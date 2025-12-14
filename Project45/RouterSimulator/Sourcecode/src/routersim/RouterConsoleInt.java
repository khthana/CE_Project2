package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */
import java.util.Vector;

public interface RouterConsoleInt extends java.rmi.Remote {
    public void NewConsole(int index ) throws java.rmi.RemoteException;
    public void runCMD(int index ,String cmd) throws java.rmi.RemoteException;
    public void tabCmd(int index ,String cmd) throws java.rmi.RemoteException;
    public void setMode(int index ,int mode) throws java.rmi.RemoteException;
    public void setModetelnet(int index ,int mode) throws java.rmi.RemoteException;
    public void setOldMode(int index ) throws java.rmi.RemoteException;
    public int getMode(int index ) throws java.rmi.RemoteException;
    public String getName(int index ) throws java.rmi.RemoteException;
    public void addhistory(int index ,String cmd) throws java.rmi.RemoteException;
    public void removehistory(int index ,int element) throws java.rmi.RemoteException;
    public Vector gethistory(int index ) throws java.rmi.RemoteException;
    public Vector getrouters(int index ) throws java.rmi.RemoteException;
    public boolean getTedit(int index ) throws java.rmi.RemoteException;
    public int getMaxhistory(int index ) throws java.rmi.RemoteException;
    public String getPwd(int index ) throws java.rmi.RemoteException;
    public String getConsolePwd(int index ) throws java.rmi.RemoteException;
    public String getOutput(int index ) throws java.rmi.RemoteException;
    public Router getrouter() throws java.rmi.RemoteException;
    public Router gettelnetrouter() throws java.rmi.RemoteException;
    public void setrouter(Router r) throws java.rmi.RemoteException;
    public boolean getEnConsole(int index ) throws java.rmi.RemoteException;
    public String getVtyPwd(int index ) throws java.rmi.RemoteException;
    public void addVrouters(int index ) throws java.rmi.RemoteException;
    public void setOutput(int index ) throws java.rmi.RemoteException;
    public String getdisplay(int index ) throws java.rmi.RemoteException;
    public void setdisplay(int index ) throws java.rmi.RemoteException;

}