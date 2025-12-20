import javax.microedition.lcdui.*;
import javax.microedition.lcdui.game.GameCanvas;
import javax.microedition.midlet.*;
import java.util.*;
import javax.microedition.io.*;
import java.io.DataInputStream;
import java.io.DataOutputStream;

public class MyCanvas extends Canvas implements CommandListener, Runnable{

 int count=0;
 int height;
 int width;
 Image myImage=null;
 Graphics myGraphics=null;
 static EleChat myMIDlet=null;
 TextBox t =null;
 int vpos=0;
 int fontheight=0;
 int drawableheight=0;
 Alert alert= null;
 Command exitCommand=null,prelimExitCommand=null,
  commandOK=null,commandCancel=null;
 boolean stop_in_progress=false;
 Font font=null;
 SocketConnection sc = null;
 char[] buf=null;
 DataInputStream is;
 DataOutputStream os;
 static MyCanvas canv=null;
 boolean done=false;
 Timer timeouttimer=new Timer();
 TimerTask timeouttimertask=null;
 int timeout=330000;

 MyCanvas(EleChat m) {
  canv=this;
  buf = new char[256];
  myMIDlet=m;
  height=getHeight();
  width=getWidth();
  myImage=Image.createImage(width,height);
  myGraphics=myImage.getGraphics();
  exitCommand=new Command("Exit",Command.EXIT,0);
  prelimExitCommand=new Command("Exit",Command.EXIT,1);
  commandOK=new Command("OK",Command.OK,0);
  commandCancel=new Command ("Cancel",Command.CANCEL,0);
  addCommand(prelimExitCommand);
  t = new TextEntryBox("","",55,0,this);
    t.addCommand( commandOK);
    t.addCommand( commandCancel);
    t.setCommandListener((CommandListener)t);
  font=Font.getDefaultFont();
  fontheight=font.getHeight();
  drawableheight=height-fontheight;
  setCommandListener(this);
 }

 public void paint (Graphics g) {
  g.drawImage(myImage,0,0,0);

 }





 public void wenda(String s) {
  if (vpos>drawableheight) {
     myGraphics.copyArea (0,fontheight,width,drawableheight,
         0,0,0);
     myGraphics.setColor(255,255,255);
     myGraphics.fillRect(0,vpos,width,fontheight);
     myGraphics.setColor(0,0,0);
     vpos-=fontheight;
    }
  myGraphics.setColor(255,255,255);
  myGraphics.fillRect(0,vpos,width,fontheight);
  myGraphics.setColor(0,0,0);
  myGraphics.drawString (s,0,vpos,0);
  vpos+=fontheight;
  repaint();
 }

 public void keyPressed(int keycode) {
	if ( (keycode < 20) || (keycode > 128) ) 
		return;
       myMIDlet.setDisplay(t);
    }
 


 public void commandAction (Command c, Displayable d) {
       if (c==prelimExitCommand) {
         stop(EleError.NOERROR);
		System.out.println("prelimexit");
       } else if (c==exitCommand) {
	myMIDlet.notifyDestroyed();
       }
     }
    
 


 public void run() {
 int strlen=0;
 String strout=null;
 try {
   sc=(SocketConnection)Connector.open("socket://zoosmart.us:4444",Connector.READ_WRITE);
   is = sc.openDataInputStream();
   os = sc.openDataOutputStream();
   os.write(("~~"+myMIDlet.nick+"\n").getBytes());
   os.flush();}
     catch (Exception e) 
          {System.out.println("exception while setting nick"); done=true; 
           stop(EleError.ERROR);}
  resettimer(330000);
 while (!done) {
   try {
   buf[strlen]=(char)is.readByte(); 
   /*if (buf[strlen] == -1){
           done = true; break;}*/
   if (buf[strlen] == '\n') {
	resettimer(330000);
     	strout=String.valueOf(buf,0,strlen);
        strlen=0;
	if (strout.equals("p!ng")) {
         os.write("p0ng\n".getBytes());
	os.flush();
         } else {
         wenda (strout);
        }
       } else if (font.charsWidth(buf,0,strlen) > width-5) {
     	strout=String.valueOf(buf,0,strlen);
        wenda (strout);
	buf[0]=buf[strlen];
        strlen=1;

      } else {
       strlen++;
     }
         }   catch (Exception e) {
        e.printStackTrace();
        done=true;
	System.out.println("exception while doing a read in main loop");
	stop(EleError.ERROR);
    }
  }
   try {
   is.close();
   os.close();
   sc.close(); } catch (Exception e) {}
 }

 public void resettimer(int thetimeout) {
    if (timeouttimertask!=null) try {
	timeouttimertask.cancel();
	timeouttimer.cancel();
      } catch (Exception e) {}
    timeouttimer=new Timer();
    timeouttimertask=new TimerTask() {
    public void run() {
       System.out.println ("blip");
       stop(EleError.TIMEOUTERROR);
       } };
    System.out.println("scheduling timeouttimer...");
    timeouttimer.schedule(timeouttimertask,thetimeout) ;

  } 

 public void stop(EleError err) {
   done=true;
   if (stop_in_progress) return;
   stop_in_progress=true;
   timeouttimertask.cancel();
   timeouttimer.cancel();


Thread stopthread=new Thread() {
  public void run () {
   try {
   os.write("*#*\n".getBytes());
   os.flush();
   is.close();
      } catch (Exception ioe) {
		System.out.println("read from closed stream resulted in exception");
            } 
   }

   };
   stopthread.start();
  
   alert = new Alert("connection status");
   alert.setCommandListener(this);
   alert.addCommand(exitCommand);
   if (err==EleError.ERROR) {
   alert.setString("connection error, the application will now quit");
    } else if (err==EleError.TIMEOUTERROR) {
   alert.setString ("timeout, no response from server");
    } else {
   alert.setString("the application will now quit normally");
    }
   alert.setTimeout(Alert.FOREVER);
   myMIDlet.setDisplay(alert);
 }


}


class TextEntryBox extends TextBox implements CommandListener{

MyCanvas canv=null;
Command  commandOK=null;

 public TextEntryBox(String a, String b, int c, int d, MyCanvas cv) {
   super (a,b,c,d);
   canv=cv;
  }

 public void commandAction (Command c, Displayable d) {
       if (c==canv.commandOK) {
     try {
	canv.resettimer(30000);
        canv.os.write((getString()+"\n").getBytes());
        canv.os.flush();
        

          }
        catch (Exception e) {
              e.printStackTrace();
		canv.stop(EleError.ERROR);
             }
    	 setString("");
    	 canv.myMIDlet.setDisplay(canv);
        } else if (c==canv.commandCancel) {
		System.out.println("commandCancel");
   	 	canv.myMIDlet.setDisplay(canv);

	}

 }

}
