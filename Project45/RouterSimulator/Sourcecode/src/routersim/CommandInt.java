package routersim;

import java.util.Vector;

public interface CommandInt extends java.rmi.Remote {

    public void constructor () throws java.rmi.RemoteException;
    public Vector getFileBuffer() throws java.rmi.RemoteException;
    public void copyFile(String f) throws java.rmi.RemoteException;
    public void setShortestPath(Router r,String dest) throws java.rmi.RemoteException;
    public String getShortestPath() throws java.rmi.RemoteException;
    public boolean getRead() throws java.rmi.RemoteException;
    public String readConfig() throws java.rmi.RemoteException;
    public void sendConfig( String s ) throws java.rmi.RemoteException;

    //-- Host Command
    public String hostPing( Router r , String des , String sourceIP ) throws java.rmi.RemoteException;

    //-- export file
    public String exportFile( Router r ) throws java.rmi.RemoteException;

}