package routersim;

import java.util.Vector;

public class CommandImpl extends java.rmi.server.UnicastRemoteObject
    implements CommandInt{

  Command c =null;
  static Vector path = new Vector();

  public CommandImpl() throws java.rmi.RemoteException {
    super();
  }

  public void constructor () throws java.rmi.RemoteException {
    c = new Command();
    c.readStartUp();
  }

  public void registerClient(ChangeStatus st) throws java.rmi.RemoteException {

  }

  public void copyFile(String f) throws java.rmi.RemoteException {
    c = new Command();
    c.copyFile(f);
  }

  public Vector getFileBuffer() throws java.rmi.RemoteException {
    c = new Command();
    return c.getFileBuffer();
  }

  public String readConfig() throws java.rmi.RemoteException {
   c = new Command();
   return c.readConfig();
  }

  public void  sendConfig( String s ) throws java.rmi.RemoteException{
    c = new Command();
    c.writeConfig( s );
  }

  public void setShortestPath(Router r,String dest) throws java.rmi.RemoteException {

    c = new Command();
    c.trace_gui(r,dest);
    path = c.getPath();

    for(int i=0;i<path.size();i++){
      String ip_path =String.valueOf(path.elementAt(i));

      for( int j=0;j<NewRouter.vRouter.size();j++) {
        Router r1 =(Router)NewRouter.vRouter.elementAt(i);

        for (int k=0;k<r1.getVInt().size();k++) {
          Interface intf = (Interface)r1.getVInt().elementAt(k);

          if(intf.getIpAddress().equalsIgnoreCase(ip_path)){
            r1.setSeq(i);
            r1.setMaxseq(path.size());
          }//end if
        }//end k
      }//end j
    }// end i
  }

  public String getShortestPath() throws java.rmi.RemoteException{

    c = new Command();
    return c.getIp_shortestPath();
  }

  public boolean getRead() throws java.rmi.RemoteException{
    return Command.read;
  }

  //-- host commands
  public String hostPing( Router r , String des , String sourceIP ) throws java.rmi.RemoteException{

    c = new Command();
    return c.hostPing(r,des,sourceIP);
  }

  public String exportFile( Router r ) throws java.rmi.RemoteException{

    c  = new Command();
    return c.exportConfig( r );
  }

}
