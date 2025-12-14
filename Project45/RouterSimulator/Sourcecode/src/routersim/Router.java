package routersim;

import java.util.*;

public class Router implements java.io.Serializable{
  static int num=0;
  private String name;
  private String Label;
  private String status;
  static String status_detail;
  private int mode;
  private String s1="";// add 4/11/45
  private char flag;// c is static or no protocol & r is rip & o is ospf
  private String Protocol;
  private int sequence=0;
  private int Maxseq=0;
  private int maxEth;
  private boolean telnet ;
  private int maxSerial;
  private int maxToken;
  private int Maxr;
  private int maxHistory;
  private int eth;
  private int serial;
  private int token;
  private String clock;
  private String network_address;
  private String password;
  private String vtyPasswd;
  private String auxPasswd;
  private String consolePasswd;
  private boolean enablepasswd;
  private boolean enabletelnet;
  private boolean enableconsole;
  private boolean ipclassless;
  private boolean terminalEdit;
  private Rip rip=null;
  private Ospf ospf=null;
  private int time = 10000;//time to sleep
  private int holdtime = 18000;
  private Vector vInt = new Vector();
  private Vector vrt = new Vector();
  private Vector hello = new Vector();
  private Vector vHello = new Vector();
  private Vector history = new Vector();
  private Vector dnsTable = new Vector();
  private Vector vIntTemp = new Vector();
  private Vector vIntTemp_S = new Vector();
  private Vector vIntTemp_T = new Vector();
  private Vector vAccessList = new Vector();
  private Cdp cdp = new Cdp();
  private RouterConsole rconsole;
  private int oldMode;
  private int model;
  private Vector vDns= new Vector();
  private boolean enabledns;
  private int lineMode = -1;
  private int cost = 10;
  private boolean debugrip = false;
  static String output="";
  private String oldname;

  //----------//
  public void initialInterface(){ //-- initial interface ( vIntTemp )

   String name = "" ;
   Interface defaultInterface ;
   int e=0,s=0,t=0;

   //-- initial router interface vector  ( vIntTemp )
   //-- Ethernet
   while ( e < maxEth ) {
     name = "E" + e; // set interface name
     defaultInterface = new Interface( name , "Ethernet" );

     vIntTemp.addElement( defaultInterface ); //-- add elements
     e++;
   }

    //-- Serial
   while ( s < maxSerial ) {
     name =  "S" + s;
     defaultInterface = new Interface( name , "Serial" ); //-- add elements
     vIntTemp.addElement( defaultInterface );
     s++;
   }

   //-- Token Ring
   while ( t < maxToken ) {
     name = "T" + t;
     defaultInterface = new Interface( name , "Token Ring" ); //-- add elements
     vIntTemp.addElement( defaultInterface );
     t++;
   }
 }
//-- called by WireDialog for delete selected interface
  public void deleteInt( int index , String intName ) {

    Router defaultRouter = (Router)NewRouter.vRouter.elementAt( index ); //-- Get router by index
    Vector vTemp = defaultRouter.getVIntTemp();    //-- Get interface vector

    int i = -1;
    boolean sign = false;

    while( !sign ){

      i++;
      Interface in = (Interface)vTemp.elementAt(i) ;

      if( intName.equalsIgnoreCase( in.getNameInt() ) )
        sign = true;
    }

    defaultRouter.vIntTemp.removeElementAt(i); //-- remove at element i
  }

  //-- add interface back when wire was delete
  public void addIntBack( int index1 , int index2 , String int1 , String int2 , String type ){

    Router defaultRouter1 = (Router)NewRouter.vRouter.elementAt( index1 ); //-- Get router1 by index
    Router defaultRouter2 = (Router)NewRouter.vRouter.elementAt( index2 ); //-- Get router2 by index

    Interface interface1 = new Interface( int1 , type );
    defaultRouter1.vIntTemp.addElement( interface1 );

    Interface interface2 = new Interface( int2 , type );
    defaultRouter2.vIntTemp.addElement( interface2 );
  }
 public Vector getVIntTemp(){
   return vIntTemp;
  }
 public Vector getVIntTemp_S(){
   return vIntTemp_S;
  }
  public Vector getVIntTemp_T(){
   return vIntTemp_T;
  }
  public void setModel(int i){
    model = i;
  }
  public void setMaxr(int max){
    Maxr=max;
  }
  public int getMaxr(){
    return Maxr;
  }
  public int getModel(){
    return model;
  }
  public void setTerminalEdit(boolean b){
    terminalEdit = b;
  }
  public boolean getTerminalEdit(){
    return terminalEdit;
  }
  public void setHoldTime(int i){
    holdtime = i;
  }
  public int getHoldTime(){
    return holdtime;
  }
  public void setIpClassless(boolean b){
    ipclassless = b;
  }
  public boolean getIpClassless(){
    return ipclassless;
  }
  public void setConsolePasswd(String s){
    consolePasswd = s;
  }
  public String getConsolePasswd(){
    return consolePasswd;
  }
  public void setLineMode(int i){
    lineMode = i;
  }
  public void setSeq(int seq)
{
  sequence = seq;
}
public int getSeq()
{
  return sequence;
}
public void setMaxseq(int max)
{
  Maxseq = max;
}
public int getMaxseq()
{
return Maxseq;
  }

  public int getLineMode(){
    return lineMode;
  }
  public Vector getDns(){
    return vDns;
  }
  public void setEnableDns(boolean b){
    enabledns = b;
  }
  public boolean getEnableDns(){
    return enabledns;
  }
  public void setVtyPasswd(String s){
    vtyPasswd = s;
  }
  public String getVtyPasswd(){
    return vtyPasswd;
  }
  public void setAuxPasswd(String s){
    auxPasswd = s;
  }
  public String getAuxPasswd(){
    return auxPasswd;
  }
  public void setEnableTelnet(boolean b){
    enabletelnet = b;

  }
  public boolean getEnableTelnet(){
    return enabletelnet;
  }
  public boolean getEnableConsole(){
    return enableconsole;
  }
  public void setEnableConsole(boolean b){
    enableconsole = b;
  }
  public void setOldMode(int i){
    oldMode = i;
  }
  public int getOldMode(){
    return oldMode;
  }
  public void setEnablePasswd(boolean b){
    enablepasswd = b;
  }
  public boolean getEnablePasswd(){
    return enablepasswd;
  }
  public String getClock(){
    return clock;
  }
  public void setClock(String s){
    clock = s;
  }
  public Cdp getCdp(){
    return cdp;
  }
  //-----//
  public RouterConsole getRouterConsole(){
    return rconsole;
  }
  public String getPasswd(){
    return password;
  }
  public void setPasswd(String s){
    password = s;
  }
  public void setLabel(String mark)
  {
    Label = mark;
  }
  public String getLabel()
  {
    return Label;
  }
  //-----------Get Protocol-------------//
  public Rip getRIP(){
    return rip;
  }
  public Ospf getOSPF(){
    return ospf;
  }
  //-----------debug ip rip------------//
  public void setdebugrip(boolean t)
  {
    debugrip = t;
  }
  public boolean getdebugrip()
  {
    return debugrip;
  }
  //----------------Set Max History----------------//
  public void setMaxHistory(int i){
    maxHistory = i;
  }
  public int getMaxHistory(){
    return maxHistory;
  }
  //--------------get Hello-------------------------//
  public Vector getVHello(){
    return vHello;
  }
  public Vector getHello(){
    return hello;
  }
  //------------------Set Name---------------------//
  public void setName(String s){
    name = s;
  }
  public String getName(){
    return name;
  }
  //------------------Set network_address---------------------//
  public void setNetwork_address(String s){
    if(s.equalsIgnoreCase(network_address))
    {
      network_address="161.246.0.0";
    }
    else
    {
      network_address = s;
    }
  }
  public String getNetwork_address(){
    return network_address;
  }
  //---------------Set Status------------------------//
  public void setStatus(String s){
    status = s;
  }
  public String getStatus(){
    return status;
  }
  //---------------Set Status_detail------------------------//
  static void setStatus_detail(String s){
    status_detail = s;
  }
  static String getStatus_detail(){
    return status_detail;
  }
  //---------------Set s1 kept interface------------------------//
  public void sets1(String s){
    s1 = s;
  }
  public String gets1(){
    return s1;
  }
  //-----------------Set Mode------------------------//
  public void setMode(int i){
    mode = i;
  }
  public int getMode(){
    return mode;
  }

  public void setCost( int w ) {
    cost = w;
  }

  public int getCost(){
    return cost;
  }

  public void setProtocol(String p){
      Protocol = p;

}
public String getProtocol(){
 return Protocol;
  }

  //-------------------Set Time----------------------//
  public void setTime(int t){
    time = t;
  }
  public int getTime(){
    return time;
  }
  //--------------------Set Table--------------------//
  public Vector getVrt(){
    return vrt;
  }
  public Vector getVInt(){
    return vInt;
  }
  //-------------Set Flag---------------//
  public void setFlag(char c){
    flag = c;
  }
  public char getFlag(){
    return flag;
  }
  public void setOldname(String name)
  {
    oldname=name;
  }
  public String getOldname()
  {
    return oldname;
  }
  //---------------Set Ethernet-----------//
  public void setEth(int n){
    eth = n;
  }
  public int getEth(){
    return eth;
  }
  public void setMaxEth(int n){
    maxEth = n;
  }
  public int getMaxEth(){
    return maxEth;
  }
  //---------------Set Serial-----------//
  public void setSerial(int n){
    serial = n;
  }
  public int getSerial(){
    return serial;
  }
  public void setMaxSerial(int n){
    maxSerial = n;
  }
  public int getMaxSerial(){
    return maxSerial;
  }
  public void setTelnet(boolean t)
  {
    telnet = t;
  }
  public boolean getTelnet()
  {
    return telnet;
  }
  //---------------Set Token Ring-----------//
  public void setToken(int n){
    token = n;
  }
  public int getToken(){
    return token;
  }
  public void setMaxToken(int n){
    maxToken = n;
  }
  public int getMaxToken(){
    return maxToken;
  }
  //----------------Get History-----------------------//
  public Vector getHistory(){
    return history;
  }

  //constructor
  public Router() {
  name = "Router";
  sequence=0;
  Maxseq=0;
  oldname="";
  telnet = false;
  s1 ="";// add 4/11/45
  status = "down";
  status_detail = "";
  mode = 1;
  flag = 'c';
  Protocol="Not have any";
  network_address="161.246.0.0";
  cost =10;
  eth = 0;
  maxEth = 10;
  token = 0;
  maxToken=10;
  serial = 0;
  maxSerial =10;
  maxHistory=10;
  num++;
  password = null;
  vtyPasswd = null;
  consolePasswd = null;
  auxPasswd = null;
 // Interface intf = new Interface();// add 1/11/2545
  rip = new Rip(this);
  debugrip = false;
  ospf = new Ospf(this);
  enablepasswd = false;
  enabledns = false;
  enabletelnet = false;
  ipclassless = false;
  terminalEdit = true;
  oldMode = -1;
}
public Router(String s){
  name = s;
  sequence =0;
  Maxseq=0;
  oldname="";
  telnet = false;
  s1 ="";// add 4/11/45
  status = "down";
  mode = 1;
  flag = 'c';
  Protocol="Not have any";
  network_address="161.246.0.0";
  cost =10;
  eth = 0;
  maxEth=10;
  serial = 0;
  maxSerial=10;
  token = 0;
  maxToken=10;
  maxHistory=10;
  num++;
  password = null;
  vtyPasswd = null;
  consolePasswd = null;
  auxPasswd = null;
 // Interface intf = new Interface();// add 1/11/2545
  rip = new Rip(this);
  debugrip = false;
  ospf = new Ospf(this);
  enablepasswd = false;
  enabledns = false;
  enabletelnet = false;
  ipclassless = false;
  terminalEdit = true;
  oldMode = -1;
  for (int a=this.getVrt().size();a > 0; a--){
    RoutingTable rt = (RoutingTable)this.getVrt().elementAt(a);
    if (rt.getRouteType() == 'r'){
      this.getVrt().removeElementAt(a);
    }//end if
  }//end for
  }//Router(String s)
  //-------------Send Table--------------------//
  public void sendRoutingTable(){
    if (NewRouter.singleMode){
      Router rturn = (Router)NewRouter.vRouter.elementAt(NewRouter.getsenderNumber());
//    System.out.println("Turn is "+rturn.getName());
      if (rturn.getName().equals(this.getName())){
        for(int a=0; a < NewRouter.vRouter.size(); a++){
          Router r = (Router)NewRouter.vRouter.elementAt(a);
          //not send to itself
          if ((!r.getName().equalsIgnoreCase(this.getName()))&&(r.getFlag() == 'r')){
            for(int x=0; x < r.getVInt().size(); x++){
              Interface i1 = (Interface)r.getVInt().elementAt(x);
              for(int y=0; y < this.getVInt().size(); y++){
                Interface i2 = (Interface)this.getVInt().elementAt(y);
                if ((i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))&&(!i1.getStatus().equalsIgnoreCase("down"))&&(!i2.getStatus().equalsIgnoreCase("down"))||(!i1.getPassive()))
                {
                  System.out.println("******Just Recieve "+r.getName()+" is recieved from"+this.getName());
                  //----------------display debug rip-----(sending)-------------
                  if(r.getdebugrip())
                  {
                    output="RIP : sending update to 255.255.255.255 via "+i1.getNameInt()+"\n";
                    output+=" ("+i1.getIpAddress()+")\n";
                    for (int i=0;i < r.getVrt().size();i++){
                      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
                      if(i==(r.getVrt().size()-1))
                      {
                        output+="       subnet "+rt.getIpDestination()+",  metric "+rt.getMatrice();
                      }
                      else{
                        output+="       subnet "+rt.getIpDestination()+",  metric "+rt.getMatrice()+"\n";
                      }
                      System.out.println(output);
                      StatusPanel.Showdebugrip(output,a);
                      if(!r.getdebugrip())
                      {
                        StatusPanel.stopdebugrip(a);
                      }//end if
                    }//end for
                  }//end if
                  //------------------------------------------------------------
                  r.recieveRoutingTable(this);
                  //----------------display debug rip-----(received)------------
                  if(r.getdebugrip())
                  {
                    for (int i=0;i < r.getVrt().size();i++){
                      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
                      output="RIP : received update from "+rt.getGateway()+" on "+i1.getNameInt()+"\n";
                      output+="     "+rt.getIpDestination()+"  in  "+rt.getMatrice()+"hops";
                      System.out.println(output);
                      StatusPanel.Showdebugrip(output,a);
                      if(!r.getdebugrip())
                      {
                        StatusPanel.stopdebugrip(a);
                      }//end if
                    }//end for
                    StatusPanel.showprompt(a);
                  }//end if
                  //------------------------------------------------------------
                }//end if
              }//end for
            }//end for
          }//end if
        }//end for
      }//is turn?
    }
    else{
      for(int a=0; a < NewRouter.vRouter.size(); a++){
        Router r = (Router)NewRouter.vRouter.elementAt(a);
        //not send to itself
        if ((!r.getName().equalsIgnoreCase(this.getName()))&&(r.getFlag() == 'r')){
          for(int x=0; x < r.getVInt().size(); x++){
            Interface i1 = (Interface)r.getVInt().elementAt(x);
            for(int y=0; y < this.getVInt().size(); y++){
              Interface i2 = (Interface)this.getVInt().elementAt(y);
              if ((i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))&&(!i1.getStatus().equalsIgnoreCase("down"))&&(!i2.getStatus().equalsIgnoreCase("down"))&&(!i1.getPassive())){
                System.out.println("******Just Recieve "+r.getName()+" is recieved from"+this.getName()+""+i2.getNetAddress());
                //----------------display debug rip-----(sending)-------------
                if(r.getdebugrip())
                {
                  output="RIP : sending update to 255.255.255.255 via "+i1.getNameInt()+"\n";
                  output+=" ("+i1.getIpAddress()+")\n";
                  for (int i=0;i < r.getVrt().size();i++){
                    RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
                    if(i==(r.getVrt().size()-1))
                    {
                      output+="       subnet "+rt.getIpDestination()+",  metric "+rt.getMatrice();
                    }
                    else{
                      output+="       subnet "+rt.getIpDestination()+",  metric "+rt.getMatrice()+"\n";
                    }
                    System.out.println(output);
                    StatusPanel.Showdebugrip(output,a);
                    if(!r.getdebugrip())
                    {
                      StatusPanel.stopdebugrip(a);
                    }//end if
                  }//end for
                }//end if
                //------------------------------------------------------------
                r.recieveRoutingTable(this);
                //----------------display debug rip-----(received)------------
                     if(r.getdebugrip())
                     {
                       for (int i=0;i < r.getVrt().size();i++){
                         RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
                         output="RIP : received update from "+rt.getGateway()+" on "+i1.getNameInt()+"\n";
                         output+="     "+rt.getIpDestination()+"  in  "+rt.getMatrice()+"  hops";
                         System.out.println(output);
                         StatusPanel.Showdebugrip(output,a);
                         if(!r.getdebugrip())
                         {
                           StatusPanel.stopdebugrip(a);
                         }//end if
                       }//end for
                       StatusPanel.showprompt(a);
                     }//end if
                  //------------------------------------------------------------
              }//end if
              System.out.print("Passive :"+i1.getPassive());
            }//end for
          }//end for
        }//end if
      }//end for
      System.out.println("******not single mode and no element ");
    }
  }
  //-------------Recieve Table------------------//
  public void recieveRoutingTable(Router oldRouter){
    Interface iadj = null;
    //-----------Find Interface that adj----------------//
    for(int a=0; a < this.getVInt().size(); a++){
      Interface i1 = (Interface)this.getVInt().elementAt(a);
      for (int b=0; b < oldRouter.getVInt().size(); b++){
        Interface i2 = (Interface)oldRouter.getVInt().elementAt(b);
        if (i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress())){
          iadj = i2;
        }//end if
      }//end for
    }//end for
    //-------------Find Destination that not have in router-----------------//
    for (int i=0; i < oldRouter.getVrt().size(); i++){
      //Routing table of router that send routing to ...
      RoutingTable rt1 = (RoutingTable)oldRouter.getVrt().elementAt(i);
      //Routing table of router that recieve from ...
      RoutingTable rt2 =null;
      boolean found = false;
      for(int j=0; j < this.getVrt().size(); j++){
        rt2 = (RoutingTable)this.getVrt().elementAt(j);
        if (rt1.getIpDestination().equalsIgnoreCase(rt2.getIpDestination())){
          found = true;
          //if gw is router that send routing table
          if(rt2.getInterface().equals(iadj)){
//            this.getVrt().removeElementAt(j);
            if(rt1.getMatrice() < 15){
              rt2.setMatrice(rt1.getMatrice()+1);
            }
            else {
              rt2.setMatrice(16);
            }
          }
          else if((((rt1.getMatrice() + 1) < rt2.getMatrice())&&((!rt2.getGateway().equalsIgnoreCase("0.0.0.0"))))||(rt2.getMatrice() == 16)){
//            rt2 = (RoutingTable)this.getVrt().elementAt(j);
//            this.getVrt().removeElementAt(j);
            if (rt1.getMatrice() < 15){
              rt2.setMatrice(rt1.getMatrice()+1);
            }
            else {
              rt2.setMatrice(16);
            }
            rt2.setGateway(iadj.getIpAddress());
            rt2.setInterface(iadj);
          }
        }//end if
      }//end for
      if (!found){
        rt1.addRouting(this,iadj);
      }
    }//end for
  }//end recieveRoutingTable
  //------------------Recieve Hello table-----------------------//
  public void recieveHelloTable(Vector h,int order)
  {
    int w = NewRouter.vRouter.size();
    for (int i=0;i<h.size();i++)
    {
      Vector vh=(Vector)h.elementAt(i);
      if (!checkHave(vh))
      {
        vHello.addElement(vh);
      }
    }
  }
  private boolean checkHave(Vector v){
    boolean check=false;
    for (int i=0;i<vHello.size();i++)
    {
      Vector vthis = (Vector)vHello.elementAt(i);
      if (v.size()!=0)
      {
        for (int j=0;j<vthis.size();j++)
        {
          Hello h = (Hello)v.elementAt(0);
          Hello hthis = (Hello)vthis.elementAt(j);
          if ( h.getStartRouter().getName().equalsIgnoreCase(hthis.getStartRouter().getName()))
          {
            check = true;
          }
        }
      }
    }
    return check;
  }
  public void createAccessList( AccessList acc , String number){

  AccessList temp = null ;
  boolean isCreated = false ;
  boolean firstSame = false;
  int first = -1 , allSame=0;

  //-- create by sequence
  for(int j = 0 ; j < vAccessList.size() ; j++ ){

    temp = (AccessList)vAccessList.elementAt(j);
    int a = Integer.parseInt(temp.getNumber());
    int b = Integer.parseInt( number );

    if(!isCreated){
      //-- add before
      if( b < a ){

        vAccessList.add( j , acc );
        isCreated = true;
      }
      else if( b == a ){

        //-- keep first
        if(!firstSame){
          //-- set address of start
          firstSame = true;
          first = j ;
        }
        allSame++;

      }
    }
  }
  //-- create with same number
  if( firstSame && !isCreated ){
    vAccessList.add( first + allSame , acc );
    isCreated = true;
  }
  //-- add first or after
  if(!isCreated)
    vAccessList.addElement(acc);
}

//-- create access-list with wildcard
public void newAccessList( String number , String condition , String source , String wildcard ){

 //-- set number of access list type
 if( Integer.parseInt( number ) > 0 && Integer.parseInt( number ) < 100 ){

   AccessList acc = new AccessList();

   acc.setNumber(number);
   acc.setCondition(condition);
   acc.setSource(source);
   acc.setSourceWildCard( wildcard );

   createAccessList( acc , number );

   System.out.println( " Access Size : " + vAccessList.size() );
 }
}

//-- new Extened IP
public void newAccessList(  String number , String condition ,String protocal , String source
                           ,String  sourWild , String destination ,String  desWild ){

 //-- set number of access list type
 if( Integer.parseInt( number ) > 99 && Integer.parseInt( number ) < 200 ){

   AccessList acc = new AccessList();

   acc.setNumber(number);
   acc.setCondition(condition);
   acc.setProtocal(protocal);
   acc.setSource(source);
   acc.setSourceWildCard( sourWild );
   acc.setDestination( destination );
   acc.setDesWildCard( desWild );

   createAccessList( acc , number );
 }
}

//-- new TCP & UDP IP
public void newAccessList( String number ,String condition ,String protocal , String source
                          ,String sourWild ,String op1,String port1, String destination
                          , String desWild ,String op2 ,String port2){

 //-- set number of access list type
 if( Integer.parseInt( number ) > 99 && Integer.parseInt( number ) < 200 ){

   AccessList acc = new AccessList();

   acc.setNumber(number);
   acc.setCondition(condition);
   acc.setProtocal(protocal);
   acc.setSource(source);
   acc.setSourceWildCard( sourWild );
   acc.setOperator1( op1 );
   acc.setPort1( port1 );
   acc.setDestination( destination );
   acc.setDesWildCard( desWild );
   acc.setOperator2( op2 );
   acc.setPort2( port2 );

   createAccessList( acc , number );
 }
}

public void deleteAccessList( String number ){

 int l = vAccessList.size();
 for( int i = 0 ; i < l; i++ ){

   for( int j = 0 ; j < vAccessList.size(); j++ ){

     AccessList acc = (AccessList)vAccessList.elementAt(j);
     if( acc.getNumber().equalsIgnoreCase( number ) ){

       vAccessList.removeElementAt(j);
     }
   }
 }
}

public Vector getVAccess(){

 return vAccessList;
}

public boolean isPassAccessList( String number , String sourceIP , String destinationIP , String protocal , String port1 , String port2 ){
//-- return true is permit , false is deny

 for( int i = 0 ; i < vAccessList.size() ; i++){ // reverse with insert so inverse read

   AccessList acc = (AccessList)vAccessList.elementAt(i);

   //-- condition testing with the same list number
   if(acc.getNumber().equalsIgnoreCase(number)){

     //-- Standard IP case ----------------------------------------------------------------------
     if(Integer.parseInt(number) < 100){

       //-- host ip
       if(   acc.getSourceWildCard().equalsIgnoreCase("")
          || acc.getSourceWildCard().equalsIgnoreCase("0.0.0.0")
          || acc.getSource().equalsIgnoreCase("host") ) {

         //-- source xxx.xxx.xxx.xxx
         if(acc.getSource().equalsIgnoreCase(sourceIP)){

           if(acc.getCondition().equalsIgnoreCase("permit"))
             return true;
           else
             return false;
         }
         //-- source host wild xxx.xxx.xxx.xxx
         else if(acc.getSource().equalsIgnoreCase("host")){

           //-- test ip
           if(acc.getSourceWildCard().equalsIgnoreCase(sourceIP)){

             if(acc.getCondition().equalsIgnoreCase("permit"))
               return true;
             else
               return false;
           }
         }
         //-- source any
         else if(acc.getSource().equalsIgnoreCase("any")){

           if(acc.getCondition().equalsIgnoreCase("permit"))
             return true;
           else
             return false;
         }
       }
       //-- source xxx.xxx.xxx.xxx wild xxx.xxx.xxx.xxx
       else if( (!acc.getSource().equalsIgnoreCase("any"))
                && (!acc.getSource().equalsIgnoreCase("host"))
                && (!acc.getSourceWildCard().equalsIgnoreCase(""))){

         String range = findAddress( acc.getSource() , acc.getSourceWildCard() );

         boolean isMatch = false;

         isMatch = isOnRange( sourceIP , acc.getSource() , range );

         if( isMatch && acc.getCondition().equalsIgnoreCase("permit") )
           return true;
         else if( !isMatch && acc.getCondition().equalsIgnoreCase("deny") )
           return true;
         else
           return false;
       }
     }
     //------------------------------------------------------------------------------------------
     //-- Extened IP case
     else if(Integer.parseInt(number) > 99 && Integer.parseInt(number) < 200 ){

       //-- check ip source and destination .
       //-- source is host
       if( acc.getSourceWildCard().equalsIgnoreCase("0.0.0.0")
          || acc.getSource().equalsIgnoreCase("host") ) {

         //-- source xxx.xxx.xxx.xxx
         if(acc.getSource().equalsIgnoreCase(sourceIP)){

           //-- destination is host
           if(acc.getDestination().equalsIgnoreCase("host")){

             if(acc.getDesWildCard().equalsIgnoreCase(destinationIP)){

               boolean isProtocal = false;
               isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

               //-- test protocal and permit
               return isProtocal;
             }
           }
           //-- destination is host by ip
           else if(acc.getDesWildCard().equalsIgnoreCase("0.0.0.0")){

             if(acc.getDestination().equalsIgnoreCase(destinationIP)){

               boolean isProtocal = false;
               isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

               //-- test protocal and permit
               return isProtocal;
             }
           }
           //-- destination has wildcard
           else{

             String range = findAddress( acc.getDestination() , acc.getDesWildCard());

             boolean isMatch = false;

             isMatch = isOnRange( destinationIP , acc.getDestination() , range );

             if( isMatch ){

               boolean isProtocal = false;
               isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

               //-- test protocal and permit
               return isProtocal;
             }
           }
         }
         //-- source host wild xxx.xxx.xxx.xxx
         else if(acc.getSource().equalsIgnoreCase("host")){

           //-- test ip
           if(acc.getSourceWildCard().equalsIgnoreCase(sourceIP)){

             //-- destination is host
             if(acc.getDestination().equalsIgnoreCase("host")){

               if(acc.getDesWildCard().equalsIgnoreCase(destinationIP)){

                 boolean isProtocal = false;
                 isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

                 //-- test protocal and permit
                 return isProtocal;
               }
             }
             //-- destination is host by ip
             else if(acc.getDesWildCard().equalsIgnoreCase("0.0.0.0")){

               if(acc.getDestination().equalsIgnoreCase(destinationIP)){

                 boolean isProtocal = false;
                 isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

                 //-- test protocal and permit
                 return isProtocal;
               }
             }
             //-- destination has wildcard
             else{

               String range = findAddress( acc.getDestination() , acc.getDesWildCard());

               boolean isMatch = false;

               isMatch = isOnRange( destinationIP , acc.getDestination() , range );

               if( isMatch ){

                 boolean isProtocal = false;
                 isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

                 //-- test protocal and permit
                 return isProtocal;
               }
             }
           }
         }
       }
       //-- source xxx.xxx.xxx.xxx wild xxx.xxx.xxx.xxx
       else if( (!acc.getSource().equalsIgnoreCase("any"))
                && (!acc.getSource().equalsIgnoreCase("host"))
                && (!acc.getSourceWildCard().equalsIgnoreCase(""))){

         String range = findAddress( acc.getSource() , acc.getSourceWildCard() );

         boolean isMatch = false;

         isMatch = isOnRange( sourceIP , acc.getSource() , range );

         if( isMatch ){      //-- destination check

           //-- destination is host
           if(acc.getDestination().equalsIgnoreCase("host")){

             if(acc.getDesWildCard().equalsIgnoreCase(destinationIP)){

               boolean isProtocal = false;
               isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

               //-- test protocal and permit
               return isProtocal;
             }
           }
           //-- destination is host by ip
           else if(acc.getDesWildCard().equalsIgnoreCase("0.0.0.0")){

             if(acc.getDestination().equalsIgnoreCase(destinationIP)){

               boolean isProtocal = false;
               isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

               //-- test protocal and permit
               return isProtocal;
             }
           }
           //-- destination has wildcard
           else{

             String range1 = findAddress( acc.getDestination() , acc.getDesWildCard());

             boolean isMatch1 = false;

             isMatch1 = isOnRange( destinationIP , acc.getDestination() , range1 );

             if( isMatch1 ){

               boolean isProtocal = false;
               isProtocal = isTrueProtocal( acc , port1 , port2 , protocal );

               //-- test protocal and permit
               return isProtocal;
             }
           }
         }
       }
     }
   }
 }

 return false;
}

//-- find address range
private String findAddress(String ip,String subnet){

  String Add="",tmp1 = "",tmp2="",tmp="";

  while(ip.length() != 0){

    int i1 = ip.indexOf(".");
    int i2 = subnet.indexOf(".");
    int i3=0,i4=0;

    if ((i1 != -1)&&(i2 != -1)){

      tmp1 = ip.substring(0,i1);
      tmp2 = subnet.substring(0,i2);
      i3 = Integer.parseInt(tmp1);
      i4 = Integer.parseInt(tmp2);
      tmp = Integer.toString(i3 | i4);
      tmp += ".";
      Add = Add.concat(tmp);
      ip = ip.substring(i1+1,ip.length());
      subnet = subnet.substring(i2+1,subnet.length());
    }
    else {

      try {

        i3 = Integer.parseInt(ip);
        i4 = Integer.parseInt(subnet);
        tmp = Integer.toString(i3 | i4);
        Add = Add.concat(tmp);
        ip="";
        subnet="";
      }
      catch (NumberFormatException exp){
        ip = "";
      }
    }
  }
  return Add;
}

private boolean isOnRange( String IP , String source , String range ){

  boolean isOn = true;
  StringTokenizer packetIP = new StringTokenizer(IP,".");
  StringTokenizer sourceIP = new StringTokenizer(source,".");
  StringTokenizer rangeIP = new StringTokenizer(range , ".");

  for( int i=0; i < 4 ; i++ ){ //-- xxx.xxx.xxx.xxx

    if (packetIP.hasMoreTokens()){

      String tmp = packetIP.nextToken();
      String tmpS = sourceIP.nextToken();
      String tmpR = rangeIP.nextToken();

      try{

        int ip = Integer.parseInt(tmp);
        int ipS = Integer.parseInt(tmpS);
        int ipR = Integer.parseInt(tmpR);

        if( ipS <= ipR ){

          if( ip < ipS || ip > ipR )
            isOn = false;
        }
        else {

          if( ip < ipR || ip > ipS )
            isOn = false;
        }
      }
      catch (NumberFormatException exp){
      }
    }
  }
  return isOn;
}

private boolean isTruePort( int packetPort , int accPort , String operator ){

  if( operator.equalsIgnoreCase("eq") && packetPort == accPort )
    return true;
  else if( operator.equalsIgnoreCase("neq") && packetPort != accPort )
    return true;
  else if( operator.equalsIgnoreCase("gt") && packetPort > accPort )
    return true;
  else if( operator.equalsIgnoreCase("lt") && packetPort < accPort )
    return true;

  return false;
}

//-- check protocal and permit or deny
private boolean isTrueProtocal( AccessList acc , String port1 , String port2 , String protocal ){

  //-- Protocal is TCP UDP
  if((acc.getProtocal().equalsIgnoreCase("tcp")
      ||acc.getProtocal().equalsIgnoreCase("udp"))
      &&acc.getProtocal().equalsIgnoreCase(protocal)){

    boolean isPort1 = false;
    boolean isPort2 = false;

    //-- test port
    isPort1 = isTruePort( Integer.parseInt(port1) , Integer.parseInt(acc.getPort1())
                          , acc.getOperator1() );

    isPort2 = isTruePort( Integer.parseInt(port2) , Integer.parseInt(acc.getPort2())
                          , acc.getOperator2() );

    if( isPort1 && isPort2 ) {

      if(acc.getDestination().equalsIgnoreCase("permit"))
        return true;
      else
        return false;
    }
  }
  //-- Protocal is IP , ICMP
  else if(acc.getProtocal().equalsIgnoreCase("ip")
          ||acc.getProtocal().equalsIgnoreCase("icmp")){

    if(acc.getCondition().equalsIgnoreCase("permit"))
      return true;
    else
      return false;
  }

  return false;

}
}