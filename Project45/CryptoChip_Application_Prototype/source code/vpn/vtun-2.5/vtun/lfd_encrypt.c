/*  
    VTun - Virtual Tunnel over TCP/IP network.

    Copyright (C) 1998-2000  Maxim Krasnyansky <max_mk@yahoo.com>

    VTun has been derived from VPPP package by Maxim Krasnyansky. 

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
 */

/*
 * lfd_encrypt.c,v 1.2.2.5 2001/06/07 15:35:12 maxk Exp
 */ 

/*
   Encryption module uses software developed by the OpenSSL Project
   for use in the OpenSSL Toolkit. (http://www.openssl.org/)       
   Copyright (c) 1998-2000 The OpenSSL Project.  All rights reserved.
 */

/*
 * This lfd_encrypt module uses MD5 to create 128 bits encryption
 * keys and BlowFish for actual data encryption.
 * It is based on code written by Chris Todd<christ@insynq.com> with 
 * several improvements and modifications by me.  
 */

#include "config.h"

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <syslog.h>
#include <strings.h>
#include <string.h>

#include "vtun.h"
#include "linkfd.h"
#include "lib.h"

// ##### MangMug
#include "ldd.h"
#include <unistd.h>
#include <fcntl.h>
#include <semaphore.h>
//#include <pthread.h>
#include <sys/types.h>
#include <sys/ioctl.h>
//#include <linux/sem.h>
//#include <linux/errno.h>
#include <linux/types.h>
// ##### MangMug

#ifdef HAVE_SSL

#include <md5.h>
#include <blowfish.h>

#define ENC_BUF_SIZE VTUN_FRAME_SIZE + 16 
// ##### MangMug
#define ENC_KEY_SIZE 8
// ##### MangMug

BF_KEY key;
char * enc_buf;

// ##### MangMug
static int fdesc=-1;
static __u64 my_key=0xffffffffffffffff;	
//static sem_t open_sem;
//static sem_t crypt_sem;
extern sem_t open_sem;
extern sem_t crypt_sem;
	// check against 'main.c'
// ##### MangMug

int alloc_encrypt(struct vtun_host *host)
{
// ##### MangMug
	int fcntl_ret;
	// this will be removed in released version
// ##### MangMug
   if( !(enc_buf = lfd_alloc(ENC_BUF_SIZE)) ){
      syslog(LOG_ERR,"Can't allocate buffer for encryptor");
      return -1;
   }

// ##### MangMug
//   BF_set_key(&key, ENC_KEY_SIZE, MD5(host->passwd,strlen(host->passwd),NULL));

//   syslog(LOG_INFO, "BlowFish encryption initialized");
//-------------------
//   if (fdesc > 0 ) {
//	   syslog(LOG_ERR, "Trying to pen simultaneous");
//	   return -1;
//   }
   sem_wait(&open_sem);
   if (fdesc) ;
   else if ((fdesc = open("/dev/mind", O_RDWR)) < 0)	{ 
	   syslog(LOG_ERR,"Can't open /dev/mind");
	   free_encrypt();
	   sem_post(&open_sem);
	   return fdesc;
   }
   fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, (unsigned long)&my_key); // set_key
   if (fcntl_ret < 0)
	   syslog(LOG_ERR,"mind::set_key() error_no = %d", errno);
// ##### MangMug

   syslog(LOG_INFO, "Isagcrypt encryption initialized");
   sem_post(&open_sem);
   return 0;
}

int free_encrypt()
{
   lfd_free(enc_buf); enc_buf = NULL;
   fdesc = -1;
   return 0;
}

int encrypt_buf(int len, char *in, char **out)
{ 
   register int pad, p;
// ##### MangMug
//   __u64 *pad_write;
   int fcntl_ret, rsize, wsize;
// ##### MangMug
   register char *in_ptr = in, *out_ptr = enc_buf;

   /* 8 - ( len % 8 ) */
   pad = (~len & 0x07) + 1; p = 8 - pad;

   memset(out_ptr, 0, pad);
   *out_ptr = (char) pad;
   memcpy(out_ptr + pad, in_ptr, p);  
// ##### MangMug
//   BF_ecb_encrypt(out_ptr, out_ptr, &key, BF_ENCRYPT);
//   -----------------------
	sem_wait(&crypt_sem);
	wsize = write(fdesc, out_ptr, 8);
//	if ((wsize != 8) || (errno != ESYSRESTART))
	if (wsize != 8) 
		syslog(LOG_ERR,"vtun - mind_:write() error_no = %d", errno);
	fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	if (fcntl_ret < 0)
		syslog(LOG_ERR,"vtun - mind_:set_key() error_no = %d", errno);
	rsize = read(fdesc, out_ptr, 8);
//	if ((rsize != 8) || (errno != ESYSRESTART))
	if (rsize != 8)
		syslog(LOG_ERR,"vtun - mind_:read() error_no = %d", errno);
// ##### MangMug
   out_ptr += 8; in_ptr += p; 
   len = len - p;

   for (p=0; p < len; p += 8) {
// ##### MangMug
//      BF_ecb_encrypt(in_ptr + p,  out_ptr + p, &key, BF_ENCRYPT);
//   -----------------------
	wsize = write(fdesc, out_ptr, 8);
//	if ((wsize != 8) || (errno != ESYSRESTART))
	if (wsize != 8) 
		syslog(LOG_ERR,"vtun - mind_:write() error_no = %d", errno);
	fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	if (fcntl_ret < 0)
		syslog(LOG_ERR,"vtun - mind_:set_key() error_no = %d", errno);
	rsize = read(fdesc, out_ptr, 8);
//	if ((rsize != 8) || (errno != ESYSRESTART))
	sem_post(&crypt_sem);
	if (rsize != 8)
		syslog(LOG_ERR,"vtun - mind_:read() error_no = %d", errno);
// ##### MangMug
   }

   *out = enc_buf;
   return len + 8;
}


int decrypt_buf(int len, char *in, char **out)
{
// ##### MangMug
	int fcntl_ret, rsize, wsize;
// ##### MangMug
   register int p;

   for (p = 0; p < len; p += 8) {
// ##### MangMug
//      BF_ecb_encrypt(in + p, in + p, &key, BF_DECRYPT);
//   -----------------------
   	sem_wait(&crypt_sem);
	wsize = write(fdesc, in, 8);
//	if ((wsize != 8) || (errno != ESYSRESTART))
	if (wsize != 8)
		syslog(LOG_ERR,"vtun - mind_:write() error_no = %d", errno);
	fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	if (fcntl_ret < 0)
		syslog(LOG_ERR,"vtun - mind_:set_key() error_no = %d", errno);
	rsize = read(fdesc, in, 8);
//	if ((rsize != 8) || (errno != ESYSRESTART))
	sem_post(&crypt_sem);
	if (rsize != 8)
		syslog(LOG_ERR,"vtun - mind_:read() error_no = %d", errno);
// ##### MangMug
   }

   p = *in;
   if (p < 1 || p > 8) {
      syslog(LOG_INFO, "decrypt_buf: bad pad length");
      return 0;
   }

   *out = in + p;

   return len - p;
}

/* 
 * Module structure.
 */
struct lfd_mod lfd_encrypt = {
     "Encryptor",
     alloc_encrypt,
     encrypt_buf,
     NULL,
     decrypt_buf,
     NULL,
     free_encrypt,
     NULL,
     NULL
};

#else  /* HAVE_SSL */

int no_encrypt(struct vtun_host *host)
{
     syslog(LOG_INFO, "Encryption is not supported");
     return -1;
}

struct lfd_mod lfd_encrypt = {
     "Encryptor",
     no_encrypt, NULL, NULL, NULL, NULL, NULL, NULL, NULL
};

#endif /* HAVE_SSL */
