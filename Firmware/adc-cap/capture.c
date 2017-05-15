#include <math.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
#include <linux/i2c-dev.h>

#define SERVER_PORT (12345)

#define KB ((1024))
#define MB ((1024*1024))

/* 1bit shift-left */
#define NAU_DEVADR      (0x34)

static sem_t sem_cap_a, sem_cap_b, sem_xfer_a, sem_xfer_b;
static int running;

void socket_bind(int* sock0)
{
    struct sockaddr_in addr;
    struct sockaddr_in client;
    int len;

    *sock0 = socket(AF_INET, SOCK_STREAM, 0);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(SERVER_PORT);
    addr.sin_addr.s_addr = INADDR_ANY;
    bind(*sock0, (struct sockaddr*)&addr, sizeof(addr));
}

void listen_and_accept(int* sock0, int* sock)
{
    struct sockaddr_in client;
    int len;

    listen(*sock0, 5);
    len = sizeof(client);
    *sock = accept(*sock0, (struct sockaddr*)&client, &len);
}

void set_axi_dma_reg(unsigned int* reg_addr, unsigned int size, unsigned int offset){
    unsigned int status = reg_addr[0]; /* clear ap_done */

    /* Global Interrupt Enable Register */
    reg_addr[1] = 1;                /* enable */
    /* IP Interrupt Enable Register */
    reg_addr[2] = 1;                /* ap_done */
    /* IP Interrupt Status Register */

    /* offset */
    reg_addr[4] = offset/8;

    /* len */
    reg_addr[6] = size/8;
}

void start_axi_dma(unsigned int* reg_addr){
    reg_addr[0] = 1;
}

void clear_interrupt(unsigned int* reg_addr){
    unsigned int status = reg_addr[3];
    reg_addr[3] = 1;                /* clear ap_done */
}

// initialize DDS memory (currently fixed 40MHz sampling)
void init_dds_frequency(float freq){
    int i;
    int uiofd;
    unsigned int* map_addr;
    double ratio = freq / 40e+6;

    uiofd = open("/dev/uio1", O_RDWR);
    if (uiofd < 0){
        perror("uio open:");
        goto exit;
    }
    map_addr = (unsigned int*)mmap(NULL, 32*KB, PROT_READ | PROT_WRITE, MAP_SHARED, uiofd, 0);
    if (!map_addr){
        fprintf(stderr, "mmap failed\n");
        goto exit;
    }
    for (i = 0; i < 400; i++){  /* 400 point is enough */
        int s = sin((double)i*M_PI*2.0*ratio) * (1<<12);
        int c = cos((double)i*M_PI*2.0*ratio) * (1<<12);
        int sc = (s<<16) | (c & 0xFFFF);
        printf("[i=%08d] sin=%d, cos=%d, sincos=%08X\n", i, s, c, sc);
        map_addr[i] = sc;
    }
 exit:
    return;
}

void parse_frequency(int fd){
    int len = 0;
    char buf[8];
    float freq;
    
    do{
        len += read(fd, &buf[len], 4-len);
    }while (len < 4);
    sscanf(buf, "%f", &freq);
    freq *= 1e+6;               /* to MHz */
    init_dds_frequency(freq);
}

void* cmd_thread_func(void* arg){
    int fd = *(int*)arg;
    char buf[16];
    int len;

    while (1){
        len = read(fd, buf, 1); /* read a byte */
        if (len < 1){           /* EOF or closed */
            running = 0;
            break;
        }
        switch (buf[0]){
        case 'F':                    /* set frequency: XX.X MHz */
            parse_frequency(fd);
            break;
        default:
            break;
        }
    }
}

void* thread_func(void* arg){
    int uiofd;
    unsigned int* map_addr;
    unsigned int one = 1;
	int i,j=0;
    unsigned int size = *(unsigned int*)arg;

    uiofd = open("/dev/uio0", O_RDWR);
    if (uiofd < 0){
        perror("uio open:");
        goto thread_exit;
    }
    map_addr = (unsigned int*)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, uiofd, 0);
    if (!map_addr){
        fprintf(stderr, "mmap failed\n");
        goto thread_exit;
    }

    printf("size=%08X\n", size);

    while (running){
        //        printf("Write DMA registers\n");
        if (sem_wait(&sem_cap_a) < 0){
            break;
        }
        set_axi_dma_reg(map_addr, size, (512*MB));
        write(uiofd, &one, 4);       /* enable interrupt */
        //        printf("Start DMA(A)!!\n");
        start_axi_dma(map_addr);
        
        if (4 != read(uiofd, &i, 4)) /* wait interrupt */
            perror("uio read:");
        
        //        printf("DMA Done\n");
        clear_interrupt(map_addr);
        if (sem_post(&sem_xfer_a) < 0){
            break;
        }

        if (sem_wait(&sem_cap_b) < 0){
            break;
        }
        set_axi_dma_reg(map_addr, size, ((512+256)*MB));
        write(uiofd, &one, 4);       /* enable interrupt */
        //        printf("Start DMA(B)!!\n");
        start_axi_dma(map_addr);
        
        if (4 != read(uiofd, &i, 4)) /* wait interrupt */
            perror("uio read:");
        clear_interrupt(map_addr);
        if (sem_post(&sem_xfer_b) < 0){
            break;
        }
    }

 thread_exit:
    close(uiofd);
    pthread_exit(NULL);
}

int write_reg(int fd, int adr, int data){
    char buf[3];

    buf[0] = (adr<<1) | ((data&0x100)>>8);
    buf[1] = data & 0xFF;
    if (write(fd, buf, 2) < 0){
        return -1;
    }
    return 0;
}

int read_reg(int fd, int adr){
    char buf[3];

    buf[0] = (adr<<1);
    if (write(fd, buf, 1) < 0){
        perror("write");
        return -1;
    }
    if (read(fd, buf, 2) < 0){
        perror("read");
        return -1;
    }
    return (buf[0]<<8) | buf[1];
}

void init_dac(){
    int fd = open("/dev/i2c-1", O_RDWR);
    int ret, adr;

    if (fd < 0){
        perror("/dev/i2c-1");
        return;
    }
    adr = NAU_DEVADR >> 1;
    ret = ioctl(fd, I2C_SLAVE, adr);
    if (ret < 0){
        perror("ioctl");
        return;
    }
    write_reg(fd, 0x00, 0x000);  /* software reset */
    write_reg(fd, 0x01, 0x00F);  /* internal tie-off buffer enabled */
    write_reg(fd, 0x02, 0x180); /* Power management for the left and right headphone amplifier, R(L)HPEN=1 */
    write_reg(fd, 0x03, 0x00F); /* Power management enable/disable, L(R)Mixer, R(L)DACEN=1 */
    printf("%03X=%03X\n", 0x04, read_reg(fd, 0x04)); /* should be 0x050 */
    printf("%03X=%03X\n", 0x06, read_reg(fd, 0x06)); /* should be 0x140 */
    write_reg(fd, 0x06, 0x000); /* MCLK used as master clock, divide by 1 */
    printf("%03X=%03X\n", 0x06, read_reg(fd, 0x06)); /* should be 0x000 */
    //    write_reg(0x05, );          /* Digital passthrough of ADC output data into DAC input */
    //    write_reg(0x07, );          /* Sample rate indication bits */
    write_reg(fd, 0x0a, 0x080); /* softmute, automute, 128k oversampling, polarity control */
    write_reg(fd, 0x0b, 0x0C0);  /* left ch DAC digital volume */
    write_reg(fd, 0x0c, 0x1C0);  /* right ch DAC digital volume, update */
    //    write_reg(fd, 0x32, 0x000);
    printf("%03X=%03X\n", 0x32, read_reg(fd, 0x32)); /* should be 0x001 */
    printf("%03X=%03X\n", 0x34, read_reg(fd, 0x34)); /* should be 0x039(LHPGAIN=0.0dB) */
    //    write_reg(52, );            /* volume, mute, update, zero crossing controls for left headphone driver */
    //    write_reg(53, );            /* volume, mute, update, zero crossing controls for right headphone driver */
}

void dump_mem(unsigned char* buf, int sz){
    int i;

    for (i = 0; i < sz; i++){
        printf("%02X ", buf[i]);
        if ((i+1 % 16) == 0)
            putchar('\n');
    }
}

int init_semaphore(){
    if (sem_init(&sem_cap_a, 0, 1)){
        perror("sem_init");
        return 1;
    }
    if (sem_init(&sem_xfer_a, 0, 0)){
        perror("sem_init");
        return 1;
    }
    if (sem_init(&sem_cap_b, 0, 1)){
        perror("sem_init");
        return 1;
    }
    if (sem_init(&sem_xfer_b, 0, 0)){
        perror("sem_init");
        return 1;
    }
    return 0;
}

void run(int sock0, unsigned char* mem){
    unsigned int capture_size;
    int sock;
	pthread_t th, th_cmd;
    int i=0;
    unsigned char buf[16];

    if (init_semaphore())
        exit(1);

    listen_and_accept(&sock0, &sock);
    while (i < 8){
        i += read(sock, buf, 8-i);
    }
    sscanf(buf, "%x", &capture_size);
    printf("capture_size=%08X\n", capture_size);

    running = 1;
	if (pthread_create(&th, NULL, &thread_func, &capture_size)){
        perror("pthread_create");
        exit(1);
    }
    if (pthread_create(&th_cmd, NULL, &cmd_thread_func, &sock)){
        perror("pthread_create");
        exit(1);
    }

    while (running){
        sem_wait(&sem_xfer_a);
        //        printf("Start transfer A\n");
        if (-1 == write(sock, mem, capture_size)){
            running = 0;
            break;
        }
        sem_post(&sem_cap_a);

        sem_wait(&sem_xfer_b);
        //        printf("Start transfer B\n");
        if (-1 == write(sock, &mem[256*MB], capture_size)){
            running = 0;
            break;
        }
        sem_post(&sem_cap_b);
    }
    //    dump_mem(mem, 256);

    sem_post(&sem_cap_a);
    sem_post(&sem_cap_b);

    sem_destroy(&sem_cap_a);
    sem_destroy(&sem_xfer_a);
    sem_destroy(&sem_cap_b);
    sem_destroy(&sem_xfer_b);
    
    //    printf("destroyed semaphores\n");
    pthread_join(th, NULL);
}

int main(int argc, char** argv)
{
    int sock0;
    int memfd;
    unsigned char* mem;
    float tune_freq = 4.7;

    init_dac();
   
    memfd = open("/dev/mem", O_RDWR|O_SYNC);
    if (memfd < 0){
        perror("/dev/mem");
        exit(1);
    }
    mem = mmap(0, 512*MB, PROT_READ|PROT_WRITE, MAP_SHARED, memfd, 512*MB);
    if (mem < 0){
        perror("mmap");
        exit(1);
    }

    if (argc == 2)              /* frequency is specified */
        sscanf(argv[1], "%f", &tune_freq); /* eg. 4.7 */
    tune_freq *= 1e+6;          /* to MHz */

    init_dds_frequency(tune_freq);
    printf("freq=%f\n", tune_freq);

    socket_bind(&sock0);
    while (1){
        run(sock0, mem);
    }

 _exit:
    printf("closed file descriptor\n");
    return 0;
}
