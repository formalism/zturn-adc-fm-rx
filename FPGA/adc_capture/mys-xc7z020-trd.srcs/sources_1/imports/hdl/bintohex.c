#include <stdio.h>

void main(){
	char buf[2];
	FILE* fd = fopen("adc_fm.dat", "rb");
	while (1){
		int sz = fread(buf, 2, 1, fd);
		printf("%02x%02x\n", buf[1]&0xFF, buf[0]&0xFF);
		if (!sz)
			break;
	}
}

