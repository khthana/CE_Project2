import javax.microedition.lcdui.*;
import javax.microedition.midlet.*;

public class EleChat extends MIDlet implements CommandListener{

	MyCanvas mc=null;
	Display md =null;
	Command commandExit=null, commandGetnick=null;
	String nick=null;
	TextField nickfield=null;
  
	public EleChat() {
		mc=new MyCanvas(this);
		getNick();
		System.out.println("constructor complete");
		
	}





 	public void getNick() {
	md=Display.getDisplay( this );
	Form f =new Form("enter nickname");
	nickfield = new TextField ("enter your nickname","",10,0);
	f.append(nickfield);
        commandGetnick=new Command("OK",Command.OK,0);
	commandExit=new Command("Exit",Command.EXIT,0);
	f.addCommand(commandGetnick);
	f.addCommand(commandExit);
	md.setCurrent(f);
	f.setCommandListener(this);
 	}

	public void commandAction (Command c, Displayable d) {
		if (c == commandExit) {
		mc.stop(EleError.NOERROR);
		} else {

		nick=nickfield.getString();
		md.setCurrent(mc);
		try { 
			(new Thread(mc)).start();
			} catch (Exception e) {
			e.printStackTrace();}
		}
	}

	public void startApp() {
	}

 	public void setDisplay(Displayable d) {
		md.setCurrent(d);
  	}

	public void resumeApp() {
  	}

	public void pauseApp() {
  	}


	public void destroyApp( boolean unconditional ) {
	}
}

