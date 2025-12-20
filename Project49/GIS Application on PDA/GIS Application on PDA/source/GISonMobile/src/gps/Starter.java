package gps;

import gps.datatypes.Record;
import gps.exceptions.EmptyBufferException;
import gps.log.Logger;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.midlet.MIDlet;

/**
 * Test class for GPS. Not needed for application.
 * 
 * @author Dominik Schmidt
 */
public class Starter extends MIDlet implements CommandListener, Runnable {
	private static final String GPS_BT_URL = "comm:6;baudrate=4800";

	private Command exitCommand;
	
	private Command pauseCommand;
	
	private Command resumeCommand;

	private Display display;

	private static final long BREAK = 500;

	private Logger l = new Logger("Bluetooth Test", 512, 0);

	private Thread runner;

	private GPS gps;

	public Starter() {
		display = Display.getDisplay(this);
		exitCommand = new Command("Exit", Command.SCREEN, 0);
		pauseCommand = new Command("Pause", Command.SCREEN, 2);
		resumeCommand = new Command("Resume", Command.SCREEN, 2);
	}

	public void startApp() {

		l.addCommand(exitCommand);
		l.addCommand(pauseCommand);
		l.addCommand(resumeCommand);
		l.setCommandListener(this);

		display.setCurrent(l);

		gps = new GPS(l, GPS_BT_URL);
		gps.start();

		start();
	}

	public void pauseApp() {
	}

	public void destroyApp(boolean unconditional) {
		stop();
		gps.stop();
	}

	public void commandAction(Command c, Displayable s) {
		if (c == exitCommand) {
			destroyApp(false);
			notifyDestroyed();
		}
		else if(c == pauseCommand) {
			stop();
			gps.stop();
		}
		else if(c == resumeCommand) {
			start();
			gps.start();
		}
	}

	public void run() {
		while (Thread.currentThread() == runner) {
			try {
				Record record = gps.getRecord();
				l.setTitle("W: " + record.warning);
				l.setString(record.output);
			} catch (EmptyBufferException e) {
				l.setString("No data received yet.");
			}
			try {
				Thread.sleep(BREAK);
			} catch (InterruptedException e) {
			}
		}
	}

	public void start() {
		if (runner == null) {
			runner = new Thread(this);
			runner.start();
		}
	}

	public void stop() {
		runner = null;
	}
}