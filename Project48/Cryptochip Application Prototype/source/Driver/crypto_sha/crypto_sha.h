#define VENDOR_ID	0xF0F0
//#define DEVICE_ID	0xF1F1
#define DEVICE_ID	0xF0F0
#define DEVICE_NAME	"crypto_SHA"
#define PASS_PCI	0x44475410
#define PASS_ADDR	0x8080

#define CRYPTO_SHA_MAJOR	0
#define CRYPTO_SHA_NR_DEVS	1

#define REG_READ_INT	0x0000
#define REG_WRITE_INT	0x0001
#define BUFFER_SIZE	8
#define CHUNK_SIZE	512
#define CHUNK_BEGINING  10 // First Address of CHUNK memories

#define WORK_ADDRESS	0x44			// Use for force hardware to work
#define RESET_ADDRESS	0x48			// Use when first hash

#define DIGEST_A	0x60
#define DIGEST_B	0x5C
#define DIGEST_C	0x58
#define DIGEST_D	0x54
#define DIGEST_E	0x50

#undef PDEBUG
#ifdef CRYPTO_DEBUG
#	define PDEBUG(fmt, args...)	printk(KERN_WARNING "crypto_sha: " fmt, ## args)
#else
#	define PDEBUG(fmt, args...)
#endif

// Predefine function
void conv_text_to_hex(u32 *ret, const char *src, int size);
int add_padding(u8 *out, size_t count);

struct crypto_sha {
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
	struct semaphore sem;
};

// ioctl definitions
//#define MAGIC 'T'		// Magic Number
#define MAGIC	0xB6
#define REG_SET_OFFSET			_IOR(MAGIC, 1, unsigned long)
#define REG_READ				_IOW(MAGIC, 2, unsigned long)
#define REG_WRITE				_IOR(MAGIC, 3, unsigned long)
#define GET_IO_BASE				_IOR(MAGIC, 12, int)
#define GET_IO_PYS				_IOR(MAGIC, 13, int)
#define GET_IO_LEN				_IOR(MAGIC, 14, int)
#define GET_IO_VIR				_IOR(MAGIC, 15, int)
