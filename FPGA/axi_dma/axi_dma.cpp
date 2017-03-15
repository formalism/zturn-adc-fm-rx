#include "hls_stream.h"
#include "ap_int.h"
#include "axi_dma.h"

void axi_dma(ap_uint<64>* addr, ap_uint<32> offset, ap_uint<32> len, hls::stream<ap_uint<64> > &in){
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE s_axilite port=offset
#pragma HLS INTERFACE s_axilite port=len
#pragma HLS INTERFACE m_axi depth=4096 port=addr
#pragma HLS INTERFACE axis port=in
	ap_uint<32> i;

	for (i = 0; i < len; i++){
#pragma HLS PIPELINE
		addr[offset+i] = in.read();
	}
}
