import java.io.*;

public interface Client {
	public void setMessageOutput (MessageOutput messageOut);
	public void receive (DataInputStream dataIn);
	public void disconnected ();
}