package Spider2;
import java.applet.*;
import java.net.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
public class WebAgent extends Applet implements Runnable{
  DataOutputStream out;
  DataInputStream in;
  Socket socket;
  Thread t;
  String page;
  Label text = new Label("Hi",1);
  public WebAgent() {
  }
  public void init(){
    setBackground(Color.white);
    add(text);
    text.setSize(113,32);
    page = getParameter("page");
    try{
      socket = new Socket("161.246.5.185",888);
      in = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
      out = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));
    }catch(Exception e)
    {
      e.printStackTrace(System.out);
    }
  }
  public void start()
  {
    t = new Thread(this);
    t.start();
  }
  public void run(){
    try{
      while(!Thread.interrupted())
      {
        String line = in.readUTF();
        if(line.compareTo("NPS")==0)
        {
          text.setForeground(Color.blue);
          text.setText("New Post Comming");
        }
      }
    }catch(Exception e)
    {
      e.printStackTrace(System.out);
    }
  }
  public void stop(){
    try{
      out.writeUTF("DSC");
      out.flush();
    }catch(Exception e)
    {
      e.printStackTrace(System.out);
    }
  }
}
