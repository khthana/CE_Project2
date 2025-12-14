
import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.media.*;
import javax.microedition.media.control.*;
import java.io.*;

/** Acquires the video content and renders it */
public class VideoCanvas extends Canvas implements CommandListener, PlayerListener, Runnable {

	private VideoPlayer parent;
	private Display display;
		
	private Player player;
	private VideoControl videoControl;
	
	private String url;
	private Thread initializer;
	
//	private Command close;
	private Command rePlay;
        private Command backEvent;
        private Command backRecently;

	
	public VideoCanvas(VideoPlayer parent){
		super();
		this.parent = parent;
		display = Display.getDisplay(parent);
//		close = new Command("close", Command.SCREEN, 1);
                if (parent.checkOpt=="recently"){
                    backRecently=new Command("back", Command.SCREEN, 1);
                    addCommand(backRecently);
                }
                else
                {
                    backEvent=new Command("back", Command.SCREEN, 1);
                    addCommand(backEvent);
                }
                
                
                
//		addCommand(close);
		setCommandListener(this);			
	}
	
	
	public void initializeVideo(String url){	
		this.url = url;
		initializer = new Thread(this);	
		initializer.start();
	}
	
	
	public void run(){
		
		try {							
			player = Manager.createPlayer(url);
			parent.updateGauge();						
			player.addPlayerListener(this); 			
			player.realize();
			parent.updateGauge();								
			player.prefetch();
			parent.updateGauge();						

        } catch (IOException ioe) {
			Alert alert = new Alert("IOException thrown", ioe.getMessage(), null, AlertType.ERROR);
			display.setCurrent(alert);
		
        } catch (MediaException me) {
			Alert alert = new Alert("MediaException thrown", me.getMessage(), null, AlertType.ERROR);
			display.setCurrent(alert);
		}
		
		playVideo();
	}
					
	
	public void playVideo(){
		try {

            // Get the video control and set it to the current display.
            videoControl = (VideoControl)player.getControl("VideoControl");
            if (videoControl != null) {				
                        videoControl.initDisplayMode(videoControl.USE_DIRECT_VIDEO, this);										                
            }
			
			parent.updateGauge();
			
			int cHeight = this.getHeight();
			int cWidth = this.getWidth();			
			videoControl.setDisplaySize(cWidth, cHeight);     	
																	
			display.setCurrent(this);
			videoControl.setVisible(true);
                        player.start();

        
        } catch (MediaException me) {
			Alert alert = new Alert("MediaException thrown", me.getMessage(), null, AlertType.ERROR);
			display.setCurrent(alert);
		}
	} 
		
		
	/** Paints background color */
	public void paint(Graphics g){
		g.setColor(128, 128, 128);
		g.fillRect(0, 0, getWidth(), getHeight());		
	}
	
	
	public void playerUpdate(Player p, String event, Object eventData) {
		//add "Replay" option when video is finished
		if (event == PlayerListener.END_OF_MEDIA)
		{
			if (rePlay == null)
			{
				rePlay = new Command("re-play", Command.SCREEN, 1);	
				addCommand(rePlay);
			}			
		}				
		
	}
	
	
	public void commandAction(Command c, Displayable s) {		
		if(c == rePlay){		
			try{
				player.start();	
			} catch (MediaException me) {
				Alert alert = new Alert("MediaException thrown", me.getMessage(), null, AlertType.ERROR);
				display.setCurrent(alert);
			}			
		}
				
/*		else if(c == close){												
			player.close();
			parent.form.delete(1);
			url=null;
			parent=null;
                        setCommandListener(this);
                        display.setCurrent(parent.optList);
		}       */
                else if(c == backEvent){
                    player.close();                    
                    url=null;
                    parent.imageForm.deleteAll();
                    parent.form.deleteAll();
                    System.out.println("back to event");
                    setCommandListener(this);
                    display.setCurrent(parent.eventList);
                    
                }
                else if(c == backRecently){
                    player.close();                    
                    url=null;
                    parent.imageForm.deleteAll();
                    parent.form.deleteAll();
                    System.out.println("back to event");
                    setCommandListener(this);
                    display.setCurrent(parent.optList);
                    
                }
			
			
	}
 
		
}
