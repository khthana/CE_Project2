package Spider2;
import java.net.*;
import java.io.*;
import java.util.*;
public class AppletHandler implements Runnable{
  Socket socket;
  ControlServer control;
  Thread t;
  DataInputStream in;
  DataOutputStream out;
  String page,username;
  int No;
  public AppletHandler(Socket socket,ControlServer control,int no) {
    t = new Thread(this);
    this.control = control;
    this.socket = socket;
    No = no;
    try{
      in = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
      out = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));
    }catch(Exception e)
    {
      e.printStackTrace(System.out);
    }
  }
  public void start(){
    t.start();
  }
  public void run(){
    try{
      while(!Thread.interrupted())
      {
        String line = in.readUTF();
        if(line.compareTo("DSC")==0)
        {
          control.appletServer.removeApplet(No);
          control.ServerI.status.append(socket.getInetAddress()+" Disconnected.\n");
        }else
        if(line.compareTo("PST")==0)
        {
          Enumeration ae = control.appletServer.applets.elements();
          while(ae.hasMoreElements())
          {
            AppletHandler app = (AppletHandler)ae.nextElement();
            if(!app.equals(this))
            {
              app.out.writeUTF("NPS");
              app.out.flush();
            }
          }
        }
      }
    }catch(Exception e)
    {
      e.printStackTrace(System.out);
    }
  }
} 