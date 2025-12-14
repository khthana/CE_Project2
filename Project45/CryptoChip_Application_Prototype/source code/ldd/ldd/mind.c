/**********************************************************************
# $RCSfile: mind.c,v $
# $Revision: 1.9 $
# last change by $Author: sirikhum $
# at $Date: 2003/01/20 03:15:56 $
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
//#define MIND_DEBUG 3

#include "mind.h"

MODULE_AUTHOR("Erik M Sirikhum (s2010159@ce.kmitl.ac.th)");
MODULE_DESCRIPTION("Driver for my isagcrypt");
MODULE_LICENSE("LGPL");

static u64 *mind_din_p;			// aka. din (CORE)
static u64 *mind_cdata_p;			// aka. cdata (CORE)
//static u64 mind_key=0x0123456789abcdef;	// static key
static u64 mind_key=0x0000000000000000;	// static key

#ifdef NO_MIND
static u64 no_mind_din	= 0x0000000000000000;
static u64 no_mind_cdata= 0x0000000000000000;
static u64 no_mind_key	= 0x0000000000000000;
//#define no_mind_key	mind_key
//static u64 no_mind_key	= 0x0000000000000000;
#endif

static unsigned long mind_din_size=0;	
static unsigned long mind_cdata_size=0;
static unsigned int mind_changed_key_flag=0;	// 1 if changed since CORE
static unsigned int mind_changed_din_flag=0;	// 1 if changed since CORE
	// read data and write data r the same size
//static unsigned char mind_busy=1;		// during transfer with CORE
static struct semaphore mind_read_sem;		// mutex read()
static struct semaphore mind_write_sem;		// mutex write()
static struct semaphore mind_ioctl_sem;		// mutex key and port

static spinlock_t mind_s_lock;
static unsigned int mind_s_count=0;

static struct file_operations mind_fops = {
	read:	mind_read,
	write:	mind_write,
	ioctl:	mind_ioctl,
	open:	mind_open,
	release:	mind_release,
};


// This section is about underlying such as port
// and also contain XOR for NO_MIND

#ifdef NO_MIND
static inline void no_mind_out_key(u16 port, u16 key_16) {
#if MIND_DEBUG > 2
	printk("<1>no_mind_out_key(port=0x%x, din_16=0x%x)\n", port, key_16);
#endif
	switch(port) {
		case MIND_PORT_KEY4:
			no_mind_key = (no_mind_key & MIND_0MASK1) | \
				((u64 )key_16 << 48);
			break;
		case MIND_PORT_KEY3:
			no_mind_key = (no_mind_key & MIND_0MASK2) | \
				((u64 )key_16 << 32);
			break;
		case MIND_PORT_KEY2:
			no_mind_key = (no_mind_key & MIND_0MASK3) | \
				((u64 )key_16 << 16);
			break;
		case MIND_PORT_KEY1:
			no_mind_key = (no_mind_key & MIND_0MASK4) | \
				((u64 )key_16 );
			break;
	}
#if MIND_DEBUG > 2
	printk("<1>no_mind_out_key(no_mind_key=%llx)\n", no_mind_key);
#endif

}


static inline void no_mind_out_din(u16 port, u16 din_16) {
#if MIND_DEBUG > 2
	printk("<1>no_mind_out_din(port=0x%x, din_16=0x%x)\n", port, din_16);
#endif
	switch (port) {
		case MIND_PORT_DIN1:
			no_mind_din = (no_mind_din & MIND_0MASK4) | \
				(u64 )din_16 ;
			break;
		case MIND_PORT_DIN2:
			no_mind_din = (no_mind_din & MIND_0MASK3) | \
				((u64 )din_16 << 16);
			break;
		case MIND_PORT_DIN3:
			no_mind_din = (no_mind_din & MIND_0MASK2) | \
				((u64 )din_16 << 32);
			break;
		case MIND_PORT_DIN4:
			no_mind_din = (no_mind_din & MIND_0MASK1) | \
				((u64 )din_16 << 48);
			break;
	}
#if MIND_DEBUG > 2
	printk("<1>no_mind_out_din(no_mind_din=%llx)\n", no_mind_din);
#endif
}


static inline u16 no_mind_in_cdata(u16 port) {
	no_mind_cdata = no_mind_din ^ no_mind_key;
	switch(port) {
		case MIND_PORT_CDATA1:
			return (u16 )(no_mind_cdata );
		case MIND_PORT_CDATA2:
			return  (u16 )(no_mind_cdata >> 16);
		case MIND_PORT_CDATA3:
			return (u16 )(no_mind_cdata >> 32);
		case MIND_PORT_CDATA4:
			return (u16 )(no_mind_cdata >> 48);
		default:
			return 0xffff;
	}
}
#endif // NO_MIND

static int begin_crypt() {
	int i, j;
	int ret;
//	u16 out_in_data;
	u64 *din_pos, *cdata_pos, din_buf;

	if (down_interruptible(&mind_write_sem)) {
		return  -ERESTARTSYS;	// can't lock plain data
	}
	if (down_interruptible(&mind_read_sem)) {
		ret = -ERESTARTSYS;	// can't lock cdata
		goto out_in;
	}

	j = mind_din_size / 8;
	
	if (mind_cdata_p)
		kfree((void *)mind_cdata_p);
	mind_cdata_p = (u64 *) kmalloc(mind_din_size*(sizeof(char )), GFP_KERNEL);
	mind_cdata_size = mind_din_size*(sizeof(char ));
	cdata_pos = mind_cdata_p;
	if (!mind_cdata_p) {
		ret = -ENOMEM;
		goto out_full;
	}
	memset(mind_cdata_p, 0, mind_cdata_size);

	din_pos = mind_din_p;
	if (!din_pos) {
		ret = -EFAULT;
		goto out_full;
	}

	for (i=0; i<j; i++) {
		din_buf = *din_pos;
#ifdef MIND_DEBUG
#ifdef NO_MIND
		printk("<1>out_CORE_in(din=0x%llxx, key=0x%llx, cdata=0x%llx)\
				\n", no_mind_din, no_mind_key, no_mind_cdata);
#endif 
#endif

		*cdata_pos = out_CORE_in(din_buf);
#ifdef MIND_DEBUG
#ifndef NO_MIND
		printk("<1>out_CORE_in(0x%llx)\n", din_buf);
#else
		printk("<1>out_CORE_in(din=0x%llxx, key=0x%llx, cdata=0x%llx)\
				\n", no_mind_din, no_mind_key, no_mind_cdata);
#endif 
#endif

		cdata_pos++;
		din_pos++;
	}

	mind_changed_din_flag = 0;
	mind_changed_key_flag = 0;
	ret = 0;
out_full:
	up(&mind_read_sem);
out_in:
	up(&mind_write_sem);
	return ret;
}

static u64 out_CORE_in(u64 plain_data) {
	int k, l;
	u16 data;
	u64 ret_cdata=0x0000000000000000, cdata_mask;

	for (k=4, l=1; k>0; k--, l++) {
		data = (plain_data & 0x000000000000ffff);
#if MIND_DEBUG > 1
		printk("<1>__out_CORE_data(k=%d, data=0x%0x\n", \
				l, data);
#endif
		out_s_data(l, data);
#ifdef NO_MIND
		out_s_key(l);
#endif
		plain_data >>= 16;
	}

	cdata_mask = MIND_0MASK1;
	for (k=4, l=1; k>0; k--, l++) {
		data = in_s_data(l);
/*#ifdef MIND_DEBUG
		printk("<1>__in_CORE(k=%d, data=0x%0x\n", \
				l, data);
#endif*/
		switch(l) {
			case 4:
				cdata_mask = MIND_0MASK1;
				break;
			case 3:
				cdata_mask = MIND_0MASK2;
				break;
			case 2:
				cdata_mask = MIND_0MASK3;
				break;
			case 1:
				cdata_mask = MIND_0MASK4;
				break;
		}
		ret_cdata = (ret_cdata & cdata_mask) | \
			(((u64 )data) << (16*(l-1)));
//		cdata_mask >>= 16;
//		cdata_mask |= ((u64 )0xffff) <<(16*(k-1));
#if MIND_DEBUG > 2
		printk("<1>  __in_CORE(cdata = 0x%llx),\n    mask=0x%llx temp=0x%llx\n",\
				ret_cdata, cdata_mask, ((u64 )data <<(16*(k-1))));
#endif
	}
	return ret_cdata;
}

static inline u16 in_s_data(int i) {
	switch (i) {
		case 1:
			return __in_cdata(MIND_PORT_CDATA1);
		case 2:
			return __in_cdata(MIND_PORT_CDATA2);
		case 3:
			return __in_cdata(MIND_PORT_CDATA3);
		case 4:
			return __in_cdata(MIND_PORT_CDATA4);
		default:
			return 0xffff;
	}
}

static inline void out_s_data(int i, u16 data) {
	switch (i) {
		case 1:
			__out_din(MIND_PORT_DIN1, data);
			break;
		case 2:
			__out_din(MIND_PORT_DIN2, data);
			break;
		case 3:
			__out_din(MIND_PORT_DIN3, data);
			break;
		case 4:
			__out_din(MIND_PORT_DIN4, data);
			break;
		default:
			break;
	}
}			

static void out_key() {
	int i;
	for (i=0; i<4; i++) {
		out_s_key(i+1);
	}
}

static inline void out_s_key(int i) {
	switch (i) {
		case 1:
			__out_key(MIND_PORT_KEY4, \
				(u16 ) ((mind_key & 0xffff000000000000) >> 48));
			break;
		case 2:
			__out_key(MIND_PORT_KEY3, \
				(u16 ) ((mind_key & 0x0000ffff00000000) >> 32));
			break;
		case 3:
			__out_key(MIND_PORT_KEY2, \
				(u16 ) ((mind_key & 0x00000000ffff0000) >> 16));
			break;
		case 4:
			__out_key(MIND_PORT_KEY1, \
				(u16 ) (mind_key & 0x00000000000ffff));
			break;
		default:
			break;
	}
}



// --------------------------------------------------
// This Section is about module's init() and release
// and also include how to register device special file
// ---------------------------------------------------
//
// Detect && Request for region

static int mind_detect_port(unsigned int port, unsigned int range) {
	int err;
	if ((err=check_region(port, range))<0) return err;
	// Maybe we need to probe if our dev is working properly here;

	request_region(port, range, "mind");
	return 0;
}

// Release port (always release)
static void mind_release_port(unsigned int port, unsigned int range) {
	release_region(port, range);
}

// Register_Device_Special_File();
static int mind_register_dev() {
	if (register_chrdev(MIND_MAJOR_NO, MIND_NAME, &mind_fops)) {
		printk("<1>unable to get major %d for IsagCrypt\n",
				MIND_MAJOR_NO);
		return -EIO;
	}
	out_key();
	return 0;
}

// Release _Device_Special_File();
static int mind_unregister_dev() {
	int err;
	err = unregister_chrdev(MIND_MAJOR_NO, MIND_NAME);
#ifdef MIND_DEBUG
	printk("<1>unregister_dev() return %d\n", err);
#endif
	return err;
}

// int main(){}
int init_module(void) { 
	int err;
	printk("<1>Hello Wonderful World\n");
	spin_lock_init(&mind_s_lock);
	sema_init(&mind_read_sem, 1);
	sema_init(&mind_write_sem, 1);
	sema_init(&mind_ioctl_sem, 1);
	if (( err=mind_detect_port(MIND_PORT_FLOOR, MIND_PORT_RANGE))<0)
		return err;
	return mind_register_dev(); 
}

// __EXIT();
void cleanup_module(void) { 
	printk("<1>Goodbye cruel world\n");
	mind_release_port(MIND_PORT_FLOOR, MIND_PORT_RANGE);
	mind_unregister_dev();
}


// --------------------------------------------------
// This Section is about file operation
// and other important machanism about data hadling
// --------------------------------------------------
//
// read() -- single
static ssize_t mind_read(struct file *flip, char *buf, size_t len, loff_t *fpos)
{
	size_t ret=0;
//	unsigned char *ptr= (char *)mind_cdata_p;
	u64 *ptr = mind_cdata_p;

#ifdef MIND_DEBUG
	printk("<1>mind_read(*mind_cdata_p = 0x%llx) \n \
			len=%d, mind_cdata_size=%ld\n",\
			*mind_cdata_p, len, mind_cdata_size);
#endif 

	if (down_interruptible(&mind_read_sem))
		return -ERESTARTSYS;
/*	if (*fpos > mind_cdata_size)		// out of position
		goto out_read;
	if (*fpos+len > mind_cdata_size)	// request to much data
		len = mind_cdata_size - *fpos;	// trim down
	ptr += *fpos;			// point to correct prosition
	ret = len;
	

#ifdef MIND_DEBUG
	printk("<1> - mind_read(*mind_cdata_p = 0x%llx) position=%d\n",\
			*((u64 *)ptr), *fpos);
#endif*/ 

	if (copy_to_user(buf, ptr, len)) {
		ret = -EFAULT;
		goto out_read;
	}

out_read:
	up(&mind_read_sem);
	return ret;
}


static ssize_t mind_write(struct file *flip, const char *buf, size_t len,
		loff_t *fpos) {
	size_t ret=0;
#ifdef MIND_DEBUG
	printk("<1>mind_write(buf = 0x%llx) len=%d\n",*((u64 * ) buf) , len);
//	printk("<1>  buf[0]=0x%x, buf[%d]=0x%x\n", buf[0], len-1, buf[len-1]);
#endif

	if (down_interruptible(&mind_write_sem))
		return -ERESTARTSYS;
	if (!len%8) {
		ret = -EINVAL;	// Invalid argument(data_size should be *8)
		goto out_write;
	}
	if (len > MIND_MAX_SIZE) {
		ret = -E2BIG; // Too Large
		goto out_write;
	}
	
	if (mind_din_p)
		kfree((void *)mind_din_p);

	mind_din_p = (u64 *) kmalloc(len*(sizeof(char *)), GFP_KERNEL);
	if (!mind_din_p) {
		ret = -ENOMEM;
		goto out_write;
	}
	memset(mind_din_p, 0, len*(sizeof(char *)));
	if (copy_from_user((char *)mind_din_p, buf, len)) {
		ret = -EFAULT;
		goto out_write;
	}
	
	*fpos = len;
	mind_din_size = len;
	mind_changed_din_flag = 1;
	ret = len;
#ifdef MIND_DEBUG
	printk("<1>** mind_write(*mind_din_p = 0x%llx)\n", *(u64 *)mind_din_p);
#endif

out_write:
	up(&mind_write_sem);
	return ret;
}

static int mind_ioctl(struct inode *ip, struct file *flip, unsigned int cmd,
		unsigned long arg) {
	int ret = 0;
//	u32 k1;
//	u32 k2;
#ifdef MIND_DEBUG
	printk("<1>mind_ioctl(cmd=%d, arg=0x%lx\n", cmd, arg);
#endif
	if (down_interruptible(&mind_ioctl_sem))
		return -ERESTARTSYS;

	switch (cmd) {
		case MIND_IOC_BEGIN: 
		{
			// port		
			ret = begin_crypt();		
			break;
		}

		case MIND_IOC_SKEY:
		{
			if (!access_ok(VERIFY_READ, (void *)arg, sizeof(u64))) {
				ret = -EFAULT;
				goto out_ioctl;
			} 
			// Not need if use get_user() instead of __get_user() 

//			__get_user(mind_key, (u64 *)arg);
//			get_user(mind_key, (u64 *)arg);
//			get_user(k1, (u32 *)arg);
//			get_user(k2, (u32 *)(arg-4));
//			mind_key = (((u64 )k2) << 8) | (k1); 
//			mind_key = k1;
			if (copy_from_user((char *)&mind_key, (char *)arg, 8)) {
				ret = -EFAULT;
				goto out_ioctl;
			}
#ifdef MIND_DEBUG
			printk("<1>mind_set_key(key = 0x%llx\n", mind_key);
#endif
			out_key();
			mind_changed_key_flag = 1;
			break;
		}

		case MIND_IOC_GKEY:
		{
			if (!access_ok(VERIFY_WRITE, (void *)arg, sizeof(u64))) {
				ret = -EFAULT;
				goto out_ioctl;
			}

//			__put_user(mind_key, (u64 *)arg);
			put_user(mind_key, (u64 *)arg);
			break;
		}

#ifdef MIND_DEBUG
		case MIND_IOC_SKEY1:
		{
			mind_key = (mind_key & 0xffffffffffff0000) | \
				(arg & 0xffff0000);
			out_s_key(1);
			mind_changed_key_flag = 1;
			break;
		}

		case MIND_IOC_SKEY2:
		{
			mind_key = (mind_key & 0xffffffff0000ffff) | \
				(arg & 0xffff0000);
			out_s_key(2);
			mind_changed_key_flag = 1;
			break;
		}

		case MIND_IOC_SKEY3:
		{
			mind_key = (mind_key & 0xffff0000ffffffff) | \
				(arg & 0xffff0000);
			out_s_key(3);
			mind_changed_key_flag = 1;
			break;
		}

		case MIND_IOC_SKEY4:
		{
			mind_key = (mind_key & 0x0000ffffffffffff) | \
				(arg & 0xffff0000);
			out_s_key(4);
			mind_changed_key_flag = 1;
			break;
		}

		case MIND_IOC_GKEY1:
		{
			break;
		}

		case MIND_IOC_GKEY2:
		{
			break;
		}

		case MIND_IOC_GKEY3:
		{
			break;
		}

		case MIND_IOC_GKEY4:
		{
			break;
		}

		case MIND_IOC_HARDRESET:
		{
			while (MOD_IN_USE)
				MOD_DEC_USE_COUNT;
			MOD_INC_USE_COUNT;	// --() in release()
			break;
		}
#endif
		default:
			break;
	}
out_ioctl:
	up(&mind_ioctl_sem);
	return ret;
}

static int mind_open(struct inode *ip, struct file *flip) {
	int num = MIND_NUM(ip->i_rdev);
//	struct mind_dev *dev; // use in next version
#ifdef DEBUG
	printk("<1>mind_open(mind_s_count=%d)\n", mind_s_count);
#endif
	
	if (num > 0)
		return -ENODEV;
	
	// begin SINGLE open checking
	spin_lock(&mind_s_lock);
	if (mind_s_count) {
		spin_unlock(&mind_s_lock);
		return -EBUSY;
	}
	mind_s_count++;
	spin_unlock(&mind_s_lock);
	
	MOD_INC_USE_COUNT;
	return 0;
}

static int mind_release(struct inode *ip, struct file *flip) {

	spin_lock(&mind_s_lock);
	mind_s_count--;
	spin_unlock(&mind_s_lock);

	MOD_DEC_USE_COUNT;
	return 0;
}
