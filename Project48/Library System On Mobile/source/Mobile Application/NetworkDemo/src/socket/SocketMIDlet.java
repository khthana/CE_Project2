package socket;
import javax.microedition.midlet.*;
import javax.microedition.io.*;
import javax.microedition.lcdui.*;
import java.io.*;
public class SocketMIDlet extends MIDlet implements CommandListener {
private Form mForm;
private Image mImage;

    private static final String AUTHOR  = "Author ";
    private static final String TITLE = "Title";
    private static final String  SUBJECT = "Subject";
	 private static final String  WORDS = "WORDS";
	  private static final String  ISBN= "ISBN";
	  private static final String  LIBRARY= "LIBRARY  CATALOG";
	  private static final String  SUGGESTION= "SUGGESTION";
	   private static final String  VIEW= "VIEW";
    private static final String[] names = {AUTHOR , TITLE, SUBJECT,WORDS,ISBN};
   private static final String[] names2 = {LIBRARY , SUGGESTION,VIEW };
    private static Display display;
    private Form f,f2,f3;
    private ChoiceGroup cg,cg2;
    private boolean isPaused;
    private Server server;
    private Isbn isbn;
	private Suggestion suggestion ;  
    private Command exitCommand = new Command("Exit", Command.EXIT, 1);
    private Command startCommand = new Command("Start", Command.ITEM, 1);
	private Command startCommand2 = new Command("Start2", Command.ITEM, 1);
   private Command startCommand3 = new Command("Start3", Command.ITEM, 1);
    public SocketMIDlet() {
  mForm = new Form( "Image");
   try {
      mImage = Image.createImage( "/test.png");
   } catch ( java.io.IOException e) {
   }
   mForm.append( mImage);
   mForm.addCommand( exitCommand);
    mForm.addCommand(startCommand3);
   mForm.setCommandListener(this);

        display = Display.getDisplay(this);
        f = new Form("Search");
		f2 = new Form("LIBRARY");
		f3 = new Form("SUGGES");
        cg = new ChoiceGroup("Please select  Search Form",
                                            Choice.EXCLUSIVE, names, null);
	     cg2 = new ChoiceGroup("Please select Form",
                                            Choice.EXCLUSIVE, names2, null);  
        f.append(cg);
      f2.append(cg2);
        f.addCommand(exitCommand);
        f.addCommand(startCommand2);
		f2.addCommand(exitCommand);
        f2.addCommand(startCommand);
	 f3.addCommand(exitCommand); 
	 
		f.setCommandListener(this);
		f2.setCommandListener(this);
		f3.setCommandListener(this);

        display.setCurrent(f2);
    }

    public boolean isPaused() {
        return isPaused;
    }

    public void startApp() {
        isPaused = false;
	display = Display.getDisplay( this);
    display.setCurrent( mForm);
    }


    public void pauseApp() {
        isPaused = true;
    }

    public void destroyApp(boolean unconditional) {
        if (server != null) {
            server.stop();
        }
        if (isbn != null) {
            isbn.stop();
        }
    }

    public void commandAction(Command c, Displayable s) {
       if(c==startCommand3 ) {
	   
        display.setCurrent(f2);
	   }

       if(c==startCommand2  ) {
				    String name = cg.getString(cg.getSelectedIndex());
					
						if(name.equals(WORDS)){					
					Word  words = new Word(this);
                    words.start();
					}			
				
					if(name.equals(ISBN)){
					
					Isbn isbn = new Isbn(this);
                    isbn.start();
					}
				
				if(name.equals(AUTHOR)){
				Auther  auther = new Auther(this);
				auther.start();
				}
				if(name.equals(TITLE)){
				Title title = new Title(this);
				title.start();
				}
				
				}		
		if (c == exitCommand) {
            destroyApp(true);
            notifyDestroyed();
        } else if (c == startCommand) {
           String name = cg2.getString(cg2.getSelectedIndex());
           		if(name.equals(LIBRARY)){
				   display.setCurrent(f);
				
				}else if(name.equals(SUGGESTION)){
				    suggestion = new Suggestion(this);
                    suggestion.start();
		//	display.setCurrent(f3);
				}
				else if(name.equals(VIEW)){				
				View  view = new View(this);
				view.start();
				}
	/*		if (name.equals(SERVER)) {
                server = new Server(this);
                server.start();
            } else  {
                client = new Client(this);
                client.start();
            }  */
     
	/*	    client = new Client(this);
                client.start();
		*/

		}
    }

}

