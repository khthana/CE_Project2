package routersim;

public class RoutingTable implements java.io.Serializable{// extends Thread{
  private String ipDestination;
  private String subnet;
  private Interface intf;
  private String gateway;
  static String output="";
  private int matric;//hop count
  private char routeType;
  //----------------------Set Interface------------------//
  public void setInterface(Interface f){
    intf = f;
  }
  public Interface getInterface(){
    return intf;
  }
  static String getOutput()
  {
    return output;
  }
  //---------------------Set Destination---------------//
  public void setIpDestination(String s){
    if (Interface.isIp(s)){
      ipDestination = s;
    }
    else {
//      System.out.println("% invalid input detected at '^' marker. \n");
    }
  }
  public String getIpDestination(){
    return ipDestination;
  }
  //-------------------Set Subnet-------------------//
  public void setSubnet(String s){
    if (Interface.isIp(s)){
      subnet = s;
    }
    else {
//      System.out.println("% invalid input detected at '^' marker. \n");
    }
  }
  public String getSubnet(){
    return subnet;
  }
  //------------------Set Gateway-------------------//
  public void setGateway(String s){
    if (Interface.isIp(s)){
      gateway = s;
    }
    else {
//      System.out.println("% invalid input detected at '^' marker. \n");
    }
  }
  public String getGateway(){
    return gateway;
  }
  //-------------------Set Matrice--------------------//
  public void setMatrice(int i){
    matric = i;
  }
  public int getMatrice(){
    return matric;
  }
/*
  //------------------Set Flag-----------------------//
  public void setFlag(String s){
    flag = s;
  }
  public String getFlag(){
    return flag;
  }
*/
  //----------------Set Route Type-----------------//
  public void setRouteType(char c){
    routeType = c;
  }
  public char getRouteType(){
    return routeType;
  }
  //-------------Static Route---------------//
  public void ipRoute(Router r,String des,String subnet,String gw){
    boolean found = false;
    int index=0;
    Interface intf=null;
    for(int i=0;i < r.getVrt().size(); i++){
      RoutingTable rt= (RoutingTable)r.getVrt().elementAt(i);
      if (rt.getIpDestination().equalsIgnoreCase(des)){
        found = true;
        index = i;
      }
    }
    boolean con = false;
    //find Interface of ip destination
    for (int a=0; a < NewRouter.vRouter.size(); a++){
      Router r1 = (Router)NewRouter.vRouter.elementAt(a);
      for (int b=0; b < r1.getVInt().size(); b++){
        Interface i1 = (Interface)r1.getVInt().elementAt(b);
//        System.out.println(i1.getIpAddress()+"&"+gw);
        if (i1.getIpAddress().equalsIgnoreCase(gw)){
          intf = i1;
          con = true;
        }
      }//end for
    }//end for
    if (con){
      r.setFlag('s');
      this.setIpDestination(des);
      this.setGateway(gw);
      this.setSubnet(subnet);
      this.setRouteType('s');
      this.setInterface(intf);
      this.setMatrice(1);
      if (found){
        r.getVrt().removeElementAt(index);
      }//end if
      r.getVrt().addElement(this);
    }//end if
    else {
//      System.out.println("Wrong Gateway");
    }//end else
  }
  public void setIpRoute(Router r,String des,String subnet,String gw,String intip,String nameint,String netAdd,String status,String intsubnet,String inttype){
    r.setFlag('s');
    Interface intface = new Interface();
    intface.setIpAddress(intip);
    intface.setNameInt(nameint);
    intface.setNetAddress(netAdd);
    intface.setSubnet(intsubnet);
    intface.setStatus(status);
    intface.setType(inttype);

    this.setIpDestination(des);
    this.setGateway(gw);
    this.setSubnet(subnet);
    this.setRouteType('s');
    this.setInterface(intface);
    this.setMatrice(1);
    r.getVrt().addElement(this);
  }
  //--------------Routing Table with direct connected----------//
  public void ipRoute(Router r,String ip,String subnet,int hop){
//    RoutingTable rt = new RoutingTable();
    int i=0;
    Interface intf = (Interface)r.getVInt().elementAt(i);
    while (!intf.getIpAddress().equalsIgnoreCase(ip)){
      i++;
      if(i < r.getVInt().size()){
        intf = (Interface)r.getVInt().elementAt(i);
      }
    }//end while
    intf = (Interface)r.getVInt().elementAt(i);
    this.setIpDestination(intf.getNetAddress());
    this.setGateway("0.0.0.0");
    this.setMatrice(hop);
    this.setSubnet(subnet);
    this.setInterface(intf);
    r.getVrt().addElement(this);
  }
  //--------Add Routing Table From RIP ---------//
  public void addRouting(Router r,Interface iadj){
    RoutingTable rt = new RoutingTable();
    rt.setGateway(iadj.getIpAddress());
    rt.setInterface(iadj);
    rt.setIpDestination(this.getIpDestination());
    if (this.getMatrice() < 15){
      rt.setMatrice(this.getMatrice()+1);
    }
    else{
      rt.setMatrice(16);
    }
    rt.setRouteType('r');
    rt.setSubnet(this.getSubnet());
    r.getVrt().addElement(rt);
  }
  //constructor
  public RoutingTable() {
    ipDestination = "";
    gateway = "";
    subnet = "";
    routeType = 'c';
    matric = 16;
  }
  //-------Delete Routing Table--------------------//
  public void noIpRoute(Router r,String des,String subnet,String gw){
    int i = 0;
    RoutingTable rt = null;
    if (r.getVrt().size() > 0){
      rt = (RoutingTable)r.getVrt().elementAt(i);
    }//end if
    boolean found = rt.getIpDestination().equalsIgnoreCase(des) && rt.getSubnet().equalsIgnoreCase(subnet) && rt.getGateway().equalsIgnoreCase(gw);
    while((!found)&&(i < r.getVrt().size())){
      rt = (RoutingTable)r.getVrt().elementAt(i);
      found = rt.getIpDestination().equalsIgnoreCase(des) && rt.getSubnet().equalsIgnoreCase(subnet) && rt.getGateway().equalsIgnoreCase(gw);
      i++;
    }//end while
    if (found){
      r.getVrt().removeElementAt(i-1);
    }//end if
    else {
      output += "Wrong Delete\n";
    }
  }
}