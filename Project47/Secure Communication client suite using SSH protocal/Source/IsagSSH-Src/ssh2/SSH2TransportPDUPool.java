
package ssh2;

/**
 * Implements a pool of PDUs which can be reused. This class holds a
 * pool of PDUs and tries to reuse them whenever possible.
 */
public class SSH2TransportPDUPool extends SSH2TransportPDU {

    static int POOL_SIZE = 32;

    protected class InPDU extends SSH2TransportPDU {
	protected InPDU(int pktType, int bufSize) {
	    super(pktType, bufSize);
	}
	public void release() {
	    this.reset();
	    this.pktSize = 0;
	    releaseIn(this);
	}
    }

    protected class OutPDU extends SSH2TransportPDU {
	protected OutPDU(int pktType, int bufSize) {
	    super(pktType, bufSize);
	}
	public void release() {
	    this.reset();
	    this.pktSize = 0;
	    releaseOut(this);
	}
    }

    int inCnt;
    int outCnt;
    int defInSz;
    int defOutSz;

    SSH2TransportPDU[] inPool;
    SSH2TransportPDU[] outPool;

    protected SSH2TransportPDUPool() {
	inPool   = new SSH2TransportPDU[POOL_SIZE];
	outPool  = new SSH2TransportPDU[POOL_SIZE];
	inCnt    = POOL_SIZE;
	outCnt   = POOL_SIZE;
	defInSz  = pktDefaultSize;
	defOutSz = ((pktDefaultSize * 3) / 2);
	for(int i = 0; i < POOL_SIZE; i++) {
	    inPool[i]  = new InPDU(0, defInSz);
	    outPool[i] = new OutPDU(0, defOutSz);
	}
    }

    protected SSH2TransportPDU createInPDU(int bufSize) {
	synchronized(inPool) {
	    if(inCnt == 0 || bufSize > defInSz) {
		return new InPDU(0, bufSize);
	    } else {
		return inPool[--inCnt];
	    }
	}
    }

    protected SSH2TransportPDU createOutPDU(int pktType, int bufSize) {
	SSH2TransportPDU pdu = null;
	synchronized(outPool) {
	    if(outCnt == 0 || bufSize > defOutSz) {
		return new OutPDU(pktType, bufSize);
	    } else {
		pdu = outPool[--outCnt];
	    }
	}
	pdu.pktType = pktType;
	return pdu;
    }

    /**
     * Internal class which releases an incoming PDU.
     */
    protected void releaseIn(InPDU pdu) {
	synchronized(inPool) {
	    if(inCnt < inPool.length && pdu.data.length >= defInSz) {
		inPool[inCnt++] = pdu;
	    } else {
		/* stat */
	    }
	}
    }

    /**
     * Internal class which releases an outgoing PDU.
     */
    protected void releaseOut(OutPDU pdu) {
	synchronized(outPool) {
	    if(outCnt < outPool.length && pdu.data.length >= defOutSz) {
		outPool[outCnt++] = pdu;
	    } else {
		/* stat */
	    }
	}
    }

}
