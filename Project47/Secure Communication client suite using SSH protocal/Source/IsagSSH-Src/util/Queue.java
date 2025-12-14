
package util;

public final class Queue {

    final static int DEFAULT_DEPTH   = 64;
    final static int DEFAULT_HIWATER = 32;

    Object[]   queue;
    boolean    isWaitGet;
    boolean    isWaitPut;
    boolean    isBlocking;
    int        rOffset;
    int        wOffset;
    int        depth;
    int        hiwater;
    int        size;

    // Copies used for saving real values when disabling queue
    //
    int        depthCP;
    int        sizeCP;
    
    public Queue() {
	this(DEFAULT_DEPTH, DEFAULT_HIWATER);
    }

    public Queue(int depth, int hiwater) {
	this.queue      = new Object[depth + 1];
	this.isWaitGet  = false;
	this.isWaitPut  = false;
	this.isBlocking = true;
	this.rOffset    = 0;
	this.wOffset    = 0;
        this.size       = 0;
	this.sizeCP     = -1;
	this.depth      = depth;
	this.hiwater    = hiwater;
    }

    public synchronized void setDepth(int depth) {
	this.depth = depth;
    }

    public synchronized void putLast(Object obj) {
	putFlowControl();
	queue[wOffset++] = obj;
	if(wOffset == (depth + 1))
	    wOffset = 0;
	if(isWaitGet)
	    this.notify();
        size++;
    }

    public synchronized void putFirst(Object obj) {
	putFlowControl();
	rOffset--;
	if(rOffset == -1)
	    rOffset = depth;
	queue[rOffset] = obj;
	if(isWaitGet)
	    this.notify();
        size++;
    }

    public synchronized void release() {
	if(isWaitGet)
	    this.notify();
    }

    public synchronized void disable() {
	depthCP = depth;
        sizeCP  = size;
	depth   = 0;
        size    = 0;
    }

    public synchronized void enable() {
	if(sizeCP >= 0) {
	    depth = depthCP;
	    size          = sizeCP;
	    sizeCP        = -1;
	    if(!isEmpty()) {
		this.release();
	    }
	    if(isWaitPut && (size <= hiwater)) {
		this.notifyAll();
		isWaitPut = false;
	    }
	}
    }

    public synchronized void setBlocking(boolean block) {
	isBlocking = block;
	release();
    }

    public synchronized boolean isEmpty() {
	return size == 0;
    }

    private final void putFlowControl() {
	/*
	 * Note this must be a while-loop because of the possibility of unfair
	 * thread scheduling due to the fact that the sematics for wait/notify
	 * in java is that the order in which wait() unblocks is not defined
	 * (i.e. even a thread which wasn't waiting for the lock BEFORE we
	 * called wait() here can acquire the lock BEFORE our wait() returns)
	 */
        while(size >= depth) {
            isWaitPut = true;
	    try {
		this.wait();
	    } catch (InterruptedException e) { /* ignore */ }
        }
    }

    public synchronized Object getFirst() {
	Object obj = null;
	while(isEmpty()) {
	    if(!isBlocking) {
		return null;
	    }
	    isWaitGet = true;
	    try {
		this.wait();
	    } catch (InterruptedException e) {
		// !!!
	    }
	}
	isWaitGet = false;
	obj = queue[rOffset];
	queue[rOffset++] = null;
	if(rOffset == (depth + 1))
	    rOffset = 0;
	if(isWaitPut && (size <= hiwater)) {
	    this.notifyAll();
	    isWaitPut = false;
	}
        size--;
	return obj;
    }
}
