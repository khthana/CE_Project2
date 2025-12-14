import java.io.*;
import java.awt.*;
import java.awt.event.*;

public class GenericChat {
	
	protected InputStream in;
	protected OutputStream out;
	protected String name;
	
	public GenericChat (InputStream in, OutputStream out, String name) {
		this.in = in;
		this.out = out;
		this.name = name;
		initAWT ();
	}
	
	protected Frame frame;
	protected ChatboardClient cb;
	protected PassposClient pp;
	
	protected void initAWT () {
		frame = new Frame (name);
		frame.setLayout (new GridLayout (1, 1));
		pp = new PassposClient ();
		cb = new ChatboardClient ();
		
		if (name.equals("Admin")) {
			Admin am = new Admin (pp);
			frame.add (am);
		}
		
		frame.add (cb);
		frame.add (pp);
		frame.pack ();
		
		frame.addWindowListener (new WindowAdapter() {
			public void windowClosing (WindowEvent event) {
				try {					
					stop ();
				} catch (IOException ex) {
					ex.printStackTrace ();
				}
			}
		});
	}
	
	protected GenericClient client;
	
	public void start () throws IOException {
		client = new GenericClient (in, out);
		client.register ("chat", cb);
		client.register ("pass", pp);
		client.start ();
		frame.setVisible (true);
		cb.sendName (name);
		cb.sendPP (pp);
		cb.sendLog ();
		pp.sendCB (cb);
		pp.CallMain ();	
	}
	
	public void stop () throws IOException {
		frame.setVisible (false);
		pp.Move (-1);
		cb.Signout ();
		client.shutdown ();		
	}
	
}