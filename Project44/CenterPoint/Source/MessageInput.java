import java.io.*;

public abstract class MessageInput extends DataInputStream {
	protected MessageInput (InputStream in) {
		super (in);
	}
	
	public abstract void receive () throws IOException;
}