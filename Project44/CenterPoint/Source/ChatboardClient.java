import java.io.*;
import java.awt.*;

public class ChatboardClient extends Chatboard implements Client {
	protected MessageOutput messageOut;
	
	public void receive (DataInputStream dataIn) {
		if (messageOut == null)
			messageOut = super.getMessageOutput ();
		try {
			byte[] buffer = new byte[dataIn.available ()];
			dataIn.readFully (buffer);
			messageOut.write (buffer);
			messageOut.send ();
		} catch (IOException ex) {
			ex.printStackTrace ();
		}
	}
	
	public void disconnected () {
		input.setEditable (false);
		listener.interrupt ();
	}
}