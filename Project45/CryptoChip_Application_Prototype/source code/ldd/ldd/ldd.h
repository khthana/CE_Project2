#define KEY (1492)	// use when create semaphore @ user-space program

#ifndef MIND_DEBUG
//#define MIND_DEBUG
#endif

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

