extern crate ws;
extern crate libc;

use ws::{listen, Handler, Result, Message, CloseCode, Handshake};
use ws::Message::Text;
use ws::Message::Binary;
use ws::util::Token;
use std::fs::{OpenOptions, File};
use std::os::unix::fs::OpenOptionsExt;
use std::os::unix::io::{AsRawFd};
use std::io;
use std::io::{Write, Read};
use std::ptr::{self, read_volatile, write_volatile};
use std::thread;
use std::sync::mpsc::channel;
use std::sync::mpsc::{Sender, Receiver};
use std::sync::Arc;
use std::slice;
use std::vec::Vec;

struct Server {
    out: ws::Sender,
    tx: Arc<Sender<i32>>,
    rx: Arc<Receiver<u32>>
}

const MB : libc::size_t = 1024*1024;
const MEM_SIZE : libc::size_t = 512*MB;
const MEM_OFFSET : libc::off_t = 512*MB as libc::off_t;
const ZERO_OFFSET : libc::off_t = 0;
const PAGE_SIZE : libc::size_t = 4096;

// https://qiita.com/hukatama024e/items/1edd5c58ed68b5264d40

fn memmap() -> io::Result<*mut u32> {
    let mem_file = OpenOptions::new()
                    .read(true)
                    .write(true)
                    .custom_flags(libc::O_SYNC)
                    .open("/dev/mem")
                    .expect("can't open /dev/mem");
    unsafe {
        let ptr = libc::mmap(ptr::null_mut(),
                            MEM_SIZE, libc::PROT_READ | libc::PROT_WRITE,
                            libc::MAP_SHARED,
                            mem_file.as_raw_fd(),
                            MEM_OFFSET);
        if ptr == libc::MAP_FAILED {
            Err(io::Error::last_os_error())
        }
        else
        {
            Ok(ptr as *mut u32)
        }
    }
}

fn uiomap() -> (*mut u32, File) {
    let uio_file = OpenOptions::new()
                    .read(true)
                    .write(true)
                    .custom_flags(libc::O_SYNC)
                    .open("/dev/uio0")
                    .expect("can't open /dev/uio0");
    unsafe {
        let ptr = libc::mmap(ptr::null_mut(),
                            PAGE_SIZE, libc::PROT_READ | libc::PROT_WRITE,
                            libc::MAP_SHARED,
                            uio_file.as_raw_fd(),
                            ZERO_OFFSET);        // second 512MB of the total of 1GB of DDR memory
        if ptr == libc::MAP_FAILED {
            panic!("{}", io::Error::last_os_error())
        }
        (ptr as *mut u32, uio_file)
    }    
}

fn set_axi_dma_reg(reg_adr : *mut u32, size : u32, offset : u32) {
    let status_reg : *mut u32 = unsafe { reg_adr.offset(0) };
    let ien_reg : *mut u32 = unsafe { reg_adr.offset(1) };
    let done_reg : *mut u32 = unsafe { reg_adr.offset(2) };
    let offset_reg : *mut u32 = unsafe { reg_adr.offset(4) };
    let len_reg : *mut u32 = unsafe { reg_adr.offset(6) };

    unsafe {
        let status = read_volatile(status_reg); // clear ap_done
        write_volatile(ien_reg, 1);     // enable
        write_volatile(done_reg, 1);    // IP Interrupt enable reg
        write_volatile(offset_reg, offset/8);
        write_volatile(len_reg, size/8);
    }
}

fn start_axi_dma(reg_adr : *mut u32){
    let start_reg : *mut u32 = unsafe { reg_adr.offset(0) };
    unsafe {
        write_volatile(start_reg, 1);
    }
}

fn clear_interrupt(reg_adr : *mut u32){
    let intcl_reg : *mut u32 = unsafe { reg_adr.offset(3) };
    unsafe {
        write_volatile(intcl_reg, 1);
    }
}

fn wait_interrupt(uio_file : &mut File) -> (){
   let mut tmp = [0; 4];
   if 4 != uio_file.read(&mut tmp).unwrap() {    // wait interrupt
        panic!("failed read");
   }
}

impl Handler for Server {
    fn on_open(&mut self, _shake: Handshake) -> Result<()> {
        println!("on_open");
        Ok(())
    }
    fn on_timeout(&mut self, event: Token) -> Result<()> {
        println!("on_timeout");
        Ok(())
    }
    fn on_message(&mut self, msg: Message) -> Result<()> {
//        println!("on_message");
        match msg {
            Text(_) => {
                let vec: Vec<u8> = vec![0; 1920*1080];
                self.out.send(vec)
            },
            Binary(v) => {
                let adr = self.rx.recv().unwrap();
                unsafe {
//                println!("send Binary");
                    let ary : &[u8] = slice::from_raw_parts(adr as *const u8, 2*MB);
                    let r = self.out.send(Binary(Vec::from(ary)));
                    self.tx.send(1);
                    r
                }
            }
        }
    }
    fn on_close(&mut self, _code: CloseCode, _reason: &str) {
    }
}

fn main() {
   println!("Hello, world!");
   let mapped_ptr : *mut u32 = memmap().expect("failed mmap");
   let (uio_ptr, mut uio_file) = uiomap();
   let one : [u8; 4] = [1, 0, 0, 0];

   let (tx_web, rx_cap) = channel();
   let (tx_cap, rx_web) = channel();

   let hdl = thread::spawn(move || {
       let tx = Arc::new(tx_web);
       let rx = Arc::new(rx_web);
       listen("192.168.0.90:3012",
                |out| Server { out: out, tx: Arc::clone(&tx), rx: Arc::clone(&rx) })
                .unwrap();
   });
   loop {
        set_axi_dma_reg(uio_ptr, 2*MB as u32, 512*MB as u32);   // capture 2MB (just for now)
        uio_file.write(&one).expect("write");            // enable interrupt
        start_axi_dma(uio_ptr);
        wait_interrupt(&mut uio_file);
        clear_interrupt(uio_ptr);
        tx_cap.send(512*MB as u32);    // send start address
        let v = rx_cap.recv().unwrap();
   }
   //hdl.join().expect("join");
}
