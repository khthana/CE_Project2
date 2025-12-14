package routersim;

import javax.swing.UIManager;
import java.awt.*;
import java.util.Vector;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class RouterConsoleImpl  extends java.rmi.server.UnicastRemoteObject
          implements RouterConsoleInt {

private boolean packFrame = false;
private Console con = null;

//Construct the application
public RouterConsoleImpl() throws java.rmi.RemoteException{
    super();
}
 public void NewConsole(int index ) throws java.rmi.RemoteException
{
     con  = new Console(index);
}
public int getMode(int index ) throws java.rmi.RemoteException
{
     return con.getMode(index);
}
public String getName(int index ) throws java.rmi.RemoteException{
     return con.getName(index);
}
public void setMode(int index ,int mode) throws java.rmi.RemoteException
{
     con.setMode(index,mode);
}
public void runCMD(int index ,String cmd) throws java.rmi.RemoteException
{
     con.runCMD(index,cmd);
}
public void addhistory(int index ,String cmd) throws java.rmi.RemoteException
{
     con.addhistory(index,cmd);
}
public Vector gethistory(int index ) throws java.rmi.RemoteException
{
     return con.gethistory(index);
}
public boolean getTedit(int index ) throws java.rmi.RemoteException
{
     return con.getTedit(index);
}
public Router getrouter() throws java.rmi.RemoteException
{
     return con.getRouter();
}
public void setrouter(Router r) throws java.rmi.RemoteException
{
     con.setRouter(r);
}
public int getMaxhistory(int index ) throws java.rmi.RemoteException
{
     return con.getMaxhistory(index);
}
public void removehistory(int index ,int element) throws java.rmi.RemoteException
{
     con.removehistory(index,element);
}
public String getPwd(int index ) throws java.rmi.RemoteException
{
     return  con.getPwd(index);
}
public String getConsolePwd(int index ) throws java.rmi.RemoteException
{
      return  con.getConsolePwd(index);
}
public String getVtyPwd(int index ) throws java.rmi.RemoteException
{
      return  con.getVtyPwd(index);
}
public Vector getrouters(int index ) throws java.rmi.RemoteException
{
      return con.getrouters(index);
}
public void addVrouters(int index ) throws java.rmi.RemoteException
{
      con.addVrouters(index);
}
public void setOldMode(int index ) throws java.rmi.RemoteException
{
      con.setOldMode(index);
}
public void setModetelnet(int index ,int mode) throws java.rmi.RemoteException
{
      con.setModetelnet(index,mode);
}
public void tabCmd(int index ,String cmd) throws java.rmi.RemoteException
{
      con.tabCmd(index,cmd);
}
public boolean getEnConsole(int index ) throws java.rmi.RemoteException
{
 return con.getEnConsole(index);
}
public String getOutput(int index ) throws java.rmi.RemoteException
{
  return con.getOutput(index);
}
public void setOutput(int index ) throws java.rmi.RemoteException
{
  SwitchCMD.output ="";
  //Command.display="";
}
public Router gettelnetrouter() throws java.rmi.RemoteException
{
  return con.getTelnetRouter();
}
public String getdisplay(int index ) throws java.rmi.RemoteException
{
  return Command.display;
}
public void setdisplay(int index ) throws java.rmi.RemoteException
{
  Command.display="";
}
}
