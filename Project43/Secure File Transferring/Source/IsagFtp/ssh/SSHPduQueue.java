package IsagFtp.ssh;

public final class SSHPduQueue {

  final static int SSH_QUEUE_DEPTH   = 512;
  final static int SSH_QUEUE_HIWATER = 384;

  Object[]   queue;
  Object     queueLock;
  boolean    isWaitGet;
  boolean    isWaitPut;
  int        rOffset;
  int        wOffset;
  int        maxQueueDepth;

  public SSHPduQueue() {
    this.queue     = new Object[SSH_QUEUE_DEPTH + 1];
    this.queueLock = new Object();
    this.isWaitGet = false;
    this.isWaitPut = false;
    this.rOffset   = 0;
    this.wOffset   = 0;
    this.maxQueueDepth = SSH_QUEUE_DEPTH;
  }

  public void setMaxDepth(int maxDepth) {
    synchronized(queueLock) {
      maxQueueDepth = maxDepth;
    }
  }

  public void putLast(SSHPdu pdu) {
    synchronized(queueLock) {
      putFlowControl();
      queue[wOffset++] = pdu;
      if(wOffset == (SSH_QUEUE_DEPTH + 1))
	wOffset = 0;
      if(isWaitGet)
	queueLock.notify();
    }
  }

  public void putFirst(SSHPdu pdu) {
    synchronized(queueLock) {
      putFlowControl();
      rOffset--;
      if(rOffset == -1)
	rOffset = SSH_QUEUE_DEPTH;
      queue[rOffset] = pdu;
      if(isWaitGet)
	queueLock.notify();
    }
  }

  public void release() {
    synchronized(queueLock) {
      if(isWaitGet)
	queueLock.notify();
    }
  }

  public boolean isEmpty() {
    boolean isEmpty;
    synchronized(queueLock) {
      isEmpty = (rOffset == wOffset);
    }
    return isEmpty;
  }

  private final void putFlowControl() {
    int fs = freeSpace();
    if(fs == (SSH_QUEUE_DEPTH - maxQueueDepth)) {
      isWaitPut = true;
    }
    if(isWaitPut) {
      try {
	queueLock.wait();
      } catch (InterruptedException e) {
	// !!!
      }
    }
  }

  private final int freeSpace() {
    int fSpc = rOffset - wOffset;
    if(fSpc <= 0)
      fSpc += (SSH_QUEUE_DEPTH + 1);
    fSpc--;
    return fSpc;
  }

  public SSHPdu getFirst() {
    SSHPdu pdu = null;

    synchronized(queueLock) {
      if(isEmpty()) {
	isWaitGet = true;
	try {
	  queueLock.wait();
	} catch (InterruptedException e) {
	  // !!!
	}
      }
      isWaitGet = false;
      pdu = (SSHPdu) queue[rOffset];
      queue[rOffset++] = null;
      if(rOffset == (SSH_QUEUE_DEPTH + 1))
	rOffset = 0;
      if(isWaitPut && (freeSpace() > (SSH_QUEUE_DEPTH - SSH_QUEUE_HIWATER))) {
	queueLock.notifyAll();
	isWaitPut = false;
      }
    }

    return pdu;
  }

}
