import java.io.*;
import java.awt.*;
import java.awt.event.*;

public class Chatboard extends Panel implements Runnable, KeyListener, ActionListener {
	protected TextArea output;
	protected TextField input;
	protected Queue queue;
	protected Thread listener;
	protected int command, count;
	protected Passpos pp;
	protected String name, human;
	
	public Chatboard () {
		setLayout (new BorderLayout ());
		add ("Center", output = new TextArea ());
		output.setEditable (false);
		add ("South", input = new TextField ());
		input.addKeyListener (this);
		input.addActionListener (this);
		human = "Boardcast";
		queue = new Queue ();
		listener = new Thread (this);
		listener.start ();
	}
	
	public Dimension getPreferredSize () {
		return new Dimension (200, 150);
	}
	
	protected MessageOutput messageOut;
	
	public void setMessageOutput (MessageOutput messageOut) {
		this.messageOut = messageOut;
	}
	
	public MessageOutput getMessageOutput () {
		return new QueueOutputStream (queue);
	}
	
	public void sendName (String name) 
	{
		this.name = name;
	}
		
	public void sendPP (Passpos pp)
	{
		this.pp = pp;
	}
	
	public void sendLog ()
	{
		try {
			messageOut.writeUTF ("++ " + name + " now Login ++ ");
			messageOut.send ();
		} catch (IOException ignored) {
		}
	}
	
	public void Signout ()
	{
		try {
			messageOut.writeUTF ("++ " + name + " now SignOut ++ ");
			messageOut.send ();
		} catch (IOException ignored) {
		}
	}
	
	public void keyTyped(KeyEvent e) {
        int keyCode = e.getKeyCode();
    }

    /** Handle the key pressed event from the text field. */
    public void keyPressed(KeyEvent e) {
        int keyCode = e.getKeyCode();
        command = 0;
        count++;
        if (keyCode == 37) { command = 3; }
        if (keyCode == 38) { command = 1; }
        if (keyCode == 39) { command = 4; }
        if (keyCode == 40) { command = 2; }
        if (count == 5) {
        	pp.Move (command);
        	count = 0;
        }
    }

    /** Handle the key released event from the text field. */
    public void keyReleased(KeyEvent e) {
        int keyCode = e.getKeyCode();
        command = 0;
        count = 0;
        pp.Move (command);
    }
    
    public void getHuman (String human)
    {
    	this.human = human;
    }
    
	public void actionPerformed (ActionEvent event) {
		try {
			String text = input.getText ();
			text = '<' + name + '>' + text;
			messageOut.writeUTF (text);
			if (!human.equals("Boardcast")) {
				messageOut.send (human);
			} else {
				messageOut.send ();
			}
			output.append (input.getText () + "\n");
			input.setText ("");
		} catch (IOException ignored) {
		}
	}
    
	public void run () {
		QueueInputStream queueIn = new QueueInputStream (queue);
		try {
			while (!Thread.interrupted ()) {
				queueIn.receive ();
				String msg = queueIn.readUTF ();
				output.append ("-- " + msg + "\n");
			}
		} catch (IOException ignored) {
		}
	}
	
}