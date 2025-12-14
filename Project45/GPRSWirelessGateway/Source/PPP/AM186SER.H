/* Various I/O definitions specific to asynch I/O on the IBM PC */
#ifndef _AM186SER_H
#define _AM186SER_H

/* Output pseudo-dma control structure */
struct dma {
		uint8 *data;            /* current output pointer */
        uint16 cnt;             /* byte count remaining */
        volatile uint8 busy;    /* transmitter active */
};

/* Read fifo control structure */
struct fifo {
        uint8 *buf;             /* Ring buffer */
        uint16 bufsize;         /* Size of ring buffer */
        uint8 *ep;              /* End of buffer */
        uint8 *wp;              /* Write pointer */
        uint8 *rp;              /* Read pointer */
        volatile uint16 cnt;    /* count of characters in buffer */
};

/* Asynch controller control block */
struct asy {
        struct fifo fifo;
        struct dma dma;

		int pppunit;            /* PPP device number for this tty */
        volatile uint16 pppsem; /* PPP receive callback semaphore */

        uint16 addr;            /* Base I/O address */
        int vec;                /* Interrupt vector */
        long speed;             /* Line speed in bits per second */

        struct {                /* Previous configuration saved at startup */
                INTERRUPT (*vec)(void);
                                /* Original interrupt vector [cs:pc] */
				uint8 mask;     /* 8259 mask */
                uint8 msr;
        } save;

        uint8 msr;              /* Copy of current modem status register */
        uint8 cts;              /* obey CTS lead for xmit flow control */
        uint8 rlsd;             /* RLSD (CD) indicates line state */
        uint8 carrier;          /* Other way of indicating CD state */
		uint8 chain;            /* Do interrupt vector chaining */
#ifdef DEBUGTTY
		uint32 rxints;			/* receive interrupts */
		uint32 txints;			/* transmit interrupts */
		uint32 rxchar;			/* receive characters */
		uint32 overrun;			/* receivr hardware overrun errors */
		uint32 txchar;			/* transmit characters */
		uint32 msint_count;		/* count of modem status interrupts */
		uint32 txto;			/* count of TX interrupt timeouts */
		uint32 cdchanges;		/* count of CD changes */
		uint32 ctschanges;		/* count of CTS changes */
#endif
};

#endif  /* _AM186SER_H */
