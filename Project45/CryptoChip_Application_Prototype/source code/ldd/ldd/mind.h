/***********************************************************************
# $RCSfile: mind.h,v $
# $Revision: 1.6 $
# last change by $Author: sirikhum $
# at $Date: 2003/01/02 12:43:12 $
***********************************************************************
#
#   GNU Lesser General Public License Version 2.1
#   ===============================================
#   Copyright 2002 by Noppadon Sirikhum
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License version 2.1, as published by the Free Software Foundation.
#
#   This library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public
#   License along with this library; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston,
#   MA  02111-1307  USA
#
***********************************************************************/
#ifndef MIND_H
#define MIND_H

#include <linux/ioport.h>	// reserve port
#include <linux/errno.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/fs.h>
#include <linux/spinlock.h>
#include <asm/semaphore.h>
#include <asm/uaccess.h>	// get_user(), put_user()
#include <linux/errno.h>
#include <linux/slab.h>		// kmalloc() and kfree()
#include <asm/io.h>		// inw(), outw()

#define MIND_PORT_FLOOR 0x110
#define MIND_PORT_CEIL 	0x125
#define MIND_PORT_RANGE 0x020

#define MIND_PORT_DIN1	0x110
#define MIND_PORT_DIN2	0x112
#define MIND_PORT_DIN3	0x114
#define MIND_PORT_DIN4	0x116

#define MIND_PORT_KEY1	0x118
#define MIND_PORT_KEY2	0x11a
#define MIND_PORT_KEY3	0x11c
#define MIND_PORT_KEY4	0x11e

#define MIND_PORT_CDATA1	0x120
#define MIND_PORT_CDATA2	0x122
#define MIND_PORT_CDATA3	0x124
#define MIND_PORT_CDATA4	0x126

#define MIND_FMASK1	0xffff000000000000
#define MIND_FMASK2	0x0000ffff00000000
#define MIND_FMASK3	0x00000000ffff0000
#define MIND_FMASK4	0x000000000000ffff

#define MIND_0MASK1	0x0000ffffffffffff
#define MIND_0MASK2	0xffff0000ffffffff
#define MIND_0MASK3	0xffffffff0000ffff
#define MIND_0MASK4	0xffffffffffff0000

#define MIND_MAJOR_NO 250
#define MIND_NAME "mind"
#define MIND_MAX_SIZE 1024

#define MIND_TYPE(dev) (MINOR(dev) >> 4) 	// high nibble
#define MIND_NUM(dev) (MINOR(dev) & 0xf) 	// low nibble

#ifndef MIND_IOC_MAGIC			// haven't defined IOCTL yet.
#define MIND_IOC_MAGIC 0xAA		// our MAGIC_#
#define MIND_IOC_BEGIN	 	(MIND_IOC_MAGIC << 8) | 69
#define MIND_IOC_SKEY		(MIND_IOC_MAGIC << 8) | 70
#define MIND_IOC_GKEY		(MIND_IOC_MAGIC << 8) | 71
#ifdef MIND_DEBUG
#define MIND_IOC_SKEY1		(MIND_IOC_MAGIC << 8) | 82
#define MIND_IOC_SKEY2		(MIND_IOC_MAGIC << 8) | 83
#define MIND_IOC_SKEY3		(MIND_IOC_MAGIC << 8) | 84
#define MIND_IOC_SKEY4		(MIND_IOC_MAGIC << 8) | 85
#define MIND_IOC_GKEY1		(MIND_IOC_MAGIC << 8) | 86
#define MIND_IOC_GKEY2		(MIND_IOC_MAGIC << 8) | 87
#define MIND_IOC_GKEY3		(MIND_IOC_MAGIC << 8) | 88
#define MIND_IOC_GKEY4		(MIND_IOC_MAGIC << 8) | 89
#define MIND_IOC_HARDRESET	(MIND_IOC_MAGIC << 8) | 90
#endif // MIND_DEBUG
#endif // MIND_IOC_MAGIC

#ifndef NO_MIND
#define __out_key(port, key_16)		outw(key_16, port)	
#define __out_din(port, din_16)		outw(din_16, port)	
#define __in_cdata(port)		inw(port)
/*#define __out_key(port, key_16)		outw_p(key_16, port)	
#define __out_din(port, din_16)		outw_p(din_16, port)	
#define __in_cdata(port)		inw_p(port)*/
/*#define __out_key(port, key_16)		isa_writew(key_16, port)	
#define __out_din(port, din_16)		isa_writew(din_16, port)	
#define __in_cdata(port)		isa_readw(port)*/
#else
#define __out_key(port, key_16)		no_mind_out_key(port, key_16)	
#define __out_din(port, din_16)		no_mind_out_din(port, din_16)	
#define __in_cdata(port)		no_mind_in_cdata(port)
static inline void no_mind_out_key(u16 port, u16 key_16);
static inline void no_mind_out_din(u16 port, u16 din_16);
static inline u16 no_mind_in_cdata(u16 port);
#endif

/* typedef struct mind_dev {
	struct mind_dev *next;	// next device
	int quantum;		// current quantum size
	int qset;		// current array size
	u64 **read_ptr;		// aka. din (CORE)
	u64 **write_ptr;	// aka. cdata (CORE)
	u64 key=0x0000000000000000;	// static key
	unsigned long data_size=0;	
		// read data and write data r the same size
	struct semaphore sem;	// mutex sem
} */ // This will use in the next version


// file_operations
static ssize_t mind_read(struct file *, char *, size_t, loff_t *);
static ssize_t mind_write(struct file *, const char *, size_t, loff_t *);
static int mind_ioctl(struct inode *, struct file *, unsigned int, unsigned long);
static int mind_open(struct inode *, struct file *);
static int mind_release(struct inode *, struct file *);

// be used internally
static int begin_crypt();
static u64 out_CORE_in(u64 );
static inline u16 in_s_data(int );
static inline void out_s_data(int , u16);
static inline void out_s_key(int );
static int mind_detect_port(unsigned int , unsigned int );
static void mind_release_port(unsigned int , unsigned int );
static int mind_register_dev();
static int mind_unregister_dev();

#endif // MIND_H
