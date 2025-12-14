import java.io.*;

public class MessageOutputStream extends MessageOutput {
	protected OutputStream rawOut;
	protected DataOutputStream dataOut;
	protected ByteArrayOutputStream byteArrayOut;
	
	public MessageOutputStream (OutputStream out) {
		super (new ByteArrayOutputStream ());
		rawOut = out;
		dataOut = new DataOutputStream (rawOut);
		byteArrayOut = (ByteArrayOutputStream) super.out;
	}
	
	public void send () throws IOException {
		synchronized (rawOut) {
			dataOut.writeInt (byteArrayOut.size ());
			byteArrayOut.writeTo (rawOut);
		}
		byteArrayOut.reset ();
		rawOut.flush ();
	}
}