#ifndef AXIDMA
#define AXIDMA

extern void axi_dma(ap_uint<64>* addr, ap_uint<32> offset, ap_uint<32> len, hls::stream<ap_uint<64> > &in);

#endif
