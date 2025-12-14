#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <linux/types.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include "ldd.h"
#include <errno.h>

#define VECTOR
//#define RANDOM

int main(int argc, char *argv[]) {
	char a;
	int i;
	int fcntl_ret;
	int size;
	int rsize, rrsize;
	int wsize, wwsize;
	__u64 din, key, cdata;
	__u64 *din_p, *cdata_p;
//	int i=-1;
//	a = 0x9a;
//	__u16 a1, a2;
//	__u64 b1, b2;
	int fdesc;

/*	if (i)
		printf("0x9a = %c\n", a);*/
/*	a1 = 0x1234;
	a2 = 0xabcd;
	b1 = 0x0123456789abcdef;
	b2 = 0xfedcba9876543210;
	printf("b1 = %llx\n", b1);
	printf("b2 = %llx\n", b2);
	printf("a1 = %x\n", a1);
	printf("a2 = %x\n", a2);
	printf("====================================\n");
	printf("((b1 & fff0) | a1 = %llx\n", (b1 & 0xffffffffffff0000) \
			| a1);
	printf("(u16 (b1 & 000f)) = %x\n", (__u16 )( b1 & \
				0x000000000000ffff));
	printf("((b2 & f0ff) | ((u64 )a2 << 32) = %llx\n", \
			(b2 &0xffff0000ffffffff) | (((__u64 )a2) << 32));
*/
	size = 3;
	din = 0x0123456789abcdef;
	cdata = 0x0000000000000000;
//	din = 0x0000000000000000;
	key = 0x0123456789abcdef;
//	key = 0x0000000000000000;
//	key = 0xffffffffffffffff;
//	key = 0xfedcba9876543210;
	din_p = (__u64 *) malloc(size*sizeof(__u64));
	cdata_p = (__u64 *) malloc(size*sizeof(__u64));
	din_p[0] = 0x0123456789abcdef;
	din_p[1] = 0x0000000000000000;
	din_p[2] = 0xfedcba9876543210;
	if ((fdesc = open("/dev/misc/isagcrypt/mind", O_RDWR)) < 0)
		return fdesc; 
	if (argc > 1) {
#ifdef MIND_DEBUG
		ioctl(fdesc, MIND_IOC_HARDRESET, 0xffffffff);
#endif
		return 1;
	}
	
	printf("fdesc = %d\n", fdesc);
	rsize = wsize = size*sizeof(__u64);

#ifndef VECTOR	
	printf("din    = 0x%016llx\n", din);
#else
	printf("din    = " );
	for (i=0; i<size; i++)
		printf("0x%016llx, ", din_p[i]);
	printf("\n");
#endif;
		
#ifndef VECTOR
	wwsize = write(fdesc, &din, 8);
#else
	wwsize = write(fdesc, din_p, wsize);
	if (wsize != wwsize) {
		printf("wsize(%d) != wwsize (%d)\n", wsize, wwsize);
//		return wwsize;
}
#endif

#ifndef VECTOR	
	printf("key    = 0x%016llx\n", key);
#else
	printf("key    = 0x%016llx, 0x%016llx, 0x%016llx\n", key, key, key);
#endif
//	fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, (unsigned long)&key);
//	fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, &key);
	fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, &key);
	if (fcntl_ret < 0) {
		printf("set_key:: errno = %d\n", errno);
		return -1;
	}
	fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	if (fcntl_ret < 0) {
		printf("start_c:: errno = %d\n", errno);
		return -1;
	}


#ifndef VECTOR
	rrsize = read(fdesc, &cdata, 8);
	printf("cdata  = 0x%016llx\n", cdata);
#else
	rrsize = read(fdesc, cdata_p, rsize);
	printf("cdata  = ");
	for (i=0; i < size; i++)
		printf("0x%016llx, ", cdata_p[i]);
	printf("\n");
#endif
	
#ifdef RANDOM
do {
	// Prepare cdin data
	printf("\n\n*********** Beginning of RANDOM_VECTOR\n");
	din_p[0] = ((long long)random() << 32) + random();
	din_p[1] = ((long long)random() << 32) + random();
	din_p[2] = ((long long)random() << 32) + random();
	printf("din    = " );
	for (i=0; i<size; i++)
		printf("0x%016llx, ", din_p[i]);
	printf("\n");

	// write cin data
	wwsize = write(fdesc, din_p, wsize);
	if (wsize != wwsize)
		printf("wsize(%d) != wwsize (%d)\n", wsize, wwsize);

	// Prepare key and start encrypt()
	key = ((long long)random() << 32) + random();
	printf("key    = 0x%016llx, 0x%016llx, 0x%016llx\n", key, key, key);
//	fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, (unsigned long)&key);
//	fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, &key);
	fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, &key);
	if (fcntl_ret < 0) {
		printf("set_key:: errno = %d\n", errno);
		return -1;
	}
	fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	if (fcntl_ret < 0) {
		printf("start_c:: errno = %d\n", errno);
		return -1;
	}

	// Read cdata and printing
	rrsize = read(fdesc, cdata_p, rsize);
	printf("cdata  = ");
	for (i=0; i < size; i++)
		printf("0x%016llx, ", cdata_p[i]);
	printf("\n");
	printf(" ---------- Press 'q' to quit -------------\n");
} while (getchar() != 'q');
#endif
	return 0;
}
