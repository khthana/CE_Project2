
package ssh;

import java.io.*;

import util.Queue;

public class SSHTxChannel extends SSHChannel {

  protected OutputStream out;
  protected Queue        queue;

  boolean closePending;

  public SSHTxChannel(OutputStream out, int channelId) {
    super(channelId);
    this.out          = out;
    this.closePending = false;
    queue = new Queue();
  }

  public Queue getQueue() {
    return queue;
  }

  public void setClosePending() {
    closePending = true;
    queue.setBlocking(false);
  }

  public synchronized boolean isClosePending() {
    return closePending;
  }

  public void serviceLoop() throws Exception {
    SSH.logExtra("Starting tx-chan: " + channelId);
    for(;;) {
      SSHPdu pdu;
      // !!! the thread is (hopefully) suspended when we set closePending
      // so we don't have to access a lock each loop
      if(closePending && queue.isEmpty()) {
	  throw new Exception("CLOSE");
      }
      pdu = (SSHPdu)queue.getFirst();
      //      pdu = pdu.preProcess();
      pdu.writeTo(out);
      //      pdu = pdu.postProcess();
    }
  }

}
