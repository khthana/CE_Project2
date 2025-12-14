import java.io.*;

public class RoutingOutputStream extends MessageOutput {
	protected MessageOutput messageOut;
	protected ByteArrayOutputStream byteArrayOut;
	
	public RoutingOutputStream (MessageOutput messageOut) {
		super (new ByteArrayOutputStream ());
		byteArrayOut = (ByteArrayOutputStream) out;
		this.messageOut = messageOut;
	}
	
	public void send () throws IOException {
		synchronized (messageOut) {
			messageOut.writeInt (-1);
			byteArrayOut.writeTo (messageOut);
			messageOut.send ();
		}
		byteArrayOut.reset ();
	}
	
	public void send (String[] dsts) throws IOException {
		synchronized (messageOut) {
			messageOut.writeInt (dsts.length);
			for (int i = 0; i < dsts.length; ++ i)
				messageOut.writeUTF (dsts[i]);
			byteArrayOut.writeTo (messageOut);
			messageOut.send ();
		}
		byteArrayOut.reset ();
	}
}