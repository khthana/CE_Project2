import java.io.*;

public class RoutingInputStream extends MessageInput {
	protected MessageInput messageIn;
	
	public RoutingInputStream (MessageInput messageIn) {
		super (messageIn);
		this.messageIn = messageIn;
	}
	
	protected String[] targets;
	
	public void receive () throws IOException {
		messageIn.receive ();
		int n = messageIn.readInt ();
		if (n < 0) {
			targets = null;
		} else {
			targets = new String[n];
			for (int j = 0; j < n; ++ j)
				targets[j] = messageIn.readUTF ();
		}
	}
	
	public String[] getTargets () {
		return targets;
	}
}