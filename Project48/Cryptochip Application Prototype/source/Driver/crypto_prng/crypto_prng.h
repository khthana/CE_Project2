#define VENDOR_ID	0xF0F0
//#define DEVICE_ID	0xF1F1
#define DEVICE_ID	0xF0F0
#define DEVICE_NAME	"crypto_PRNG"
#define PASS_PCI	0x44475410
#define PASS_ADDR	0x8080

#define CRYPTO_PRNG_MAJOR	0
#define CRYPTO_PRNG_NR_DEVS	1

#define SEED_1ST	0x0110
#define SEED_2ND	0x010C
#define SEED_3RD	0x0108
#define SEED_4TH	0x0104

#define LOAD		0x0114
#define CE		0x0118

#define	RAND_1ST	0x012C
#define	RAND_2ND	0x0128
#define	RAND_3RD	0x0124
#define	RAND_4TH	0x0120

#define DEBUG
#ifdef DEBUG
#define MSG(string, args...) if (crypto_debug) printk(KERN_DEBUG "crypto_prng: " string, ##args)
#else
#define MSG(string, args...)
#endif

// Predefine function
void conv_text_to_hex(u32 *ret, const char *src, int size);

struct crypto_prng{
	unsigned long io_base;
	unsigned long io_len;
	unsigned long mem_base;
	unsigned long mem_len;
	void *io_v_base;
	void *mem_v_base;
	unsigned int irq;
	unsigned long offset;
	struct cdev cdev;
	//u32 *first;
	void *first;
};

// ioctl definitions
//#define MAGIC 'T'		// Magic Number
#define MAGIC		0xB7
#define REG_SET_OFFSET			_IOR(MAGIC, 1, unsigned long)
#define REG_READ				_IOW(MAGIC, 2, unsigned long)
#define REG_WRITE				_IOR(MAGIC, 3, unsigned long)
#define GET_IO_BASE				_IOR(MAGIC, 12, int)
#define GET_IO_PYS				_IOR(MAGIC, 13, int)
#define GET_IO_LEN				_IOR(MAGIC, 14, int)
#define GET_IO_VIR				_IOR(MAGIC, 15, int)
