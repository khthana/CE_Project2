import java.io.*;

public class MultiplexInputStream extends MessageInput {
	protected MessageInput messageIn;
	
	public MultiplexInputStream (MessageInput messageIn) {
		super (messageIn);
		this.messageIn = messageIn;
	}
	
	protected String label;
	
	public void receive () throws IOException {
		messageIn.receive ();
		label = messageIn.readUTF ();
	}
	
	public String getLabel () {
		return label;
	}
}