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

#ifdef HAVE_SSL

#include <md5.h>
#include <blowfish.h>

#define ENC_BUF_SIZE VTUN_FRAME_SIZE + 16 
#define ENC_KEY_SIZE 8

// MangMug
#include "ldd.h"
#include <unistd.h>
#include <fcntl.h>
#include <semaphore.h>
#include <linux/types.h>
#include <sys/types.h>
#include <sys/ioctl.h>

extern int fdesc;	// from 'main.c'
#ifdef POSIX_SEMAPHORE // DEFINED !!
extern sem_t mind_sem;	// from 'main.c'
#else
extern struct sembuf sem_wait_op[];
extern struct sembuf sem_post_op[];
extern union semun argument;
int id;
#endif // POSIX_SEMAPHORE
//static __u64 my_key=0xffffffffffffffff;
__u64 my_key=0xffffffffffffffff;

BF_KEY key;
char * enc_buf;

int alloc_encrypt(struct vtun_host *host)
{
	int fcntl_ret;
	int sem_ret;
/*#ifndef POSIX_SEMAPHORE
	union semun {
		int val;
		struct semid_ds *buf;
		ushort * array;
	} argument;
	argument.val = 1;
#endif	*/
   if( !(enc_buf = lfd_alloc(ENC_BUF_SIZE)) ){
      syslog(LOG_ERR,"Can't allocate buffer for encryptor");
      return -1;
   }

//   BF_set_key(&key, ENC_KEY_SIZE, MD5(host->passwd,strlen(host->passwd),NULL));

//   syslog(LOG_INFO, "BlowFish encryption initialized");

#ifndef POSIX_SEMAPHORE // NOT !!!
  id = semget(KEY, 1, 0666);
  if (id < 0) 
	  syslog(LOG_ERR, "CanNOT find semaphore");
  sem_ret = semop(id, sem_wait_op, 1);
  if ( sem_ret != 0 )
	  syslog(LOG_ERR, "CanNOT lock because \"%s\"", strerror(errno));
#else
   if (sem_wait(&mind_sem) == 1)	// prevent access simultaneous
	   syslog(LOG_ERR, "sem_wait, Invalid semaphore mind_sem");
#endif // POSIX_SEMAPHORE
   
   fcntl_ret = ioctl(fdesc, MIND_IOC_SKEY, (unsigned long)&my_key);
   if (fcntl_ret == -1 )
	   syslog(LOG_ERR, "mind::set_key() error=\"%s\", my_key=0x%016llx", strerror(errno), my_key);

#ifndef POSIX_SEMAPHORE // NOT !!!
   if (id < 0) 
	  syslog(LOG_ERR, "CanNOT find semaphore");
  sem_ret = semop(id, sem_post_op, 1);
  if ( sem_ret != 0 )
	  syslog(LOG_ERR, "CanNOT lock because \"%s\"", strerror(errno));
#else // defined
   if (sem_post(&mind_sem) == -1)	// release 'mind'
	   syslog(LOG_ERR, "sem_post, Invalid semaphore, mind_sem");
#endif // POSIX_SEMAPHORE

   syslog(LOG_INFO, "Isagcrypt encryption initialized, fdesc=%d", fdesc);

   return 0;
}

int free_encrypt()
{
   lfd_free(enc_buf); enc_buf = NULL;
   return 0;
}

int encrypt_buf(int len, char *in, char **out)
{ 
   register int pad, p;
   register char *in_ptr = in, *out_ptr = enc_buf;

   int fcntl_ret, rsize, wsize;
   int sem_ret;

   /* 8 - ( len % 8 ) */
   pad = (~len & 0x07) + 1; p = 8 - pad;

   memset(out_ptr, 0, pad);
   *out_ptr = (char) pad;
   memcpy(out_ptr + pad, in_ptr, p);  
//   BF_ecb_encrypt(out_ptr, out_ptr, &key, BF_ENCRYPT);
//

#ifndef POSIX_SEMAPHORE // NOT !!!
  id = semget(KEY, 1, 0666);
  if (id < 0) 
	  syslog(LOG_ERR, "CanNOT find semaphore");
  sem_ret = semop(id, sem_wait_op, 1);
  if ( sem_ret != 0 )
	  syslog(LOG_ERR, "CanNOT lock because \"%s\"", strerror(errno));
#else // defined
   if (sem_wait(&mind_sem) == 1)	// prevent access simultaneous
	   syslog(LOG_ERR, "sem_wait, Invalid semaphore mind_sem");
#endif // POSIX_SEMAPHORE
   
   wsize = write(fdesc, out_ptr, 8);
   if (wsize != 8)
	   syslog(LOG_ERR, "mind::write() wsize=%d, error=\"%s\"", wsize, strerror(errno));
   
   fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
   if (fcntl_ret == -1)
	   syslog(LOG_ERR, "mind::ioc_begin() fcntl_ret=%d, error=\"%s\"%", fcntl_ret, strerror(errno));
   rsize = read(fdesc, out_ptr, 8);
   if (rsize != 8)
	   syslog(LOG_ERR, "mind::read() rsize=%d, error=\"%s\"", strerror(errno));

  
   out_ptr += 8; in_ptr += p; 
   len = len - p;
//   sem_post(&mind_sem);
// !!!!!!!!!!!!!!!!!!!!!!!!!!!

   for (p=0; p < len; p += 8) {
//      BF_ecb_encrypt(in_ptr + p,  out_ptr + p, &key, BF_ENCRYPT);


//	   sem_wait(&mind_sem);
// !!!!!!!!!!!!!!!!!!!!!!!!!!!
	   // I request semaphore_wait() everytime, increase overhead
	   // but prefer for multi-processes system.
	   wsize = write(fdesc, in_ptr + p, 8);
	   if (wsize != 8)
		   syslog(LOG_ERR, "vtun - mind::write() error=\"%s\"", strerror(errno));
	   fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	   if (fcntl_ret < 0)
		   syslog(LOG_ERR, "vtun - mind::ioc_begin() error=\"%s\"", strerror(errno));
	   rsize = read(fdesc, out_ptr + p, 8);
	   

#ifndef POSIX_SEMAPHORE // NOT !!!
  id = semget(KEY, 1, 0666);
  if (id < 0) 
	  syslog(LOG_ERR, "CanNOT find semaphore");
  sem_ret = semop(id, sem_post_op, 1);
  if ( sem_ret != 0 )
	  syslog(LOG_ERR, "CanNOT lock because \"%s\"", strerror(errno));
#else // defined
	   if (sem_post(&mind_sem) == -1)	// release 'mind'
		   syslog(LOG_ERR, "sem_post, Invalid semaphore, mind_sem");
#endif // POSIX_SEMAPHORE

	   if (rsize != 8)
		   syslog(LOG_ERR, "vtun - mind::read() error=\"%s\"", strerror(errno));
   }

   *out = enc_buf;
   return len + 8;
}

int decrypt_buf(int len, char *in, char **out)
{
   register int p;
   int fcntl_ret, rsize, wsize;

   int sem_ret;
#ifndef POSIX_SEMAPHORE // NOT !!!
  id = semget(KEY, 1, 0666);
  if (id < 0) 
	  syslog(LOG_ERR, "CanNOT find semaphore");
  sem_ret = semop(id, sem_wait_op, 1);
  if ( sem_ret != 0 )
	  syslog(LOG_ERR, "CanNOT lock because \"%s\"", strerror(errno));
#else // defined
  if (sem_wait(&mind_sem) == 1)	// prevent access simultaneous
	  syslog(LOG_ERR, "sem_wait, Invalid semaphore mind_sem");
#endif // POSIX_SEMAPHORE


   for (p = 0; p < len; p += 8) {
//      BF_ecb_encrypt(in + p, in + p, &key, BF_DECRYPT);

	   wsize = write(fdesc, in + p, 8);
	   if (wsize != 8)
		   syslog(LOG_ERR, "vtun - mind::write() error=\"%s\"", strerror(errno));

	   fcntl_ret = ioctl(fdesc, MIND_IOC_BEGIN, 0xffffffff);
	   if (fcntl_ret < 0)
		   syslog(LOG_ERR, "vtun - mind::set_key() error=\"%s\"", strerror(errno));
	   rsize = read(fdesc, in + p, 8);
	   if (rsize != 8 )
		   syslog(LOG_ERR, "vtun - mind::read() error=\"%s\"", strerror(errno));
   }
#ifndef POSIX_SEMAPHORE // NOT !!!
  id = semget(KEY, 1, 0666);
  if (id < 0) 
	  syslog(LOG_ERR, "CanNOT find semaphore");
  sem_ret = semop(id, sem_wait_op, 1);
  if ( sem_ret != 0 )
	  syslog(LOG_ERR, "CanNOT lock because \"%s\"", strerror(errno));
#else // defined
   if (sem_post(&mind_sem) == -1)	// release 'mind'
	   syslog(LOG_ERR, "sem_post, Invalid semaphore, mind_sem");
#endif // POSIX_SEMAPHORE

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
