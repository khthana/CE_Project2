import java.io.*;

public class MessageInputStream extends MessageInput {
	protected InputStream rawIn;
	protected DataInputStream dataIn;
	
	public MessageInputStream (InputStream in) {
		super (new ByteArrayInputStream (new byte[0]));
		rawIn = in;
		dataIn = new DataInputStream (rawIn);
	}
	
	public void receive () throws IOException {
		synchronized (rawIn) {
			int length = dataIn.readInt ();
			byte[] buffer = new byte[length];
			dataIn.readFully (buffer);
			in = new ByteArrayInputStream (buffer);
		}
	}
}