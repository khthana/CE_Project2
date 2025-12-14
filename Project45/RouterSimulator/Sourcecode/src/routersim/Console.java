
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

public class Console {
  private Router r1 = new Router();
  private Vector routers = new Vector();
  private SwitchCMD sw = new SwitchCMD();
  private Router telnetRouter = new Router();
  private static boolean terminalEdit=false;
  private String output="";
  static int focus = 0;

  public Console(int index) {
    try {
      // index1=index;
      jbInit(index);
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  void jbInit(int index) throws Exception {
    Router router =(Router)NewRouter.vRouter.elementAt(index);
    r1 = router;
    router.getHistory().addElement("");
    CheckRouter(router);
    routers.addElement(router);
    System.out.print("History size---:00"+r1.getHistory().size());
  }
  public int getMode(int index)
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return r1.getMode();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return router.getMode();
    }
  }
  public String getName(int index)
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return r1.getName();
    }
    else
    {

      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return router.getName();

    }
  }
  public void setMode(int index,int mode)
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      r1.setMode(mode);
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      router.setMode(mode);
    }
  }
  public void runCMD(int index,String cmd)
  {
    output="";
    SwitchCMD.output="";
    Interface.output="";
    Command.output="";

    System.out.print("Name========= : "+r1.getName()+"\n");
    Router router =(Router)NewRouter.vRouter.elementAt(index);
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      sw.runCommand(r1,cmd,this);
    }
    else
    {
      sw.runCommand(router,cmd,this);
    }
    setOutput(sw.getOutput());
    System.out.print("getmode+++ : "+router.getMode()+"\n");
    System.out.print("ranme+++ : "+router.getName()+"\n");

  }
  public void addhistory(int index,String cmd) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      r1.getHistory().add(r1.getHistory().size()-1,cmd);
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      router.getHistory().add(router.getHistory().size()-1,cmd);
    }
  }
  public Vector gethistory(int index) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return r1.getHistory();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return router.getHistory();
    }
  }
  public boolean getTedit(int index) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return r1.getTerminalEdit();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return router.getTerminalEdit();
    }
  }
  public Router getRouter() throws java.rmi.RemoteException
  {
    return r1;
  }
  public int getMaxhistory(int index) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return r1.getMaxHistory();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return router.getMaxHistory();
    }
  }
  public void removehistory(int index,int element) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      r1.getHistory().removeElementAt(element);
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      router.getHistory().removeElementAt(element);
    }

  }
  public String getPwd(int index) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return  r1.getPasswd();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return  router.getPasswd();
    }
  }
  public String getConsolePwd(int index) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return  r1.getConsolePasswd();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return  router.getConsolePasswd();
    }
  }
  public String getVtyPwd(int index) throws java.rmi.RemoteException
  {
    Router router =(Router)NewRouter.vRouter.elementAt(index);
    return  telnetRouter.getVtyPasswd();
  }
  public Vector getrouters(int index) throws java.rmi.RemoteException
  {
    return  routers;
  }
  public void addVrouters(int index) throws java.rmi.RemoteException
  {
    this.getRouters().addElement(telnetRouter);
  }
  public void setOldMode(int index) throws java.rmi.RemoteException
  {
    telnetRouter.setOldMode(telnetRouter.getMode());
  }
  public void setModetelnet(int index,int mode) throws java.rmi.RemoteException
  {
    Router router =(Router)NewRouter.vRouter.elementAt(index);
    telnetRouter.setMode(mode);
    this.setRouter(telnetRouter);
    router.setTelnet(true);
    //this.getRouter().setOldname(router.getName());
  }
  public void tabCmd(int index,String cmd) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      sw.tabCmd(cmd,r1.getMode());
      setOutput(sw.getOutput());
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      sw.tabCmd(cmd,router.getMode());
      setOutput(sw.getOutput());
    }

  }
  public boolean getEnConsole(int index) throws java.rmi.RemoteException
  {
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      return r1.getEnableConsole();
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      return router.getEnableConsole();
    }
  }
  public Router getTelnetRouter(){
    return telnetRouter;
  }
  public void setTelnetRouter(Router router){
    // Router router =(Router)NewRouter.vRouter.elementAt(index);
    telnetRouter = router;
  }
  public void setRouter(Router router){
    this.r1= router;
  }
  public Router getRouterofRconsole(){
    return r1;
  }
  static void terminaledit(boolean b){
    terminalEdit = b;
  }
  public void addRouters(int index){
    Router r =(Router)NewRouter.vRouter.elementAt(index);
    if(r.getTelnet())
    {
      routers.addElement(r1);
    }
    else
    {
      Router router =(Router)NewRouter.vRouter.elementAt(index);
      routers.addElement(router);
    }
  }
  public Router getRouter(int i){
    return (Router)routers.elementAt(i);
  }
  public Vector getRouters(){
    return routers;
  }
  static int getfocus(){
    return focus;
  }
  public String getOutput(int index )
  {
    return output;
  }
  public void setOutput(String s)
  {
    this.output = s;
  }

  public void CheckRouter(Router r)
  {
    for(int i=0;i<NewRouter.vRouter.size();i++){
      Router r1 =(Router)NewRouter.vRouter.elementAt(i);
      if(r1.getName().equalsIgnoreCase(r.getName()))
      {
        r1=r;
        setRouter(r1);
        System.out.print("Name========= : "+r1.getName()+"\n");
        System.out.print("Mode========= : "+r1.getMode()+"\n");
        System.out.print("Flag========= : "+r1.getFlag()+"\n");
        System.out.print("Vintsize===== : "+r1.getVInt().size()+"\n");
        System.out.print("Clock========= : "+r1.getClock()+"\n");

      }
    }//end for
  }
}