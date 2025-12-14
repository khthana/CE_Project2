/* OS- and machine-dependent stuff for the 8250 asynch chip on a IBM-PC
 * Copyright 1991 Phil Karn, KA9Q
 *
 * 16550A support plus some statistics added mah@hpuviea.at 15/7/89
 *
 * CTS hardware flow control from dkstevens@ucdavis,
 * additional stats from delaroca@oac.ucla.edu added by karn 4/17/90
 * Feb '91      RLSD line control reorganized by Bill_Simpson@um.cc.umich.edu
 * Sep '91      All control signals reorganized by Bill Simpson
 * Apr '92      Control signals redone again by Phil Karn
 */

#include <dos.h>
#include "syslog.h"
#include "global.h"
#include "am186cc.h"
#include "am186ser.h"
#include "asy.h"
#include "asyimprt.h"
#include "pppd.h"
#ifdef DEBUGTTY
#include <stdio.h>
#endif

#define CPU_FREQ    24000000L

#define IDX_CON0    0
#define IDX_CON1    2
#define IDX_STAT    4
#define IDX_IMSK    6
#define IDX_TXD     8
#define IDX_RXD     10
#define IDX_RXDP    12
#define IDX_BDV     14

/* Does not support Fake bitmask value for a few status */
#define CTS_STATUS  0x01
#define DCD_STATUS  0x02
#define RTS_ON      0x04
#define DTR_ON      0x08

/* In lowlevel.asm */
INTERRUPT asy0vec(void);
INTERRUPT asy1vec(void);


/* External functions.
*/
#ifndef UARTDRV_TEST
void asyrxschedule(int comdev, int unit);
#endif

/* Global functions.
 */
INTERRUPT (far *(asyint)(int dev))();

/* Local functions.
 */
static int setirq(unsigned itype, INTERRUPT (*handler)());
static INTERRUPT (*getirq(unsigned int itype))();
static int maskoff(unsigned itype);
static int maskon(unsigned itype);
static int getmask(unsigned itype);
static int asyrxint(struct asy *asyp);
static void asytxint(struct asy *asyp);
static void asymsint(struct asy *asyp);
static int rlsdstat(struct asy *ap);

struct asy Asy[ASY_MAX];

/* ASY interrupt handlers
 */
static INTERRUPT (*Handle[ASY_MAX])() = {
    asy0vec,asy1vec
};

/* Set bit(s) in I/O port.
 */
#define setbit(p,b) outportb((p), inportb((p)) | (b))

/* Set bit(s) in I/O port (WORD size)
 */
#define setbitw(p,b) outport((p), inport((p)) | (b))


/* Clear bit(s) in I/O port.
 */
#define clrbit(p,b) outportb((p), inportb((p)) & ~(b))

/* Clear bit(s) in I/O port. (WORD size)
 */
#define clrbitw(p,b) outport((p), inport((p)) & ~(b))

/* Set or clear selected bits(s) in I/O port.
 */
#define writebit(p,m,v) (void)((v) ? outportb((p), inportb((p)) | (m)) : outportb((p), inportb((p)) & ~(m)))

/* Set or clear selected bits(s) in I/O port. (WORD size)
 */
#define writebitw(p,m,v) (void)((v) ? outport((p), inport((p)) | (m)) : outport((p), inport((p)) & ~(m)))

/* Install hardware interrupt handler.
 */
static int setirq(unsigned itype, INTERRUPT (*handler)())
{
	/* Set interrupt vector */
	setvect(itype, handler);

	return 0;
}


/* Return pointer to hardware interrupt handler.
 */
static INTERRUPT (*getirq(unsigned int itype))()
{
	/* Get interrupt vector */
	return getvect(itype);
}


/* Disable hardware interrupt.
 * Support ITYPE_UART only
 */
static int maskoff(unsigned int itype)
{
	if ( itype == ITYPE_UART ) {
		setbitw(IMASK, IMASK_CH11);
	}
	else {
		return -1;
	}

	return 0;
}


/* Enable hardware interrupt
 * Support ITYPE_UART only
 */
static int maskon(unsigned int itype)
{
	if ( itype == ITYPE_UART ) {
		clrbitw(IMASK, IMASK_CH11);
	}
	else {
		return -1;
	}

	return 0;
}


/* Return 1 if specified interrupt is enabled, 0 if not, -1 if invalid.
 * Support ITYPE_UART only
 */
static int getmask(unsigned int itype)
{
	if ( itype == ITYPE_UART ) {
		return (inport(IMASK) & IMASK_CH11) ? 0 : 1;
	}
	else {
		return -1;
	}
}


/* Initialize asynch port "dev".
 * Support COM1 and ITYPE_UART (0x1B) only
 */
int asy_init(int dev, int base, int itype, uint16 bufsize,
			 long speed, int cts, int rlsd, int chain)
{
	unsigned char c;
	struct fifo *fp;
	struct asy *asyp;
	int i_state;
    unsigned int temp;

	if ( dev < 0 || dev >= ASY_MAX )
		return -1;
    
	asyp = &Asy[dev];

	/* Set up receiver FIFO */
	fp = &asyp->fifo;

	if ( (fp->buf = malloc(bufsize)) == NULL ) {
		return -1;
	}

	fp->bufsize = bufsize;
	fp->ep = &fp->buf[fp->bufsize];
	fp->wp = fp->rp = fp->buf;
	fp->cnt = 0;

	asyp->pppunit = -1;
	asyp->pppsem = 0;
	asyp->addr = base;
	asyp->vec = itype;
	asyp->chain = chain;

    /* configure interface 4 for the low speed uart */
    temp = inport(SYSCON);  
    temp = temp & (~0x0300);
    temp = temp | (0x0200);
    outport(SYSCON, temp);       

    /* Now we can actually initialize the port */
    outport(CH11CON, inport(CH11CON) | CHCON_MSK);      /* Disable Serial Port Interrupts in the       */
                                                        /* interrupt controller                        */    
    outport(EOI, EOITYPE_UART);                         /* Signal an EOI just in case the last didn't  */
                                                        /* get servied                                 */
    asy_speed(dev, speed);

	i_state = dirps();

	/* Save original interrupt vector, mask state, control bits */
	if ( asyp->vec != -1 ) {
		asyp->save.vec = getirq(asyp->vec);
		asyp->save.mask = getmask(asyp->vec);
	}

    /* Force modem status */
	asyp->msr = asyp->save.msr = 0xFF;
	asyp->carrier = TRUE;

	/* save modem control flags */
	asyp->cts = (cts == 1);
	asyp->rlsd = rlsd;

	/* Set interrupt vector to SIO handler */
	if ( asyp->vec != -1 )
		setirq(asyp->vec, Handle[dev]);

    /* OK, now enable the interrut in the interrupt controller */
    outport(CH11CON, inport(CH11CON) | CHCON_SRC_INTERNAL | CHCON_PR3);

    outport(base + IDX_CON0, 0x0000 |               /* Operating Mode 1                                */
                                                    /* No Parity                                       */
                                                    /* No Parity                                       */
                       SPCON0_RMODE |               /* Receiver Enabled                                */
                       SPCON0_TMODE |               /* Transmiter Enabled                              */
                        SPCON0_RXIE |               /* Receive Data Ready Interrupt                    */
                                                    /* Hardware Flow Control                           */
                                                    /* Transmit bit 8 is 0                             */
                                                    /* Send Break is 0                                 */
                        SPCON0_RSIE                 /* Receive Status Interrupts                       */
                                                    /* No DMA                                          */
           );

    outport(base + IDX_STAT, 0x0000);               /* make sure the status register is clear          */

	/* TODO: Verify Change Timer Interrupt priority to highest */
	outpw(CH0CON, inpw(CH0CON) & 0xFFF8);
    
	/* Enable interrupt */
	if ( asyp->vec != -1 )
		maskon(asyp->vec);

#ifdef DEBUGTTY
	asyp->rxints = 0;
	asyp->rxchar = 0;
	asyp->txints = 0;
	asyp->overrun = 0;
	asyp->txchar = 0;
	asyp->msint_count = 0;
	asyp->txto = 0;
	asyp->cdchanges = 0;
	asyp->ctschanges = 0;
#endif

	restore(i_state);
    
	return dev;
}

/* Deinitialize asynch port "dev".
 * Restore COM state and frees used buffers.
 */
int asy_stop(int dev)
{
	struct asy *asyp;
	unsigned base;
	int i_state;

	if ( dev < 0 || dev >= ASY_MAX )
		return -1;

	asyp = &Asy[dev];
	base = asyp->addr;

	i_state = dirps();

	/* Restore original interrupt vector and interrupt mask state */
	if ( asyp->vec != -1 ) {
		setirq(asyp->vec, asyp->save.vec);

		if( asyp->save.mask )
			maskon(asyp->vec);
		else
			maskoff(asyp->vec);
	}

    outport(base + IDX_CON0, 0x0000);
    
	/* release receiver buffer */
	free(asyp->fifo.buf);
	asyp->fifo.buf = NULL;

	restore(i_state);

	return 0;
}


/* Set asynch line speed.
 *                  BAUDDIV = CLOCK_FREQ / (16 * BAUD_RATE)
 */
int asy_speed(int dev, long bps)
{
	unsigned base;
	unsigned int baud_div;
	struct asy *asyp;
	int i_state;


	if ( bps < 1200L || dev < 0 || dev >= ASY_MAX )
		return -1;

	asyp = &Asy[dev];

	if ( bps < 1200L || bps > 115200L)
		return -1;

	asyp->speed = bps;

	base = asyp->addr;

	baud_div = CPU_FREQ / (16 * bps);

	i_state = dirps();

	/* TODO: Purge the receive data buffer */

	/* Store the BAUDDIV to the register */
    outport(base + IDX_BDV, baud_div);
    
	restore(i_state);

	return 0;
}


/* Set asynch line PPP device number, returns -1 if error.
 */
int asy_set_ppp(int dev, int unit)
{
	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}

	return Asy[dev].pppunit = unit;
}


/* Asynchronous line I/O control.
 */
int32 asy_ioctl(int dev, int cmd, int set, int32 val)
{
	struct asy *asyp = &Asy[dev];
	uint16 base = asyp->addr;

	if ( dev < 0 || dev >= ASY_MAX )
		return (int32)(-1);

	switch ( cmd ) {
		case PARAM_SPEED:
			if ( set ) {
				asy_speed(dev, val);
			}

			return (int32)(asyp->speed);

		case PARAM_DTR:
			if ( set ) {
				/* TODO: DTR does not support */
			}

			return (int32)(TRUE);

		case PARAM_RTS:
			if ( set ) {
				/* TODO: RTS signal cannot be controlled by software */
			}

			return (int32)(TRUE);

		case PARAM_DOWN:
			/* TODO: RTS signal cannot be controlled by software */
			/* TODO: DTR does not support */

			return (int32)(FALSE);

		case PARAM_UP:
			/* TODO: RTS signal cannot be controlled by software */
			/* TODO: DTR does not support */

			return (int32)(TRUE);
	}

	return (int32)(-1);
}


/* Send a buffer on the serial transmitter without waiting for completion.
 * Returns -1 if invalid device, 0 if buffer busy, else returns cnt.
 * BEWARE !!!, this functions transmits the buffer by interrupts and does
 * not do any local copy. It means that the buffer passed in can't be a
 * local varibale, as it can go out of scope before the contents get
 * actually transmitted.
 */
int asy_write(int dev, uint8 *buf, uint16 cnt)
{
	unsigned base;
	struct dma *dp;
	struct asy *asyp;

	if ( dev < 0 || dev >= ASY_MAX )
		return -1;

	asyp = &Asy[dev];
	base = asyp->addr;
	dp = &asyp->dma;

	if ( dp->busy )
		return 0;  /* Already busy */

	if ( cnt ) {
		dp->data = buf;
		dp->cnt = cnt;
		dp->busy = 1;
		/* If CTS flow control is disabled or CTS is true,
		 * enable transmit interrupts here so we'll take an immediate
		 * interrupt to get things going. Otherwise let the
		 * modem control interrupt enable transmit interrupts
		 * when CTS comes up. If we do turn on TxE,
		 * "kick start" the transmitter interrupt routine, in case just
		 * setting the interrupt enable bit doesn't cause an interrupt
		 */

		if ( ! asyp->cts || (asyp->msr & CTS_STATUS) ) {
            asytxint(asyp);
		}
	}
	return cnt;
}


/* Returns number of chars in tx output buffer for dev or -1 if error.
 */
int asy_txcheck(int dev)
{
	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}

	return ((struct dma *)&(Asy[dev].dma))->cnt;
}


/* Read data from asynch line without blocking.
 * Returns number of bytes read, up to 'cnt' max.
 * It will return 0 if no data available, -1 if invalid device.
 */
int asy_read(int dev, uint8 *buf, uint16 cnt)
{
	struct fifo *fp;
	int i_state, i;

	if ( cnt == 0 )
		return 0;

	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}

	fp = &Asy[dev].fifo;

	/* Atomic read of and subtract from fp->cnt */
	i_state = dirps();

	if ( fp->cnt != 0 ) {
		if ( cnt > fp->cnt )
			cnt = fp->cnt;  /* Limit to data on hand */

		fp->cnt -= cnt;
	}
	else
		cnt = 0;

	restore(i_state);

	i = cnt;

	while ( i-- != 0 ) {
		/* This can be optimized later if necessary */
		*buf++ = *fp->rp++;

		if ( fp->rp >= fp->ep )
			fp->rp = fp->buf;
	}

	return cnt;
}


/* Returns number of chars in rx input buffer for dev
 * or -1 if invalid device.
 */
int asy_rxcheck(int dev)
{
	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}

	return ((struct fifo *)&(Asy[dev].fifo))->cnt;
}


/* Blocking read one character from asynch line.
 * Returns character or -1 if aborting.
 */
int get_asy(int dev)
{
	uint8 c;
	int tmp;

	for (;;) {
		if ( (tmp = asy_read(dev, &c, 1)) == 1 )
			return c;
		else if ( tmp < 0 )
			return tmp;
	}
}


/* Interrupt handler for 8250 asynch chip (called from lowlevel.asm).
 * Common interrupt handler code for 8250/16550 port.
 */
INTERRUPT (far *(asyint)(int dev))()
{
	struct asy *asyp;
	uint16 base;
	uint16 status;

	asyp = &Asy[dev];
	base = asyp->addr;


    status = inport(base + IDX_STAT);

    if (status & SPSTAT_RDR) {
        asyrxint(asyp);
    }
    
    if (status & SPSTAT_THRE) {
        asytxint(asyp);
    }
    
    if (status & SPSTAT_OER) {
#ifdef DEBUGTTY
			asyp->overrun++;
#endif
    }
    
    outport(base + IDX_STAT, 0x0000);

#ifndef UARTDRV_TEST
	if ( asyp->fifo.cnt && asyp->pppunit >= 0 && ! asyp->pppsem ) {
		++(asyp->pppsem);
		enable();
		asyrxschedule(dev, asyp->pppunit);
		disable();
		--(asyp->pppsem);
	}
#endif
	outport(EOI, EOITYPE_UART);

	return asyp->chain ? asyp->save.vec : NULL;
}


/* Process Z85230 receiver interrupts */
static int asyrxint(struct asy *asyp)
{
	struct fifo *fp;
	unsigned base;
	uint8 c;

#ifdef DEBUGTTY
	asyp->rxints++;
    asyp->rxchar++;
#endif

	base = asyp->addr;
	fp = &asyp->fifo;

    c = inportb(base + IDX_RXD);

    /* If buffer is full, we have no choice but
     * to drop the character
     */
    if ( fp->cnt != fp->bufsize ) {
        *fp->wp++ = c;

        if ( fp->wp >= fp->ep )
            /* Wrap around */
            fp->wp = fp->buf;

        fp->cnt++;

    }

	return 0;
}


/* Handle Z85230 transmitter interrupts */
static void asytxint(struct asy *asyp)
{
	struct dma *dp;
	unsigned base;

	base = asyp->addr;
	dp = &asyp->dma;

#ifdef DEBUGTTY
	asyp->txints++;
#endif

	if ( !dp->busy || (asyp->cts && !(asyp->msr & CTS_STATUS)) ) {
		/* These events "shouldn't happen". Either the
		 * transmitter is idle, in which case the transmit
		 * interrupts should have been disabled, or flow control
		 * is enabled but CTS is low, and interrupts should also
		 * have been disabled.
		 */
		/* Disable TX interrupt */
        outport(base + IDX_CON0, inport(base + IDX_CON0) & ~SPCON0_TXIE);
		return; /* Nothing to send */
	}

    while (inport(base + IDX_STAT) & SPSTAT_THRE) {
		outportb(base + IDX_TXD, *dp->data++);
#ifdef DEBUGTTY
    	asyp->txchar++;
#endif
    	dp->cnt--;
        if (dp->cnt == 0) {
		    /* Disable further transmit interrupts */
		    /* TODO: Verify this */
            outport(base + IDX_CON0, inport(base + IDX_CON0) & ~SPCON0_TXIE);
	        dp->busy = 0;
            break;
        }
	}
    if (dp->cnt) {
        outport(base + IDX_CON0, inport(base + IDX_CON0) | SPCON0_TXIE);
    }
}


/* Handle Z85230 modem status change interrupt */
/* TODO: Should be more verify since it have a lot of different */
static void asymsint(struct asy *asyp)
{
        /* Does not support */
}


/* TODO: must be verify Different between MSR_RLSD vs. DCD_STATUS */
static int rlsdstat(struct asy *asyp)
{
	if ( asyp->rlsd )
		return asyp->carrier;
	else if ( asyp->cts )
		return ((asyp->msr & DCD_STATUS) != 0);
	else
		return ((0xFF & DCD_STATUS) != 0);                /* Does not support FORCE IT */
}


/* Get the RLSD signal status.
 */
int get_rlsd_asy(int dev)
{
	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}
	return rlsdstat(&Asy[dev]);
}


/* Wait for a signal that the RLSD modem status has changed.
 */
int wait_rlsd_asy(int dev, int new_rlsd)
{
	struct asy *asyp;

	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}

	asyp = &Asy[dev];

	for (;;) {
		/* Wait for state change to requested value */
		if ( new_rlsd && rlsdstat(asyp) )
			return 1;

		if ( !new_rlsd && !rlsdstat(asyp) )
			return 0;
	}
}


/* Poll the asynch input queues; called on every clock tick.
 */
void asytimer(void)
{
	struct dma *dp;
	struct asy *asyp;
	int i, i_state;

	for ( asyp = Asy, i = 0 ; i < ASY_MAX ; asyp++, i++ ) {
		if ( asyp->fifo.buf == NULL )
			continue;
		dp = &asyp->dma;
		if ( dp->busy
			 && (inport(asyp->addr + IDX_STAT) & SPSTAT_THRE)
			 && (!asyp->cts || (asyp->msr & CTS_STATUS)) ) {
#ifdef DEBUGTTY
			asyp->txto++;
#endif
			i_state = dirps();
			/* TODO: Revise this changes */
            asytxint(asyp);
			restore(i_state);
		}
	}

	for ( asyp = Asy, i = 0 ; i < ASY_MAX ; asyp++, i++ ) {
		if ( asyp->fifo.buf == NULL )
			continue;

#ifndef UARTDRV_TEST
		i_state = dirps();

		if ( asyp->fifo.cnt && asyp->pppunit >= 0 && ! asyp->pppsem ) {
			++(asyp->pppsem);
			restore(i_state);
			asyrxschedule(i, asyp->pppunit);
			i_state = dirps();
			--(asyp->pppsem);
		}

		restore(i_state);
#endif
	}
}


/* Check the state of 'pppsem' on a given port, increment it and return 1
 * if it is available, return 0 otherwise.
 */
int set_pppsem(int dev)
{
	struct asy *asyp;
	int i_state;

	if ( dev < 0 || dev >= ASY_MAX ) {
		return -1;
	}

	asyp = &Asy[dev];
	i_state = dirps();

	if ( ! asyp->pppsem ) {
		++(asyp->pppsem);
		restore(i_state);
		return 1;
	}

	restore(i_state);

	return 0;
}


/* Release 'pppsem' on a given port, do nothing if it is already 0.
 */
int free_pppsem(int dev)
{
    struct asy *asyp;
    int i_state;

    if ( dev < 0 || dev >= ASY_MAX ) {
        return -1;
	}

    asyp = &Asy[dev];
    i_state = dirps();

    if ( asyp->pppsem ) {
        --(asyp->pppsem);
        restore(i_state);
        return 1;
    }

    restore(i_state);

	return 0;
}


/* Check if the interrupt vectors in use for COM ports still owned by us.
 */
int asy_chkirqvecs(void)
{
    struct asy *asyp;
    int i;

    for ( asyp = Asy, i = 0 ; i < ASY_MAX ; asyp++, i++ ) {
        if ( asyp->fifo.buf == NULL )
            continue;

        if ( FP_SEG(getirq(asyp->vec)) != _CS )
            return 0;
    }

    return 1;
}


#ifndef UARTDRV_TEST
/* Far functions meant to be called by programs that use the private
 * interface functions in PKTDRVR.C, CHAT for example. These functions
 * uses whatever com id is defined in the external variable 'comopen',
 * which is set up in DOSMAIN.C.
 */


/* A simple wrapper for asy_rxcheck()
 */
int far _loadds asyf_rxcheck(void)
{
	return asy_rxcheck(comopen);
}


/* A simple wrapper for asy_txcheck()
 */
int far _loadds asyf_txcheck(void)
{
    return asy_txcheck(comopen);
}


/* This function calls asy_read() with a 1 count and checks the result.
 * If 1 is returned from the call, then a valid byte was found. A 0 value
 * return means that nothing is in the rx buffer, we return -1 in this
 * case. A less than 0 value returned means some error occured, subtract
 * 1 to it and return the resulting value.
 */
int far _loadds asyf_getc(void)
{
	int r;
    /* DON'T CHANGE THIS !!!, this variable must lie in the
	   Data segment for a proper addressing from asy_read() later. */
    static uint8 chr;

    if ( (r = asy_read(comopen, &chr, 1)) == 1 )
        return (int)chr;
    else if ( r == 0 )
        return -1;

    return (r - 1);
}

/* First we check if the tx buffer is busy, if so we return a 0 to the
 * caller. Note that we make a copy of the byte to a static buffer, cause
 * asy_write() must not be used with local buffers in the stack. We return
 * the asy_write() result to the caller.
 */
int far _loadds asyf_putc(uint8 chr)
{
	/* DON'T CHANGE THIS !!!, this variable must lie in the
	   Data segment for a proper addressing from asy_write() later. */
	static uint8 chrbuf;

	if ( ((struct dma *)&(Asy[comopen].dma))->busy )
		return 0;

	chrbuf = chr;

	return asy_write(comopen, &chrbuf, 1);
}


const ASY_HOOKS asy_exportinfo = {
	sizeof(asy_exportinfo),
	asyf_rxcheck,
	asyf_txcheck,
	asyf_getc,
	asyf_putc
};

#endif

/* Prints info about asynch port "dev".
 */
#ifndef DEBUGTTY
#pragma argsused
int asy_info(int dev)
{
	return 0;
}
#else /* DEBUGTTY */
int asy_info(int dev)
{
	struct asy *asyp;
	int mcr, msr;

	if ( dev < 0 || dev >= ASY_MAX )
		return -1;

	asyp = &Asy[dev];

	printf("COM%d %X %u:", dev + 1, asyp->addr, asyp->vec);

	if ( asyp->cts )
		printf(" [cts flow control]");

	if ( asyp->rlsd )
		printf(" [rlsd line control]");

	printf(" %lu bps\n", asyp->speed);

	mcr = 0xFF;        /* Hardware does not support force it */

	if ( asyp->cts || asyp->rlsd )
		msr = asyp->msr;
	else
		msr = 0xFF;    /* Hardware does not support force it */

	printf(" MC: int %lu  DTR %s  RTS %s  CTS %s  CD %s\n",
			asyp->msint_count,
			(mcr & DTR_ON) ? "On" : "Off",
			(mcr & RTS_ON) ? "On" : "Off",
			(msr & CTS_STATUS) ? "On" : "Off",
			(msr & DCD_STATUS) ? "On" : "Off");

    printf(" CD Changes: %lu, CTS Changes: %lu\n", asyp->cdchanges, asyp->ctschanges);

    printf(" RX: int %lu  chars %lu  hw over %lu",
			asyp->rxints, asyp->rxchar, asyp->overrun);

	printf(" TX: int %lu  chars %lu  THRE TO %lu  %s\n",
			asyp->txints,asyp->txchar, asyp->txto,
			asyp->dma.busy ? " BUSY" : "");

	return 0;
}
#endif /* DEBUGTTY */
