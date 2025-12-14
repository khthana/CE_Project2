package routersim;
import java.io.*;
import java.util.*;
import javax.swing.*;

public class Command implements java.io.Serializable{
  int numtrace=0;

  final public String filename = "config.dat";  //-- config file
  final public String fileName = "network.dat"; //-- diagram file
  static Vector fileBuffer = new Vector();
  static Vector deleteList = new Vector(); //-- router delete list

  static Vector Path = new Vector();
  static Router rout = new  Router();
  static String output="";
  static String display="";
  static private String ip_shortestPath="";
  static boolean read = false;
  boolean test = false;
  //--- Access List --------------
  boolean isPass = false ;
  String sourceIP = "";
  int inRouter = -1;
  int inInt = -1;
  int sourceRouter = -1;
  int sourceInt = -1;
  int outRouter = -1;
  int outInt = -1;
  String outIP = "";
  String inIP = "";
  String gwNetaddress = "";
  //--------------------------------


  public void copyFile( String message ){

    try {

      FileWriter fout = new FileWriter( fileName );
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(message);
      pout.close();

      //-- set buffer file
      setFileBuffer( message );
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }

  public void setFileBuffer( String message ) {

    fileBuffer.addElement( new String( message ) );
  }

  //-- file buffer for User load file
  public Vector getFileBuffer( ){

    return fileBuffer;
  }

  public String readConfig(){

    String config = "";
    String s = "";
    int linenum = 0 ;

    try{ //-- read config file

      FileReader fin = new FileReader(filename);
      BufferedReader bin = new BufferedReader(fin);

      while ((s = bin.readLine()) != null) {
        config += s;
        config += "\n";
      }

    }catch( Exception e ) {
    }
    return config;
  }

  //-- write config file from open file
  public void writeConfig( String s ){

    try{
      FileWriter fout = new FileWriter( filename );
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(s);
      pout.close();
    }catch( Exception e) {}
  }

  //--------------Show Interface---------------//
  public void showInt(Router r){
    for(int j=0;j<NewRouter.vRouter.size();j++)
    {
      Router rt = (Router)NewRouter.vRouter.elementAt(j);
      if(rt.getName().equalsIgnoreCase(r.getName()))
      {
    output="";
    String s = "   Type \t Name \t      IP \t     Subnet \t Status \n";
    for (int i=0; i < rt.getVInt().size(); i++){
      Interface intf = (Interface)rt.getVInt().elementAt(i);
      s = s + intf.getType() + "\t" + intf.getNameInt() + "\t" + intf.getIpAddress() + "\t" + intf.getSubnet() + "\t      " + intf.getStatus() + "\n";
    }//end for
    output = s;
    System.out.println(s);
    for (int i=0; i < rt.getVInt().size(); i++){
      Interface intf = (Interface)rt.getVInt().elementAt(i);
      output += intf.getType() + intf.getNum(intf.getNameInt()) + " " + "is up " + ",line protocol is " + intf.getStatus() + "\n";
      output += "Hardware is HD64570\n";
      output += "Internet address is " + intf.getIpAddress() + " " + intf.getSubnet() + "\n";
      output += "MTU 1500 bytes, BW 1544 Kbit, DLY 20000 usec, rely 255/255, load 1/255\n";
      output += "Encapsulation HDLC, loopback not set, keepalive set (10 sec)\n";
      output += "Last input 0:00:03, output 0:00:02, output hang never\n";
      output += "Last clearing o f\"show interface\" counters never\n";
      output += "Output queue 0/40, 0 drops; input queue 0/75, 0 drops\n";
      output += "5 minute input rate 0 bit/sec, 0 packets/sec\n";
      output += "5 minute output rate 0 bit/sec, 0 packets/sec\n";
      output += "  6000 packets input, 424701 bytes, 0 no buffer\n";
      output += "  Received 3177 broadcasets, 0 runts, 0 giants\n";
      output += "  0 input errors, 0 CRC, o frame, 0 overrun, 0 ignored, 0 abort\n";
      output += "  6185 packets output, 1400825 bytes, 0 underruns\n";
      output += "  0 output errors, o collisions, 2 interface resets, 0 restarts\n";
      output += "  0 output buffer failures, 0 output buffers swapped out\n";
      output += "  0 carrier transitions\n";
      output += "  DCD=up DSR=up DTR=up RTS=up CTS=up\n";
     // StatusPanel.showOutputConsole(output,r);
     // output="";
    }//end for
    rout = r;
     }
  }
  }
  public void showInt(Router r,String iname){
     output="";
/*    String s = "   Type \t Name \t      IP \t     Subnet \t Status \n";
    for (int i=0; i < r.getVInt().size(); i++){
      Interface intf = (Interface)r.getVInt().elementAt(i);
      if ((intf.getNameInt().equalsIgnoreCase(iname))||(intf.getIpAddress().equalsIgnoreCase(iname))){
      s = s + intf.getType() + "\t" + intf.getNameInt() + "\t" + intf.getIpAddress() + "\t" + intf.getSubnet() + "\t      " + intf.getStatus() + "\n";
      }
    }//end for
    output = s;
    System.out.println(s);
*/
    for (int i=0; i < r.getVInt().size(); i++){
      Interface intf = (Interface)r.getVInt().elementAt(i);
      if ((intf.getNameInt().equalsIgnoreCase(iname))||(intf.getIpAddress().equalsIgnoreCase(iname))){
        output += intf.getType() + intf.getNum(intf.getNameInt()) + " " + "is up " + ",line protocol is " + intf.getStatus() + "\n";
        output += "Hardware is HD64570\n";
        output += "Internet address is " + intf.getIpAddress() + " " + intf.getSubnet() + "\n";
        output += "MTU 1500 bytes, BW 1544 Kbit, DLY 20000 usec, rely 255/255, load 1/255\n";
        output += "Encapsulation HDLC, loopback not set, keepalive set (10 sec)\n";
        output += "Last input 0:00:03, output 0:00:02, output hang never\n";
        output += "Last clearing o f\"show interface\" counters never\n";
        output += "Output queue 0/40, 0 drops; input queue 0/75, 0 drops\n";
        output += "5 minute input rate 0 bit/sec, 0 packets/sec\n";
        output += "5 minute output rate 0 bit/sec, 0 packets/sec\n";
        output += "  6000 packets input, 424701 bytes, 0 no buffer\n";
        output += "  Received 3177 broadcasets, 0 runts, 0 giants\n";
        output += "  0 input errors, 0 CRC, o frame, 0 overrun, 0 ignored, 0 abort\n";
        output += "  6185 packets output, 1400825 bytes, 0 underruns\n";
        output += "  0 output errors, o collisions, 2 interface resets, 0 restarts\n";
        output += "  0 output buffer failures, 0 output buffers swapped out\n";
        output += "  0 carrier transitions\n";
        output += "  DCD=up DSR=up DTR=up RTS=up CTS=up\n";
        //StatusPanel.showOutputConsole(output,r);
        // output="";
      }
    }
    rout = r;
  }
  //----------Telnet Command----------//
  public void telnetCmd(Router r,String ip,Console rconsole){
    Interface itmp = new Interface();
    Router newrouter = null;
    boolean connection = false;
    boolean waitcon = false;
    //when send ip
    if (itmp.isIp(ip)){
      for (int i=0; i < NewRouter.vRouter.size(); i++){
        Router router = (Router)NewRouter.vRouter.elementAt(i);
        for (int j=0; j < router.getVInt().size(); j++){
          Interface intf = (Interface)router.getVInt().elementAt(j);
          if (ip.equalsIgnoreCase(intf.getIpAddress())){
            newrouter = router;
            if (router.getEnableTelnet()){
              int a =0;
              while ((!router.getName().equalsIgnoreCase(rconsole.getRouter(a).getName()))&&(a < rconsole.getRouters().size()-1)){
                a++;
              }//end while
              if (router.getName().equalsIgnoreCase(rconsole.getRouter(a).getName())){
                rconsole.getRouters().removeElementAt(a);
              }//end if
              if (router.getVtyPasswd() != null){
                r.setOldMode(r.getOldMode());
                r.setMode(12);
                rconsole.setTelnetRouter(router);
                waitcon = true;
              }
              else {
                r.setOldMode(r.getMode());
                rconsole.getRouters().addElement(router);
                router.setOldMode(router.getMode());
                router.setMode(2);
                rconsole.setRouter(router);
                connection = true;
              }
            }//end if
            else{
              //Ip is not correct
//              output += "Invalid Destination\n";
            }
          }//end if open port
          else {
//            output += "Not open Port\n";
          }
        }//end for interface
      }//end for router
      if (connection){
        output += "Telnet Success....\n";
        output += "Welcome to " + ((Router)rconsole.getRouters().lastElement()).getName() + "\n";
       // StatusPanel.showOutputConsole(output,r);
       // output="";
      }
      else {
        if (!waitcon){
          if (newrouter != null){
            output += "% Connection timed out; remote host not responding\n";
            output += "Can not connect to " + newrouter.getName() + "\n";
           // StatusPanel.showOutputConsole(output,r);
           // output="";
          }
          else {
            output += "Not have ip " + ip + "\n";
            //StatusPanel.showOutputConsole(output,r);
            //output="";
          }
        }
        else {
          System.out.println("wait to connection");
        }
      }
    }//end if
    else {
      //When send Router name
//      Dns dns = (Dns)r.getdns
    }//end else
    rout = r;
  }
  //------------Show IP Protocol----------------------------//
  public void showIPProtocol(Router r){
  output="";
    switch(r.getFlag()){
      case 'r' :
        output += "Routing Protocol is \"rip\"\nSending updates every ";
        output += r.getTime() + " seconds, hold down 180, flushed after 240\n";
        output += "Outgoing update filter list for all interfaces is not set\n";
        output += "Incoming update filter list for all interdaces is not set\n";
        output += "Redistributing : rip\n";
        output += "Routing for Networks :\n";
        output += r.getNetwork_address()+"\n";
        output += "Routing Information Sources :\n";
        output += "Gateway      Distance    Last Update\n";
        output += r.getNetwork_address()+"      120         0:00:00\n";
        output += "Distance: (default is 120)\n";
        //StatusPanel.showOutputConsole(output,r);
        // output="";
        break;
      case 'o' :
        output += "Routing Protocol is \"ospf\"\nSending updates every ";
        output += r.getTime() + " seconds, hold down 180, flushed after 240\n";
        output += "Outgoing update filter list for all interfaces is not set\n";
        output += "Incoming update filter list for all interdaces is not set\n";
        output += "Redistributing : ospf\n";
        output += "Routing for Networks :\n";
        output += r.getNetwork_address()+"\n";
        output += "Routing Information Sources :\n";
        output += "Gateway      Distance    Last Update\n";
        output += r.getNetwork_address()+"      120         0:00:00\n";
        output += "Distance: (default is 120)\n";
        //StatusPanel.showOutputConsole(output,r);
         //output="";
        break;
      default : output += "Not Have any protocol\n";//StatusPanel.showOutputConsole(output,r);output="";
      break;
    }
    rout = r;
  }
  //------------Show Version-------------------//
  public void showVersion(Router r){
    output="";
    String s = "Cisco Internetwork Operating System Software\n";
    s += "IOS(tm) 2500 Software (C3640-J-M), Version 11.0(6)P, SHARED PLATFORM,RELEASE SOFTWARE (fc1)\n";
    s += "Copy right(c) 1986-1977 by cisco Systems,Inc.\n";
    s += "Compiled Mon 12-May-97 15:07 by tej\n";
    s += "Image text-base:0x600088A0, data-base: 0x6075C000\n\n";
    s += "ROM: System Bootstrap, Version 11.1(7)AX SOFTWARE\n";

    s += "ROM: System Bootstrap, Version 5.2(8a), RELEASE SOFTWARE\n";
    s += "BOOTFLASH: 3000 Bootstrap Software (IGS-RXBOOT), Version 10.2(8a), RELEASE SOFTW\n";
    s += "ARE (fc1)\n\n";
    s += r.getName()+ " uptime is 11 minutes\n";
    s += "System restarted by power-on\n";
    s += "System image file is \"flash:c2500-d-l_113-5.bin\", booted via flash\n\n";
    s += "Bridging software.\n";
    s += "X.25 software, Version 3.0.0.\n";
    s += r.getMaxEth()+" Ethernet/IEEE 802.3 interface(s)\n";
    s += r.getMaxSerial()+" Serial network interface(s)\n";
    s += "32K bytes of non-volatile configuration memory.\n";
    s += "8192K bytes of processor board System flash (Read ONLY)\n\n";
    s += "Configuration register is 0x2102\n";
    output = s;
    //StatusPanel.showOutputConsole(output,r);
    // output="";
    rout = r;
  }
  //----------Show Cdp----------------//
  public void showCdp(Router r){
    output="";
    String s =  "Global CDP information:\n";
           s += "\tSending CDP packets every " + r.getCdp().getTimer() + " seconds\n";
           s += "\tSending a holdtime value of "+ r.getCdp().getHoldTime() +" seconds\n";
    output = s;
    rout = r;
    //StatusPanel.showOutputConsole(output,r);output="";
  }
  public void showCdpEntry(Router r,String arg){
     output="";
    if (arg.equalsIgnoreCase("*")){
      boolean adj = false;
      Interface icon = null;
      Interface inf = null;
      String s="";
      for (int a=0; a < NewRouter.vRouter.size(); a++){
        Router router = (Router)NewRouter.vRouter.elementAt(a);
        adj = false;
        icon = null;
        inf = null;
        if (!router.getName().equals(r.getName())){
          for (int b=0; b < router.getVInt().size(); b++){
            Interface iremote = (Interface)router.getVInt().elementAt(b);
            for (int c=0; c < r.getVInt().size();c++){
              Interface i = (Interface)r.getVInt().elementAt(c);
              if (i.findNetAdd().equalsIgnoreCase(iremote.findNetAdd())){
                adj = true;
                icon = iremote;
                inf = i;
              }//connect
            }//interface i
          }//interface iremote
        }//same router
        if (adj){
          output += "-------------------\n";
          output += "Device ID: " + router.getName() + "\n";
          output += "Entry address(es):\n";
          output += "Ip address: " + icon.getIpAddress() + "\n";
          output += "Novell address: 20A.0010.7be8.25db\n";
          output += "Interface: " + icon.getType() + icon.getNum() + ", Port ID (outgoing port): " + inf.getType() + inf.getNum() + "\n";
          output += "Holdtime " + r.getCdp().getHoldTimePacket() + " sec\n";
          //StatusPanel.showOutputConsole(output,r);output="";
        }
      }//router
      s = output;
      System.out.println(s);
    }//show all
    else {
      int a=0;
      Router router = (Router)NewRouter.vRouter.elementAt(a);
      boolean found = false;
      while ((!router.getName().equalsIgnoreCase(arg))&&(a < NewRouter.vRouter.size())){
        router = (Router)NewRouter.vRouter.elementAt(a);
        a++;
      }//search router
      int b=0;
      while ((b < router.getVInt().size())&&(!found)){
        Interface iremote = (Interface)router.getVInt().elementAt(b);
        int c=0;
        while ((c < r.getVInt().size())&&(!found)){
          Interface i = (Interface)r.getVInt().elementAt(c);
          if (iremote.findNetAdd().equals(i.findNetAdd())){
            output += "-------------------------------\n";
            output += "Device ID: " + router.getName() + "\n";
            output += "Entry address(es):\n";
            output += "Ip address: " + iremote.getIpAddress() + "\n";
            output += "Novell address: 20A.0010.7be8.25db\n";
            output += "Interface: " + iremote.getType() + iremote.getNum() + ", Port ID (outgoing port): " + i.getType() + i.getNum() + "\n";
            output += "Holdtime " + r.getCdp().getHoldTimePacket() + " sec\n\n";
            //StatusPanel.showOutputConsole(output,r);output="";
          }
          c++;
        }//main
        b++;
      }//remote
    }
    rout = r;
  }
  //----------------------------------------------------------------------------getOutput
  static String getOutput()
  {
    return output;
  }
  //------------Show cdp interface--------///
  public void showCdpInt(Router r){
    for(int j=0;j<NewRouter.vRouter.size();j++)
    {
      Router rt = (Router)NewRouter.vRouter.elementAt(j);
      if(rt.getName().equalsIgnoreCase(r.getName()))
      {
        r = rt;
        output="";
        if(r.getVInt().size()!=0)
        {
          for(int i=0;i<r.getVInt().size();i++)
          {
            Interface intf = (Interface)r.getVInt().elementAt(i);

            output += ""+intf.getNameInt()+"is"+intf.getStatus()+", line protocol is up \n";
          }
          output += "    Encapsulation ARPA \n";
          output += "    Sending  CDP  packets every "+r.getCdp().getTimer()+" seconds \n";
          output += "    Holdtime is "+r.getCdp().getHoldTime()+" seconds \n\n";
        }
        else{
          for(int i=0;i<r.getMaxEth();i++)
          {
            output += "Ethernet E"+i+" is Down, line protocol is up \n";
          }
          for(int i=0;i<r.getMaxSerial();i++)
          {
            output += "Serial S"+i+" is Down, line protocol is up \n";
          }
          for(int i=0;i<r.getMaxToken();i++)
          {
            output += "Token T"+i+" is Down, line protocol is up \n";
          }
          output += "    Encapsulation ARPA \n";
          output += "    Sending  CDP  packets every "+r.getCdp().getTimer()+"seconds \n";
          output += "    Holdtime is "+r.getCdp().getHoldTime()+"seconds \n\n";
        }
      }
    }
  }
  //-------------Show cdp neighbors--------//
  public void showCdpNeighbors(Router r){
    output="";
    output += "Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridges,\n";
    output += "S - Switch, H - Host, I - IGMP, r - Repeater\n";
    output += "Device ID \t Local Interface \t Holdtime \t Capability \t Platform \t   Port ID\n";
    //StatusPanel.showOutputConsole(output,r);output="";
    for (int a=0;a < NewRouter.vRouter.size(); a++){
      Router router = (Router)NewRouter.vRouter.elementAt(a);
      Interface icon = null,inf=null;
      boolean found = false;
      if (!router.getName().equals(r.getName())){
        int b=0;
        while ((b < router.getVInt().size())&&(!found)){
          Interface iremote = (Interface)router.getVInt().elementAt(b);
          int c=0;
          while ((c < r.getVInt().size())&&(!found)){
            Interface i = (Interface)r.getVInt().elementAt(c);
            if (iremote.findNetAdd().equals(i.findNetAdd())){
              found = true;
              icon = iremote;
              inf = i;
            }
            c++;
          }//interface
          b++;
        }//interface remote
        if (found){
          output += router.getName() + "\t" + icon.getType() + icon.getNum() + "\t" + router.getCdp().getHoldTimePacket() + "\tR\t";
          switch (router.getModel()){
            case 1 : output += "2501\t";break;
            case 2 : output += "2502\t";break;
            case 3 : output += "2513\t";break;
            case 4 : output += "2514\t";break;
            case 5 : output += "2515\t";break;
            default : output += "2500\t";
          }//end switch
          output += inf.getType() + inf.getNum() +"\n";//output="";
         // StatusPanel.showOutputConsole(output,r);
        }
      }//same router
    }//router
    output += "\n";
    rout = r;
    //StatusPanel.showOutputConsole(output,r);output="";
  }
  //--------------Show Routing Table---------------------------//
  public void showIpRoute(Router r){
    output="";
    String s = "Codes: \t C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP \n"
                      +"\t D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area \n"
                      +"\t N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2 \n"
                      +"\t E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP \n"
                      +"\t i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, * - candidate default \n"
                      +"\t U - per-user static route, o - ODR \n\n Gateway of last resort is not set \n";
    for (int i=0;i < r.getVrt().size();i++){
      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
      s = s + rt.getRouteType() + "   " + rt.getIpDestination();
      switch (rt.getRouteType()){
        case 'c' : s = s + " is directly connected, "+rt.getInterface().getType()+rt.getInterface().getNameInt().charAt(rt.getInterface().getNameInt().length()-1)+" " +rt.getSubnet()+"\n";break;
        case 's' : s = s +" [1/0] via, " + rt.getGateway() + " " + rt.getSubnet() + "\n";break;
        case 'r'  : s = s + "[120/"+rt.getMatrice() +"] via, "+ rt.getGateway() + " " + rt.getSubnet() + "\n";
      }//end switch
    }//end for
//    s = s + "\n\n Destination \t Gateway \t Interface \t matric \n----------------------------------------------------------------------------\n";
    for (int i=0; i < r.getVrt().size();i++){
      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
//      s = s + rt.getIpDestination() + "\t" + rt.getGateway() + "\t"+rt.getInterface().getNameInt()+"\t" + rt.getMatrice()+"\n";
    }//end for
    output = s;
    rout = r;
    //StatusPanel.showOutputConsole(output,r);output="";
//    System.out.println(s);
  }
  public void showIpRoute(Router r,char f){
    output="";
    String s = "Codes: \t C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP \n"
                      +"\t D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area \n"
                      +"\t N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2 \n"
                      +"\t E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP \n"
                      +"\t i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, * - candidate default \n"
                      +"\t U - per-user static route, o - ODR \n\n Gateway of last resort is not set \n";
    for (int i=0;i < r.getVrt().size();i++){
      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
      if (rt.getRouteType() == f){
        s = s + rt.getRouteType() + "    " + rt.getIpDestination();
        switch (rt.getRouteType()){
          case 'c' : s = s + "  is directly connected, "+rt.getInterface().getType()+rt.getInterface().getNameInt().charAt(rt.getInterface().getNameInt().length()-1)+" " +rt.getSubnet()+"\n";
                     break;
          case 's' : s = s +"  [1/0]  via, " + rt.getGateway() + "   " + rt.getSubnet() + "\n";
                     break;
          case 'r'  : s = s + "  [120/"+rt.getMatrice() +"]  via, "+ rt.getGateway() + "   " + rt.getSubnet() + "\n";
                     break;
        }//end switch
      }//end if
    }//end for
    s = s + "\n\n Destination \t Gateway \t Interface \t matric \n----------------------------------------------------------------------------\n";
    for (int i=0; i < r.getVrt().size();i++){
      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);
      if (rt.getRouteType() == f){
        s = s + rt.getIpDestination() + "\t" + rt.getGateway() + "\t"+rt.getInterface().getNameInt()+"\t" + rt.getMatrice()+"\n";
      }
    }//end for
    output = s;
    rout = r;
  }
//-------------------debug ip rip-------------------------------------//
  public void debugiprip(Router router)
  {
    output="";
    String s ="RIP  protocol  debugging  is  on\n";
    output = s;
    router.setdebugrip(true);
  }
  public void undebugiprip(Router router)
 {
   output="";
   String s ="RIP  protocol  debugging  is  off\n";
   output = s;
   router.setdebugrip(false);
  }
  //-----------------show ip route ospf-------------------------------//
  public String show_ip_route_ospf(Router r,boolean c){
    String final_output="Show IP Route \n"+"Codes: \t C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP \n"
                        +"\t D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area \n"
                        +"\t N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2 \n"
                        +"\t E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP \n"
                        +"\t i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, * - candidate default \n"
                        +"\t U - per-user static route, o - ODR \n\n Gateway of last resort is not set \n";
    int w = NewRouter.vRouter.size();
    int order = findOrder(r);
    Interface tmp;
    Vector ip = new Vector();
    System.out.println("c="+c);
    if (true){
      for (int i=0;i<r.getVInt().size();i++){
        Interface intf = (Interface)r.getVInt().elementAt(i);
        final_output += "c\t"+intf.getNetAddress()+" is directly connected, "+intf.getNameInt()+" "+intf.getSubnet()+"\n";
        ip.addElement(intf.getNetAddress());
      }
    }
    for (int i=0;i<w;i++){
      try{
        if (i!=order){
          Router rr = (Router)NewRouter.pathx[order][i].lastElement();
          for (int j=0;j<rr.getVInt().size();j++){
            Interface intf = (Interface)rr.getVInt().elementAt(j);
            String trace = trace_ospf(r,intf.getIpAddress());
            System.out.println("start ****->"+trace);
            Vector v = cut_string(trace);
            System.out.println("end->"+trace);
            if (!check_ip_route_ospf(ip,intf.getNetAddress())){
              ip.addElement(intf.getNetAddress());
              final_output += "o\t"+intf.getNetAddress()+" [110/20] via, "+v.firstElement()+"\n";
            }
            //final_output += "o\t"+last+"[110/20] via, "+desIntf.getIpAddress()+" 00:41:52 ,"+desIntf.getNameInt()+" "+desIntf.getSubnet()+"\n";
          }
        }// i != order
      }//try
      catch (Exception e){
        System.out.println(e);
      }//catch
    }
    rout = r;
    return final_output;
  }
  private boolean check_ip_route_ospf(Vector v,String s){
    boolean check = false;
    int i=0;
    while((i<v.size())&&(!check)){
      if (((String)v.elementAt(i)).equalsIgnoreCase(s))
        check = true;
      i++;
    }
    return check;
  }
  private Vector cut_string(String s){
    Vector v = new Vector();
    int len = s.length();
    int i =0;
    String tmp="";
    while(i<len){
      if (s.charAt(i)!='\n'){
        tmp +=s.charAt(i);
      }
      else{
        System.out.println("tmp="+tmp.length());
        try{
          tmp = tmp.substring(4,tmp.length()-1);
          v.addElement(tmp);
          tmp="";
        }
        catch (Exception exp){
        }
      }
      i++;
    }
    return v;
  }

  public void showCmd1(Router r){
    output += "Exex Commands:\n";
    output += "enable           \t\tTurn on privileged commands\n";
    output += "exit             \t\tExit from the EXEC\n";
    output += "ping             \t\tSend echo messages\n";
    output += "show             \t\tShow running system information\n";
    output += "traceroute       \t\tTrace route to destination\n\n";
   // StatusPanel.showOutputConsole(output,r);
   // output="";
    rout = r;
  }
  public void showCmd2(Router r){
    output += "Exex Commands:\n";
    output += "config           \t\tEnter configuration mode\n";
    output += "copy             \t\tCopy configuration or image data\n";
    output += "debug            \t\tDebugging functions\n";
    output += "disable          \t\tTurn off privileged commands\n";
    output += "erase            \t\tErase flash or configuration memory\n";
    output += "ping             \t\tSend echo messages\n";
    output += "show             \t\tShow running system information\n";
    output += "terminal         \t\tShow running system information\n";
    output += "traceroute       \t\tTrace route to destination\n";
    output += "undebug          \t\tDisable debugging functions\n\n";
    //StatusPanel.showOutputConsole(output,r);
    // output="";
  }
  public void showCmd3(Router r){
    output += "Configure commands:\n";
    output += "access-list      \t\tAdd an access list entry\n";
    output += "enable           \t\tModify enable password parameter\n";
    output += "exit             \t\tExit from configure mode\n";
    output += "hostname         \t\tSet system's network name\n";
    output += "interface        \t\tSelect an interface to configure\n";
    output += "ip               \t\tGlobal IP configuration subcommands\n";
    output += "no               \t\tNegate a command or set its defaults\n";
    output += "router           \t\tSet protocol\n\n";
    //StatusPanel.showOutputConsole(output,r);
    // output="";
  }
  public void showCmd4(Router r){
    output += "Interface configuration commands:\n";
    output += "bandwidth        \t\tSet bandwidth informational parameter\n";
    output += "cdp              \t\tCDP interface subcommands\n";
    output += "clock            \t\tConfigure serial interface clock\n";
    output += "end              \t\tExit from configure mode\n";
    output += "exit             \t\tExit from interface configuration mode\n";
    output += "interface        \t\tSelect an interface to configure\n";
    output += "ip               \t\tInterface Internet Protocol config commands\n";
    output += "no               \t\tNegate a command or set its defaults\n";
    output += "ring-speed       \t\tSet ring speed of token ring\n";
    output += "shutdown         \t\tShutdown the selected interface\n\n";
    //StatusPanel.showOutputConsole(output,r);
    //output="";
  }
  public void showCmd5(Router r){
    output += "Router configuration commands:\n";
    output += "network          \t\tEnable routing on an IP network\n";
    output += "passive-interface\tSuppress routing updates on an interface\n";
    output += "no               \t\tNegate a command or set its defaults\n\n";

    //StatusPanel.showOutputConsole(output,r);
    //output="";
  }
  public void showCmd6(Router r){
    output += "Line configuration commands:\n";
    output += "login            \t\tEnable password checking\n";
    output += "password         \t\tSet a password\n";
    output += "no               \t\tNegate a command or set its defaults\n";
   // StatusPanel.showOutputConsole(output,r);
   // output="";
  }
  //----------------Traceroute-----------------//
  //Normal Trace
  public void trace(Router r,String des){
    int a=0;
    int b=0;
    RoutingTable rt = null;
    Router tmp = null;
    Interface inf = null;
    String nextgw="";
    String gwout = "";
    boolean found = false;
    boolean havedes = false;
    while ((!havedes)&&(a < NewRouter.vRouter.size() )){
      b=0;
      Router rtmp = (Router)NewRouter.vRouter.elementAt(a);
      while ((!havedes)&&(b < rtmp.getVInt().size() )){
        Interface i1 = (Interface)rtmp.getVInt().elementAt(b);
        if (i1.getIpAddress().equalsIgnoreCase(des)){
          inf = i1;
          havedes = true;
        }//end if
        b++;
      }//end while
      a++;
    }//end while
    // Correct IP Address
    int i=0;
    if (inf != null){
      //search path from routing table when des = des from user command
      rt = (RoutingTable)r.getVrt().firstElement();
      nextgw = rt.getGateway();
      while((i < r.getVrt().size())&&(!rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd()))){
        rt = (RoutingTable)r.getVrt().elementAt(i);
        //gateway is interface that adj
        nextgw = rt.getGateway();
        gwout = inf.getIpAddress();
        i++;
      }//end while
      //if found in routing table
      boolean doagain = false;
      if (rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd())){
        if (rt.getRouteType() == 'r'){
          if (rt.getMatrice() < 16){
            doagain = true;
          }//end if
        }//end if
        else if (rt.getRouteType() == 'o'){
          if (rt.getMatrice() < 30){
            doagain = true;
          }//end if
        }//end if
        else if (rt.getRouteType() == 'c'){
          doagain = true;
        }
        if (doagain){
          //find route that have interface of gateway value
          for (int j=0; j < NewRouter.vRouter.size(); j++){
            //Router 1
            tmp = (Router)NewRouter.vRouter.elementAt(j);
            //Interface 1 of Router 1
            for(int k=0; k < tmp.getVInt().size(); k++){
              Interface intf = (Interface)tmp.getVInt().elementAt(k);
              String i1 = intf.getIpAddress();
              if (intf.getIpAddress().equalsIgnoreCase(nextgw)){
                r = tmp;
                found = true;
              }//end if
            }//end for
          }//end for
          if (!nextgw.equals("0.0.0.0")){
            System.out.println("nextgw"+nextgw);
            numtrace++;
            output += "  ["+numtrace+"]  "+nextgw + "\n";
            //StatusPanel.showOutputConsole(output,r);output="";
           // Path.addElement(new String(nextgw));// kept value to display GUI
            ip_shortestPath = nextgw;
            if (found){
              trace(r,des);
            }//end if
          }//end if
          else {
              System.out.println(des + "\nComplete\n");
              numtrace++;
              output += "  ["+numtrace+"]  "+des + "\nComplete\n";
              //StatusPanel.showOutputConsole(output,r);output="";
             // Path.addElement(new String(des));// kept value to display GUI
              ip_shortestPath = des;
          }
        }//end if
        else {
          //when have in routing table but unreachable
          System.out.println("Destination Unreachable");
          output += "Destination Unreachable\n";
         // StatusPanel.showOutputConsole(output,r);output="";
        }
      }//end if
      else{
        //not found destination in routing table
        output += "Incorrect Destination\n";
        //StatusPanel.showOutputConsole(output,r);output="";
        System.out.println("Incorrect Destination");
        found = false;
      }//end else
    }//end if
    else {
      System.out.println("Incorrect Destination");
      output +=" Incorrect Destination\n";
      //StatusPanel.showOutputConsole(output,r);output="";
    }
    rout = r;
  }//end function
 // trace route to show
  public void trace_gui(Router r,String des){
    int a=0;
    int b=0;
    RoutingTable rt = null;
    Router tmp = null;
    Interface inf = null;
    String nextgw="";
    String gwout = "";
    boolean found = false;
    boolean havedes = false;
    while ((!havedes)&&(a < NewRouter.vRouter.size() )){
      b=0;
      Router rtmp = (Router)NewRouter.vRouter.elementAt(a);
      while ((!havedes)&&(b < rtmp.getVInt().size() )){
        Interface i1 = (Interface)rtmp.getVInt().elementAt(b);
        if (i1.getIpAddress().equalsIgnoreCase(des)){
          inf = i1;
          havedes = true;
        }//end if
        b++;
      }//end while
      a++;
    }//end while
    // Correct IP Address
    int i=0;
    if (inf != null){
      //search path from routing table when des = des from user command
      rt = (RoutingTable)r.getVrt().firstElement();
      nextgw = rt.getGateway();
      while((i < r.getVrt().size())&&(!rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd()))){
        rt = (RoutingTable)r.getVrt().elementAt(i);
        //gateway is interface that adj
        nextgw = rt.getGateway();
        gwout = inf.getIpAddress();
        i++;
      }//end while
      //if found in routing table
      boolean doagain = false;
      if (rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd())){
        if (rt.getRouteType() == 'r'){
          if (rt.getMatrice() < 16){
            doagain = true;
          }//end if
        }//end if
        else if (rt.getRouteType() == 'o'){
          if (rt.getMatrice() < 30){
            doagain = true;
          }//end if
        }//end if
        else if (rt.getRouteType() == 'c'){
          doagain = true;
        }
        if (doagain){
          //find route that have interface of gateway value
          for (int j=0; j < NewRouter.vRouter.size(); j++){
            //Router 1
            tmp = (Router)NewRouter.vRouter.elementAt(j);
            //Interface 1 of Router 1
            for(int k=0; k < tmp.getVInt().size(); k++){
              Interface intf = (Interface)tmp.getVInt().elementAt(k);
              String i1 = intf.getIpAddress();
              if (intf.getIpAddress().equalsIgnoreCase(nextgw)){
                r = tmp;
                found = true;
              }//end if
            }//end for
          }//end for
          if (!nextgw.equals("0.0.0.0")){
            System.out.println("nextgw"+nextgw);
            numtrace++;
           // output += "  ["+numtrace+"]  "+nextgw + "\n";
            Path.addElement(new String(nextgw));// kept value to display GUI
            ip_shortestPath = nextgw;
            if (found){
              trace(r,des);
            }//end if
          }//end if
          else {
              System.out.println(des + "\nComplete\n");
              numtrace++;
             // output += "  ["+numtrace+"]  "+des + "\nComplete\n";
              Path.addElement(new String(des));// kept value to display GUI
              ip_shortestPath = des;
          }
        }//end if
        else {
          //when have in routing table but unreachable
          System.out.println("Destination Unreachable");
          JOptionPane.showMessageDialog( null , "Destination Unreachable ", " Message ", JOptionPane.INFORMATION_MESSAGE );
        }
      }//end if
      else{
        //not found destination in routing table
        output += "Incorrect Destination\n";
        //StatusPanel.showOutputConsole(output,r);output="";
        JOptionPane.showMessageDialog( null , "Incorrect Destination ", " Message ", JOptionPane.INFORMATION_MESSAGE );
        found = false;
      }//end else
    }//end if
    else {
      System.out.println("Incorrect Destination");
     JOptionPane.showMessageDialog( null , "Incorrect Destination ", " Message ", JOptionPane.INFORMATION_MESSAGE );
    }
    rout = r;
  }//end function
 static Vector getPath()
 {
   return Path;
 }
  //----------------Ping------------//
  //Normal Ping
  public void ping(Router r,String des){
    int a=0;
    int b=0;
    RoutingTable rt = null;
    Router tmp = null;
    Interface inf = null;
    String nextgw="";
    String gwout = "";
    boolean found = false;
    boolean havedes = false;
    while ((!havedes)&&(a < NewRouter.vRouter.size() )){
      b=0;
      Router rtmp = (Router)NewRouter.vRouter.elementAt(a);
      while ((!havedes)&&(b < rtmp.getVInt().size() )){
        Interface i1 = (Interface)rtmp.getVInt().elementAt(b);
        if (i1.getIpAddress().equalsIgnoreCase(des)){
          inf = i1;
          havedes = true;
        }//end if
        b++;
      }//end while
      a++;
    }//end while
    // Correct IP Address
    int i=0;
    if (inf != null){
      //search path from routing table when des = des from user command
      rt = (RoutingTable)r.getVrt().firstElement();
      nextgw = rt.getGateway();
      while((i < r.getVrt().size())&&(!rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd()))){
        rt = (RoutingTable)r.getVrt().elementAt(i);
        //gateway is interface that adj
        nextgw = rt.getGateway();
        gwout = inf.getIpAddress();
        i++;
      }//end while
      //if found in routing table
      boolean doagain = false;
      if (rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd())){
        if (rt.getRouteType() == 'r'){
          if (rt.getMatrice() < 16){
            doagain = true;
          }//end if
        }//end if
        else if (rt.getRouteType() == 'o'){
          if (rt.getMatrice() < 30){
            doagain = true;
          }//end if
        }//end if
        else if ((rt.getRouteType() == 'c')||(rt.getRouteType() == 's')){
          doagain = true;
        }
        if (doagain){
          //find route that have interface of gateway value
          for (int j=0; j < NewRouter.vRouter.size(); j++){
            //Router 1
            tmp = (Router)NewRouter.vRouter.elementAt(j);
            //Interface 1 of Router 1
            for(int k=0; k < tmp.getVInt().size(); k++){
              Interface intf = (Interface)tmp.getVInt().elementAt(k);
              String i1 = intf.getIpAddress();
              if (intf.getIpAddress().equalsIgnoreCase(nextgw)){
                //-- find source address -------------------------------------------------------

                 //-- find router and interface position  (next gateway)
                 for( int aa = 0 ; aa < NewRouter.vRouter.size() ; aa++ ){

                   Router rr = (Router)NewRouter.vRouter.elementAt(aa);

                   for( int bb = 0 ; bb < rr.getVInt().size() ; bb++ ){

                     Interface ii = (Interface)rr.getVInt().elementAt(bb);

                     if( ii.getIpAddress().equalsIgnoreCase(nextgw)){

                       inRouter = aa;
                       inInt = bb;
                       gwNetaddress = ii.getNetAddress();
                     }
                   }
                 }

                 //-- find out interface
                 for( int aa = 0 ; aa < NewRouter.vRouter.size() ; aa++ ){

                   Router rr = (Router)NewRouter.vRouter.elementAt(aa);

                   for( int bb = 0 ; bb < rr.getVInt().size() ; bb++ ){

                     Interface ii = (Interface)rr.getVInt().elementAt(bb);

                     if( ii.getNetAddress().equalsIgnoreCase(gwNetaddress)
                         && !ii.getIpAddress().equalsIgnoreCase(nextgw)){

                       outRouter = aa;
                       outInt = bb;
                       outIP = ii.getIpAddress();

                       if( !test ){
                         //-- get source ip address
                         sourceIP = ii.getIpAddress();
                         sourceRouter = aa;
                         sourceInt = bb;
                         test = true;
                       }
                     }
                   }
                 }

               //-------------------------------------------------------------------------------
               //-- out interface
               boolean isPassOut = true;
               //-- get interface out
               Router outR = (Router)NewRouter.vRouter.elementAt( outRouter );
               Interface outI = (Interface)outR.getVInt().elementAt( outInt );
               System.out.println( " Router Out : " + outR.getName() + " Interface Out : " + outI.getIpAddress() );

               if( !outI.getAccessListNumber().equalsIgnoreCase("")
                   && outI.getConditionAccessLsit().equalsIgnoreCase("out") )

                 isPassOut = outR.isPassAccessList( outI.getAccessListNumber() , sourceIP , des , "icmp" , "" , "" );


               //----------------------  Test Accesslist -----------------------------------------------

               r = tmp;
               found = true;

               boolean isPassIn = true;
               //-- get interface out
               Router inR = (Router)NewRouter.vRouter.elementAt( inRouter );
               Interface inI = (Interface)inR.getVInt().elementAt( inInt );
               System.out.println( " Router In : " + inR.getName() + " Interface In : " + inI.getIpAddress() );
               if( !inI.getAccessListNumber().equalsIgnoreCase("")
                  && inI.getConditionAccessLsit().equalsIgnoreCase("in") )
                 isPassIn = inR.isPassAccessList( inI.getAccessListNumber() , sourceIP , des , "icmp" , "" , "" );


               //-- set output
               if(!isPassOut){
                 //output = " Block By Access of Router " + outR.getName() + " Interface ( out ) " + outI.getNameInt() + "\n";
                 isPass = true;
               }else if(!isPassIn){
                 //output = " Block By Access of Router " + inR.getName() + " Interface ( in ) " + inI.getNameInt() + "\n";
                 isPass = true;
               }

  //--------------------------------------------------------------------------------------
              }//end if
            }//end for
          }//end for
          if (!nextgw.equals("0.0.0.0")){
//            System.out.println("nextgw"+nextgw);
//            output += nextgw + "\n";
            if (found){
              ping(r,des);
            }//end if
          }//end if
          else if(isPass) {
            //-- Access List Blocked
            output += "Type escape sequence to abort.\n";
            output += "Sending 5, 100-byte ICMP Echos to "+des+" timeout is 2 seconds:\n";
            output += "....\n";
            output += "Success rate is 0 percent (0/5)\n";
          }
          else {
          System.out.println("success");
          //when have in routing table
            output += "Type escape sequence to abort.\n";
            output += "Sending 5, 100-byte ICMP Echos to "+ des+" timeout is 2 seconds:\n";
            output += "!!!!\n";
            output += "Success rate is 100 percent (5/5), round-trip min/avg/max = 4/4/4 ms\n";
            //StatusPanel.showOutputConsole(output,r);output="";
          }
        }//end if
        else {
          //when have in routing table but unreachable
          System.out.println("Destination Unreachable");
            System.out.println("Fail");
            output += "Type escape sequence to abort.\n";
            output += "Sending 5, 100-byte ICMP Echos to "+des+" timeout is 2 seconds:\n";
            output += "....\n";
            output += "Success rate is 0 percent (0/5)\n";
            //StatusPanel.showOutputConsole(output,r);output="";
        }
      }//end if
      else{
        //not found destination in routing table
//        output += "Incorrect Destination\n";
        System.out.println("Not found in routing Table");
        output += "Type escape sequence to abort.\n";
        output += "Sending 5, 100-byte ICMP Echos to "+des+" timeout is 2 seconds:\n";
        output += "....\n";
        output += "Success rate is 0 percent (0/5)\n";
       // StatusPanel.showOutputConsole(output,r);output="";
        found = false;
      }//end else
    }//end if
    else {
      System.out.println("not found this ip in network");
      output +=" Incorrect Destination\n";
      //StatusPanel.showOutputConsole(output,r);output="";
    }
    rout = r;
  }//end function

  public Command() {
  }
  //-----------Show History--------------------//
  public void showHistory(Router r) {
    for(int i=0; i < r.getHistory().size(); i++){
      output = output + (String)r.getHistory().elementAt(i) + "\n";
      //StatusPanel.showOutputConsole(output,r);output="";
    }//end for
  }//end Show History
  //----------Read StartUp-------------------//
  public void readStartUp(){

    try{
      FileReader fin = new FileReader(filename);
      BufferedReader bin = new BufferedReader(fin);
      String s;
      Router r=null;
      AccessList ac=null;
      Status stat =null;
      int type=0;
      Interface i1=new Interface();
      int linenum=0;
      int routerIndex = -1;
      boolean found = false;
      boolean line =false;

      //while not End of File
      while ((s = bin.readLine()) != null){

        linenum++;
        //while not end of Router
        StringTokenizer st = new StringTokenizer(s);
        if (s.startsWith("hostname")){
          //set Name of Router
          if (st.hasMoreTokens()){
            String name = (String)st.nextToken();
            name = (String)st.nextToken();
            for(int i=0;i<NewRouter.vRouter.size();i++)
            {
              Router r1 = (Router)NewRouter.vRouter.elementAt(i);
              if(r1.getName().equalsIgnoreCase(name))
              {
                found = true;
                routerIndex = i;
              }
            }//end for
          }//end if
        }//end if
        //set password
        else if (s.startsWith("enable password ")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          String pwd = (String)st.nextToken();
          if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            r1.setEnablePasswd(true);
            r1.setPasswd(pwd);
          }
          System.out.print("pwd: "+pwd);
        }
        //add new Interface
        else if (s.startsWith("interface")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            i1.AddNewInt(r1,name1);
          }
        }
        //set ip address
        else if (s.startsWith("ip address")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          String ip = (String)st.nextToken();
          String subnet = (String)st.nextToken();
          if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            i1.setIpAddress(r1,ip,subnet);
            stat.setInt(r1);
            StatusPanel.showStatus_int(r1);
          }
          //stat.setInt(r);
          //StatusPanel.showStatus_int(r);
          //------------------
        }

        else if (s.startsWith("ip access-group")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          String group = (String)st.nextToken();
          String cond = (String)st.nextToken();
          if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            i1 = (Interface)r1.getVInt().lastElement();
            i1.setAccessListNumber(group);
            i1.setConditionAccessList(cond);
          }
        }
        else if (s.startsWith("access-list")){
         String name1 = (String)st.nextToken();
         //name1 = (String)st.nextToken();
         String group = (String)st.nextToken();
         String cond = (String)st.nextToken();
         String param = (String)st.nextToken();
         ac = new AccessList();
         if(found)
         {
           Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
           ac.setNumber(group);
           ac.setCondition(cond);
         // standard ip
         if((Interface.isIp(param))||(param.equalsIgnoreCase("host")))
         {
           if(Interface.isIp(param))
           {
             String s_w = (String)st.nextToken();
             ac.setSource(param);
             ac.setSourceWildCard(s_w);
           }
           if(param.equalsIgnoreCase("host"))
           {
             String wild_c = (String)st.nextToken();
             ac.setSource(wild_c);
            }
         }//end if
         // extended
         else if((param.equalsIgnoreCase("ip"))||(param.equalsIgnoreCase("icmp")))
         {

           String s_ip = (String)st.nextToken();
           String s_w  = (String)st.nextToken();
           String d_ip = (String)st.nextToken();
           String d_w  = (String)st.nextToken();
           ac.setProtocal(param);
           ac.setSource(s_ip);
           ac.setSourceWildCard(s_w);
           ac.setDestination(d_ip);
           ac.setDesWildCard(d_w);
         }
         //
         else if((param.equalsIgnoreCase("tcp")) || (param.equalsIgnoreCase("udp")))
         {
           String s_ip  = (String)st.nextToken();
           String s_w   = (String)st.nextToken();
           String op1   = (String)st.nextToken();
           String port1 = (String)st.nextToken();
           String d_ip  = (String)st.nextToken();
           String d_w   = (String)st.nextToken();
           String op2   = (String)st.nextToken();
           String port2 = (String)st.nextToken();
           ac.setProtocal(param);
           ac.setSource(s_ip);
           ac.setSourceWildCard(s_w);
           ac.setOperator1(op1);
           ac.setPort1(port1);
           ac.setDestination(d_ip);
           ac.setDesWildCard(d_w);
           ac.setOperator2(op2);
           ac.setPort2(port2);

         }
         r1.getVAccess().addElement(ac);
         }//end found
        }
        //no shut
        else if (s.startsWith("shutdown")){
         if(found)
           {
             Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
              i1 = (Interface)r1.getVInt().lastElement();
              i1.shutInt(r1);
              stat.setInt(r1);
              StatusPanel.showStatus_int(r1);
          }

          //stat.setInt(r);
        }
        else if (s.startsWith("no shutdown")){
          if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            i1 = (Interface)r1.getVInt().lastElement();
            i1.noshutInt(r1);
            stat.setInt(r1);
            StatusPanel.showStatus_int(r1);
          }

          //stat.setInt(r);
        }
        else if (s.startsWith("router rip")){
        if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            Rip ripf = (Rip)r1.getRIP();
            ripf.start();
            r1.setFlag('r');
            r1.setProtocol("RIP");
          }

          //stat.setInt(r);
          //StatusPanel.showStatus_name(r);
        }
        else if (s.startsWith("router ospf")){
        if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            Ospf ospff = (Ospf)r1.getOSPF();
            ospff.start();
            r1.setFlag('o');
            r1.setProtocol("OSPF");
             }
        }
        else if (s.startsWith("network")){
          if(found)
          {
            String name1 = (String)st.nextToken();
            name1 = (String)st.nextToken();
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            r1.setNetwork_address(name1);
          }
        }
        else if (s.startsWith("line vty 0 4")){
          if(found)
          {
            line =true;
          }
        }
        else if (s.startsWith("password")){
          if(found)
          {
            if(line)
            {
            String name1 = (String)st.nextToken();
            name1 = (String)st.nextToken();
           // name1 = (String)st.nextToken();
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            r1.setVtyPasswd(name1);
            }
          }
        }
        else if (s.startsWith("ip route")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          String des = (String)st.nextToken();
          String subnet = (String)st.nextToken();
          String gw = (String)st.nextToken();
          String intip = (String)st.nextToken();
          String nameint = (String)st.nextToken();
          String netAdd = (String)st.nextToken();
          String status = (String)st.nextToken();
          String intsubnet = (String)st.nextToken();
          String inttype = (String)st.nextToken();
          if(found)
          {
            Router r1 = (Router)NewRouter.vRouter.elementAt(routerIndex);
            RoutingTable rt = new RoutingTable();
            rt.setIpRoute(r1,des,subnet,gw,intip,nameint,netAdd,status,intsubnet,inttype);
            r1.setFlag('s');
            r1.setProtocol("STATIC");
            //stat.setInt(r);
          }

          //stat.setInt(r);
          //StatusPanel.showStatus_name(r);
        }

           // StatusPanel.showStatus_int(r);
             read = true;
            //NewRouter.vRouter.addElement(r);


          }//end try


    }//end try
    catch (IOException exp){
      System.out.println("Error with File");
      System.out.print(read);
    }
  }
  //---------Erase Startup----------------//
  public void eraseStartUp(Router r){
    try{
      FileReader fin = new FileReader(filename);
      BufferedReader bin = new BufferedReader(fin);
      String s="";
      String newstr="";
      String strRouter="";
      boolean flag=false;//flag true when found router destination
      //while not End of File
      while ((s = bin.readLine()) != null){
        if (s.startsWith("end")){
          if (strRouter.length() != 0){
            strRouter += "end\n";
          }
          if (flag){
            newstr += strRouter;
            strRouter = "";
            flag = false;
          }//end if
          else{
            newstr += strRouter;
            strRouter = "";
          }
        }//end if
        else if (!flag){
          StringTokenizer st = new StringTokenizer(s);
          if (s.startsWith("hostname")){
            String name = (String)st.nextToken();
            name = (String)st.nextToken();
            if (r.getName().equalsIgnoreCase(name)){
              strRouter ="";
              flag = true;
            }
            else {
              s += "\n";
              strRouter += s;
            }
            //set Name of Router
          //not router
          }
          else {
            s += "\n";
            strRouter += s;
          }
        }//end if
      }//end while
      bin.close();
      FileWriter fout = new FileWriter(filename);
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(newstr);
      pout.close();
//    System.out.println(newstr);
    }
    catch (IOException exp){
    }
   rout = r;
  }
  //----------Show Startup------------------//
  public void showStartUp(Router r){
    try{
      String str = filename;
      FileReader fin = new FileReader(str);
      BufferedReader bin = new BufferedReader(fin);
      String s="";
      String newstr="";
      String strRouter="";
      boolean flag=true;//true means read
      //while not End of File
      while ((s = bin.readLine()) != null){
        if (s.startsWith("end")){
          if (!flag){
            flag = true;
            strRouter = "";
          }//end if
          else{
            newstr += strRouter;
          }
        }//end if
         else if (flag){
          StringTokenizer st = new StringTokenizer(s);
          if (s.startsWith("hostname")){
            String name = (String)st.nextToken();
            name = (String)st.nextToken();
            if (!r.getName().equalsIgnoreCase(name)){
              strRouter ="";
              flag = false;
            }//end if
            else {
              s += "\n";
              strRouter += s;
            }//end else
          }
          else {
            if (s.startsWith("ip route")){
              StringTokenizer stoken = new StringTokenizer(s);
              for(int a=0; a<5; a++){
                strRouter += stoken.nextToken() + " ";
              }
              strRouter += "\n";
            }
            else {
              s += "\n";
              strRouter += s;
            }
            if (s.startsWith("type")){
            }
          }
        }//end if
      }//end while
      bin.close();
      if (newstr.length() == 0){
        output += "%% Non-volatile configuration memory has not been set up or has bad checksum\n";
        //StatusPanel.showOutputConsole(output,r);output="";
      }
      else {
        output += newstr + "end\n\n";
        //StatusPanel.showOutputConsole(output,r);output="";
      }
    }
    catch (IOException exp){
    }
    rout = r;
  }
  //----------Save Config-----------------//

  public void saveRunningConfig(Router r){
    try{
      FileReader fin = new FileReader(filename);
      BufferedReader bin = new BufferedReader(fin);
      String s="";
      String newstr="";
      String strRouter="";
      boolean flag=false; //flase means it is not right router
      boolean found=false;
      int numline=0;
      //while not End of File
      System.out.println("Read File1");
      while ((s = bin.readLine()) != null){
        numline++;
        if (s.startsWith("end")){
          if (strRouter.length() != 0)
          {
            strRouter += "end\n";
            System.out.println("Read File2");
          }
          newstr += strRouter;
          strRouter="";
          if (flag){
            flag = false;
          }//end if
        }//end if
        else if (!flag){
          StringTokenizer st = new StringTokenizer(s);
          //check is that router
          if (s.startsWith("hostname")){
            System.out.println("Read File3");
            String name = (String)st.nextToken();
            name = (String)st.nextToken();
            if (r.getName().equalsIgnoreCase(name)){
//              strRouter ="";
              flag = true;
              found = true;
              strRouter += s + "\n";
              strRouter += "!\n";
              if (r.getEnablePasswd()){
               strRouter += "enable password " + r.getPasswd() + "\n";
              }
              else {
               strRouter += "!\n";
              }
               strRouter += "!\n";
              //find config and save
              for (int a=0; a<r.getVInt().size();a++){
                Interface i1 = (Interface)r.getVInt().elementAt(a);
                strRouter +="!\n";
                strRouter += "interface " + i1.getNameInt() + "\n";
                if (!((i1.getIpAddress().equals(""))||(i1.getIpAddress().equals(" ")))){
                  System.out.println("I!"+i1.getIpAddress());
                  strRouter += "ip address " + i1.getIpAddress() + " " + i1.getSubnet() + "\n";
                }
                if ( !i1.getAccessListNumber().equalsIgnoreCase("")){
                  strRouter += "ip access-group " + i1.getAccessListNumber() + " " + i1.getConditionAccessLsit()+"\n";
                }
                else {
                  strRouter += "no ip address\n";
                }

                if (i1.getStatus().equalsIgnoreCase("down")){
                  strRouter += "shutdown\n";
                }
                else{
                  strRouter += "no shutdown\n";
                }
              }//end read interface
              switch(r.getFlag()){
                case 's': strRouter += "!\n";
                          for (int a=0; a < r.getVrt().size(); a++){
                            RoutingTable rt = (RoutingTable)r.getVrt().elementAt(a);
                            if (rt.getRouteType() == 's'){
                              strRouter += "ip route " + rt.getIpDestination() + " " + rt.getSubnet() + " " + rt.getGateway()+ " " + rt.getInterface().getIpAddress() + " " + rt.getInterface().getNameInt() + " " + rt.getInterface().getNetAddress() + " " + rt.getInterface().getStatus() + " " + rt.getInterface().getSubnet() + " " + rt.getInterface().getType() + "\n";
                            }
                          }
                              r.setFlag('s');
                          strRouter += "!\n";
                          break;
                case 'r': strRouter += "!\n";
                          strRouter += "router rip\n";
                          strRouter += "network " +r.getNetwork_address()+ "\n";
                          strRouter += "\n";
                          break;
                case 'o': strRouter += "!\n";
                          strRouter += "router ospf\n";
                          strRouter += "network " +r.getNetwork_address()+ "\n";
                          strRouter += "\n";
                          break;
                default: strRouter += "!\n!\n";
              }//end switch route type
              strRouter += "!\n";
              if (r.getIpClassless()){
                strRouter += "ip classless\n";
              }
              else {
                strRouter += "no ip classless\n";
              }
              strRouter += "!\n";

              if( r.getVAccess().size() > 0 ){

                for( int o=0 ; o < r.getVAccess().size() ; o++ ){

                  AccessList acc = (AccessList)r.getVAccess().elementAt(o) ;
                  strRouter += acc.getAccessList() + "\n";
                }
                strRouter += "!\n";
              }
              // Set Line Password
              strRouter += "!\n";
              strRouter += "line con 0\n";
              if (r.getConsolePasswd() != null){
                strRouter += "password " + r.getConsolePasswd() + "\n";
              }
              strRouter += "line aux 0\n";
              if (r.getAuxPasswd() != null){
                strRouter += "password " + r.getAuxPasswd() + "\n";
              }
              strRouter += "line vty 0 4\n";
              if (r.getVtyPasswd() != null){
                strRouter += "password " + r.getVtyPasswd() + "\n";
              }
              if (r.getEnableTelnet()){
                strRouter += "login\n";
              }
              //---now is default---//
              strRouter += "!\n";
              //Save Type
              System.out.println("Eth="+r.getMaxEth()+" ser="+r.getMaxToken()+" tok="+r.getMaxToken());
              strRouter += "type " + r.getModel() + "\n";
/*              int maxeth = r.getMaxEth();
              int maxser = r.getMaxSerial();
              int maxtok = r.getToken();
              if ((maxeth == 1)&&(maxser == 2)&&(maxtok == 0)){
                strRouter += "type 1\n";
              }
              else if ((maxeth == 0)&&(maxser == 2)&&(maxtok == 1)){
                strRouter += "type 2\n";
              }
              else if ((maxeth == 1)&&(maxser == 1)&&(maxtok == 2)){
                strRouter += "type 3\n";
              }
              else if ((maxeth == 2)&&(maxser == 2)&&(maxtok == 0)){
                strRouter += "type 4\n";
              }
              else if ((maxeth == 0)&&(maxser == 2)&&(maxtok == 2)){
                strRouter += "type 5\n";
              }
              else {
                System.out.println("eth="+r.getMaxEth()+" ser="+r.getMaxSerial()+" token="+r.getToken());
                strRouter += "type 0\n";
              }
*/
            }//end if hostname = router
            else {
              s += "\n";
              strRouter += s;
            }
            //set Name of Router
          //not router
          }//end s.startwith hostname
          else {
            s += "\n";
            strRouter += s;
          }
        }//end if
      }//end while
      //------------That is not found--------------//
      if(!found){
        //append
        System.out.println("save config");
        newstr += "version 11.3\n";
        newstr += "service timestamps debug uptime\n";
        newstr += "service uimestamps log uptiom\n";
        newstr += "no service password-encryption\n";
        newstr += "!\n";
        // Set Hostname
        newstr += "hostname " + r.getName()+ "\n";
        // Enalbe Password
        newstr += "!\n";
        if (r.getEnablePasswd()){
          newstr += "enable password " + r.getPasswd() + "\n";
        }
        else {
          newstr += "!\n";
        }
        newstr += "!\n";
        for (int a=0; a<r.getVInt().size();a++){
          // Set Interface
          Interface i1 = (Interface)r.getVInt().elementAt(a);
          newstr +="!\n";
          newstr += "interface " + i1.getNameInt()+"\n";
          if (!i1.getIpAddress().equals("")){
            newstr += "ip address " + i1.getIpAddress() + " " + i1.getSubnet() + "\n";
          }
          if ( !i1.getAccessListNumber().equalsIgnoreCase("")){
                  strRouter += "ip access-group " + i1.getAccessListNumber() + " " + i1.getConditionAccessLsit()+"\n";
              }
          else {
            newstr += "no ip address\n";
          }
          if (i1.getStatus().equalsIgnoreCase("down")){
            newstr += "shutdown\n";
          }
          else{
            newstr += "no shutdown\n";
          }
        }//end read interface
        //Set Protocol
//        newstr += "!\n";
        switch(r.getFlag()){
          case 's': newstr += "!\n";
                    for (int a=0; a < r.getVrt().size(); a++){
                      RoutingTable rt = (RoutingTable)r.getVrt().elementAt(a);
                      if (rt.getRouteType() == 's'){
                        newstr += "ip route " + rt.getIpDestination() + " " + rt.getSubnet() + " " + rt.getGateway() + "\n";
                      }//end if
                    }//end for
                    newstr += "!\n";
                    break;
          case 'r': newstr += "!\n";
                    newstr += "router rip\n";
                    newstr += "network " +r.getNetwork_address()+ "\n";
                    newstr += "!\n";
                    break;
          case 'o':
                    newstr += "!\n";
                    newstr += "router ospf\n";
                    newstr += "network " +r.getNetwork_address()+ "\n";
                    newstr += "!\n";
                    break;
          default:break;
        }//end switch route type
//        newstr += "!\n";
        if (r.getIpClassless()){
          newstr += "ip classless\n";
        }
        else {
          newstr += "no ip classless\n";
        }
        strRouter += "!\n";

        if( r.getVAccess().size() > 0 ){

          for( int o=0 ; o < r.getVAccess().size() ; o++ ){

            AccessList acc = (AccessList)r.getVAccess().elementAt(o) ;
            strRouter += acc.getAccessList() + "\n";
          }
          strRouter += "!\n";
        }
        // Set Line Password
        newstr += "!\n";
        newstr += "line con 0\n";
        if (r.getConsolePasswd() != null){
          newstr += "password " + r.getConsolePasswd() + "\n";
        }
        newstr += "line aux 0\n";
        if (r.getAuxPasswd() != null){
          newstr += "password " + r.getAuxPasswd() + "\n";
        }
        newstr += "line vty 0 4\n";
        if (r.getVtyPasswd() != null){
          newstr += "password " + r.getVtyPasswd() + "\n";
        }
        if (r.getEnableTelnet()){
          newstr += "login\n";
        }
        //Save Type
        newstr += "type "+ r.getModel() + "\n";
        System.out.println("Eth="+r.getMaxEth()+" ser="+r.getMaxToken()+" tok="+r.getMaxToken());
/*        int maxeth = r.getMaxEth();
        int maxser = r.getMaxSerial();
        int maxtok = r.getToken();
        if ((maxeth == 1)&&(maxser == 2)&&(maxtok == 0)){
          newstr += "type 1\n";
        }
        else if ((maxeth == 0)&&(maxser == 2)&&(maxtok == 1)){
          newstr += "type 2\n";
        }
        else if ((maxeth == 1)&&(maxser == 1)&&(maxtok == 2)){
          newstr += "type 3\n";
        }
        else if ((maxeth == 2)&&(maxser == 2)&&(maxtok == 0)){
          newstr += "type 4\n";
        }
        else if ((maxeth == 0)&&(maxser == 2)&&(maxtok == 2)){
          newstr += "type 5\n";
        }
        else {
          System.out.println("eth="+r.getMaxEth()+" ser="+r.getMaxSerial()+" token="+r.getToken());
          newstr += "type 0\n";
        }
*/
        //---now is default---//
        newstr += "!\nend\n\n";
      }
      bin.close();
      FileWriter fout = new FileWriter(filename);
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(newstr);
      pout.close();
      System.out.print("Password "+r.getPasswd()+"\n");
      display ="save-running";
      output += "Buliding Configuration....\n\n";
      output += "[OK]\n";
     // StatusPanel.showOutputConsole(output,r);output="";
    }
    catch (IOException exp){
    }
    rout = r;
  }  //----------Show Config-------------------//
  public void showRunningConfig(Router r){

    System.out.println("show running");
    display ="show-running";
    String newstr = "";
    newstr += "version 11.3\n";
    newstr += "service timestamps debug uptime\n";
    newstr += "service timestamps log uptiom\n";
    newstr += "no service password-encryption\n";
    newstr += "!\n";
    // Set Hostname
    newstr += "hostname " + r.getName()+ "\n";
    newstr += "!\n";
    // Enalbe Password
    if (r.getEnablePasswd()){
      newstr += "enable password " + r.getPasswd() + "\n";
    }
    else {
      newstr += "!\n";
    }
    newstr += "!\n";
    for (int a=0; a<r.getVInt().size();a++){
      // Set Interface
      Interface i1 = (Interface)r.getVInt().elementAt(a);
      newstr +="!\n";
      newstr += "interface " + i1.getNameInt()+"\n";
      newstr += "ip address " + i1.getIpAddress() + " " + i1.getSubnet() + "\n";
      //-- set access-list
     if(!i1.getAccessListNumber().equalsIgnoreCase("")){
        newstr += "ip access-group " + i1.getAccessListNumber() + " " + i1.getConditionAccessLsit() + "\n";
      if (i1.getStatus().equalsIgnoreCase("down")){
        newstr += "shutdown\n";
      }
      else{
        newstr += "no shutdown\n";
      }
     }//end if
    }//end read interface
    //Set Protocol
    switch(r.getFlag()){
    case 's': newstr += "!\n";
              for (int a=0; a < r.getVrt().size(); a++){
                RoutingTable rt = (RoutingTable)r.getVrt().elementAt(a);
                if (rt.getRouteType() == 's'){
                  newstr += "ip route " + rt.getIpDestination() + " " + rt.getSubnet() + " " + rt.getGateway() + "\n";
                }//end if
              }//end for
              newstr += "!\n";
              break;
    case 'r': newstr += "!\n";
              newstr += "router rip\n";
              newstr += "network " +r.getNetwork_address()+ "\n";
              newstr += "!\n";
              break;
    case 'o': newstr += "!\n";
              newstr += "router ospf\n";
              newstr += "network " +r.getNetwork_address()+ "\n";
              newstr += "!\n";
              break;
    default: newstr += "!\n!\n";
    }//end switch route type
    newstr += "!\n";
    // Set ip classless
    if (r.getIpClassless()){
      newstr += "ip classless\n";
    }
    else {
      newstr += "no ip classless\n";
    }
    newstr += "!\n";
    // Set Access-List
   if( r.getVAccess().size() > 0 ){

     for( int o=0 ; o < r.getVAccess().size() ; o++ ){

       AccessList acc = (AccessList)r.getVAccess().elementAt(o);
       newstr += acc.getAccessList() + "\n";
     }
     newstr += "!\n";
    }
    // Set Line Password
    newstr += "line con 0\n";
    if (r.getConsolePasswd() != null){
      newstr += "password " + r.getConsolePasswd() + "\n";
    }
    newstr += "line aux 0\n";
    if (r.getAuxPasswd() != null){
      newstr += "password " + r.getAuxPasswd() + "\n";
    }
    newstr += "line vty 0 4\n";
    if (r.getVtyPasswd() != null){
      newstr += "password " + r.getVtyPasswd() + "\n";
    }
    if (r.getEnableTelnet()){
      newstr += "login\n";
    }
    //---now is default---//
    newstr += "!\nend\n";
    output = newstr + "\n";
    rout = r;
    //StatusPanel.showOutputConsole(output,r);output="";
  }//end function
  //---------------OSPF Command------------------------//
  public String ping_ospf(Router r,String ip_des)
  {
    String final_output="";
    String def_time_out =  "Type escape sequence to abort. \n"
                 +"Sending 5, 100-byte ICMP Echos to "+ip_des+" timeout is 2 seconds:\n"
                 +".....\n"+"Success rate is 0 percent (0/5)\n";
    String def_reply="Type escape sequence to abort. \n"
                      +"Sending 5, 100-byte ICMP Echos to "+ip_des+" timeout is 2 seconds:\n"
                      +"!!!!!\n"+"Success rate is 100 percent (5/5), round-trip min/avg/max = 4/4/4 ms\n";
    String trace = trace_ospf(r,ip_des);
    if (trace.endsWith("Request time out\n"))
    {
      final_output=def_time_out;
    }else {
      final_output=def_reply;
    }
    rout = r;
    return final_output;
  }
  /*---------------------------------------------------------------------------------*/
  public String trace_ospf(Router r,String ip_des)
  {
    String final_output="";
    Router r_des = findr_des(r,ip_des);
    Interface inf_check = myinf(r,ip_des);
    if (inf_check!=null){
      if (inf_check.getStatus().equalsIgnoreCase("up")){
        final_output=final_output+ip_des;
      }
      else{
        final_output=final_output+"Request time out";
      }
    }
    else{
      if (r_des!=null){
        int a = findOrder(r);
        int b = findOrder(r_des);
        Vector vtrace = trace_output(NewRouter.pathx[a][b],ip_des);
        for (int i=0;i<vtrace.size();i++){
          final_output = final_output +" "+(i+1)+" ["+vtrace.elementAt(i)+ "]\n";
        }
        if (vtrace.size()!=0){
          String s = (String)vtrace.lastElement();
          if (!s.equalsIgnoreCase(ip_des)){
            final_output=final_output+"Request time out";
          }
        }
        else{
          final_output=final_output+"Request time out";
        }
      }
      else{
        final_output=final_output+"Request time out";
      }
    }
    rout = r;
    final_output += "\n";
    return final_output;
  }
  private Interface myinf(Router r,String ip_des)
  {
    Interface inf = null;
    int i=0;
    boolean found = false;
    while ((i<r.getVInt().size())&&(!found))
    {
      Interface in = (Interface)r.getVInt().elementAt(i);
      if(in.getIpAddress().equalsIgnoreCase(ip_des))
      {
        inf = in;
        found = true;
      }
      i++;
    }
    rout = r;
    return inf;
  }
  private Vector trace_output(Vector v,String ip_des)
  {
    boolean success = true;
    Vector vtrace = new Vector();
    //for (int i=0;i<v.size()-1;i++)
    int i=0;
    while ((i<v.size()-1)&&(success))
    {
      Router r = (Router)v.elementAt(i);
      Router r_next = (Router)v.elementAt(i+1);
      boolean found = false;
      int j=0;
      while ((j<r.getVInt().size())&&(!found))
      {
        Interface i1 = (Interface)r.getVInt().elementAt(j);
        int k=0;
        while((k<r_next.getVInt().size())&&(!found)&&(success))
        {
          Interface i2 =(Interface)r_next.getVInt().elementAt(k);
          //if ((i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))&&(i1.getStatus().equalsIgnoreCase("up"))&&(i2.getStatus().equalsIgnoreCase("up")))
          if (i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))
          {
            if ((i1.getStatus().equalsIgnoreCase("up"))&&(success)){
              //vtrace.addElement(i1.getIpAddress());
            }else
            {success = false;}
            if ((i2.getStatus().equalsIgnoreCase("up"))&&(success)){
              vtrace.addElement(i2.getIpAddress());
            }else
            {success = false;}
            found = true;
          }
          k++;
        }
        j++;
      }
      i++;
    }
    if ((vtrace.size()!=0)&&(success)){
          String s = (String)vtrace.lastElement();
          if (!s.equalsIgnoreCase(ip_des))
          {
            Router r =(Router)v.lastElement();
            boolean f=false;
            int n=0;
            while (n<(r.getVInt().size())&&(!f))
            {
              Interface inf = (Interface)r.getVInt().elementAt(n);
              if (inf.getIpAddress().equalsIgnoreCase(ip_des))
              {
                if (inf.getStatus().equalsIgnoreCase("up"))
                {
                  vtrace.addElement(ip_des);
                }
                f=true;
              }
              n++;
            }
          }
    }
    return vtrace;
  }
  private Router findr_des(Router r,String ip_des)
  {
    boolean found = false;
    int i=0;
    Router r_dess = null;
    while((i<NewRouter.vRouter.size())&&(!found))
    {
      Router r_des = (Router)NewRouter.vRouter.elementAt(i);
      int j=0;
      while(j<(r_des.getVInt().size())&&(!found))
      {
        Interface inf = (Interface)r_des.getVInt().elementAt(j);
        if (inf.getIpAddress().equalsIgnoreCase(ip_des))
        {
          r_dess = r_des;
          found = true;
        }
        j++;
      }
      i++;
    }
    rout = r;
    return r_dess;
  }
  public String show_ip_ospf_inf(Router rin,String inf_name)
  {
    Interface i_rin = null;
    for (int i=0;i<rin.getVInt().size();i++)
    {
      Interface a=(Interface)rin.getVInt().elementAt(i);
      if (a.getNameInt().equalsIgnoreCase(inf_name)){
        i_rin = a;
      }
    }
    Router r_des = findRouterDes(rin.getHello(),i_rin);
    Interface i_des = findInfDes(rin.getHello(),i_rin);
    String s= "\t"+inf_name+" is "+i_rin.getStatus()+", line protocol is up \n"
              +"\tInternet Address "+i_rin.getIpAddress()+", Area 0 \n"
              +"\tProcess ID 1, Router ID "+rin.getName()+", Network Type BROADCAST, Cost: 64 \n"
              +"\tTransmit Delay is 1 sec, State DR, Priority 1 \n"
              +"\tDesignated Router (ID) "+rin.getName()+", Interface address"+i_rin.getIpAddress()
              +"\n\tBackup Designated router (ID) "+r_des.getName()+", Interface address "+i_des.getIpAddress()
              +"\n\tTimer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5"
              +"\n\tHello due in 00:00:00"
              +"\n\tNeighbor Count is 1, Adjacent neighbor count is 1 "
              +"\n\tAdjacent with neighbor "+r_des.getName()+" (Backup Designated Router)"
              +"\n\tSuppress hello for 0 neighbor(s)\n";
    rout = rin;return s;

  }
  private Interface findInfDes(Vector hello,Interface inf)
  {
    Interface des = null;
    boolean found=false;
    int i=0;
    while ((i<hello.size())&&(!found))
    {
      Hello h = (Hello)hello.elementAt(i);
      Router r = h.getDesRouter();
      int j=0;
      while ((j<r.getVInt().size())&&(!found))
      {
        Interface a = (Interface)r.getVInt().elementAt(j);
        if (inf.getNetAddress().equalsIgnoreCase(a.getNetAddress()))
        {
          des = a;
          found = true;
        }
        j++;
      }
      i++;
    }
    return des;
  }
  private Router findRouterDes(Vector hello,Interface inf)
  {
    Router des = null;
    boolean found=false;
    int i=0;
    while ((i<hello.size())&&(!found))
    {
      Hello h = (Hello)hello.elementAt(i);
      Router r = h.getDesRouter();
      int j=0;
      while ((j<r.getVInt().size())&&(!found))
      {
        Interface a = (Interface)r.getVInt().elementAt(j);
        if (inf.getNetAddress().equalsIgnoreCase(a.getNetAddress()))
        {
          des = r;
          found = true;
        }
        j++;
      }
      i++;
    }
    return des;
  }
  public String show_ip_ospf_neighbor(Router rin)
  {
    String outp="";
    int rin_order = findOrder(rin);
    for (int i=0;i<rin.getHello().size();i++)
    {
      Hello h = (Hello)rin.getHello().elementAt(i);
      Router nb = h.getDesRouter();
      int nb_order = findOrder(nb);
      outp = outp + find_gateway(rin_order,nb_order);
    }
    rout = rin;
    return outp;
  }
  public int findOrder(Router rin){
    int order=-1;
    boolean found=false;
    for (int i=0;i<NewRouter.vRouter.size();i++){
      Router r = (Router)NewRouter.vRouter.elementAt(i);
      if (r.getName().equalsIgnoreCase(rin.getName())){
        order = i;
      }
    }
    rout = rin;
    return order;
  }
  public String find_gateway(int a,int b){
    String out="";
    Vector v = NewRouter.pathx[a][b];
    Router r1 = (Router)v.elementAt(0);
    Router r2 = (Router)v.elementAt(1);
    boolean found = false;
    int k=0,j=0;
    while ((j<r1.getVInt().size())&&(!found))
    {
      Interface i1 = (Interface)r1.getVInt().elementAt(j);
      k=0;
      while ((k<r2.getVInt().size())&&(!found))
      {
        Interface i2 = (Interface)r2.getVInt().elementAt(k);
        if ((i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))&&(!i1.getIpAddress().equalsIgnoreCase(i2.getIpAddress())))
        {
          Router rdes = (Router)v.lastElement();
          String s=rdes.getName()+"\t"+"1 \t FULL/DR \t 0:00:34 \t"+i1.getIpAddress()+"\t"+i2.getNameInt()+"\n";
          //System.out.println(s);
          out = out+s;
          found = true;
        }
          k++;
      }
      j++;
    }
    return out;
  }
  static String getIp_shortestPath(){
    return ip_shortestPath;
  }
  static Router getRouter()
  {
    return rout;
  }
  static String getDispley()
  {
    return display;
  }

  //--------------- host ping selection command -----------------------------------
  public String hostPing(Router router,String arg , String sourceIP){

    Command c = new Command();
    String result = "";

    if (router.getFlag() != 'o'){
      result = c.hostPingRip(router,arg,sourceIP);
    }
    else {
      result = c.hostPingOspf(router,arg);
    }
    return result;
  }

  //-- Ospf ping
  public String hostPingOspf(Router r,String ip_des){

    String final_output="";
    String def_time_out ="Pinging  "+ip_des+"  with  32 bytes of data:"+"\n";
          def_time_out +="\nRequest timed out.";
          def_time_out +="\nRequest timed out.";
          def_time_out +="\nRequest timed out.";
          def_time_out +="\nRequest timed out.";
          def_time_out +="\nPing  statistics for "+ip_des+":";
          def_time_out +="\n         Packet : Sent = 4, Received = 0, Lost = 4 (100% loss),\n";

    String  def_reply="Pinging  "+ip_des+"  with  32 bytes of data:"+"\n";
           def_reply+="\nReply from "+ip_des+": bytes 32 time<1ms  TTL = 128";
           def_reply+="\nReply from "+ip_des+": bytes 32 time<1ms  TTL = 128";
           def_reply+="\nReply from "+ip_des+": bytes 32 time<1ms  TTL = 128";
           def_reply+="\nReply from "+ip_des+": bytes 32 time<1ms  TTL = 128\n";
           def_reply+="\nPing  statistics for "+ip_des+":";
           def_reply+="\n         Packet : Sent = 4, Received = 4, Lost = 0 (0% loss),";
           def_reply+="\nApproximate round  trip times in milli-seconds:";
           def_reply+="\n         Minimum = 0ms, Maximum = 0ms, Average = 0ms\n";


    String trace = trace_ospf(r,ip_des); //-- call tracroute ospf

    if (trace.endsWith("Request time out\n")) {
      final_output=def_time_out;
    }else{
      final_output=def_reply;
    }
    rout = r;
    return final_output;
  }

  //-- Rip ping
  public String hostPingRip( Router r,String des , String sIP){

    String def_time_out ="Pinging  "+des+"  with  32 bytes of data:"+"\n";
         def_time_out +="\nRequest timed out.";
         def_time_out +="\nRequest timed out.";
         def_time_out +="\nRequest timed out.";
         def_time_out +="\nRequest timed out.";
         def_time_out +="\nPing  statistics for "+des+":";
         def_time_out +="\n         Packet : Sent = 4, Received = 0, Lost = 4 (100% loss),\n";

   String  def_reply="Pinging  "+des+"  with  32 bytes of data:"+"\n";
          def_reply+="\nReply from "+des+": bytes 32 time<1ms  TTL = 128";
          def_reply+="\nReply from "+des+": bytes 32 time<1ms  TTL = 128";
          def_reply+="\nReply from "+des+": bytes 32 time<1ms  TTL = 128";
          def_reply+="\nReply from "+des+": bytes 32 time<1ms  TTL = 128\n";
          def_reply+="\nPing  statistics for "+des+":";
          def_reply+="\n         Packet : Sent = 4, Received = 4, Lost = 0 (0% loss),";
          def_reply+="\nApproximate round  trip times in milli-seconds:";
           def_reply+="\n         Minimum = 0ms, Maximum = 0ms, Average = 0ms\n";

    int a=0;
    int b=0;
    RoutingTable rt = null;
    Router tmp = null;
    Interface inf = null;
    String nextgw="";
    String gwout = "";
    boolean found = false;
    boolean havedes = false;
    String out = "";

    while ((!havedes)&&(a < NewRouter.vRouter.size() )){

      b=0;
      Router rtmp = (Router)NewRouter.vRouter.elementAt(a);

      while ((!havedes)&&(b < rtmp.getVInt().size() )){
        Interface i1 = (Interface)rtmp.getVInt().elementAt(b);
        if (i1.getIpAddress().equalsIgnoreCase(des)){
          inf = i1;
          havedes = true;
        }//end if
        b++;
      }//end while
      a++;
    }//end while

    int i=0;

    if (inf != null){

      rt = (RoutingTable)r.getVrt().firstElement();
      nextgw = rt.getGateway();

      while((i < r.getVrt().size())&&(!rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd()))){

        rt = (RoutingTable)r.getVrt().elementAt(i);
        // gateway is interface that adj
        nextgw = rt.getGateway();
        gwout = inf.getIpAddress();
        i++;
      }//end while

      //if found in routing table
      boolean doagain = false;
      if (rt.getIpDestination().equalsIgnoreCase(inf.findNetAdd())){
        if (rt.getRouteType() == 'r'){
          if (rt.getMatrice() < 16){
            doagain = true;
          }//end if
        }//end if
        else if (rt.getRouteType() == 'o'){
          if (rt.getMatrice() < 30){
            doagain = true;
          }//end if
        }//end if
        else if ((rt.getRouteType() == 'c')||(rt.getRouteType() == 's')){
          doagain = true;
        }
        if (doagain){
          //find route that have interface of gateway value
          for (int j=0; j < NewRouter.vRouter.size(); j++){
            //Router 1
            tmp = (Router)NewRouter.vRouter.elementAt(j);
            //Interface 1 of Router 1

            for(int k=0; k < tmp.getVInt().size(); k++){
              Interface intf = (Interface)tmp.getVInt().elementAt(k);
              String i1 = intf.getIpAddress();

              if (intf.getIpAddress().equalsIgnoreCase(nextgw)){


                //-- find source address -------------------------------------------------------
                 //-- find router and interface position  (next gateway)
                 for( int aa = 0 ; aa < NewRouter.vRouter.size() ; aa++ ){

                   Router rr = (Router)NewRouter.vRouter.elementAt(aa);

                   for( int bb = 0 ; bb < rr.getVInt().size() ; bb++ ){

                     Interface ii = (Interface)rr.getVInt().elementAt(bb);

                     if( ii.getIpAddress().equalsIgnoreCase(nextgw)){

                       inRouter = aa;
                       inInt = bb;
                       gwNetaddress = ii.getNetAddress();
                     }
                   }
                 }

                 //-- find out interface
                 for( int aa = 0 ; aa < NewRouter.vRouter.size() ; aa++ ){

                   Router rr = (Router)NewRouter.vRouter.elementAt(aa);

                   for( int bb = 0 ; bb < rr.getVInt().size() ; bb++ ){

                     Interface ii = (Interface)rr.getVInt().elementAt(bb);

                     if( ii.getNetAddress().equalsIgnoreCase(gwNetaddress)
                         && !ii.getIpAddress().equalsIgnoreCase(nextgw)){

                       outRouter = aa;
                       outInt = bb;
                       outIP = ii.getIpAddress();

                       if( !test ){
                         //-- get source ip address
                         sourceIP = ii.getIpAddress();

                         sourceRouter = aa;
                         sourceInt = bb;
                         test = true;
                       }
                     }
                   }
                 }

               //-------------------------------------------------------------------------------
               //-- out interface
               boolean isPassOut = true;
               //-- get interface out
               Router outR = (Router)NewRouter.vRouter.elementAt( outRouter );
               Interface outI = (Interface)outR.getVInt().elementAt( outInt );

               if( !outI.getAccessListNumber().equalsIgnoreCase("")
                   && outI.getConditionAccessLsit().equalsIgnoreCase("out") )

                 isPassOut = outR.isPassAccessList( outI.getAccessListNumber() , sIP , des , "icmp" , "" , "" );

               //----------------------  Test Accesslist -----------------------------------------------

               r = tmp;
               found = true;

               boolean isPassIn = true;
               //-- get interface out
               Router inR = (Router)NewRouter.vRouter.elementAt( inRouter );
               Interface inI = (Interface)inR.getVInt().elementAt( inInt );

               if( !inI.getAccessListNumber().equalsIgnoreCase("")
                  && inI.getConditionAccessLsit().equalsIgnoreCase("in") )
                 isPassIn = inR.isPassAccessList( inI.getAccessListNumber() , sIP , des , "icmp" , "" , "" );

               //-- set output
               if(!isPassOut){
                 isPass = true;
               }else if(!isPassIn){
                 isPass = true;
               }
               //--------------------------------------------------------------------------------------
              }//end if
            }//end for
          }//end for
          if (!nextgw.equals("0.0.0.0")){
            if (found){
              out = hostPingRip(r,des,sourceIP);
            }//end if
          }//end if
          else if(isPass) {
            //-- Access List Blocked
            return  def_time_out;
          }
          else {

            System.out.println("success");
            //when have in routing table
            return def_reply;
          }
        }//end if
        else {
          //when have in routing table but unreachable
            return  def_time_out;
        }
      }//end if
      else{
        //-- not found destination in routing table
        found = false;
        return  def_time_out;
      }//end else
    }//end if
    else {
      System.out.println("not found this ip in network");
      return " Incorrect Destination\n";
    }
    rout = r;
    return out;
  }//end function

  //-- Export Configuration ------------------------------------------------------------------------\
  public String exportConfig(Router r){

    String text = "";

    text += "version 11.3\n";
    text += "service timestamps debug uptime\n";
    text += "service timestamps log uptiom\n";
    text += "no service password-encryption\n";
    text += "!\n";

    //-- Set Hostname
    text += "hostname " + r.getName()+ "\n";
    text += "!\n";

    // Enalbe Password
    if (r.getEnablePasswd()){
      text += "enable password " + r.getPasswd() + "\n";
    }
    else {
      text += "!\n";
    }
    text += "!\n";

    for (int a=0; a<r.getVInt().size();a++){
      // Set Interface
      Interface i1 = (Interface)r.getVInt().elementAt(a);
      text +="!\n";
      text += "interface " + i1.getNameInt()+"\n";
      text += "ip address " + i1.getIpAddress() + " " + i1.getSubnet() + "\n";

      //-- set access-list
      if(!i1.getAccessListNumber().equalsIgnoreCase("")){
        text += "ip access-group " + i1.getAccessListNumber() + " " + i1.getConditionAccessLsit() + "\n";
        if (i1.getStatus().equalsIgnoreCase("down")){
          text += "shutdown\n";
        }
        else{
          text += "no shutdown\n";
        }
      }//end if
    }//end read interface

    //--Set Protocol
    switch(r.getFlag()){

        case 's': text += "!\n";
                  for (int a=0; a < r.getVrt().size(); a++){
                    RoutingTable rt = (RoutingTable)r.getVrt().elementAt(a);
                    if (rt.getRouteType() == 's'){
                      text += "ip route " + rt.getIpDestination() + " " + rt.getSubnet() + " " + rt.getGateway() + "\n";
                    }//end if
                  }//end for
                  text += "!\n";
                  break;

        case 'r': text += "!\n";
                  text += "router rip\n";
                  text += "network " +r.getNetwork_address()+ "\n";
                  text += "!\n";
                  break;

        case 'o': text += "!\n";
                  text += "router ospf\n";
                  text += "network " +r.getNetwork_address()+ "\n";
                  text += "!\n";
                  break;

        default:  text += "!\n!\n";
      }//end switch route type
      text += "!\n";

      //-- Set ip classless
      if (r.getIpClassless()){
        text += "ip classless\n";
      }
      else {
        text += "no ip classless\n";
      }
      text += "!\n";

      //-- Set Access-List
      if( r.getVAccess().size() > 0 ){

        for( int o=0 ; o < r.getVAccess().size() ; o++ ){

          AccessList acc = (AccessList)r.getVAccess().elementAt(o);
          text += acc.getAccessList() + "\n";
        }
        text += "!\n";
      }

      //-- Set Line Password
      text += "line con 0\n";
      if (r.getConsolePasswd() != null){
        text += "password " + r.getConsolePasswd() + "\n";
      }
      text += "line aux 0\n";
      if (r.getAuxPasswd() != null){
        text += "password " + r.getAuxPasswd() + "\n";
      }
      text += "line vty 0 4\n";
      if (r.getVtyPasswd() != null){
        text += "password " + r.getVtyPasswd() + "\n";
      }
      if (r.getEnableTelnet()){
        text += "login\n";
      }

      //-- default
      text += "!\nend\n";
      output = text + "\n";
      rout = r;

      return text;
    }

}