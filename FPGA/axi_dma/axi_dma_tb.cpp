#include "hls_stream.h"
#include "ap_int.h"
#include "axi_dma.h"

int main(){
	ap_uint<64> buf[4096];
	hls::stream<ap_uint<64> > fifo;

	for (int i = 0; i < 1024; i++){
		fifo.write(i);
	}

	axi_dma(buf, 16, 1024, fifo);	// 16*8=128bytes offset

	for (int i = 0; i < 1024; i++){
		if (buf[16+i] != i)
			return 1;
	}

	return 0;
}
