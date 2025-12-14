import java.io.*;

public class MultiplexOutputStream extends MessageOutput {
	protected MessageOutput messageOut;
	protected ByteArrayOutputStream byteArrayOut;
	protected String label;
	
	public MultiplexOutputStream (MessageOutput messageOut, String label) {
		super (new ByteArrayOutputStream ());
		byteArrayOut = (ByteArrayOutputStream) out;
		this.messageOut = messageOut;
		this.label = label;
	}
	
	public void send () throws IOException {
		synchronized (messageOut) {
			messageOut.writeUTF (label);
			byteArrayOut.writeTo (messageOut);
			messageOut.send ();
		}
		byteArrayOut.reset ();
	}
	
	public void send (String[] dsts) throws IOException {
		synchronized (messageOut) {
			messageOut.writeUTF (label);
			byteArrayOut.writeTo (messageOut);
			messageOut.send (dsts);
		}
		byteArrayOut.reset ();
	}
}