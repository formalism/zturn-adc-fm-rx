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

#define SERVER_PORT (12345)

#define KB ((1024))
#define MB ((1024*1024))

void bind_and_open(int* sock0, int* sock)
{
    struct sockaddr_in addr;
    struct sockaddr_in client;
    int len;

    *sock0 = socket(AF_INET, SOCK_STREAM, 0);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(SERVER_PORT);
    addr.sin_addr.s_addr = INADDR_ANY;
    bind(*sock0, (struct sockaddr*)&addr, sizeof(addr));

    listen(*sock0, 5);
    len = sizeof(client);
    *sock = accept(*sock0, (struct sockaddr*)&client, &len);
}

void set_axi_dma_reg(unsigned int* addr){
    unsigned int status = addr[0]; /* clear ap_done */

    /* Global Interrupt Enable Register */
    addr[1] = 1;                /* enable */
    /* IP Interrupt Enable Register */
    addr[2] = 1;                /* ap_done */
    /* IP Interrupt Status Register */

    /* offset */
    addr[4] = (512*MB)/8;     /* 512MBytes offset */
    /* len */
    addr[6] = (256*MB)/8;     /* 256MBytes */
}

void start_axi_dma(unsigned int* addr){
    addr[0] = 1;
}

void clear_interrupt(unsigned int* addr){
    unsigned int status = addr[3];
    addr[3] = 1;                /* clear ap_done */
}

static sem_t sem_cap, sem_xfer;

void* thread_func(void* arg){
    int uiofd;
    unsigned int* map_addr;
    unsigned int one = 1;
	int i,j=0;

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

    while (1){
        printf("Write DMA registers\n");
        set_axi_dma_reg(map_addr);
        write(uiofd, &one, 4);       /* enable interrupt */
        printf("Start DMA!!\n");
        start_axi_dma(map_addr);
        
        if (4 != read(uiofd, &i, 4)) /* wait interrupt */
            perror("uio read:");
        
        printf("DMA Done\n");
        clear_interrupt(map_addr);
        sem_post(&sem_cap);
        sem_wait(&sem_xfer);
    }

 thread_exit:
    pthread_exit(NULL);
}

int main(int argc, char** argv)
{
    int sock0, sock;
    int i=0, j;
	pthread_t th;
    int memfd;
    unsigned char* mem;
   
    if (sem_init(&sem_cap, 0, 0)){
        perror("sem_init");
        exit(1);
    }
    if (sem_init(&sem_xfer, 0, 0)){
        perror("sem_init");
        exit(1);
    }
    memfd = open("/dev/mem", O_RDWR|O_SYNC);
    if (memfd < 0){
        perror("/dev/mem");
        exit(1);
    }
    mem = mmap(0, 256*MB, PROT_READ|PROT_WRITE, MAP_SHARED, memfd, 512*MB);
    if (mem < 0){
        perror("mmap");
        exit(1);
    }

    bind_and_open(&sock0, &sock);

	pthread_create(&th, NULL, &thread_func, (void*)NULL);

    while (1){
        sem_wait(&sem_cap);
        printf("Start transfer\n");
        if (-1 == write(sock, mem, 256*MB))
            break;
        sem_post(&sem_xfer);
    }

    sem_destroy(&sem_cap);
    sem_destroy(&sem_xfer);

 _exit:
    printf("closed file descriptor\n");
    return 0;
}
