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
#include <linux/interrupt.h>	/* interrupt API */
//#include <linux/irq.h>		/* irq */

#include <asm/system.h>		/* cli(), *_flags */
#include <asm/uaccess.h>	/* copy_*_user */

#include "crypto_prng.h"

int crypto_major = CRYPTO_PRNG_MAJOR;
int crypto_minor = 0;
int crypto_nr_devs = CRYPTO_PRNG_NR_DEVS;

static char sendPassed = 1; // sendPassed is used to identify that 1 = Not send passwd

struct crypto_prng *crypto_devices;		/* allocated in cryptochip_init */

// The first device is the single-open one,
// it has an hw structure and an open count
static atomic_t cryptochip_available = ATOMIC_INIT(1);	/* Can use one process at time */

// Next, the "uid" device. It can be opened multiple times by the
// same user, but access is denied to other users if the device is open
static int cryptochip_count;		/* initialized to 0 by default */
static uid_t cryptochip_owner;		/* initialized to 0 by default */
static spinlock_t cryptochip_u_lock = SPIN_LOCK_UNLOCKED;

u8 mapping(char ch);

// Queue
static DECLARE_WAIT_QUEUE_HEAD(wq);
//static int doFlag = 0;

static spinlock_t cryptochip_interrupt_lock;
	
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

	// Enable Interrupt
	int data;
	data = 2;
	crypto_devices->offset = 0;
	writel(data, crypto_devices->io_v_base + crypto_devices->offset);
	printk(KERN_WARNING "write 2 to 0x0000\n");
}

int cryptochip_open (struct inode *inode, struct file *filp)
{
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
		/* return -EPERM; */ return -EBUSY;		/* -EPERM would confuse the user */
	}
 if(0) { /* 1 : Enable multiopen on same user */
	if (cryptochip_count == 0)
		cryptochip_owner = current->uid;
	// cryptochip_count++;		/* disable this statement because it have atomic check.
 }
	spin_unlock(&cryptochip_u_lock);
}

	if(sendPassed == 1) {
		sendPass();
		sendPassed = 0;
	}
	
	printk(KERN_WARNING "Open cryptochip\n");
	printk(KERN_WARNING "io_v_base: %lu\n", (*(unsigned long *)crypto_devices->io_v_base) + PASS_ADDR);
	printk(KERN_WARNING "io_base: %lu\n", crypto_devices->io_base);
	printk(KERN_WARNING "io_len: %lu\n", crypto_devices->io_len);
	//printk(KERN_WARNING "PASS_PCI: %lu\n", (*(unsigned long *)PASS_PCI));
//	printk(KERN_WARNING "PCI Interrupts line %d\n", myirq);
	printk(KERN_WARNING "PCI Interrupts line %d\n", crypto_devices->irq);

	return 0;
}

int cryptochip_release (struct inode *inode, struct file *filp)
{
	atomic_inc(&cryptochip_available);	/* release the device */
if (0) {
	// release for single-user open
	spin_lock(&cryptochip_u_lock);
	// cryptochip_count--;			/* disable this statement because it have atomic open.
	spin_unlock(&cryptochip_u_lock);
}

	return 0;
}

ssize_t cryptochip_read (struct file *filp, char *buf, size_t count, loff_t *f_pos)
{
	printk("<4>cryptochip_read()\n");
	printk("<4>count = %d\n", count);
	u32 rand[4];

	// Write 1 to CE -> H/W Generate RANDOM NUMBER
	writel(1, crypto_devices->io_v_base + CE);

	// Get RANDOM NUMBER 
	rand[0] = readl(crypto_devices->io_v_base + RAND_1ST);
	rand[1] = readl(crypto_devices->io_v_base + RAND_2ND);
	rand[2] = readl(crypto_devices->io_v_base + RAND_3RD);
	rand[3] = readl(crypto_devices->io_v_base + RAND_4TH);

	printk("<4>random number = %08X%08X%08X%08X\n", rand[0], rand[1], rand[2], rand[3]);

	if (copy_to_user((unsigned char *)buf, (unsigned char *)rand, 32))
		return -EFAULT;
	
	
	return count;
}



ssize_t cryptochip_write (struct file *filp, const char *buf, size_t count, loff_t *f_pos)
{
	printk("<4>cryptochip_write()\n");
	printk("<4>count = %d\n", count);

	u32 seed[4] = {0, 0, 0, 0};
	u32 x;
	int i, j = 0;

	for (i=0; i<4; i++) {
		seed[i] = mapping(*(buf + j)) & 0x0F;
		seed[i] <<= 28;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		x <<= 24;
		seed[i] |= x;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		x <<= 20;
		seed[i] |= x;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		x <<= 16;
		seed[i] |= x;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		x <<= 12;
		seed[i] |= x;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		x <<= 8;
		seed[i] |= x;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		x <<= 4;
		seed[i] |= x;
		j++;
		x = mapping(*(buf +j)) & 0x0F;
		//x <<= 0;
		seed[i] |= x;
		j++;
	}

	printk("<4>seed = %08X%08X%08X%08X\n", seed[0], seed[1], seed[2], seed[3]);

	// Write SEED to hardware
	writel(seed[0], crypto_devices->io_v_base + SEED_1ST);
	writel(seed[1], crypto_devices->io_v_base + SEED_2ND);
	writel(seed[2], crypto_devices->io_v_base + SEED_3RD);
	writel(seed[3], crypto_devices->io_v_base + SEED_4TH);

	// Load SEED into hardware
	writel(1, crypto_devices->io_v_base + LOAD);

	//int ret;
	//ret = 32;
	//return ret;
if (0) {	
	u32 rand[4];

	// Write 1 to CE -> H/W Generate RANDOM NUMBER
	writel(1, crypto_devices->io_v_base + CE);

	// Get RANDOM NUMBER 
	rand[0] = readl(crypto_devices->io_v_base + RAND_1ST);
	rand[1] = readl(crypto_devices->io_v_base + RAND_2ND);
	rand[2] = readl(crypto_devices->io_v_base + RAND_3RD);
	rand[3] = readl(crypto_devices->io_v_base + RAND_4TH);

	printk("<4>random number = %08X%08X%08X%08X\n", rand[0], rand[1], rand[2], rand[3]);
}

	return count;
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
/*
static irqreturn_t cryptochip_interrupt(int irq, void *dev_id, 
					struct pt_regs *regs)
{
	printk(KERN_WARNING "Device Interrupt handler is called\n");
	// 1st Bit :: 0:Disable 1:Enable, 2nd Bit :: 0:Ext. Interrupt don't occur 1:Ext. Interrupt occur
	// write 2 to 0x0000 for clear interrupt bit.
	unsigned int check_own_int = 0;
	crypto_devices->offset = 0;
	check_own_int = readl(crypto_devices->io_v_base + crypto_devices->offset);

	if (check_own_int == 3) {
		doFlag = 1;
		wake_up_interruptible(&wq);

		writel(2, crypto_devices->io_v_base + crypto_devices->offset);
	}
	
	return IRQ_HANDLED;
	
}

void freeIRQ(void) 
{
	// remove IRQ
	printk(KERN_WARNING "     freeIRQ function \n");

	// Get PCI Devices
	struct pci_dev *dev;
	//u8 myirq;
	dev = pci_get_device(VENDOR_ID, DEVICE_ID, NULL);
	if (dev) {
		// Use the PCI device 
		if (crypto_devices->irq >=0) {
			// Must disable interrupt first
			free_irq(crypto_devices->irq, dev);
		}

		pci_dev_put(dev);
	}

//	if (crypto_devices->irq >=0) {
		// Must disable interrupt first
//		free_irq(crypto_devices->irq, NULL);
//	}
}
*/
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
/*
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
	crypto_devices->irq = myirq;

	// Register the IRQ handler
	crypto_devices->irq = dev->irq;
if(1){
	int result;
	//result = request_irq(crypto_devices->irq, cryptochip_interrupt,  0, "cyrptochip_interrupt", NULL);
	result = request_irq(crypto_devices->irq, cryptochip_interrupt, SA_SHIRQ, "cyrptochip_interrupt", dev);
	printk(KERN_WARNING "IRQ Number :: %X\n", myirq);
	if (result) {
		printk(KERN_WARNING "interrupt can't assign\n");
		//cryptochip_exit();
		//freeIRQ();
		return result;
	}
}else {
	printk(KERN_WARNING "IRQ Number :: %X\n", myirq);
}
*/

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

static int cryptochip_setup_cdev(struct crypto_prng *dev)
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

	printk(KERN_WARNING "Removing IRQ\n");
	//freeIRQ();
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
	
	crypto_devices = kmalloc(crypto_nr_devs * sizeof(struct crypto_prng), GFP_KERNEL);
		
	// Set up the char_dev structure for thist device.
	
	if (!crypto_devices) {
		result = -ENOMEM;
		goto fail;	// Make this more graceful 
	}

	memset(crypto_devices, 0, crypto_nr_devs * sizeof(struct crypto_prng));
	
	printk(KERN_WARNING "passed kmalloc\n");
	/* Initialize each device. */
	/*for (i=0; i<crypto_nr_devs; i++) {
		
	}*/
	printk(KERN_WARNING "This is setup character device\n");
	result = cryptochip_setup_cdev(crypto_devices);
	
	if (result < 0) {
		printk(KERN_WARNING "Crypto Chip: can't get major %d\n", crypto_major);
		return result;
	}

	spin_lock_init(&cryptochip_interrupt_lock);
	
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

u8 mapping(char ch)
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

module_init(cryptochip_init);
module_exit(cryptochip_exit);
