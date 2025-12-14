import java.io.*;

public class QueueInputStream extends MessageInput {
	protected Queue queue;
	
	public QueueInputStream (Queue queue) {
		super (new ByteArrayInputStream (new byte[0]));
		this.queue = queue;
	}
	
	public void receive () throws IOException {
		try {
			byte[] buffer = (byte[]) queue.remove ();
			in = new ByteArrayInputStream (buffer);
		} catch (InterruptedException ex) {
			throw new InterruptedIOException ("queue.remove()");
		}
	}
}