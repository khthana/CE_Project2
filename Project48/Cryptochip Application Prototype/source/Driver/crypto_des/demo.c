#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>

#define MAGIC	0xB5		// Magic Number
#define REG_SET_OFFSET				_IOR(MAGIC, 1, unsigned long)
#define REG_READ				_IOW(MAGIC, 2, unsigned long)
#define REG_WRITE				_IOR(MAGIC, 3, unsigned long)
#define GET_IO_BASE				_IOR(MAGIC, 4, int)
#define GET_IO_PYS				_IOR(MAGIC, 5, int)
#define GET_IO_LEN				_IOR(MAGIC, 6, int)
#define GET_IO_VIR				_IOR(MAGIC, 7, int)
#define ASSIGN_DIRECTION			_IOW(MAGIC, 8, int)
#define INSERT_KEY_H				_IOW(MAGIC, 9, unsigned int)
#define INSERT_KEY_L				_IOW(MAGIC, 10, unsigned int)
#define ASSIGN_MODE				_IOW(MAGIC, 11, int)		// 0 : encryption, 1 : decryption
#define INSERT_KEY_H2				_IOW(MAGIC, 12, unsigned int)
#define INSERT_KEY_L2				_IOW(MAGIC, 13, unsigned int)
#define INSERT_KEY_H3				_IOW(MAGIC, 14, unsigned int)
#define INSERT_KEY_L3				_IOW(MAGIC, 15, unsigned int)
#define INSERT_IV_L				_IOW(MAGIC, 16, unsigned int)
#define INSERT_IV_H				_IOW(MAGIC, 17, unsigned int)

void string2long(char *digit, unsigned long *result);
int  mapping(char ch);
void toHex(unsigned long *ret, const char *src, int size);

void encryption(char *ctext, char *ptext, int ptext_s, int modeop);
void decryption(char *ctext, char *dtext, int dtext_s, int modeop);
//char *encryption(char *ptext, int ptext_s, int modeop);
//char *decryption(char *dtext, int dtext_s, int modeop);
char *padding(char *filename, char *src, int *s);
void unpadding(char *src, int size);
void insert_key(unsigned long *key_l, unsigned long *key_h);

void help(void);

static int fd;					// Use to keep file descriptor of CryptoChip Device Driver

int main(int argc, char *argv[])
{
	if (argc == 1){ 
		help();
		return 0;
	}
	int i;
	char *filename;
	char *output;
	char *tmp;
	char option;
	int modeop = 0;				// MODE of OPERATION 0 : ECB, 1 : CBC, 2 : OFB, 3 : CFB, 4 : 3DES
	int direction = 0;			// DIRECTION 0 : Encryption, 1 : Decryption
	int output_op = 0;
	unsigned long key_l, key_h;
	unsigned long key_l2, key_h2;
	unsigned long key_l3, key_h3;
	unsigned long iv_l, iv_h;

	// Get Input from command line
	for (i=1; i<argc; i++){
		if (argv[i][0] == '-'){
			option = *(argv[i]+1);
			//printf("argv[%d] = %c\n", i, option);
			
			switch (option) {
				case 'f' : 
					filename = argv[++i];
					//printf("filename : %s\n", filename);
					break;
					
				case 'e' :
					//printf("Encryption \n");
					direction = 0;
					break;

				case 'd' :
					//printf("Decryption \n");
					direction = 1;
					break;

				case 'M' :
					modeop = atoi(argv[++i]);
					//printf("Mode of Operation : %d\n", modeop);
					break;

				case 'k' :
					toHex(&key_l, argv[++i]+2, 8);
					//printf("Key(in hex) : %08X\n", key_l);

					toHex(&key_h, argv[++i]+2, 8);
					//printf("Key(in hex) : %08X\n", key_h);
					if (modeop == 4){
						toHex(&key_l2, argv[++i]+2, 8);
						//printf("Key2(in hex) : %08X\n", key_l2);
						toHex(&key_h2, argv[++i]+2, 8);
						//printf("Key2(in hex) : %08X\n", key_h2);

						toHex(&key_l3, argv[++i]+2, 8);
						//printf("Key2(in hex) : %08X\n", key_l3);
						toHex(&key_h3, argv[++i]+2, 8);
						//printf("Key2(in hex) : %08X\n", key_h3);
					}
					break;

				case 'i' :
					if (modeop > 0) {
						toHex(&iv_l, argv[++i]+2, 8);
						//printf("IV_L : %08X\n", iv_l);
						toHex(&iv_h, argv[++i]+2, 8);
						//printf("IV_H : %08X\n", iv_h);
					}
					break;

				case 'o' :
					output = argv[++i];
					output_op = 1;
					//printf("output to file : %s\n", output);
					break;

				default :
					printf("Not match option\n");
			}
		}
	}

// Do work !!!
	fd = open("/dev/crypto_DES", O_RDWR);

	if(!fd) {
		printf("error in open device operation\n");
		exit(0);
	}

	// Get source file to src variable
	// Use fread and fopen
	FILE *f;			// Variable use to store filestream
	char *src;
	struct stat statbuf;		// Variable use to get stat

	lstat(filename, &statbuf);	// Get stat from filename
	int fsize = statbuf.st_size;
	src = (char *)malloc(fsize);	// Allocation Memory for buffer content of file

	if(!(f = fopen(filename, "rb"))){
		printf("open error, file : %s\n", filename);
	}

	fread(src, sizeof(char), fsize, f);
	//printf("content \n");
	//printf("%s", src);
	//printf("\n");

	insert_key(&key_l, &key_h);
	if (modeop == 4) {
		int err;
		err = ioctl(fd, INSERT_KEY_L2, &key_l2);
		if (err != 0)
			printf("Insert KEY_L2 Function \nerr = %d\n", err);

		err = ioctl(fd, INSERT_KEY_H2, &key_h2);
		if (err != 0)
			printf("Insert KEY_H2 Function \nerr = %d\n", err);

		err = ioctl(fd, INSERT_KEY_L3, &key_l3);
		if (err != 0)
			printf("Insert KEY_L3 Function \nerr = %d\n", err);

		err = ioctl(fd, INSERT_KEY_H3, &key_h3);
		if (err != 0)
			printf("Insert KEY_H3 Function \nerr = %d\n", err);
	}

	if (modeop > 0) {
		int err;
		err = ioctl(fd, INSERT_IV_L, &iv_l); 
		if (err != 0)
			printf("Insert IV_L Function \nerr = %d\n", err);

		err = ioctl(fd, INSERT_IV_H, &iv_h); 
		if (err != 0)
			printf("Insert IV_H Function \nerr = %d\n", err);
	}

	char *ctext;
	if (!direction) {
		if ((modeop == 0)||(modeop == 1)||(modeop == 4)){		
			src = padding(filename, src, &fsize);
		}
		//else ctext = src;		
		//printf("strlen(src) - in main fuction = %d\n", strlen(src));
		/*for (i=0; i<fsize; i++) {
			printf("ctext[%d] = %02X\n", i, src[i]);
		}*/
		//unpadding(ctext, fsize);

		ctext = (char *)malloc(fsize*2);
		encryption(ctext, src, fsize, modeop);
		//ctext = encryption(src, fsize, modeop);
	}else {
		ctext = (char *)malloc(fsize/2);
		decryption(ctext, src, fsize, modeop);
		//ctext = decryption(src, fsize, modeop);
		//printf("check before :: unpadd\n");
		if ((modeop == 0)||(modeop == 1)||(modeop == 4)){		
			unpadding(ctext,fsize);
		}
		//printf("plaintext :: %s\n",ctext);
	}

	// Output to file
	/*
	if (output_op) { 
		FILE *cipher;
		cipher = fopen(output, "wb");
		if (!direction)
			fwrite(ctext, sizeof(char), fsize*2, cipher);
		else
			fwrite(ctext, sizeof(char), fsize/2, cipher);
	}
	*/

	free(src);
	free(ctext);

	return 0;
}

char *padding(char *filename, char *src, int *s)
{
	char last_byte, padd_byte;
	int fraction, padd, begin_pad;
	char *res;
	struct stat statbuf;
	int fsize, i; 
	lstat(filename, &statbuf); 
	fsize = statbuf.st_size; 
	padd_byte = '0'; 
	
	// padding data
	fraction = fsize % 8;
	last_byte = 8 - fraction;
	padd = last_byte - 1;
	res = (char *)malloc((fsize + last_byte));

	//fread(src, sizeof(char), statbuf.st_size, f);
	strcpy(res, src);

	for (i=fsize; i<(fsize+last_byte)-1; i++) {
		res[i] = padd_byte;
	}
	res[i] = last_byte;

//	printf("strlen(res) = %d\n", strlen(res));

	free(src);
	src = res;

	//free(res);
/*	
	for (i=0; i<(fsize+last_byte); i++) {
		printf("res[%d] = %02X\n", i, src[i]);
	}
*/	
	*s = strlen(src);

	//printf("res = \n%s\n", src);
	//printf("strlen(src) = %d\n", *s);
	//return fsize + last_byte;
	return res;
}

void unpadding(char *src, int size)
{
	char *res,*copy_src;
	char padding;
	int unpadd_last_byte;
	int cut_start, i;

	padding = 0;
//	printf("strlen(src) = %d\n", size);
	size /= 2;
	//size >>= 1;
//	printf("size >>= 1 : %d\n", size);
	copy_src = (char *)malloc(size);
	unpadd_last_byte = src[size-1];
//	printf("unpadd_last_byte = %d\n", unpadd_last_byte);
	cut_start = (size-1)-unpadd_last_byte;
	src[size-unpadd_last_byte] = '\0';
//	printf("plaintext :");
	
	sprintf(copy_src, "%s", src);
	printf("%s",copy_src);
	free(copy_src);
	
}

void insert_key(unsigned long *key_l, unsigned long *key_h)
{
	int err;
	err = ioctl(fd, INSERT_KEY_L, key_l);
	if (err != 0)
		printf("Insert KEY_L Function \nerr = %d\n", err);

	err = ioctl(fd, INSERT_KEY_H, key_h);
	if (err != 0)
		printf("Insert KEY_H Function \nerr = %d\n", err);

}

void encryption(char *ctext, char *ptext, int ptext_s, int modeop)
{
	int err;
	int dirc = 0;
	//char *ctext;
	err = ioctl(fd, ASSIGN_DIRECTION, &dirc);
	if (err != 0)
		printf("err = %d\n", err);

	err = ioctl(fd, ASSIGN_MODE, &modeop);
	if (err != 0)
		printf("err = %d\n", err);

	write(fd, ptext, ptext_s);
	//ctext = (char *)malloc(ptext_s*2);
	read(fd, ctext, ptext_s*2);
	//printf("cipher Text \n");
	printf("%s");
//	return ctext;
}

void decryption(char *ctext, char *dtext, int dtext_s, int modeop)
{
	int err;
	int dirc = 1;
	//char *ctext;
	err = ioctl(fd, ASSIGN_DIRECTION, &dirc);
	if (err != 0)
		printf("err = %d\n", err);

	err = ioctl(fd, ASSIGN_MODE, &modeop);
	if (err != 0)
		printf("err = %d\n", err);

	write(fd, dtext, dtext_s);
	//ctext = (char *)malloc(dtext_s/2);
	read(fd, ctext, dtext_s/2);
	//printf("decryt text:: \n");
	//printf("%s\n",ctext);
}
/*
void toHex(char *hash_v, unsigned long *ret)
{
	int i;
	int j = 0;
	unsigned char x;
	for (i=0; i<4; i++){
		ret[i] = mapping(*(hash_v+j)) & 0x0F;
		ret[i] <<= 4;
		j++;
		x = mapping(*(hash_v+j)) & 0x0F;
		x &= 0x0F;
		ret[i] = ret[i] | x;
		j++;
		printf("ret[%d] = %02X\n", i, ret[i]);
		printf("ret = %08X\n", ret);
	}
}
*/

void toHex(unsigned long *ret, const char *src, int size)
{
	unsigned long x;
	unsigned long tmp;
	int s = size;
	s /= 8;
	int i,j = 0;

	for (i=0; i<s; i++) {
		tmp = mapping(*(src + j)) & 0x0F;
		//printk("<4> tmp1 = %08X\n", tmp);
		tmp <<= 28;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		x <<= 24;
		tmp |= x;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		x <<= 20;
		tmp |= x;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		x <<= 16;
		tmp |= x;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		x <<= 12;
		tmp |= x;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		x <<= 8;
		tmp |= x;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		x <<= 4;
		tmp |= x;
		j++;
		x = mapping(*(src + j)) & 0x0F;
		//x <<= 0;
		tmp |= x;
		j++;

		ret[i] = tmp;
	}
}

int  mapping(char ch)
{
	switch(ch) {
		case '0' :
			return 0;
		case '1' :
			return 1;
		case '2' :
			return 2;
		case '3' :
			return 3;
		case '4' :
			return 4;
		case '5' :
			return 5;
		case '6' :
			return 6;
		case '7' :
			return 7;
		case '8' :
			return 8;
		case '9' :
			return 9;
		case 'A' :
		case 'a' :
			return 10;
		case 'B' :
		case 'b' :
			return 11;
		case 'C' :
		case 'c' :
			return 12;
		case 'D' :
		case 'd' :
			return 13;
		case 'E' :
		case 'e' :
			return 14;
		case 'F' :
		case 'f' :
			return 15;
	}
	return 0;
}

void string2long(char *digit, unsigned long *result)
{
	*result = 0;
	while (*digit >= '0' && *digit <= '9') {
		*result = ((*result) * 10) + (*digit - '0');
		digit++;
	}
}

void help(void)
{
	printf("\n\nDEMO Program\n");
	printf("Syntax : ./demo [OPTION]\n");
	printf("OPTION : \n");
	printf("\t-f	:	source file\n");
	printf("\t-k	:	key ex. -k 0x12345678 0x12345678\n");
	//printf("\t-o	:	output file\n");
	printf("\t-i	:	insert initial vector\n");
	printf("\t-e	:	encryption\n");
	printf("\t-d	:	decryption\n");
	printf("\t-M	:	Select Mode of Operation\n");
	printf("\t  	 	0  ECB\t1  CBC\n");
	printf("\t  	 	2  OFB\t3  CFB\n");
	printf("\t  	 	4  3DES\n");
}
