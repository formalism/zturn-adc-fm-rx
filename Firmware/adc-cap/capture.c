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

static sem_t sem_cap_a, sem_cap_b, sem_xfer_a, sem_xfer_b;

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

    while (1){
        //        printf("Write DMA registers\n");
        if (EINVAL == sem_wait(&sem_cap_a)){
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
        if (EINVAL == sem_post(&sem_xfer_a)){
            break;
        }

        if (EINVAL == sem_wait(&sem_cap_b)){
            break;
        }
        set_axi_dma_reg(map_addr, size, ((512+256)*MB));
        write(uiofd, &one, 4);       /* enable interrupt */
        //        printf("Start DMA(B)!!\n");
        start_axi_dma(map_addr);
        
        if (4 != read(uiofd, &i, 4)) /* wait interrupt */
            perror("uio read:");
        clear_interrupt(map_addr);
        if (EINVAL == sem_post(&sem_xfer_b)){
            break;
        }
    }

 thread_exit:
    pthread_exit(NULL);
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

int main(int argc, char** argv)
{
    int sock0, sock;
    int i=0;
	pthread_t th;
    int memfd;
    unsigned char* mem;
    unsigned char buf[16];
    unsigned int capture_size;

    if (init_semaphore())
        exit(1);
   
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

    bind_and_open(&sock0, &sock);
    while (i < 8){
        i += read(sock, buf, 8-i);
    }
    sscanf(buf, "%x", &capture_size);
    printf("capture_size=%08X\n", capture_size);

	if (pthread_create(&th, NULL, &thread_func, &capture_size)){
        perror("pthread_create");
        exit(1);
    }

    while (1){
        sem_wait(&sem_xfer_a);
        //        printf("Start transfer A\n");
        if (-1 == write(sock, mem, capture_size))
            break;
        sem_post(&sem_cap_a);

        sem_wait(&sem_xfer_b);
        //        printf("Start transfer B\n");
        if (-1 == write(sock, &mem[256*MB], capture_size))
            break;
        sem_post(&sem_cap_b);
    }

    dump_mem(mem, 256);

    sem_destroy(&sem_cap_a);
    sem_destroy(&sem_xfer_a);
    sem_destroy(&sem_cap_b);
    sem_destroy(&sem_xfer_b);

    pthread_join(th, NULL);

 _exit:
    printf("closed file descriptor\n");
    return 0;
}
