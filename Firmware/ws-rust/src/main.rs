extern crate ws;

use ws::{listen, Sender, Handler, Result, Message, CloseCode, Handshake};
use ws::Message::Text;
use ws::Message::Binary;
use ws::util::Token;

struct Server {
    out: Sender,
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
        let mut vec: Vec<u8> = vec![0; 1920*1080];
        match msg {
            Text(_) => {
//                println!("Text");
                let vec: Vec<u8> = vec![0; 1920*1080];
                self.out.send(vec)
            },
            Binary(v) => {
                for j in 0..1080 {
                    for i in 0..1920 {
                        vec[j*1920+i] = (i+j+v[0] as usize) as u8;
                    }
                }
//                println!("send Binary");
                self.out.send(Binary(vec))
            }
        }
    }
    fn on_close(&mut self, _code: CloseCode, _reason: &str) {
    }
}

fn main() {
   //listen("127.0.0.1:3012", |out| Server { out: out }).unwrap();
   listen("192.168.0.90:3012", |out| Server { out: out }).unwrap();
//   listen("127.0.0.1:3012", |out| {
//       move |msg| {
//            out.send(vec)
//        }
//    }).unwrap();
//    println!("{}", vec[1920*1080-1]);
    println!("Hello, world!");
}
