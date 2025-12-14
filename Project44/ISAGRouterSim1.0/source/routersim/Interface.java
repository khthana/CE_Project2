package routersim;

import java.util.*;

public class Interface {
  private String nameInt;
  private String ipAddress;
  private String netAddress;
  private String subnet;
  private String type;
  private String status;
  private int bandwidth;
  private int clockRate;
  private int ringSpeed;
  private String descript;
  private Vector ipGateway;
  //-------Set Bandwidth------//
  public void setBandwidth(int i){
    bandwidth = i;
  }
  public int getBandwidth(){
    return bandwidth;
  }
  //------Set Description-----//
  public void setDescription(String s){
    descript = s;
  }
  public String getDescription(){
    return descript;
  }
  //-----------//
  public void setClockRate(int i){
    clockRate = i;
  }
  public int getClockRate(){
    return clockRate;
  }
  //---------//
  public void setRingSpeed(int i){
    ringSpeed = i;
  }
  public int getRingSpeed(){
    return ringSpeed;
  }
  //-------------Set Interface Name---------------//
  public void setNameInt(String s){
    nameInt = s;
  }
  public String getNameInt(){
    return nameInt;
  }
  //-------------Set Ip Address ------------------//
  public void setIpAddress(String s){
    ipAddress = s;
  }
  public String getIpAddress(){
    return ipAddress;
  }
  //-------------Set Network Address-------------//
  public void setNetAddress(String s){
    netAddress = s;
  }
  public String getNetAddress(){
    return netAddress;
  }
  //---------------Set Subnet------------------------//
  public void setSubnet(String s){
    subnet = s;
  }
  public String getSubnet(){
    return subnet;
  }
  //------------------Set Type------------------------//
  public void setType(String s){
    type = s;
  }
  public String getType(){
    return type;
  }
  //---------------Set Status------------------------//
  public void setStatus(String s){
    status = s;
  }
  public String getStatus(){
    return status;
  }
  //---------------Set IP Gateway------------------//
  public void setIpGateway(String s){
    ipGateway.addElement(s);
  }
  public Vector getIpGateway(){
    return ipGateway;
  }
//---------------------Function-----------------------//
  //-----------Shut Down Interface----------//
  public void shutInt(Router r){
    this.status = "down";
    RoutingTable rt = new RoutingTable();
    int j=0;
    while (j < r.getVrt().size()){
      RoutingTable rt1 = (RoutingTable)r.getVrt().elementAt(j);
      if ((rt1.getInterface().getType().equalsIgnoreCase(this.getType()))&&(rt1.getInterface().getNum() == this.getNum())){
	r.getVrt().removeElementAt(j);
      }//end if
      j++;
    }//end while
    rt.ipRoute(r,this.getIpAddress(),subnet,16);
//    if (){
      for (int a=0; a < Frame1.vRouter.size(); a++){
        Router newr = (Router)Frame1.vRouter.elementAt(a);
        j=0;
        while (j < newr.getVrt().size()){
          RoutingTable rt1 = (RoutingTable)newr.getVrt().elementAt(j);
          if ((rt1.getGateway().equalsIgnoreCase(this.getIpAddress()))||((r.getName().equalsIgnoreCase(newr.getName())))&&(findNetAdd(rt1.getGateway(),rt1.getSubnet()).equalsIgnoreCase(this.getNetAddress()))){
            rt1.setMatrice(16);
          }//end if
          j++;
        }//end while
//      }
    }
  }
  //------------Active Interface--------------//
  public void noshutInt(Router r){
    this.status = "up";
    RoutingTable rt = new RoutingTable();
    int j=0;
    while (j < r.getVrt().size()){
      RoutingTable rt1 = (RoutingTable)r.getVrt().elementAt(j);
      if ((rt1.getInterface().getType().equalsIgnoreCase(this.getType()))&&(rt1.getInterface().getNum() == this.getNum())){
	r.getVrt().removeElementAt(j);
      }//end if
      j++;
    }//end while
    rt.ipRoute(r,this.getIpAddress(),subnet,0);
  }
  //-----------------Find Net Add------------------//
  public String findNetAdd(){
    String ip = this.ipAddress;
    String subnet = this.subnet;
    String netAdd="",tmp1 = "",tmp2="",tmp="";
    while(ip.length() != 0){
      int i1 = ip.indexOf(".");
      int i2 = subnet.indexOf(".");
      int i3=0,i4=0;
      if (i1 != -1){
        tmp1 = ip.substring(0,i1);
        tmp2 = subnet.substring(0,i2);
        i3 = Integer.parseInt(tmp1);
        i4 = Integer.parseInt(tmp2);
        tmp = Integer.toString(i3 & i4);
        tmp += ".";
        netAdd = netAdd.concat(tmp);
        ip = ip.substring(i1+1,ip.length());
        subnet = subnet.substring(i2+1,subnet.length());
      }//end index != -1
      else {
        i3 = Integer.parseInt(ip);
        i4 = Integer.parseInt(subnet);
        tmp = Integer.toString(i3 & i4);
        netAdd = netAdd.concat(tmp);
        ip="";
        subnet="";
      }//end else
    }//end while
    return netAdd;
  }
  public static String findNetAdd(String ip,String subnet){
    String netAdd="",tmp1 = "",tmp2="",tmp="";
    while(ip.length() != 0){
      int i1 = ip.indexOf(".");
      int i2 = subnet.indexOf(".");
      int i3=0,i4=0;
      if ((i1 != -1)&&(i2 != -1)){
        tmp1 = ip.substring(0,i1);
        tmp2 = subnet.substring(0,i2);
        i3 = Integer.parseInt(tmp1);
        i4 = Integer.parseInt(tmp2);
        tmp = Integer.toString(i3 & i4);
        tmp += ".";
        netAdd = netAdd.concat(tmp);
        ip = ip.substring(i1+1,ip.length());
        subnet = subnet.substring(i2+1,subnet.length());
      }//end index != -1
      else {
        try {
          i3 = Integer.parseInt(ip);
          i4 = Integer.parseInt(subnet);
          tmp = Integer.toString(i3 & i4);
          netAdd = netAdd.concat(tmp);
          ip="";
          subnet="";
        }
        catch (NumberFormatException exp){
          ip = "";
        }
      }//end else
    }//end while
    return netAdd;
  }
  //---------------Check is ip----------------------//
  // true if ip correct
  //argument must be pass by value
  static public boolean isIp(String s){
    boolean f = true;
    StringTokenizer st = new StringTokenizer(s,".");
    for(int i=0; i<4; i++){
      if (st.hasMoreTokens()){
        String tmp = st.nextToken();
        try{
          int ip = Integer.parseInt(tmp);
          if ((ip < 0) || (ip > 255)){
            f = false;
          }
        }
        catch (NumberFormatException exp){
          f = false;
        }
      }
      else{
        f = false;
      }
    }
    return f;
/*    boolean f = true;
    String region="";
    while((s.length() != 0) && f){
      int index = s.indexOf(".");
      if (index != -1){
        region = s.substring(0,index);
        s = s.substring(index+1,s.length());
      }//end index != -1
      else {
        region = s;
        s = "";
      }//end index = -1
      try{
        int ip = Integer.parseInt(region);
        if  ((ip < 0) || (ip > 255)){
          f = false;
        }//end ip in range
      }
      catch (Exception exp){
        f = false;
      }
    }//end while
    return f;
*/
  }
  //----Get Number of  Type of Interface ----//
  public static int getNum(String s){
    int num=0,index=0;
    int minascii = 48,maxascii = 57;
    while ((index < s.length())&&((s.charAt(index) < minascii) || (s.charAt(index) > maxascii))){
      index++;
    }
    try{
      num = Integer.parseInt(s.substring(index));
      return(num);
    }
    catch(Exception exp){
      System.out.println("Invalid Interface Name");

      return(-1);
    }
  }
  public int getNum(){
    int num=0,index=0;
    int minascii=48,maxascii=57;
    while((index < this.nameInt.length())&&((this.nameInt.charAt(index) < minascii)||(this.nameInt.charAt(index) > maxascii))){
      index++;
    }
    try{
      num = Integer.parseInt(this.nameInt.substring(index));
      return(num);
    }
    catch(Exception exp){
      System.out.println("Invalid Interface Name");
      return(-1);
    }
  }
  //--------------Add new Interface---------------//
  public void AddNewInt(Router r,String s){
    Interface newInt = new Interface();
    Interface oldInt =null;
    int i=0,j=0,useint=0;
    String type;
    s = s.toLowerCase();
    switch(s.charAt(0)){
      case 'e' : type = "Ethernet";r.setEth(r.getEth()+1);break;
      case 's' : type = "Serial";r.setSerial(r.getSerial()+1);break;
      case 't' : type = "Token Ring";r.setToken(r.getToken()+1);break;
      default : type = "Unknow";
    }//end switch
    int num = Interface.getNum(s);
    while(i < r.getVInt().size()){
      oldInt = (Interface)r.getVInt().elementAt(i);
      if((oldInt.getType().equalsIgnoreCase(type))&&(oldInt.getNum() == num)){
        newInt = (Interface)r.getVInt().elementAt(i);
        r.getVInt().removeElementAt(i);
      }//end if
      i++;
    }//end while
    newInt.setNameInt(s);
    newInt.setType(type);
//    int num = newInt.getNum();
    int max=-1;
    switch(s.charAt(0)){
      case 'e' : max = r.getMaxEth();break;
      case 's' : max = r.getMaxSerial();break;
      case 't' : max = r.getMaxToken();break;
      default : break;
    }//end switch
    if (num < max){
//  if ((r.getEth() <= r.getMaxEth()) && (r.getSerial() <= r.getMaxSerial()) && (r.getToken() <= r.getMaxToken())){
      r.getVInt().addElement(newInt);
    }
  else {
    switch(s.charAt(0)){
      case 'e' : r.setEth(r.getEth()-1);RouterConsole.output+= "Ethernet ";break;
      case 's' : r.setSerial(r.getSerial()-1);RouterConsole.output+= "Serial ";break;
      case 't' : r.setToken(r.getToken()-1);RouterConsole.output+= "Token Ring ";break;
      default : break;
    }//end switch
    RouterConsole.output += "has limited\n";
  }
  }//end Add New Interface
  //------------------Set ip Interface-----------------------//
  public void setIpAddress(Router r,String ip,String subnet){
    Interface i = (Interface)r.getVInt().elementAt(r.getVInt().size()-1);
    RoutingTable rt=new RoutingTable();
    if ((i.isIp(ip))&&(i.isIp(subnet))){
      r.getVInt().removeElementAt(r.getVInt().size()-1);
      i.setIpAddress(ip);
      i.setSubnet(subnet);
      i.setNetAddress(i.findNetAdd());
      r.getVInt().addElement(i);
      int j=0;
      while (j < r.getVrt().size()){
        RoutingTable rt1 = (RoutingTable)r.getVrt().elementAt(j);
        if ((rt1.getInterface().getType().equalsIgnoreCase(i.getType()))&&(rt1.getInterface().getNum() == i.getNum())){
          r.getVrt().removeElementAt(j);
        }//end if
        j++;
      }//end while
/*      if(this.getStatus().equalsIgnoreCase("up")){
        rt.ipRoute(r,ip,subnet,0);
      }
      else{
	rt.ipRoute(r,ip,subnet,16);
      }*/
    }//end if
  }
  //---Constuctor--//
  public Interface(){
    nameInt = "";
    ipAddress = "";
    type = "";
    status = "down";
    netAddress = "";
    subnet ="";
    ipGateway =  new Vector();
  }
  public Interface(String n,String t){
    nameInt = n;
    ipAddress = "";
    type = t;
    status = "down";
    netAddress = "";
    subnet ="";
    ipGateway  = new Vector();
  }
}