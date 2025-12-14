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

#include <asm/system.h>		/* cli(), *_flags */
#include <asm/uaccess.h>	/* copy_*_user */
#include <linux/delay.h>

#include "crypto_sha.h"

int crypto_major = CRYPTO_SHA_MAJOR;
int crypto_minor = 0;
int crypto_nr_devs = CRYPTO_SHA_NR_DEVS;

static char sendPassed = 1; // sendPassed is used to identify that 1 = Not send passwd

struct crypto_sha *crypto_devices;		/* allocated in cryptochip_init */

// The first device is the single-open one,
// it has an hw structure and an open count
static atomic_t cryptochip_available = ATOMIC_INIT(1);	/* Can use one process at time */

// Next, the "uid" device. It can be opened multiple times by the
// same user, but access is denied to other users if the device is open
static int cryptochip_count;		/* initialized to 0 by default */
static uid_t cryptochip_owner;		/* initialized to 0 by default */
static spinlock_t cryptochip_u_lock = SPIN_LOCK_UNLOCKED;
static spinlock_t rw_u_lock = SPIN_LOCK_UNLOCKED;

// Queue
static DECLARE_WAIT_QUEUE_HEAD(wq);

//static spinlock_t cryptochip_interrupt_lock;
	
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

int cryptochip_open (struct inode *inode, struct file *filp)
{
	// Check first opening
	if (!atomic_dec_and_test(&cryptochip_available)){
		atomic_inc(&cryptochip_available);
		return -EBUSY;			// already open 
	}


if(1) { /* 1 : Enable single-user mode */
	// Check single-user open
	spin_lock(&cryptochip_u_lock);
	if (
		(cryptochip_owner != current->uid) && 
		(cryptochip_owner != current->euid) &&
		!capable(CAP_DAC_OVERRIDE)) {	
		spin_unlock(&cryptochip_u_lock);
		return -EBUSY;
	}
	spin_unlock(&cryptochip_u_lock);
}
	//struct crypto_des *dev;
	//dev = container_of(inode->i_cdev, struct crypto_des, cdev);
	//filp->private_data = dev;

	if(sendPassed == 1) {
		sendPass();
		sendPassed = 0;
	}
	
	printk(KERN_WARNING "Open cryptochip\n");
	PDEBUG("io_v_base: %lu\n", (*(unsigned long *)
		crypto_devices->io_v_base) + PASS_ADDR);
	PDEBUG("io_base: %lu\n", crypto_devices->io_base);
	PDEBUG("io_len: %lu\n", crypto_devices->io_len);

	return 0;
}

int cryptochip_release (struct inode *inode, struct file *filp)
{
	printk(KERN_WARNING "This is cryptochip_release();\n");
	atomic_inc(&cryptochip_available);	/* release the device */

	return 0;
}

ssize_t cryptochip_read (struct file *filp, char *buf, size_t count, loff_t *f_pos)
{
	printk("<4>cryptochip_read()\n");
	ssize_t retval = 0;
	
	PDEBUG("count = %d\n", count);
	if (count <= 20) {
		printk("<4>Error size of buffer is not enough\n");
		retval = -EFAULT;
		goto out;
	}

	u32 digest[5];
	int i, j = 0;
	unsigned long flags;

	spin_lock_irqsave(&rw_u_lock, flags);

	for (i=0; i<5; i++) {
		digest[i] = readl(crypto_devices->io_v_base + 0x60 - j);
		j += 4;
		PDEBUG("digest[%d] = %08X\n", i, digest[i]);
	}

	PDEBUG("digest = '%08X%08X%08X%08X%08X'\n", 
		digest[0], digest[1], digest[2], digest[3], digest[4]);

	if (copy_to_user((unsigned char *)buf, 
			 (unsigned char *)digest, 20)) {
		retval = -EFAULT;
		goto out;
	}
	retval = 20;
out:
	spin_unlock_irqrestore(&rw_u_lock, flags);
	return retval;
}

ssize_t cryptochip_write (struct file *filp, const char *buf, size_t count, loff_t *f_pos)
{
	printk("<4>cryptochip_write()\n");
	PDEBUG("count = %d\n", count);

	u8 *ctx;
	const u8 padding[64] = { 0x80, };
	int padlen;
	unsigned int i, j;
	size_t countp;
	ssize_t retval = 0;
	countp = count;
	unsigned long flags;

	spin_lock_irqsave(&rw_u_lock, flags);

	// out is pad value, which is used in last block.
	u8 out[8] = { 0, };
	padlen = add_padding(out, countp);	// padlen is pad length.

	PDEBUG("padlen = %d\n", padlen);

	j = count >> 8;
	u32 totalsize = count + padlen + 8;

	ctx = kmalloc(totalsize, GFP_KERNEL);
	//ctx = kmalloc((count + padlen + 8), GFP_KERNEL);

	//memcpy(ctx, buf, count);
	if (copy_from_user(&ctx[0], buf, count)) {
		printk("<4>Error in copy_from_user\n");
		retval = -EFAULT;
		goto out;
	}

	memcpy(&ctx[count], padding, padlen);
	memcpy(&ctx[count+padlen], &out[0], 8);

	j = totalsize >> 2;
	PDEBUG("j = %d\n", j);
	//u32 sctx[32000];
	sctx = kmalloc(j, GFP_KERNEL);
	int k = 0;
	u32 tmp;
	
	for (i=0; i<j; i++) {
		PDEBUG("ctx[%d] = %02X\n", k, ctx[k]);
		sctx[i] = ctx[k] & 0xFF; sctx[i] <<= 24;
		PDEBUG("sctx[%d] = %08X\n", i, sctx[i]);
		k++;

		PDEBUG("ctx[%d] = %02X\n", k, ctx[k]);
		tmp = ctx[k] & 0xFF;
		sctx[i] = sctx[i] | ((tmp << 16) & 0x00FF0000);
		PDEBUG("sctx[%d] = %08X\n", i, sctx[i]);
		k++;

		PDEBUG("ctx[%d] = %02X\n", k, ctx[k]);
		tmp = ctx[k] & 0xFF;
		sctx[i] = sctx[i] | ((tmp << 8) & 0x0000FF00);
		PDEBUG("sctx[%d] = %08X\n", i, sctx[i]);
		k++;

		PDEBUG("ctx[%d] = %02X\n", k, ctx[k]);
		tmp = ctx[k] & 0xFF;
		sctx[i] = sctx[i] | tmp;//((tmp << 8) & 0x0000FF00);
		PDEBUG("sctx[%d] = %08X\n", i, sctx[i]);
		k++;
	}

	// Reset hardware
	writel(1, crypto_devices->io_v_base + RESET_ADDRESS);

	j /= 16;
	k = 0;
	//u32 *c1, *c2;
	crypto_devices->io_v_base = ioremap(crypto_devices->io_base, crypto_devices->io_len);
	PDEBUG("Total loops = %d\n", j);
	for (i=0; i<j; i++){
		//printk("<4>Round %d\n", i );
		// First Message
		
		writel(sctx[k], crypto_devices->io_v_base + 4);
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		PDEBUG("First Message = %08X\n", sctx[k]);
		k++;

		// Second Message
		writel(sctx[k], crypto_devices->io_v_base + 8);
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		PDEBUG("Second Message = %08X\n", sctx[k]);
		k++;

		// Third Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 12);
		PDEBUG("Third Message = %08X\n", sctx[k]);
		k++;
		
		// Fourth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 16);
		PDEBUG("Fourth Message = %08X\n", sctx[k]);
		k++;
		
		// Fifth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 20);
		PDEBUG("Fifth Message = %08X\n", sctx[k]);
		k++;
		
		// Sixth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 24);
		PDEBUG("Sixth Message = %08X\n", sctx[k]);
		k++;
		
		// Seventh Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 28);
		PDEBUG("Seventh Message = %08X\n", sctx[k]);
		k++;
		
		// Eighth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 32);
		PDEBUG("Eighth Message = %08X\n", sctx[k]);
		k++;
		
		// Ninth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 36);
		PDEBUG("Ninth Message = %08X\n", sctx[k]);
		k++;
		
		// Tenth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 40);
		PDEBUG("Tenth Message = %08X\n", sctx[k]);
		k++;
		
		// Eleventh Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 44);
		PDEBUG("Eleventh Message = %08X\n", sctx[k]);
		k++;
		
		// Twelfth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 48);
		PDEBUG("Twelfth Message = %08X\n", sctx[k]);
		k++;
		
		// Thirteenth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 52);
		PDEBUG("Thirteenth Message = %08X\n", sctx[k]);
		k++;
		
		// Fourteenth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 56);
		PDEBUG("Fourteenth Message = %08X\n", sctx[k]);
		k++;
		
		// Fifteenth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 60);
		PDEBUG("Fifteenth Message = %08X\n", sctx[k]);
		k++;
		
		// Sixteenth Message
		PDEBUG("sctx[%d] = %08X\n", k, sctx[k]);
		writel(sctx[k], crypto_devices->io_v_base + 64);
		PDEBUG("Sixteenth Message = %08X\n", sctx[k]);
		k++;
		
		// Enable hardware to work
		writel(1, crypto_devices->io_v_base + WORK_ADDRESS);
		PDEBUG("Enable hardware to work\n");
		mdelay(1);
	}

	kfree(ctx);
	//kfree(sctx);
	retval = count;

out:
	spin_unlock_irqrestore(&rw_u_lock, flags);
	return retval;
}

int cryptochip_ioctl(struct inode *inode, struct file *filp,
					unsigned int cmd, unsigned long arg)
{
	printk("<4>cryptochip_ioctl for %u command \n", cmd);
	// Make sure that the command is really one of cryptochip
	if (_IOC_TYPE(cmd) != MAGIC)
		return -ENOTTY;

	switch(cmd) {

		case REG_SET_OFFSET : {
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
			int data;
			if(crypto_devices->offset == -1)
				return -1;
			data = readl(crypto_devices->io_v_base + crypto_devices->offset);
			put_user(data, (unsigned long *)arg);
			// printk("<4> data = %d", data);
			break;
		}

		case REG_WRITE : {
			int data;
			if (crypto_devices->offset == -1)
				return -1;
			get_user(data, (unsigned long *)arg);
			writel(data, crypto_devices->io_v_base + crypto_devices->offset);
			break;
		}

		case GET_IO_BASE : {
			int data;
			data = (int)crypto_devices->io_base;
			if(copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
			break;
		}

		case GET_IO_PYS : {
			int data;
			data = (int)__pa(crypto_devices->io_base);
			if(copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
		}

		case GET_IO_LEN : {
			int data;
			data = (int)crypto_devices->io_len;
			if (copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
		}

		case GET_IO_VIR : {
			int data;
			data = (int)crypto_devices->io_v_base;
			if (copy_to_user((int *)arg, &data, sizeof(int)))
				return -EFAULT;
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
	/*
	// PCI Probing 
	dev = pci_get_device(VENDOR_ID, DEVICE_ID, NULL);
	if (dev) {	
		printk(KERN_WARNING "This is PCI Probing Function.");
	}*/
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

	// Get PCI Devices
	//struct pci_dev *dev;
	u8 myirq;
	//dev = pci_get_device(VENDOR_ID, DEVICE_ID, NULL);
	if (dev) {
		// Use the PCI device 
		
		// PCI Interrupts assigning
		int result;
		result = pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &myirq);
		if (result) {
			printk(KERN_WARNING "Error occur in PCI Interrupts assinging functions");
			return 0; // return Error is occured. but NOW I don't know.
		}

	//	pci_dev_put(dev);
	}

	return 0;
}

static void remove(struct pci_dev *dev)
{
	printk(KERN_WARNING "This is remove();\n");
	/* clean up any allocated resources and stuff here.
	 * like call release_region();
	 */
	//release_region();
	pci_disable_device(dev);
}

static struct pci_driver crypto_pci_driver = {
	.name = DEVICE_NAME,
	.id_table = ids,
	.probe = probe,
	.remove = remove,
};

static int cryptochip_setup_cdev(struct crypto_sha *dev)
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

/*
static void init_chunk(void)
{
	printk("<4>Initialize chunk\n");
	crypto_devices->first = crypto_devices->io_v_base + CHUNK_BEGINING;
	memset_io(crypto_devices->first, 0, CHUNK_SIZE);
}
*/

static void cryptochip_exit(void)
{
	printk(KERN_WARNING "This is cryptochip_exit();\n");

	int i;
	dev_t devno = MKDEV(crypto_major, crypto_minor);
	
		/* Get rid of our char dev entries */
	if (crypto_devices) {
		for (i = 0; i < crypto_nr_devs; i++) {
			//scull_trim(crypto_devices + i);
			cdev_del(&crypto_devices[i].cdev);
		}
		kfree(crypto_devices);
	}
	unregister_chrdev_region(devno, crypto_nr_devs);
	pci_unregister_driver(&crypto_pci_driver);

}

static int __init cryptochip_init(void)
{
	printk(KERN_WARNING "Start cryptochip_init function\n");
	int result;//, i;
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
	
	crypto_devices = kmalloc(crypto_nr_devs * sizeof(struct crypto_sha), GFP_KERNEL);
		
	// Set up the char_dev structure for thist device.
	
	if (!crypto_devices) {
		result = -ENOMEM;
		goto fail;	// Make this more graceful 
	}

	memset(crypto_devices, 0, crypto_nr_devs * sizeof(struct crypto_sha));
	
	printk(KERN_WARNING "passed kmalloc\n");
	/* Initialize each device. */
	//init_MUTEX(&crypto_devices->sem);
	/*for (i=0; i<crypto_nr_devs; i++) {
		
	}*/
	printk(KERN_WARNING "This is setup character device\n");
	result = cryptochip_setup_cdev(crypto_devices);
	
	if (result < 0) {
		printk(KERN_WARNING "Crypto Chip: can't get major %d\n", crypto_major);
		return result;
	}

	//spin_lock_init(&cryptochip_interrupt_lock);
	
	result = pci_register_driver(&crypto_pci_driver);
	if (result < 0) {
		printk(KERN_WARNING "Crypto Chip: can't register pci driver\n");
		goto fail;//return result;//goto pci_fail;
	}

	// Initialize each chunk.
	//init_chunk();

	return result;
	/*
	pci_fail:
		cryptochip_exit();*/
	
	fail:
		cryptochip_exit();
		return result;		
}

/* Add padding */
int add_padding(u8 *bits, size_t count)
{
	//u32 i, j, index, padlen;
	u32 index;
	u64 t;
	//u8 bits[8] = { 0, };
	//bits[8] = { 0, };

	t = (count<<3);
	bits[7] = 0xFF & t; t>>=8;
	bits[6] = 0xFF & t; t>>=8;
	bits[5] = 0xFF & t; t>>=8;
	bits[4] = 0xFF & t; t>>=8;
	bits[3] = 0xFF & t; t>>=8;
	bits[2] = 0xFF & t; t>>=8;
	bits[1] = 0xFF & t; t>>=8;
	bits[0] = 0xFF & t;

	//out = bits;

	PDEBUG("bits = %02X%02X%02X%02X%02X%02X%02X%02X\n", bits[0],bits[1],bits[2],bits[3],bits[4],bits[5],bits[6],bits[7]);

	/* Pad out to 56 mod 64 */
	index = count & 0x3F;
	//index = (count >> 3) & 0x3F;
	//padlen = (index < 56) ? (56 - index) : ((64+56) - index);
	return (index < 56) ? (56 - index) : ((64+56) - index);
}

void conv_text_to_hex(u32 *ret, const char *src, int size)
{
	u32 tmp;
	int i;
	int s = size;
	/*
	if ((size%2) != 0) {
		s = size - 1;
		s /= 2;
		size++;
	}
	*/
	s = size / 4;

	for(i=0; i<s; i++) {
		ret[i] = 0;
		tmp = *src;
		printk("src1 = %c\n", *src);
		printk("tmp1 = %08X\n", tmp);
		tmp <<= 24;
		ret[i] |= tmp;
		printk("ret1 = %08X\n", ret[i]);
		src++;
		tmp = *src;
		printk("src2 = %c\n", *src);
		printk("tmp2 = %08X\n", tmp);
		tmp <<= 16;
		ret[i] |= tmp;
		printk("ret2 = %08X\n", ret[i]);
		src++;
		tmp = *src;
		printk("src3 = %c\n", *src);
		printk("tmp3 = %08X\n", tmp);
		tmp <<= 8;
		ret[i] |= tmp;
		printk("ret3 = %08X\n", ret[i]);
		src++;
		tmp = *src;
		printk("src4 = %c\n", *src);
		printk("tmp4 = %08X\n", tmp);
		//tmp <<= 0;
		ret[i] |= tmp;
		printk("ret4 = %08X\n", ret[i]);
		src++;
	}

	//ret[size/2] = 0;
}

module_init(cryptochip_init);
module_exit(cryptochip_exit);
