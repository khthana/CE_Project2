package Spider2;
import java.net.*;
import java.util.*;
public class AppletServer implements Runnable{
  Thread t = new Thread(this);
  ControlServer control;
  ServerSocket server;
  Vector applets;
  public int appletCount;
  public AppletServer(ControlServer control) {
    applets = new Vector();
    this.control = control;
    appletCount = 0;
  }
  public void start(){
    try{
      server = new ServerSocket(888);
    }catch(Exception e)
    {
      e.printStackTrace(System.out);
    }
    t.start();
  }
  public void run(){
    while(true)
    {
      try{
        Socket s = server.accept();
        control.ServerI.status.append(s.getInetAddress().toString()+"\n");
        AppletHandler handler = new AppletHandler(s,control,appletCount);
        applets.addElement(handler);
        appletCount++;
        handler.start();
      }catch(Exception e)
      {
        e.printStackTrace(System.out);
      }
    }
  }
  synchronized void removeApplet(int index){
    applets.removeElementAt(index);
    appletCount--;
  }
}