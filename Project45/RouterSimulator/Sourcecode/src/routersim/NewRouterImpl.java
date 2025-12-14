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
import java.util.Arrays;
import java.lang.String;
import java.rmi.UnmarshalException;

public class NewRouterImpl extends java.rmi.server.UnicastRemoteObject
             implements NewRouterInt{
  static Vector vName = new Vector();
  static Vector vModel = new Vector();
  static Vector vIntname = new Vector();
  static Vector vInt = new Vector();
  static Vector name = new Vector();
  static Vector interfaces = new Vector();
  static int Maxr =0;
  static int  count =0,count1=0;;
  private RouterConsole rcon = null;
  private Router r = null;
  private int cost=1;


  public NewRouterImpl() throws java.rmi.RemoteException
  {
    super();
  }
  public void newConsole(Router r) throws java.rmi.RemoteException
  {
    //rcon = new RouterConsole(r);
  }
 public RouterConsole getnewConsole() throws java.rmi.RemoteException{
    return rcon;
 }
 public void newRouter(String name,int model) throws java.rmi.RemoteException{
     r = new Router(name);
     r.setModel(model);
 }
 public Router getnewRouter() throws java.rmi.RemoteException{
    return r;
 }
 public void setMaxInt(Router r,String intf,int num) throws java.rmi.RemoteException{
   if(intf.equalsIgnoreCase("e")){
     r.setMaxEth(num);
   }
   if(intf.equalsIgnoreCase("s")){
     r.setMaxSerial(num);
   }
   if(intf.equalsIgnoreCase("t")){
     r.setMaxToken(num);
   }
 }
  public void constructor (int series) throws java.rmi.RemoteException
  {
   new NewRouter(series);
  }

  public void setvRouter() throws java.rmi.RemoteException
  {
    //  if(count != 0){
    if(NewRouter.vRouter.size() != 0)
    {
      if (vName.size() != 0)
      {
        vName.removeAllElements();
        for(int a=0; a < NewRouter.vRouter.size(); a++)
        {
          Router r = (Router)NewRouter.vRouter.elementAt(a);
          vName.addElement(new String(r.getName()));
        }
      }//end if
      else {
        for(int a=0; a < NewRouter.vRouter.size(); a++)
        {
          Router r = (Router)NewRouter.vRouter.elementAt(a);
          vName.addElement(new String(r.getName()));
        }
      }//end else
    }//end if
  }

  public void setvModel() throws java.rmi.RemoteException
  {
    //if(count1 != 0){
    if(NewRouter.vRouter.size() != 0)
    {
      if (vModel.size() != 0)
      {

        vModel.removeAllElements();

        for(int a=0; a < NewRouter.vRouter.size(); a++)
        {
          Router r = (Router)NewRouter.vRouter.elementAt(a);
          vModel.addElement(new Integer(r.getModel()));
        }
      }//end if
      else {
        for(int a=0; a < NewRouter.vRouter.size(); a++)
        {
          Router r = (Router)NewRouter.vRouter.elementAt(a);
          vModel.addElement(new Integer(r.getModel()));
        }
      }//end else
    }//end if
  }
  public void NewFrameR(String name,int model) throws java.rmi.RemoteException
  {
    NewRouter nr = new NewRouter();
    nr.NewFramer(name,model);
  }
  public Vector getvName() throws java.rmi.RemoteException
  {
    return vName;
  }
  public Vector getvModel() throws java.rmi.RemoteException
  {
    return vModel;
  }
  public Vector getvStatus() throws java.rmi.RemoteException
  {
    return NewRouter.vStatus;
  }
  public void DelRouter(int index)
  {
    NewRouter nr = new NewRouter();
    nr.DeleteRouter(index);
  }
  public void showFrame(int index)  throws java.rmi.RemoteException
  {
  }
  public void showStatus(int index)  throws java.rmi.RemoteException
  {
    StatusPanel st = (StatusPanel)NewRouter.vStatus.elementAt(index);
    st.revalidate();
  }
  public Vector getvRouter() throws java.rmi.RemoteException
  {
    return NewRouter.vRouter;
  }
  public void setvFrame(int size) throws java.rmi.RemoteException
  {
  }
   public  void setCost(int indexr1,int indexr2,int cost) throws java.rmi.RemoteException{
     Router r_source =(Router)NewRouter.vRouter.elementAt(indexr1);
     Router r_dest =(Router)NewRouter.vRouter.elementAt(indexr2);
     setCostOfWire(r_source.getName(),r_dest.getName(),cost);
   }
  public void setCostOfWire(String R_Source,String R_Dest,int cost) throws java.rmi.RemoteException
  {
   boolean found=false;
   int i=0;
  // Router r=null;
   while ((i<NewRouter.vRouter.size())&&(!found))
   {
    Router r = (Router)NewRouter.vRouter.elementAt(i);
     if (R_Source.equalsIgnoreCase(r.getName())){
       if(r.getVHello().size()!=0)
       {
       found=true;
       Ospf o = (Ospf)r.getOSPF();
       o.setWeight(R_Source,R_Dest,cost);
       }//end if
     }
     i++;
    }// end while
  }
  public Vector getName() throws java.rmi.RemoteException
  {

    return name;
  }
  public Vector getInt() throws java.rmi.RemoteException
  {

    return interfaces;
  }
  public void setMaxr(Router r){
    Maxr=r.getMaxr();
  }
  public int getMaxr(){
    return Maxr;
  }

  public void setIntName() throws java.rmi.RemoteException
  {
    for(int i=0;i<vInt.size();i++)
    {
      Interface intf = (Interface)vInt.elementAt(i);
      vIntname.addElement(new String(intf.getNameInt()));
    }
  }
  public Vector getIntName() throws java.rmi.RemoteException
  {
    return vIntname;
  }
  public void deleteInt( int i , String s ) throws java.rmi.RemoteException {

    Router r = new Router();
    r.deleteInt( i , s );
  }

  public void wireDelete( int index1 , int index2 , String int1 , String int2 , String t) throws java.rmi.RemoteException {

    //-- add int back
    Router r = new Router();
    r.addIntBack( index1 , index2 , int1 , int2 , t );
  }
  public void setsingleMode(boolean yes) throws java.rmi.RemoteException
  {
    NewRouter.setSingleMode(yes);
  }
  public void singlemode() throws java.rmi.RemoteException
  {
    NewRouter.SingleMode();
  }
  public void normalmode() throws java.rmi.RemoteException{
    NewRouter.NormalMode();
  }
  public void nextstep() throws java.rmi.RemoteException{
    NewRouter.Next_Step();
  }

  public void deleteAllVector() throws java.rmi.RemoteException{

    NewRouter n = new NewRouter();
    for(int i=0;i<NewRouter.vRouter.size();i++)
    {
      Router r =(Router)NewRouter.vRouter.elementAt(i);
      if(r.getFlag()=='o') //|| (r.getFlag()=='r'))
      {
        Ospf ospff = (Ospf)r.getOSPF();
        //ospff.suspend();
        ospff.stop();
      }
      if(r.getFlag()=='r') //|| (r.getFlag()=='r'))
      {
        Rip ripf = (Rip)r.getRIP();
        //ripf.suspend();
        ripf.stop();
      }
    }//end for
    n.vRouter.removeAllElements();
    n.vStatus.removeAllElements();
    StatusPanel.jPanel1.removeAll();
    StatusPanel.jPanel1.removeAll();

  }

  public Router getRouter() throws java.rmi.RemoteException
  {
    return NewRouter.getR();
  }
  public String getrname() throws java.rmi.RemoteException
  {
    return NewRouter.getRname();
  }
  public int gettype() throws java.rmi.RemoteException
  {
    return NewRouter.getType();
  }
  public void checkVhello(Router r,Router neighbor) throws java.rmi.RemoteException
  {
    for (int i=0;i<r.getHello().size();i++)
    {
      Hello h =(Hello)r.getHello().elementAt(i);

      if (h.getStartRouter().getName().equalsIgnoreCase(r.getName()) &(h.getDesRouter().getName().equalsIgnoreCase(neighbor.getName())))
      {
        setCost(h.getWeight());
      }
    }
    for (int i=0;i<neighbor.getHello().size();i++)
    {
      Hello h =(Hello)neighbor.getHello().elementAt(i);
      if (h.getStartRouter().getName().equalsIgnoreCase(neighbor.getName()) &(h.getDesRouter().getName().equalsIgnoreCase(r.getName())))
      {
        setCost(h.getWeight());
      }
    }
  }
  public void setCost(int c)
  {
    cost = c;
  }
  public int getCost()throws java.rmi.RemoteException
  {
    return cost;
  }
}