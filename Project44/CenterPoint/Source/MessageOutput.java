import java.io.*;
public abstract class MessageOutput extends DataOutputStream {
	protected MessageOutput (OutputStream out) {
		super (out);
	}
	
	public abstract void send () throws IOException;
	
	public void send (String[] dsts) throws IOException {
		throw new IOException ("send[] not supported");
	}
	
	public void send (String dst) throws IOException {
		String[] dsts = { dst };
		send (dsts);
	}
}