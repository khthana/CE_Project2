#include <linux/config.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>

#include <linux/kernel.h>
#include <linux/slab.h>		/* kmalloc() */
#include <linux/fs.h>		/* everything... */
#include <linux/errno.h>	/* error codes */
#include <linux/types.h>	/* size_t */
#include <linux/fcntl.h>	/* O_ACCMODE */
#include <linux/pci.h>
#include <linux/cdev.h>
//#include <linux/interrupt.h>	/* interrupt API */
//#include <linux/irq.h>		/* irq */
#include <linux/string.h>	/* string manipulation */
#include <linux/delay.h>

#include <asm/system.h>		/* cli(), *_flags */
#include <asm/uaccess.h>	/* copy_*_user */

#include "crypto_des.h"

static unsigned int key_H2;
static unsigned int key_L2;
static unsigned int key_H3;
static unsigned int key_L3;
static int direction;

int crypto_major = CRYPTO_DES_MAJOR;
int crypto_minor = 0;
int crypto_nr_devs = CRYPTO_DES_NR_DEVS;

//u32 *conv;			// Contain Cipher Text or Hex String from decryption
u32 conv[32000];			// Contain Cipher Text or Hex String from decryption
int s;			// Contain size of Cipher Text or Hex String from decryption
u8 *ofb;			// Contain Cipher Text or Hex String

static char sendPassed = 1; // sendPassed is used to identify that 1 = Not send passwd

struct crypto_des *crypto_devices;		/* allocated in cryptochip_init */

// The first device is the single-open one,
// it has an hw structure and an open count
static atomic_t cryptochip_available = ATOMIC_INIT(1);	/* Can use one process at time */

// Next, the "uid" device. It can be opened multiple times by the
// same user, but access is denied to other users if the device is open
static int cryptochip_count;		/* initialized to 0 by default */
static uid_t cryptochip_owner;		/* initialized to 0 by default */
static spinlock_t cryptochip_u_lock = SPIN_LOCK_UNLOCKED;
static spinlock_t rw_u_lock = SPIN_LOCK_UNLOCKED;

static DECLARE_WAIT_QUEUE_HEAD(wq);
static int doFlag = 0;


// Mode of Operation
static int modeop = 0;	// Mode of Operation
			// 0 : ECB, 1 : CBC, 2 : OFB, 3 : CFB, 4 : 3DES (EDE - DED)

//int crypto_quantum = CRYPTO_QUANTUM;
//int crypto_qset = CRYPTO_QSET;
	
MODULE_LICENSE("GPL");
MODULE_AUTHOR("ISAG_CryptoChip");

static struct pci_device_id ids[] = {
	{ PCI_DEVICE(VENDOR_ID, DEVICE_ID), },
	{0, },
};

MODULE_DEVICE_TABLE(pci, ids);

void sendPass(void)
{
	printk(KERN_WARNING "This is sendPass();\n");
	writel(PASS_PCI, crypto_devices->io_v_base + PASS_ADDR);
}

/*
int crypto_trim (struct crypto_des *dev)
{
	struct crypto_qset *next, *dptr;
	int qset = dev->qset;
	int i;

	for (dptr = dev->data; dptr; dptr = next) {
		if (dptr->data) {
			for (i = 0; i < qset; i++)
				kfree(dptr->data[i]);
			kfree(dptr->data);
			dptr->data = NULL;
		}
		next = dptr->next;
		kfree(dptr);
	}
	dev->size = 0;
	dev->quantum = crypto_quantum;
}
*/

int cryptochip_open (struct inode *inode, struct file *filp)
{
	printk(KERN_WARNING "Open cryptochip\n");

	// struct crypto_sha *dev = &crypto_devices; /* device information */

	// Check first opening
	if (!atomic_dec_and_test(&cryptochip_available)){
		atomic_inc(&cryptochip_available);
		return -EBUSY;			/* already open */
	}

if(1) { /* 1 : Enable single-user mode */
	// Check single-user open
	spin_lock(&cryptochip_u_lock);
	if (//cryptochip_u_lock && 
			(cryptochip_owner != current->uid) && 		/* allow user */
			(cryptochip_owner != current->euid) &&		/* allow whoever did su */
			!capable(CAP_DAC_OVERRIDE)) {			/* still allow root */
		spin_unlock(&cryptochip_u_lock);
		return -EBUSY;		/* -EPERM would confuse the user */
	}
	spin_unlock(&cryptochip_u_lock);
}
	struct crypto_des *dev;		/* device information */

	dev = container_of(inode->i_cdev, struct crypto_des, cdev);
	filp->private_data = dev;	/* for other methods */

	//printk(KERN_WARNING "io_v_base: %lu\n", crypto_devices->io_v_base + PASS_ADDR);
	printk(KERN_WARNING "io_v_base: %lu\n", (*(unsigned long *) crypto_devices->io_v_base) + PASS_ADDR);
	printk(KERN_WARNING "io_base: %lu\n", crypto_devices->io_base);
	printk(KERN_WARNING "io_len: %lu\n", crypto_devices->io_len);
	printk(KERN_WARNING "PASS_PCI: %lu\n", (unsigned long)PASS_PCI);
	//printk(KERN_WARNING "PASS_PCI: %lu\n", PASS_PCI);
	//printk(KERN_WARNING "PCI Interrupts line %d\n", crypto_devices->irq);

	return 0;
}

int cryptochip_release (struct inode *inode, struct file *filp)
{
	atomic_inc(&cryptochip_available);	/* release the device */

	printk(KERN_WARNING "This is cryptochip_release();\n");
	return 0;
}

ssize_t cryptochip_read (struct file *filp, char *buf, size_t count, loff_t *f_pos)
{
	printk("<4>cryptochip_read function\n");
	if (buf == NULL) {
		printk("<4>Dereference pointer\n");
		return -EFAULT;
	}
	unsigned long flags;

	struct crypto_des *dev = filp->private_data;
	char *output;
	int i;
	char tmp[8];
	char ch[4];
	output = (char *)kmalloc(count, GFP_USER);
	int retval = 0;
	printk("<4>direction = %d\n", direction);
	if (!direction) {					// Encryption -- Cipher Text
		output[0] = '\0';
		for (i=0; i<s; i++){
			spin_lock_irqsave(&rw_u_lock, flags);
			sprintf(tmp, "%08X", conv[i]);
			spin_unlock_irqrestore(&rw_u_lock, flags);
			strcat(output, tmp);
			retval += 8;
		}
		if (copy_to_user(buf, output, retval)){
		//if (copy_to_user(buf, (char *)&conv[0], retval)){
			retval = -EFAULT;
			goto out;
		}
		//printk("<4>output = %s\n", output);
	}else {							// Decryption -- Plain Text
		output[0] = '\0';
		for (i=0; i<s; i++) {
			spin_lock_irqsave(&rw_u_lock, flags);
			sprintf(ch, "%c%c%c%c", conv[i]>>24, conv[i]>>16, conv[i]>>8, conv[i]);
			spin_unlock_irqrestore(&rw_u_lock, flags);
			strcat(output, ch);
		}
		if (copy_to_user(buf, output, count)) {
			retval = -EFAULT;
			goto out;
		}
		//printk("<4>output = %s\n", output);
	}

out:
	//printk("<4>kree(conv);\n");
	//spin_lock_irqsave(&rw_u_lock, flags);
	//kfree(conv);
	//spin_unlock_irqrestore(&rw_u_lock, flags);

	printk("<4>kree(output);\n");
	kfree(output);
	return retval;

}

ssize_t cryptochip_write (struct file *filp, const char *buf, size_t count, loff_t *f_pos)
{
	printk("<4>modeop = %d\n", modeop);
	//printk("<4>Input Source\n");
	//printk("<4>%s\n", buf);
	int retval = 0;
	unsigned long flags;

	spin_lock_irqsave(&rw_u_lock, flags);
	
	char *buff;
	buff = (char *)kmalloc(count, GFP_KERNEL); 
	if (copy_from_user((char *)buff, buf, count)) {
		retval = -EFAULT;
		goto out;
	}
/*
	//printk("<4>buff = \n%s\n", buff);
	int b;
	for (b=0; b<count; b++)
		printk("<4>%c",*(buff+b));
*/

	struct crypto_des *dev = filp->private_data;

	switch (modeop) {
		// ECB MODE
		case 0 : {
			printk("<4>cryptochip_write\n");
			//printk("<4>count = %d\n", count);
			CDEBUG("count = %d\n", count);
			printk("<4>Mode of Operation is ECB\n");
			int size;
			size = count;
			s = size;
			
			printk("<4>direction = %d\n", direction);
			if (!direction){
				s = s / 4;	// Divide with 4 because of input is 4 units in byte.
				//conv = (u32 *)kmalloc(s, GFP_KERNEL);
				conv_text_to_hex(conv, buff, size);
			}else {
				s = s / 8;	// Divide with 8 because of input is 8 units in hex.
				//conv = (u32 *)kmalloc(s, GFP_KERNEL);
				re_conv_text_to_hex(conv, buff, size);
			}
	
			int i, j;
			u32 x;
			u32 y; 
			for (i=0; i<s; i++) {
				CDEBUG("i = %d\n", i);
	
				j = i;
				i++;
				x = conv[j];				// High 
				y = conv[i];				// Lower
				
				writel(x, dev->io_v_base + TEXT_ADDR_H);
				writel(y, dev->io_v_base + TEXT_ADDR_L);
			
				CDEBUG("x = %04X\n", x);
				CDEBUG("i = %d\n", i);
				CDEBUG("y = %04X\n", y);
	
				// Enable hardware to encrypt
				writel(1, dev->io_v_base + ENABLE_SIG_ADDR);
				CDEBUG("Enable hardware to encrypt\n");
				mdelay(1);
	
				// Copy cipher text to conv[i]
				x = readl(dev->io_v_base + CIPHER_ADDR_H);
				conv[j] = x;
				CDEBUG("Cipher[%d] = %08X\n", j, conv[j]);
				y = readl(dev->io_v_base + CIPHER_ADDR_L);
				conv[i] = y;
				CDEBUG("Cipher[%d] = %08X\n", i, conv[i]);
			}
			
			break;
		}
			 
		// CBC MODE
		case 1 : {
			printk("<4>cryptochip_write\n");
			CDEBUG("count = %d\n", count);
			printk("<4>Mode of Operation is CBC\n");
		
			int size;
			size = count;
			s = size;
			
			int i, j;
			u32 x;
			u32 y;
	
			printk("<4>direction = %d\n", direction);
			if (!direction){
				printk("<4>CBC Mode Encryption\n");
				s = s / 4;			// Divide with 4 because of input is 4 units in byte.
				j = 0;
				//conv = (u32 *)kmalloc(s, GFP_KERNEL);
				conv_text_to_hex(conv, buff, size);
				int firstround = 1;
				for (i=0; i<s; i++) {
					j = i;			// Lower
					i++;			// Higher
	
					// XOR With IV
					CDEBUG("<4>XOR Expession\n");
					if (firstround == 1){
						CDEBUG("firstround = %d\n", firstround);
						CDEBUG("conv XOR IV\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i, conv[i]);
						conv[j] ^= crypto_devices->iv_h;
						conv[i] ^= crypto_devices->iv_l;
						CDEBUG("Evaluted conv\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i, conv[i]);
						firstround = 0;
					}else {
						CDEBUG("firstround = %d\n", firstround);
						CDEBUG("conv XOR conv\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", j-2, conv[j-2]);
						CDEBUG("conv[%d] = %08X\n", i, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i-2, conv[i-2]);
						conv[j] ^= conv[j-2];
						conv[i] ^= conv[i-2];
						CDEBUG("Evaluted conv\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i, conv[i]);
					}
	
					x = conv[j];				// High 
					y = conv[i];				// Lower
					
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
			
					// Enable hardware to encrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to encrypt\n");
					mdelay(1);
					
					// Copy cipher text to conv[i]
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					conv[j] = x;
					CDEBUG("Cipher[%d] = %08X\n", j, conv[j]);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
					conv[i] = y;
					CDEBUG("Cipher[%d] = %08X\n", i, conv[i]);
				}	
	
			}else {
				printk("<4>CBC Mode Decryption\n");
	
				// Use to store previous cipher
				u32 cipher_high = 0;
				u32 cipher_low = 0;
				j = 0;
	
				s = s / 8;			// Divide with 8 because of input is 8 units in hex.
				//conv = (u32 *)kmalloc(s, GFP_KERNEL);
				re_conv_text_to_hex(conv, buff, size);
				int firstround = 1;
				for (i=0; i<s; i++) {
					j = i;
					i++;
	
					x = conv[j];				// High 
					y = conv[i];				// Lower
	
					CDEBUG("Text_H = %08X\n", x);
					CDEBUG("Text_L = %08X\n", y);
					
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
			
					// Enable hardware to decrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to decrypt\n");
					mdelay(1);
	
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
					
					// XOR With IV
					if (firstround == 1){
						CDEBUG("firstround = %d\n", firstround);
	
						CDEBUG("x = %08X\n", x);
						x ^= crypto_devices->iv_h;
						CDEBUG("x ^= %08X := %08X\n", crypto_devices->iv_h, x);
	
						CDEBUG("y = %08X\n", y);
						y ^= crypto_devices->iv_l;
						CDEBUG("y ^= %08X := %08X\n", crypto_devices->iv_l, y);
	
						firstround = 0;
					}else {
						CDEBUG("firstround = %d\n", firstround);
						CDEBUG("x = %08X\n", x);
						x ^= cipher_high;
						CDEBUG("x ^= %08X := %08X\n", cipher_high, x);
	
						CDEBUG("y = %08X\n", y);
						y ^= cipher_low;
						CDEBUG("y ^= %08X := %08X\n", cipher_low, y);
					}
	
					cipher_high = conv[j];
					CDEBUG("cipher_high = %08X\n", cipher_high);
					cipher_low = conv[i];
					CDEBUG("cipher_low= %08X\n", cipher_low);
					conv[j] = x;
					CDEBUG("Cipher[%d] = %08X\n", j, conv[j]);
					conv[i] = y;
					CDEBUG("Cipher[%d] = %08X\n", i, conv[i]);
				}	
	
			}
			break;
		}
		// OFB MODE
		case 2 : {
			printk("<4>cryptochip_write\n");
			CDEBUG("count = %d\n", count);
			printk("<4>Mode of Operation is OFB\n");
		
			int size;
			size = count;
			
			s = size;
				
			ofb = (u8 *)kmalloc(s, GFP_KERNEL);
	
			int i;	
			u32 x;						// High	
			u32 y;						// Low
			u8 kbits;
			u8 xorbyte;
	
			// assign IV to X:Y
			x = crypto_devices->iv_h;
			y = crypto_devices->iv_l;
	
			// store IV
			u32 x_pre;
			u32 y_pre;
			u8 *dst;
	
			if (direction) {
				s /= 2;
				dst = (u8 *)kmalloc(s, GFP_KERNEL);
				charTOhex(buff, dst, size);
				direction = 0;
				writel(direction, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
			}else {
				//dst = kmalloc(s, GFP_KERNEL);
				dst = buff;
				//if(copy_from_user((char *)dst, buff, s)) {
				//	return -EFAULT;
				//}
			}
	
			for (i=0; i<s; i++) {
				CDEBUG("i = %d\n", i);
				
				x_pre = x;
				y_pre = y;
	
				CDEBUG("x_pre = %08X\n", x_pre);
				CDEBUG("y_pre = %08X\n", y_pre);
				
				writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
				writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
	
				CDEBUG("x = %08X\n", x);
				CDEBUG("y = %08X\n", y);
	
				// Enable hardware to encrypt
				writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
				CDEBUG("Enable hardware to encrypt\n");
				mdelay(1);
	
				// Create XOR Factor
				x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
				y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
				CDEBUG("XORFAC_H = %08X\n", x);
				CDEBUG("XORFAC_L = %08X\n", y);
	
				// Sub XORFAC to one first byte
				x &= 0xFF000000;
				x >>= 24;
				kbits = x;
	
				CDEBUG("kbits = %X\n", kbits);
				xorbyte = dst[i];
				CDEBUG("xorbyte = %X\n", xorbyte);
				xorbyte ^= kbits;
				ofb[i] = xorbyte;
				CDEBUG("Cipher[%d] = %X\n", i, ofb[i]);
	
				// Prepare IV for next round.
				x = x_pre;
				y = y_pre;
	
				x <<= 8;
				x = x | ((y & 0xFF000000) >> 24);
				y <<= 8; 
				y += kbits;
				CDEBUG("x(IV) = %08X\n", x);
				CDEBUG("y(IV) = %08X\n", y);
			}
		
			kfree(dst);
			break;
		}
		// CFB MODE
		case 3 : {
			printk("<4>cryptochip_write\n");
			CDEBUG("count = %d\n", count);
			printk("<4>Mode of Operation is CFB\n");
		
			int size;
			size = count;
			
			s = size;
			
			ofb = (u8 *)kmalloc(s, GFP_KERNEL);
	
			int i;
			doFlag = 0;
			u32 x;						// High
			u32 y;						// Low
			u8 kbits;
			u8 xorbyte;
	
			// assign IV to X:Y
			x = crypto_devices->iv_h;
			y = crypto_devices->iv_l;
	
			// store IV
			u32 x_pre;
			u32 y_pre;
			u8 *dst;
			
			if (direction) {
				s /= 2;
				dst = (u8 *)kmalloc(s, GFP_KERNEL);
				charTOhex(buff, dst, size);
				direction = 0;
				writel(direction, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
			}else {
				dst = buff;
				//dst = kmalloc(s, GFP_KERNEL);
				//if(copy_from_user((char *)dst, buff, s)) {
				//	return -EFAULT;
				//}
			}
		
			for (i=0; i<s; i++) {
				CDEBUG("i = %d\n", i);
	
				x_pre = x;
				y_pre = y;
	
				CDEBUG("x_pre = %08X\n", x_pre);
				CDEBUG("y_pre = %08X\n", y_pre);
	
				writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
				writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
	
				CDEBUG("x = %08X\n", x);
				CDEBUG("y = %08X\n", y);
	
				// Enable hardware to encrypt
				writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
				CDEBUG("Enable hardware to encrypt\n");
				mdelay(1);
	
				// Create XOR Factor
				x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
				y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
				CDEBUG("XORFAC_H = %08X\n", x);
				CDEBUG("XORFAC_L = %08X\n", y);
	
				// Sub XORFAC to one first byte
				x &= 0xFF000000;
				x >>= 24;
				kbits = x;
	
				CDEBUG("kbits = %X\n", kbits);
				xorbyte = dst[i];
				CDEBUG("xorbyte = %X\n", xorbyte);
				xorbyte ^= kbits;
				ofb[i] = xorbyte;
				CDEBUG("Cipher[%d] = %X\n", i, ofb[i]);
	
				// Prepare IV for next round.
				x = x_pre;
				y = y_pre;
	
				x <<= 8;
				x = x | ((y & 0xFF000000) >> 24);
				y <<= 8; 
				y += xorbyte;
				CDEBUG("x(IV) = %08X\n", x);
				CDEBUG("y(IV) = %08X\n", y);
			}
		
			kfree(dst);
			break;
		}
		/// 3DES CBC OUTTER EDE
		case 4 : {
			printk("<4>cryptochip_write\n");
			CDEBUG("count = %d\n", count);
			printk("<4>3DES CBC OUTTER\n");
		
			int size;
			size = count;
			
			s = size;
			
			int i, j;
			//doFlag = 0;
			u32 x;
			u32 y;
	
			printk("<4>direction = %d\n", direction);
			if (!direction){
				printk("<4>3DES EDE with CBC Mode Encryption\n");
				s = s / 4;			// Divide with 4 because of input is 4 units in byte.
				j = 0;
				//conv = (u32 *)kmalloc(s, GFP_KERNEL);
				conv_text_to_hex(conv, buff, size);
				int firstround = 1;
				for (i=0; i<s; i++) {
					j = i;			// Lower
					i++;			// Higher
	
					// XOR With IV
					CDEBUG("<4>XOR Expession\n");
					if (firstround == 1){
						CDEBUG("firstround = %d\n", firstround);
						CDEBUG("conv XOR IV\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i, conv[i]);
						conv[j] ^= crypto_devices->iv_h;
						conv[i] ^= crypto_devices->iv_l;
						CDEBUG("Evaluted conv\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i, conv[i]);
						firstround = 0;
					}else {
						CDEBUG("firstround = %d\n", firstround);
						CDEBUG("conv XOR conv\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", j-2, conv[j-2]);
						CDEBUG("conv[%d] = %08X\n", i, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i-2, conv[i-2]);
						conv[j] ^= conv[j-2];
						conv[i] ^= conv[i-2];
						CDEBUG("Evaluted conv\n");
						CDEBUG("conv[%d] = %08X\n", j, conv[j]);
						CDEBUG("conv[%d] = %08X\n", i, conv[i]);
					}
	
					x = conv[j];				// High 
					y = conv[i];				// Lower
		
					// Ede
					CDEBUG("Encryption Step : Ede\n");
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
			
					// Enable hardware to encrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to encrypt\n");
					mdelay(1);
					
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
				
					CDEBUG("x[%d] = %08X\n", i, x);
					CDEBUG("y[%d] = %08X\n", i, y);
	
	
					// eDe
					CDEBUG("Encryption Step : eDe\n");
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
	
					// Set key 
					writel(key_L2, crypto_devices->io_v_base + KEY_ADDR_L);
					writel(key_H2, crypto_devices->io_v_base + KEY_ADDR_H);
	
					// 1 : Decryption
					writel(1, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
	
					// Enable hardware to encrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to encrypt\n");	
					mdelay(1);
	
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
	
					CDEBUG("x[%d] = %08X\n", i, x);
					CDEBUG("y[%d] = %08X\n", i, y);
	
					// edE
					CDEBUG("Encryption Step : edE\n");
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
	
					// Set key 
					writel(key_L3, crypto_devices->io_v_base + KEY_ADDR_L);
					writel(key_H3, crypto_devices->io_v_base + KEY_ADDR_H);
			
					// 0 : Encryption
					writel(0, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
	
					// Enable hardware to encrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to encrypt\n");
					mdelay(1);
					
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
	
					CDEBUG("x[%d] = %08X\n", i, x);
					CDEBUG("y[%d] = %08X\n", i, y);
	
					// Output (Cipher)
					conv[j] = x;
					CDEBUG("Cipher[%d] = %08X\n", j, conv[j]);
					conv[i] = y;
					CDEBUG("Cipher[%d] = %08X\n", i, conv[i]);
				}	
	
			}else {
				printk("<4>3DES DED with CBC Mode Decryption\n");
	
				// Use to store previous cipher
				u32 cipher_high = 0;
				u32 cipher_low = 0;
				j = 0;
	
				s = s / 8;			// Divide with 8 because of input is 8 units in hex.
				//conv = (u32 *)kmalloc(s, GFP_KERNEL);
				re_conv_text_to_hex(conv, buff, size);
				int firstround = 1;
				for (i=0; i<s; i++) {
					j = i;
					i++;
	
					x = conv[j];				// High 
					y = conv[i];				// Lower
		
					CDEBUG("Text_H = %08X\n", x);
					CDEBUG("Text_L = %08X\n", y);
	
					// Ded
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
			
					//printk("<4>buf_H = %04X\n", *((u32 *) crypto_devices->first));
					
					// Enable hardware to decrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to decrypt\n");
					mdelay(1);
					
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
	
					CDEBUG("x[%d] = %08X\n", i, x);
					CDEBUG("y[%d] = %08X\n", i, y);
	
					// dEd
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
				
					// Set key 
					writel(key_L2, crypto_devices->io_v_base + KEY_ADDR_L);
					writel(key_H2, crypto_devices->io_v_base + KEY_ADDR_H);
	
					// 0 : Encryption
					writel(0, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
	
					// Enable hardware to decrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to decrypt\n");
					mdelay(1);
					
					mdelay(1);
					
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
	
					CDEBUG("x[%d] = %08X\n", i, x);
					CDEBUG("y[%d] = %08X\n", i, y);
	
					// deD
					writel(x, crypto_devices->io_v_base + TEXT_ADDR_H);
					writel(y, crypto_devices->io_v_base + TEXT_ADDR_L);
			
					// Set key 
					writel(key_L3, crypto_devices->io_v_base + KEY_ADDR_L);
					writel(key_H3, crypto_devices->io_v_base + KEY_ADDR_H);
	
					// 1 : Decryption
					writel(1, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
	
					// Enable hardware to decrypt
					writel(1, crypto_devices->io_v_base + ENABLE_SIG_ADDR);
					CDEBUG("Enable hardware to decrypt\n");
					mdelay(1);
					
					x = readl(crypto_devices->io_v_base + CIPHER_ADDR_H);
					y = readl(crypto_devices->io_v_base + CIPHER_ADDR_L);
	
					CDEBUG("x[%d] = %08X\n", i, x);
					CDEBUG("y[%d] = %08X\n", i, y);
	
					// XOR With IV
					if (firstround == 1){
						CDEBUG("firstround = %d\n", firstround);
	
						CDEBUG("x = %08X\n", x);
						x ^= crypto_devices->iv_h;
						CDEBUG("x ^= %08X := %08X\n", crypto_devices->iv_h, x);
		
						CDEBUG("y = %08X\n", y);
						y ^= crypto_devices->iv_l;
						CDEBUG("y ^= %08X := %08X\n", crypto_devices->iv_l, y);
		
						firstround = 0;
					}else {
						CDEBUG("firstround = %d\n", firstround);
						CDEBUG("x = %08X\n", x);
						x ^= cipher_high;
						CDEBUG("x ^= %08X := %08X\n", cipher_high, x);
		
						CDEBUG("y = %08X\n", y);
						y ^= cipher_low;
						CDEBUG("y ^= %08X := %08X\n", cipher_low, y);
					}
		
					cipher_high = conv[j];
					CDEBUG("cipher_high = %08X\n", cipher_high);
					cipher_low = conv[i];
					CDEBUG("cipher_low= %08X\n", cipher_low);
					conv[j] = x;
					CDEBUG("Cipher[%d] = %08X\n", j, conv[j]);
					conv[i] = y;
					CDEBUG("Cipher[%d] = %08X\n", i, conv[i]);
				}	
		
			}
			break;
		}
			
		default :
			 break;
	}
	printk("<4>End of write function\n");
	kfree(buff);
	retval = count;
	//return count;
out :
	spin_unlock_irqrestore(&rw_u_lock, flags);
	return retval;
}

int cryptochip_ioctl(struct inode *inode, struct file *filp,
					unsigned int cmd, unsigned long arg)
{
	printk("<4>cryptochip_ioctl for %X command \n", cmd);
	// Make sure that the command is really one of cryptochip
	if (_IOC_TYPE(cmd) != MAGIC)
		return -ENOTTY;

	printk("<4>cryptochip_ioctl before switch case\n");
	switch(cmd) {

		case REG_SET_OFFSET : {
			printk("<4>IOCTL : REG_SET_OFFSET \n");
			int offset;
			get_user(offset, (unsigned long *)arg);
			if (offset >= crypto_devices->io_len) {
				crypto_devices->offset = -1;
				return -ENXIO;
			} else
				crypto_devices->offset = offset;
			break;
		}

		case REG_READ : {
			printk("<4>IOCTL : REG_READ\n");
			int data;
			if(crypto_devices->offset == -1)
				return -1;
			data = readl(crypto_devices->io_v_base + crypto_devices->offset);
			put_user(data, (unsigned long *)arg);
			// printk("<4> data = %d", data);
			break;
		}

		case REG_WRITE : {
			printk("<4>IOCTL : REG_WRITE\n");
			int data;
			if (crypto_devices->offset == -1)
				return -1;
			get_user(data, (unsigned long *)arg);
			writel(data, crypto_devices->io_v_base + crypto_devices->offset);
			break;
		}

		case GET_IO_BASE : {
			printk("<4>IOCTL : GET_IO_BASE\n");
			int data;
			data = (int)crypto_devices->io_base;
			if(copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
			break;
		}

		case GET_IO_PYS : {
			printk("<4>IOCTL : GET_IO_PYS\n");
			int data;
			data = (int)__pa(crypto_devices->io_base);
			if(copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
		}

		case GET_IO_LEN : {
			printk("<4>IOCTL : GET_IO_LEN\n");
			int data;
			data = (int)crypto_devices->io_len;
			if (copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
		}

		case GET_IO_VIR : {
			printk("<4>IOCTL : GET_IO_VIR\n");
			int data;
			data = (int)crypto_devices->io_v_base;
			if (copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
			break;
		}

		case ASSIGN_DIRECTION : {
			printk("<4>IOCTL : ASSIGN_DIRECTION\n");
			int data;
			get_user(data, (int *)arg);
			if ((data == 1) || (data == 0)) 
				writel(data, crypto_devices->io_v_base + ENCRYPT_SIG_ADDR);
			else
				return -EFAULT;
			direction = data;
			printk("<4>DIRECTION = %d\n", direction);
			break;
		}

		case INSERT_KEY_H : {
			printk("<4>IOCTL : INSERT_KEY_H\n");
			unsigned int key_h;
			get_user(key_h, (unsigned int *)arg);
			printk("<4>INSERT_KEY_H : key_h = %08X\n", key_h);
			writel(key_h, crypto_devices->io_v_base + KEY_ADDR_H);
			break;
		}

		case INSERT_KEY_L : {	
			printk("<4>IOCTL : INSERT_KEY_L\n");
			unsigned int key_l;
			get_user(key_l, (unsigned int *)arg);
			printk("<4>INSERT_KEY_L : key_l = %08X\n", key_l);
			writel(key_l, crypto_devices->io_v_base + KEY_ADDR_L);
			break;
		}

		case INSERT_KEY_H2 : {
			printk("<4>IOCTL : INSERT_KEY_H\n");
			get_user(key_H2, (unsigned int *)arg);
			printk("<4>INSERT_KEY_H2 : key_H2 = %08X\n", key_H2);
			break;
		}

		case INSERT_KEY_L2 : {	
			printk("<4>IOCTL : INSERT_KEY_L\n");
			get_user(key_L2, (unsigned int *)arg);
			printk("<4>INSERT_KEY_L2 : key_L2 = %08X\n", key_L2);
			break;
		}

		case INSERT_KEY_H3 : {
			printk("<4>IOCTL : INSERT_KEY_H\n");
			get_user(key_H3, (unsigned int *)arg);
			printk("<4>INSERT_KEY_H3 : key_H3 = %08X\n", key_H3);
			break;
		}

		case INSERT_KEY_L3 : {	
			printk("<4>IOCTL : INSERT_KEY_L\n");
			get_user(key_L3, (unsigned int *)arg);
			printk("<4>INSERT_KEY_L3 : key_L3 = %08X\n", key_L3);
			break;
		}

		case ASSIGN_MODE : {
			printk("<4>IOCTL : ASSIGN_MODE\n");
			unsigned int data;
			__get_user(data, (unsigned int __user *)arg);
			if ((data >= 0) && (data <= 4)){ 
				printk("<4>ASSIGN_MODE : data = %d\n", data);
				modeop = data;
		 	}else
				return -EFAULT;
			break;
		}

		case INSERT_IV_L : {		
			printk("<4>IOCTL : INSERT_IV_L\n");
			get_user(crypto_devices->iv_l, (unsigned int __user *)arg);
			printk("<4>INSERT_IV_L : crypto_devices->iv_l = %08X\n", crypto_devices->iv_l);
			break;
		}

		case INSERT_IV_H : {
			printk("<4>IOCTL : INSERT_IV_H\n");
			get_user(crypto_devices->iv_h, (unsigned int __user *)arg);
			printk("<4>INSERT_IV_H : crypto_devices->iv_h = %08X\n", crypto_devices->iv_h);
			break;
		}
		
		default :
			return -ENOTTY;

	}
	
	return 0;
}

struct file_operations cryptochip_fops = {
	.owner		= THIS_MODULE,
	//.llseek		= cryptochip_llseek,
	.read		= cryptochip_read,
	.write		= cryptochip_write,
	.ioctl		= cryptochip_ioctl,
	.open		= cryptochip_open,
	.release	= cryptochip_release,
};

static unsigned char cryptochip_get_revision(struct pci_dev *dev)
{
	u8 revision;
	
	pci_read_config_byte(dev, PCI_REVISION_ID, &revision);
	return revision;
}

static int probe(struct pci_dev *dev, const struct pci_device_id *id)
{
	printk(KERN_WARNING "This is probe();\n");
	long resource_flag;
	/* Do probing type stuff here.
	 * Like calling request_region();
	 */

	printk(KERN_WARNING "Next: pci_enable_device();\n");
	
	pci_set_drvdata(dev, crypto_devices);
	
	pci_enable_device(dev);
	if(cryptochip_get_revision(dev) == 0x42)
		return -ENODEV;
	
	crypto_devices->io_base = pci_resource_start(dev, 0);
	crypto_devices->io_len = pci_resource_len(dev, 0);
	resource_flag = pci_resource_flags(dev, 0);
	
	if(!crypto_devices->io_base || ((resource_flag & IORESOURCE_MEM) == 0)){
		printk(KERN_WARNING "io_base not correct !!!");
		return -ENODEV;
	}
	
	crypto_devices->io_v_base = ioremap(crypto_devices->io_base, crypto_devices->io_len);

	if(sendPassed == 1) {
		sendPass();
		sendPassed = 0;
	}

	return 0;
}

static void remove(struct pci_dev *dev)
{
	printk(KERN_WARNING "This is remove();\n");
	/* clean up any allocated resources and stuff here.
	 * like call release_region();
	 */
	pci_disable_device(dev);
}

static struct pci_driver crypto_pci_driver = {
	.name = DEVICE_NAME,
	.id_table = ids,
	.probe = probe,
	.remove = remove,
};

static int cryptochip_setup_cdev(struct crypto_des *dev)
{
	int err, devno = MKDEV(crypto_major, crypto_minor);
	
	cdev_init(&dev->cdev, &cryptochip_fops);
	dev->cdev.owner = THIS_MODULE;
	dev->cdev.ops = &cryptochip_fops;
	err = cdev_add (&dev->cdev, devno, 1);
	/* Fail gracefully if need be */
	if (err) 
		printk(KERN_NOTICE "Error %d adding cryptochip\n", err);
	return err;
}

static void cryptochip_exit(void)
{
	printk(KERN_WARNING "This is cryptochip_exit();\n");

	int i;
	dev_t devno = MKDEV(crypto_major, crypto_minor);
	
		/* Get rid of our char dev entries */
	if (crypto_devices) {
		for (i = 0; i < crypto_nr_devs; i++) {
			cdev_del(&crypto_devices[i].cdev);
		}
		kfree(crypto_devices);
	}
	pci_unregister_driver(&crypto_pci_driver);
	unregister_chrdev_region(devno, crypto_nr_devs);
}

static int __init cryptochip_init(void)
{
	printk(KERN_WARNING "Start cryptochip_init function\n");
	int result;
	dev_t dev = 0;
	
	/* Get a range of minor numbers to work with, asking for a dynamic 
	 * major unless directed otherwise at load time.
	 */
	
	if(crypto_major) {
		dev = MKDEV(crypto_major, crypto_minor);
		result = register_chrdev_region(dev, crypto_nr_devs, DEVICE_NAME);
	} else {
		result = alloc_chrdev_region(&dev, crypto_minor, crypto_nr_devs,
									DEVICE_NAME);
		crypto_major = MAJOR(dev);		
	}
	
	/* allocate the devices -- we can't have them static, as the numbers
	 * can be specified at load time
	 */
	
	crypto_devices = kmalloc(crypto_nr_devs * sizeof(struct crypto_des), GFP_KERNEL);
		
	// Set up the char_dev structure for thist device.
	
	if (!crypto_devices) {
		result = -ENOMEM;
		goto fail;	// Make this more graceful 
	}

	memset(crypto_devices, 0, crypto_nr_devs * sizeof(struct crypto_des));
	
	printk(KERN_WARNING "passed kmalloc\n");
	/* Initialize each device. */

	printk(KERN_WARNING "This is setup character device\n");
	result = cryptochip_setup_cdev(crypto_devices);
	
	if (result < 0) {
		printk(KERN_WARNING "Crypto Chip: can't get major %d\n", crypto_major);
		goto fail;
	}
	
	result = pci_register_driver(&crypto_pci_driver);
	printk("<4>pci_regiter_driver result = %d\n", result);
	if (result < 0) {
		printk(KERN_WARNING "Crypto Chip: can't register pci driver\n");
		goto fail;
	}

	return result;
	
fail:
	cryptochip_exit();
	return result;		
}

void conv_text_to_hex(u32 *ret, const char *src, int size)
{
	printk("<4>conv_text_to_hex() is called with size = %d\n",
		size);
	u32 tmp;
	int i;
	int s = size;
	
	s = size / 4;
	printk("<4>s = %d\n", s);

	for(i=0; i<s; i++) {
		ret[i] = 0;
		tmp = *src;
		PDEBUG("src1 = %c\n", *src);
		PDEBUG("tmp1 = %08X\n", tmp);
		tmp <<= 24;
		ret[i] |= tmp;
		PDEBUG("ret1 = %08X\n", ret[i]);
		src++;
		tmp = *src;
		PDEBUG("src2 = %c\n", *src);
		PDEBUG("tmp2 = %08X\n", tmp);
		tmp <<= 16;
		ret[i] |= tmp;
		PDEBUG("ret2 = %08X\n", ret[i]);
		src++;
		tmp = *src;
		PDEBUG("src3 = %c\n", *src);
		PDEBUG("tmp3 = %08X\n", tmp);
		tmp <<= 8;
		ret[i] |= tmp;
		PDEBUG("ret3 = %08X\n", ret[i]);
		src++;
		tmp = *src;
		PDEBUG("src4 = %c\n", *src);
		PDEBUG("tmp4 = %08X\n", tmp);
		
		ret[i] |= tmp;
		PDEBUG("ret4 = %08X\n", ret[i]);
		src++;
	}
}

void re_conv_text_to_hex(u32 *ret, const char *src, int size)
{
	u32 x;
	u32 tmp;
	int s = size;
	s /= 8;
	int i,j = 0;

	for (i=0; i<s; i++) {
		tmp = mapping(*(src + j)) & 0x0F;
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
		tmp |= x;
		j++;

		ret[i] = tmp;
	}
}

u8  mapping(char ch)
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

void charTOhex(const char *src, u8 *dst, int size)
{
	printk("charTOhex function : size = %d\n", size);
	u8 first;
	u8 second;

	int i;
	for(i=0; i<size-1; i++) {
		first = mapping(src[i]);
		first <<= 4;
		printk("first = %02X\n", first);
		second = mapping(src[i+1]);
		printk("second = %02X\n", second);
		first |= second;
		printk("result = %02X\n", first);
		dst[i] = first;
		i++;
		printk("dst[%d] = %02X\n", i, dst[i]);
	}
}

module_init(cryptochip_init);
module_exit(cryptochip_exit);
