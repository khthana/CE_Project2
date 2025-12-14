#define VENDOR_ID	0xF0F0
#define DEVICE_ID	0xF0F0
#define DEVICE_NAME	"crypto_DES"
#define PASS_PCI	0x44475410
#define PASS_ADDR	0x8080

#define CRYPTO_DES_MAJOR 0
#define CRYPTO_DES_NR_DEVS 1

#define BUFFER_SIZE	64
#define CHUNK_SIZE	4	
#define CHUNK_BEGINING  10 // First Address of CHUNK memories

/* Address Location Mapping */
#define TEXT_ADDR_H	4	// plain text (0x0004)
#define TEXT_ADDR_L	8	// plain text (0x0008)
#define KEY_ADDR_H	12	// key address (0x000c)
#define KEY_ADDR_L	16	// key address (0x0010)	
#define ENCRYPT_SIG_ADDR	20	// encryption or decryption signal that use to assign direction 
					// 0 : encryption, 1 : decryption (0x0014)
#define ENABLE_SIG_ADDR	24	// 1 : start (0x0018)
#define CIPHER_ADDR_H	32	// cipher text (0x0020)
#define CIPHER_ADDR_L	36	// cipher text (0x0024)
#define INT_ADDR	0	// interrupt address (0x0000)

#define IV_H		0x31323334
#define IV_L		0x35363738

#undef PDEBUG
#ifdef CONVERT_DEBUG
#	define	PDEBUG(fmt, args...)	printk(KERN_WARNING "crypto_des: " fmt, ## args)
#else
#	define	PDEBUG(fmt, args...)
#endif

#undef CDEBUG
#ifdef CIPHER_DEBUG
#	define CDEBUG(fmt, args...)	printk(KERN_WARNING "crypto_des: " fmt, ## args)
#else
#	define CDEBUG(fmt, args...)
#endif

#undef TDEBUG
#ifdef CRYPTO_DEBUG
#	define TDEBUG(fmt, args...)	printk(KERN_WARNING "crypto_des: " fmt, ## args)
#else
#	define TDEBUG(fmt, args...)
#endif

void conv_text_to_hex(u32 *ret, const char *src, int size);
void re_conv_text_to_hex(u32 *ret, const char *src, int size);
u8 mapping(char ch);
void charTOhex(const char *src, u8 *dst, int size);

struct crypto_qset {
	void **data;
	struct crypto_qset *next;
};

struct crypto_des {
	unsigned long io_base;
	unsigned long io_len;
	unsigned long mem_base;
	unsigned long mem_len;
	void *io_v_base;
	void *mem_v_base;
//	unsigned int irq;
	unsigned long offset;
	struct cdev cdev;
//	void *first;
//	void *second;
	unsigned int encrypt_signal;
	unsigned int iv_h;
	unsigned int iv_l;
	u32 *conv;

	struct crypto_qset *data;
	unsigned long size;		/* amount of data stored here */
	int quantum;			/* the current quantum size */
	int qset;			/* the current array size */
};

// ioctl definitions
//#define MAGIC 'T'		// Magic Number
#define MAGIC 0xB5		// Magic Number
#define REG_SET_OFFSET			_IOR(MAGIC, 1, unsigned long)
#define REG_READ			_IOW(MAGIC, 2, unsigned long)
#define REG_WRITE			_IOR(MAGIC, 3, unsigned long)
#define GET_IO_BASE			_IOR(MAGIC, 4, int)
#define GET_IO_PYS			_IOR(MAGIC, 5, int)
#define GET_IO_LEN			_IOR(MAGIC, 6, int)
#define GET_IO_VIR			_IOR(MAGIC, 7, int)
#define ASSIGN_DIRECTION		_IOW(MAGIC, 8, int)		// 0 : encryption, 1 : decryption
#define INSERT_KEY_H			_IOW(MAGIC, 9, unsigned int)
#define INSERT_KEY_L			_IOW(MAGIC, 10, unsigned int)
#define ASSIGN_MODE			_IOW(MAGIC, 11, int)
#define INSERT_KEY_H2			_IOW(MAGIC, 12, unsigned int)
#define INSERT_KEY_L2			_IOW(MAGIC, 13, unsigned int)
#define INSERT_KEY_H3			_IOW(MAGIC, 14, unsigned int)
#define INSERT_KEY_L3			_IOW(MAGIC, 15, unsigned int)
#define INSERT_IV_L			_IOW(MAGIC, 16, unsigned int)
#define INSERT_IV_H			_IOW(MAGIC, 17, unsigned int)
