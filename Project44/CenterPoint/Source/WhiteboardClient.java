import java.io.*;
import java.awt.*;

public class WhiteboardClient extends Whiteboard implements Client {
	public void disconnected () {
		setForeground (Color.red);
	}
}