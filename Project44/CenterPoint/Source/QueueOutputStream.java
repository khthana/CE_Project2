import java.io.*;

public class QueueOutputStream extends MessageOutput {
	protected ByteArrayOutputStream byteArrayOut;
	protected Queue queue;
	
	public QueueOutputStream (Queue queue) {
		super (new ByteArrayOutputStream ());
		byteArrayOut = (ByteArrayOutputStream) out;
		this.queue = queue;
	}
	
	public void send () {
		byte[] buffer = byteArrayOut.toByteArray ();
		byteArrayOut.reset ();
		queue.add (buffer);
	}
}