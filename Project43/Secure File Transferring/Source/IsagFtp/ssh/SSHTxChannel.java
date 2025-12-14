package IsagFtp.ssh;

import java.io.*;

public class SSHTxChannel extends SSHChannel {

  protected OutputStream out;
  protected SSHPduQueue  queue;

  boolean closePending;

  public SSHTxChannel(OutputStream out, int channelId) {
    super(channelId);
    this.out          = out;
    this.closePending = false;
    queue = new SSHPduQueue();
  }

  public SSHPduQueue getQueue() {
    return queue;
  }

  public void setClosePending() {
    closePending = true;
    queue.release();
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
      pdu = queue.getFirst();
      //      pdu = pdu.preProcess();
      pdu.writeTo(out);
      //      pdu = pdu.postProcess();
    }
  }

}
