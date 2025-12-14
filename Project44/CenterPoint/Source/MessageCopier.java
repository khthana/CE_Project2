import java.io.*;

public class MessageCopier extends Thread {
	protected MessageInput messageIn;
	protected MessageOutput messageOut;
	
	static private int copierNumber;
	static private synchronized int nextCopierNum () { return copierNumber ++; }
	
	public MessageCopier (MessageInput messageIn, MessageOutput messageOut) {
		super ("MessageCopier-" + nextCopierNum ());
		this.messageIn = messageIn;
		this.messageOut = messageOut;
	}
	
	protected boolean finished;
	public void finish () {
		finished = true;
		interrupt ();
	}
	
	public void run () {
		try {
			copy ();
		} catch (IOException ex) {
			if (!finished)
				ex.printStackTrace ();
		}
	}
	
	protected void copy () throws IOException {
		while (!interrupted ()) {
			byte[] buffer;
			synchronized (messageIn) {
				messageIn.receive ();
				buffer = new byte[messageIn.available ()];
				messageIn.readFully (buffer);
			}
			synchronized (messageOut) {
				messageOut.write (buffer);
				messageOut.send ();
			}
		}
	}
}