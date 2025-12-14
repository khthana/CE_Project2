import java.io.*;

public class GenericMessageCopier extends MessageCopier {
	protected Thread sibling;
	
	public GenericMessageCopier (Thread sibling, MessageInput messageIn,
			MessageOutput messageOut) {
		super (messageIn, messageOut);
		this.sibling = sibling;
	}
	
	public void run () {
		try {
			copy ();
		} catch (IOException ex) {
			if (!finished) {
				ex.printStackTrace ();
				sibling.interrupt ();
			}
		}
	}
}