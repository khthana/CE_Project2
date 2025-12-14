package routersim;

import java.io.*;
import java.lang.*;
import java.util.*;
public class SwitchCMD implements java.io.Serializable{
  private final String error = "% Invalid input detected at '^' marker.\n";
  private final String ambigous = "% Ambiguous Command :";
  private final ListCommand cmdUserExe = new ListCommand(new String[]{"?","enable","encapsulation arg_ppp","show cdp","show cdp entry *","show cdp entry arg_name","show cdp interface","show cdp neighbors","ping arg_ip_name","traceroute arg_ip_name","exit",""});
  private final ListCommand cmdPrivilegedExe = new ListCommand(new String[]{"?","configure","configure terminal","disable","clock set arg_time_date","debug ip rip","undebug ip rip","show history","show cdp","show cdp entry arg_name","show cdp entry *","show cdp interface","show cdp neighbors","terminal editing","terminal no editing","show ip route","show ip rip database","show ip ospf database","show ip route arg_routetype","show running-config","show startup-config","copy running-config startup-config","copy startup-config running-config","erase startup-config","reload","show version","show interface","show interface arg_typeint","show ip protocol","ping arg_ip_name","traceroute arg_ip_name","telnet arg_ip_name","show ip ospf neighbors","show ip ospf interface arg_intname","show access-lists","exit",""});
  private final ListCommand globalConfig = new ListCommand(new String[]{"?","interface arg_intname","hostname arg_string","enable secret arg_string","no enable secret","line vty 0 4","line auxiliary 0","line console 0","banner motd#","no banner login","ip route arg_ip arg_ip arg_ip","ip classless","no ip route arg_ip arg_ip arg_ip","no ip classless","router arg_protocol arg_num","router arg_protocol","no router arg_protocol","ip host arg_name arg_ip","cdp timer arg_num","cdp holdtime arg_num","ip ospf cost arg_name arg_num","exit",""
        //-- Standard AccessList
              ,"no access-list list-number"
              ,"access-list list-number list-condition list-source"
              ,"access-list list-number list-condition list-source list-source-wildcard"
              ,"access-list list-number list-condition list-protocal list-source list-source-wildcard list-destination list-destination-wildcard"
              ,"access-list list-number list-condition list-protocal list-source list-source-wildcard list-operator list-port list-destination list-destination-wildcard list-operator list-port",""
  });

  private final ListCommand intCmd = new ListCommand(new String[]{"?","interface arg_intname","ip address arg_ip arg_ip","encapsulation","shutdown","no shutdown","ring-speed arg_num","description arg_string","bandwidth arg_num","clock rate arg_num","exit","ip access-group list-number list-inout","no ip access-group list-number list-inout",""});
  private final ListCommand routingCmd = new ListCommand(new String[]{"?","network arg_ip","passive-interface arg_intname","no passive-interface arg_intname","no network arg_ip","distribute-list arg_gateway","no distribute-list arg_gateway","version arg_num","exit",""});
  private final ListCommand lineCmd = new ListCommand(new String[]{"?","password arg_string","login","no login","exit",""});
//  private int cmdNum = -1;
  private boolean accept = false;
  static String output="";
  static int index =0;
 // static Router //rout = new Router();

  //------Function--------//

  public void runCommand(Router router,String cmdline,Console rconsole){
    output="";
    accept = false;
    StringTokenizer st1 = new StringTokenizer(cmdline);
    ListCommand allCmd = null;
    int nummatch = 0;
    switch (router.getMode()){
      case 1 :
                //User Exec Commands
                allCmd = cmdUserExe;
                break;
      case 2 :
                //Privileged EXec Commands
                allCmd = cmdPrivilegedExe;
                break;
      case 3 :
                //Global Config
                allCmd = globalConfig;
                break;
      case 4:
                //Interface Commands
                allCmd = intCmd;
                break;
      case 5 :
                //Routing Engine Commands
                allCmd = routingCmd;
                break;
      case 6 :
                //Line Commands
                allCmd = lineCmd;
                break;
      default : output  += "Error in Mode\n";//StatusPanel.showOutputConsole(output,//router);
    }//end switch
    allCmd.resetList();
    String usercmd="";
    if (st1.hasMoreTokens()){
      usercmd = st1.nextToken();
    }
    String listcmd = "";
    String commandlist ="";
    String list = (String)allCmd.nextElement();
    String matchCmd = "";
    while (allCmd.hasMoreElements()){
      boolean match = true;
      StringTokenizer tmp1 = new StringTokenizer(cmdline);
      StringTokenizer tmp2 = new StringTokenizer(list);
//      System.out.println("full->"+cmdline+":"+list);
      while ((tmp1.hasMoreTokens())&&(match)){
        String checkusercmd = tmp1.nextToken();
        String checklistcmd="";
        if(tmp2.hasMoreTokens()){
          //both have more token
          checklistcmd = tmp2.nextToken();
        }
        else {
          //case usercmd have more token but list not more token
          match = false;
        }
//        System.out.println("debug->"+checkusercmd+":"+checklistcmd);
      if ((checkusercmd.length() <= checklistcmd.length())&&(!checklistcmd.startsWith("arg"))&&(!checklistcmd.startsWith("list"))){
          if (checkusercmd.equalsIgnoreCase(checklistcmd.substring(0,checkusercmd.length()))){
            //if cmd must equal
          }//end if
          else{
            match = false;
          }//end else
        }//end if screen only keyword
        else if (checklistcmd.startsWith("arg")){
          //when list is argument
          if (checklistcmd.startsWith("arg_string")){
            while (tmp1.hasMoreTokens()){
              String t = tmp1.nextToken();
            }
          }
          else if (checklistcmd.startsWith("arg_name")){
            if (checkusercmd.equals("*")){
              match=false;
            }
          }

        }
        else if ( checklistcmd.startsWith("list")){
       //-- for access-list arguments
        }
        else {
          //when not match keyword and not match argument
          match = false;
        }//end if
//        System.out.println("Match->"+match);
      }
      if (match){
        if ((!tmp1.hasMoreTokens())&&(!tmp2.hasMoreTokens())){
          nummatch++;
          commandlist = list;
        }
      }//end if
      list = (String)allCmd.nextElement();
    }//end while
    if (nummatch == 1){
      StringTokenizer st2 = new StringTokenizer(commandlist);
      listcmd = st2.nextToken();
//      System.out.println("match");
      boolean con = true;
      while ((((st1.hasMoreTokens())||(st2.hasMoreTokens())))&&con){
        if (st1.hasMoreTokens())
          usercmd = st1.nextToken();
        else usercmd = "";
        listcmd = st2.nextToken();
        if (listcmd.startsWith("arg")){
          if (listcmd.equalsIgnoreCase("arg_ip")){
            if (!Interface.isIp(usercmd)){
              con = false;
            }
            else{
            }
          }
          else if (listcmd.equalsIgnoreCase("arg_num")){
            try {
              Integer.parseInt(usercmd);
            }
            catch (Exception exp){
              // Error in number
              con = false;
            }
          }
          else if (listcmd.equalsIgnoreCase("arg_string")){
            if (usercmd.equals("")){
              con = false;
//              System.out.println("false="+usercmd);
            }
            else {
              while (st1.hasMoreTokens()){
                String x = st1.nextToken();
              }
            }
          }
          else if (listcmd.equalsIgnoreCase("arg_routetype")){
            String sta = "static";
            String rip = "rip";
            String osp = "ospf";
            con = false;
            usercmd = usercmd.toLowerCase();
            switch (usercmd.charAt(0)){
              case 's': if (usercmd.equalsIgnoreCase(sta.substring(0,usercmd.length()))){
                          con = true;
                        }
                        break;
              case 'r': if (usercmd.equalsIgnoreCase(rip.substring(0,usercmd.length()))){
                          con = true;
                        }
                        break;
              case 'o': if (usercmd.equalsIgnoreCase(osp.substring(0,usercmd.length()))){
                          con = true;
                        }
                        break;
            }
          }
          else if (listcmd.equalsIgnoreCase("arg_typeint")){
            String eth = "Ethernet";
            String ser = "Serial";
            String tok = "Tokenring";
            con = false;
            usercmd = usercmd.toLowerCase();
            switch (usercmd.charAt(0)){
              case 'e': if (usercmd.equalsIgnoreCase(eth.substring(0,usercmd.length()))){
                            con = true;
                          }
                          break;
              case 's': if (usercmd.equalsIgnoreCase(ser.substring(0,usercmd.length()))){
                            con = true;
                          }
                          break;
              case 't': if (usercmd.equalsIgnoreCase(tok.substring(0,usercmd.length()))){
                            con = true;
                          }
                          break;
              default :  //Error in type of interface
            }
          }
          else if (listcmd.equalsIgnoreCase("arg_intname")){
            String eth = "Ethernet";
            String ser = "Serial";
            String tok = "Tokenring";
            con = false;
            usercmd = usercmd.toLowerCase();
            switch (usercmd.charAt(0)){
              case 'e' :  if (usercmd.length() < 10){ //EthernetXX
                            int ii = 0;
                            while (usercmd.charAt(ii) == eth.charAt(ii)){
                              ii++;
                            }//end while
                            if (Interface.getNum(usercmd.substring(ii)) > -1){
                              con = true;
                            }//end if
                          }//end if
                          break;
              case 's' :  if (usercmd.length() < 8){ //SerialXX
                            int ii = 0;
                            while (usercmd.charAt(ii) == ser.charAt(ii)){
                              ii++;
                            }//end while
                            if (Interface.getNum(usercmd.substring(ii)) > -1){
                              con = true;
                            }//end if
                          }//end if
                          break;
              case 't' :  if (usercmd.length() < 11){ //TokenringXX
                            int ii = 0;
                            while (usercmd.charAt(ii) == eth.charAt(ii)){
                              ii++;
                            }//end while
                            if (Interface.getNum(usercmd.substring(ii)) > -1){
                              con = true;
                            }//end if
                          }//end if
                          break;
              default : //Error in interface name
            }//end switch
          }
          else if (listcmd.equalsIgnoreCase("arg_ip_name")){
            con = false;
            if (!Interface.isIp(usercmd)){
              for(int i=0; i<NewRouter.vRouter.size(); i++){
                Router rou = (Router)NewRouter.vRouter.elementAt(i);
                if (usercmd.equalsIgnoreCase(rou.getName())){
                  con = true;
                }//end if
              }//end for
            }//end if
            else {
              con = true;
            }//end else
          }
          else if (listcmd.equalsIgnoreCase("arg_protocol")){
            con = false;
            if ((usercmd.equalsIgnoreCase("rip"))||(usercmd.equalsIgnoreCase("ospf"))){
              con = true;
            }//end if
          }

          else if(listcmd.equalsIgnoreCase("arg_time")){
          }
          else if (listcmd.equalsIgnoreCase("arg_name")){
            con = false;
            for(int i=0; i<NewRouter.vRouter.size(); i++){
              Router rou = (Router)NewRouter.vRouter.elementAt(i);
              if (usercmd.equalsIgnoreCase(rou.getName())){
                con = true;
              }//end if
            }//end for
          }
          else {
            //error
            con = false;
//            System.out.println("con = false");
          }
        }//end if
        //-----------------------------------------------------------------------------------------
        //-- access control list check sequence
        else if (listcmd.startsWith("list")){

          if(listcmd.startsWith("list-number")){

            con = false;
            //-- Range 1-99 for Standard IP  ,  100- 199 for Extened IP
            if(Integer.parseInt(usercmd) >=1 && Integer.parseInt(usercmd) <= 199 )
              con = true;

          }
          else if(listcmd.startsWith("list-condition")){ // { deny | permit }

            con = false;

            if(usercmd.equalsIgnoreCase("deny")||usercmd.equalsIgnoreCase("permit"))
              con = true;

          }
          else if(listcmd.startsWith("list-source")){ // xxx.xxx.xxx.xxx

            con = false ;

            if(Interface.isIp(usercmd)||usercmd.equalsIgnoreCase("any")||usercmd.equalsIgnoreCase("host"))
              con = true;

          }

          else if(listcmd.startsWith("list-source-wildcard")){ // xxx.xxx.xxx.xxx

            con = false ;

            if(Interface.isIp(usercmd))
              con = true;
          }
          else if(listcmd.startsWith("list-destination")){ // xxx.xxx.xxx.xxx

            con = false ;

            if(Interface.isIp(usercmd)||usercmd.equalsIgnoreCase("any")||usercmd.equalsIgnoreCase("host"))
              con = true;

          }

          else if(listcmd.startsWith("list-destination-wildcard")){ // xxx.xxx.xxx.xxx

            con = false ;

            if(Interface.isIp(usercmd))
              con = true;
          }
          else if(listcmd.startsWith("list-inout")){ // { in | out }

            con = false;

            if(usercmd.equalsIgnoreCase("in")||usercmd.equalsIgnoreCase("out"))
              con = true;

          }
          else if(listcmd.equalsIgnoreCase("list-protocal")){

            con = false;

            if(usercmd.equalsIgnoreCase("ip")||usercmd.equalsIgnoreCase("eigrp")
               ||usercmd.equalsIgnoreCase("gre")||usercmd.equalsIgnoreCase("igmp")
               ||usercmd.equalsIgnoreCase("igrp")||usercmd.equalsIgnoreCase("ipinip")
               ||usercmd.equalsIgnoreCase("nos")||usercmd.equalsIgnoreCase("ospf")
               ||usercmd.equalsIgnoreCase("tcp")||usercmd.equalsIgnoreCase("udp"))

              con = true;

          }
          else if(listcmd.equalsIgnoreCase("list-operator")){

            con = false;

            if(usercmd.equalsIgnoreCase("eq")||usercmd.equalsIgnoreCase("neq")||usercmd.equalsIgnoreCase("gt")||usercmd.equalsIgnoreCase("lt"))
              con = true;

          }
          else if(listcmd.equalsIgnoreCase("list-port")){

            con = false;

            if( Integer.parseInt(usercmd) > 0 )
              con = true;

          }
        }
//----------------------------------------------------------------------------------------
        else {
          if (st1.hasMoreTokens()){
/*            usercmd = st1.nextToken();
            listcmd = st2.nextToken();
            if (!usercmd.equalsIgnoreCase(listcmd.substring(0,usercmd.length()))){
              con = false;
            }//end if*/
          }//end if
          else {
            if (!st2.hasMoreTokens()){
              con = true;
            }
            else{
              con = false;
            }
          }
        }//end else
      }//end while
      if (con){
        accept = true;
//        System.out.println("Accept");
      }//end if
      else{
        output += error;//StatusPanel.showOutputConsole(output,//router);
//        System.out.println(error);
      }//end else
    }//end if
    else if (nummatch > 1){
      output += ambigous + "\"" + cmdline + "\"\n";//StatusPanel.showOutputConsole(output,//router);
//      System.out.println(ambigous+ "\"" + usercmd + "\"");

    }//end if
    else{
      //not in list command
      output += error;//StatusPanel.showOutputConsole(output,//router);
//      System.out.println("% Invalid input detected at '^' marker.");
    }//end else
    if (accept){
      if (commandlist.equals("enable")){
        output="";
        enablecmd(router);
      }
      else if (commandlist.equals("?")){
        Command c = new Command();
        switch(router.getMode()){
          case 1 : output="";c.showCmd1(router);output = c.getOutput();break;
          case 2 : output="";c.showCmd2(router);output = c.getOutput();break;
          case 3 : output="";c.showCmd3(router);output = c.getOutput();break;
          case 4 : output="";c.showCmd4(router);output = c.getOutput();break;
          case 5 : output="";c.showCmd5(router);output = c.getOutput();break;
          case 6 : output="";c.showCmd6(router);output = c.getOutput();break;
          default : output += error;//StatusPanel.showOutputConsole(output,//router);
        }
        Command.output="";
      }
      //-- access control list command -----------------------------------------------------
    //-- global command
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-source list-source-wildcard")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String source = s.nextToken();
      String wildcard = s.nextToken();

      accessStandardWithWild( router , number , condition , source , wildcard );
    }
    //-- global command
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-source")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String source = s.nextToken();

      accessStandardWithOutWild( router , number , condition , source );

    }
    else if (commandlist.equalsIgnoreCase("no access-list list-number")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      number = s.nextToken();

      noAccessList( router , number );

    }
    //-- interface command
    else if (commandlist.equalsIgnoreCase("ip access-group list-number list-inout")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      number = s.nextToken();
      String inout = s.nextToken();

      setAccessListToInterface( router , number , inout );
    }
    else if (commandlist.equalsIgnoreCase("no ip access-group list-number list-inout")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      number = s.nextToken();
      number = s.nextToken();
      String inout = s.nextToken();

      noAccessListToInterfeace( router , number , inout );

    }
    else if (commandlist.equalsIgnoreCase("show access-lists")){

      showAccessList( router );
    }
    //-- Extended IP
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-protocal list-source list-destination")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String protocal = s.nextToken();
      String source = s.nextToken();
      String destination = s.nextToken();

      accessListProtocal( router , number , condition , protocal , source , "" , destination , "" );
    }
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-protocal list-source list-source-wildcard list-destination")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String protocal = s.nextToken();
      String source = s.nextToken();
      String sourceWild = s.nextToken();
      String destination = s.nextToken();

      accessListProtocal( router , number , condition , protocal , source , sourceWild , destination , "" );
    }
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-protocal list-source list-destination list-destination-wildcard")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String protocal = s.nextToken();
      String source = s.nextToken();
      String destination = s.nextToken();
      String desWild = s.nextToken();
      accessListProtocal( router , number , condition , protocal , source , "" , destination , desWild );
    }
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-protocal list-source list-source-wildcard list-destination list-destination-wildcard")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String protocal = s.nextToken();
      String source = s.nextToken();
      String sourWild = s.nextToken();
      String destination = s.nextToken();
      String desWild = s.nextToken();
      accessListProtocal( router , number , condition , protocal , source , sourWild , destination , desWild );
    }
    //-- TCP / UDP access list
    else if (commandlist.equalsIgnoreCase("access-list list-number list-condition list-protocal list-source list-source-wildcard list-operator list-port list-destination list-destination-wildcard list-operator list-port")){

      StringTokenizer s = new StringTokenizer(cmdline);
      String number = s.nextToken();
      number = s.nextToken();
      String condition = s.nextToken();
      String protocal = s.nextToken();
      String source = s.nextToken();
      String sourWild = s.nextToken();
      String op1 = s.nextToken();
      String port1 = s.nextToken();
      String destination = s.nextToken();
      String desWild = s.nextToken();
      String op2 = s.nextToken();
      String port2 = s.nextToken();
      accessListTCP_UDP( router , number , condition , protocal , source , sourWild ,op1,port1, destination , desWild , op2 , port2 );
     }
      else if (commandlist.equals("ping arg_ip_name")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        pingcmd(router,arg);
      }
      else if (commandlist.equals("traceroute arg_ip_name")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        traceroutecmd(router,arg);
      }
      else if (commandlist.equals("exit")){
        exitcmd(router,rconsole);
      }
      else if (commandlist.equals("configure terminal")){
        configtcmd(router);
      }
      else if (commandlist.equals("configure")){
        configcmd(router);
      }
      else if (commandlist.equals("disable")){
        disablecmd(router);
      }
      else if (commandlist.equals("clock set arg_time_date")){
      }
      else if (commandlist.equals("debug ip rip")){
        debugipripcmd(router);
      }
      else if (commandlist.equals("undebug ip rip")){
       undebugipripcmd(router);
      }
      else if (commandlist.equals("show history")){
          showhistorycmd(router);
      }
      else if (commandlist.equals("terminal editing")){
        terminaleditcmd(router);
      }
      else if (commandlist.equals("terminal no editing")){
        terminalnoeditcmd(router);
      }
      else if (commandlist.equals("show running-config")){
        showruncmd(router);
      }
      else if (commandlist.equals("show startup-config")){
        showstartcmd(router);
      }
      else if (commandlist.equals("copy running-config startup-config")){
        copyrunstartcmd(router);
      }
      else if (commandlist.equals("copy startup-config running-config")){
        copystartruncmd(router);
      }
      else if (commandlist.equals("erase startup-config")){
        erasestartcmd(router);
      }
      else if (commandlist.equals("reload")){
      }
      else if (commandlist.equals("show version")){
        showversioncmd(router);
      }
      else if (commandlist.equals("show interface")){
        showintcmd(router);
      }
      else if (commandlist.equals("show ip protocol")){
        showipprotocol(router);
      }
      else if (commandlist.equals("show ip rip database")){
      showip_database(router,'r');
      }
      else if (commandlist.equals("show ip ospf database")){
      showip_database(router,'o');
      }
      else if (commandlist.equals("show interface arg_typeint")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        showintcmd(router,arg);
      }
      else if (commandlist.equals("interface arg_intname")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        intcmd(router,arg);
      }
      else if (commandlist.equals("hostname arg_string")){
        System.out.print("VRouter+++++SW:  "+NewRouter.vRouter.size());
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        hostnamecmd(router,arg);
      }
      else if (commandlist.equals("enable secret arg_string")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        enablesecretcmd(router,arg);
      }
      else if (commandlist.equals("no enable secret")){
        noenablesecretcmd(router);
      }
      else if (commandlist.equals("line vty 0 4")){
        linevtycmd(router);
      }
      else if (commandlist.equals("line auxiliary 0")){
        lineAuxcmd(router);
      }
      else if (commandlist.equals("line console 0")){
        lineConsolecmd(router);
      }
      else if (commandlist.equals("password arg_string")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        linepasswdcmd(router,arg);
      }
      else if (commandlist.equals("login")){
        logincmd(router);
      }
      else if (commandlist.equals("no login")){
        nologincmd(router);
      }
      else if (commandlist.equals("banner motd#")){
      }
      else if (commandlist.equals("no banner login")){
      }
      else if (commandlist.equals("show ip route")){
        showiproutecmd(router);
      }
      else if (commandlist.endsWith("show ip route arg_routetype")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        showiproutecmd(router,arg);
      }
      else if (commandlist.equals("ip route arg_ip arg_ip arg_ip")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        String arg2 = stoken.nextToken();
        String arg3 = stoken.nextToken();
        iproutecmd(router,arg1,arg2,arg3);
      }
      else if (commandlist.equals("ip classless")){
        ipclasslesscmd(router);
      }
      else if (commandlist.equals("no ip route arg_ip arg_ip arg_ip")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        String arg2 = stoken.nextToken();
        String arg3 = stoken.nextToken();
        noiproutecmd(router,arg1,arg2,arg3);
      }
      else if (commandlist.equals("no ip classless")){
        noipclasslesscmd(router);
      }
      else if (commandlist.equals("router arg_protocol")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        routercmd(router,arg,1);
        Status.setInt(router);
        //Frame3.showStatus_name(//router);
      }
      else if (commandlist.equals("router arg_protocol arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        String arg2 = stoken.nextToken();
        routercmd(router,arg1,Integer.parseInt(arg2));
      }
      else if (commandlist.equals("no router arg_protocol")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        noroutercmd(router,arg);
      }
      else if (commandlist.equals("ip host arg_name arg_ip")){
      }
      else if (commandlist.equals("cdp timer arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        router.getCdp().setTimer(Integer.parseInt(arg));
        //rout = //router;
      }
      else if (commandlist.equals("cdp holdtime arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        router.getCdp().setHoldTime(Integer.parseInt(arg));
        //rout = //router;
      }
      else if (commandlist.equals("ip address arg_ip arg_ip")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        String arg2 = stoken.nextToken();
        ipaddcmd(router,arg1,arg2);
      }
      else if (commandlist.equals("encapsulation")){
      }
      else if (commandlist.equals("shutdown")){
        shutcmd(router);
      }
      else if (commandlist.equals("no shutdown")){
        noshutcmd(router);
      }
      else if (commandlist.equals("passive-interface arg_intname")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        passivecmd(router,arg);
      }
      else if (commandlist.equals("no passive-interface arg_intname")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        nopassivecmd(router,arg);
      }
      else if (commandlist.equals("distribute-list arg_gateway")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        distributelistcmd(router,arg);
      }
      else if (commandlist.equals("ring-speed arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        ringspeedcmd(router,Integer.parseInt(arg));
      }
      else if (commandlist.equals("description arg_string")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = "";
        while (stoken.hasMoreTokens()){
          arg += stoken.nextToken()+" ";
        }
        arg.trim();
        descriptcmd(router,arg);
        System.out.println("des="+arg);
      }
      else if (commandlist.equals("bandwidth arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        bandwidthcmd(router,Integer.parseInt(arg));
      }
      else if (commandlist.equals("clock rate arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        clockratecmd(router,Integer.parseInt(arg));
      }
      else if (commandlist.equals("show ip ospf neighbors")){
        showospfneighbor(router);
      }
      else if (commandlist.equals("show ip ospf interface arg_intname")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        showospfint(router,arg);
      }
      else if (commandlist.equals("ip ospf cost arg_name arg_num")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        String arg2 = stoken.nextToken();
        System.out.println("switch="+arg1+":"+arg2);
        ospfcost(router,arg1,Integer.parseInt(arg2));
      }
      else if (commandlist.equals("network arg_ip")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        router.setNetwork_address(arg1);
      }
      else if (commandlist.equals("no network arg_ip")){
        output="";
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        arg1 = stoken.nextToken();
        if(arg1.equalsIgnoreCase(router.getNetwork_address()))
        {
          router.setNetwork_address("161.246.0.0");
        }
        else
        {
          //output="network address not correct";
        }
      }
      else if (commandlist.equals("version arg_num")){
      }
      else if (commandlist.equals("show cdp")){
        Command c = new Command();
        output="";
        c.showCdp(router);
        output = c.getOutput();
        Command.output="";
      }
      else if(commandlist.equals("show cdp interface")){
        Command c = new Command();
        output="";
        c.showCdpInt(router);
        output = c.getOutput();
        Command.output="";
      }
      else if (commandlist.equals("show cdp neighbors")){
        Command c = new Command();
        output="";
        c.showCdpNeighbors(router);
        output = c.getOutput();
        Command.output="";
      }
      else if (commandlist.equals("show cdp entry *")){
        Command c = new Command();
        output="";
        c.showCdpEntry(router,"*");
        output = c.getOutput();
        Command.output="";
      }
      else if (commandlist.equals("show cdp entry arg_name")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        arg = stoken.nextToken();
        Command c = new Command();
        output="";
        c.showCdpEntry(router,arg);
        output = c.getOutput();
        Command.output="";
      }
      else if (commandlist.equals("telnet arg_ip_name")){
        StringTokenizer stoken = new StringTokenizer(cmdline);
        String arg = stoken.nextToken();
        arg = stoken.nextToken();
        output="";
        telnetcmd(router,arg,rconsole);
      }
    }//end accept
  }//end function

  //--------------Old Function---------------------//
  String findFirstCMD(String c,char separator){
    int i=0;
    while ((c.charAt(i) != separator) && (i+1 < c.length())){
      i++;
    }
    return c.substring(0,i+1).trim();
  }
  String[] splitCMD(String str){
    String arrCMD[] = new String[6];
    for (int i=0;i <6;i++){
      arrCMD[i] = "";
    }
    int i=0;
    while (str.length() >0){
      arrCMD[i] = findFirstCMD(str,' ');
      str = str.substring(arrCMD[i].length()).trim();
      i++;
    }
    return arrCMD;
  }
  public void sendCMD(Router router,String cmdline){
    String[] arrCMD = new String[6];
    arrCMD = splitCMD(cmdline);
    if (router.getMode() == 10){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      System.out.print(arrCMD[0]+"&"+router.getPasswd());
      if (arrCMD[0].equalsIgnoreCase(router.getPasswd())){
        router.setMode(2);
        //rout = //router;
      }
    }
    else
    //-------Mode 1------------//
    if (cmdline.startsWith("?")){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      Command c = new Command();
      switch (router.getMode()){
        case 1 : c.showCmd1(router);output = c.getOutput();break;
        case 2 : c.showCmd2(router);output = c.getOutput();break;
        case 3 : c.showCmd3(router);output = c.getOutput();break;
        case 4 : c.showCmd4(router);output = c.getOutput();break;
        default: break;
      }//end switch
       Command.output="";
    }
    else if((arrCMD[0].equalsIgnoreCase("enable"))&&(arrCMD[1].equalsIgnoreCase("password"))){
      if (arrCMD[2].length() != 0){
        router.setPasswd(arrCMD[2]);
        //rout = //router;
      }
      else {output += error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("en"))||(arrCMD[0].equalsIgnoreCase("enable"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 1){
        if (router.getPasswd() == null){
          router.setMode(2);
          //rout = //router;
        }
        else {
          router.setMode(10);
          //rout = //router;
        }
      }//end if
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    //------------Mode 2--------------//
    else if((arrCMD[0].equalsIgnoreCase("dis"))||(arrCMD[0].equalsIgnoreCase("disable"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 2){
        router.setMode(1);
        //rout = //router;
      }//end if
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("config"))&&((arrCMD[1].equalsIgnoreCase("t"))||(arrCMD[1].equalsIgnoreCase("terminal")))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if(router.getMode() == 2){
        router.setMode(3);
        //rout = //router;
        output="Enter configuration commands, one per line. End with CNTL/Z.\n";//StatusPanel.showOutputConsole(output,router);
      }//end if
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("set"))&&(arrCMD[1].equalsIgnoreCase("clock"))){
      router.setClock(arrCMD[2]+" "+arrCMD[3]+" "+arrCMD[4]+" "+arrCMD[5]);
      //rout = //router;
      System.out.println(router.getClock());
    }
    //-----------Mode 3--------//
    else if(((arrCMD[0].equalsIgnoreCase("int"))||(arrCMD[0].equalsIgnoreCase("interface")))&&(arrCMD[1].length() != 0)){
      output = "";
      if ((router.getMode() == 3) || (router.getMode() == 4)){
         router.setMode(4);
        //rout = //router;
        setInterface(router,arrCMD[1]);
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("hostname"))&&(arrCMD[1].length() != 0)){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        setHostname(router,arrCMD[1]);
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("no"))&&(arrCMD[1].equalsIgnoreCase("ip"))&&(arrCMD[2].equalsIgnoreCase("//route"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        if ((arrCMD[3].length() != 0)&&(arrCMD[4].length() != 0)&&(arrCMD[5].length() != 0)){
          setNoIpRoute(router,arrCMD[3],arrCMD[4],arrCMD[5]);
        }
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("ip"))&&(arrCMD[1].equalsIgnoreCase("route"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        if ((arrCMD[2].length() != 0)&&(arrCMD[3].length() != 0)&&(arrCMD[4].length() != 0)){
          setIpRoute(router,arrCMD[2],arrCMD[3],arrCMD[4]);
        }
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("router"))&&(arrCMD[1].equalsIgnoreCase("rip"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        router.setMode(5);
        //rout = //router;
        setRouterRip(router);
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("router"))&&(arrCMD[1].equalsIgnoreCase("ospf"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        router.setMode(5);
        //rout = //router;
        setRouterOspf(router);
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("no")) && (arrCMD[1].equalsIgnoreCase("router")) && (arrCMD[2].equalsIgnoreCase("rip"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        router.setMode(5);
        //rout = //router;
        setNoRouterRip(router);
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("no")) && (arrCMD[1].equalsIgnoreCase("router")) && (arrCMD[2].equalsIgnoreCase("ospf"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        router.setMode(5);
        //rout = //router;
        setNoRouterOspf(router);
      }
      else {output = error;//tatusPanel.showOutputConsole(output,//router);
      }
    }
    else if(arrCMD[0].equalsIgnoreCase("exit")){
       output = "";//StatusPanel.showOutputConsole(output,//router);
        switch (router.getMode()){
          case 1 : router.setMode(0);output="reset";//StatusPanel.showOutputConsole(output,//router);
                    break;
          case 3 : router.setMode(2);output="%SYS-5-CONFIG_I: Configured from console by console\n";
                   //StatusPanel.showOutputConsole(output,//router);
                   break;
          case 4 : router.setMode(3);output="";
                  // StatusPanel.showOutputConsole(output,//router);
                   break;
          case 5 : router.setMode(2);output="%SYS-5-CONFIG_I: Configured from console by console\n";
                   //StatusPanel.showOutputConsole(output,//router);
                   break;
          default :output="";//StatusPanel.showOutputConsole(output,//router);
        }//end switch
        //rout = //router;
    }
    //------------Mode 4---------------//
    else if ((arrCMD[0].equalsIgnoreCase("bandwidth"))&&(arrCMD[1].length() != 0)){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 4){
        Interface i1 = (Interface)router.getVInt().lastElement();
        i1.setBandwidth(Integer.parseInt(arrCMD[1]));
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("clock rate"))&&(arrCMD[1].length() != 0)){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 4){
        Interface i1 = (Interface)router.getVInt().lastElement();
        i1.setClockRate(Integer.parseInt(arrCMD[1]));
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("ip"))&&((arrCMD[1].equalsIgnoreCase("add"))||(arrCMD[1].equalsIgnoreCase("address")))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 4){
        if ((arrCMD[2].length() != 0)&&(arrCMD[3].length() != 0)){
          setIpAddress(router,arrCMD[2],arrCMD[3]);
        }//have value
      }//in proper mode
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("no"))&&((arrCMD[1].equalsIgnoreCase("shut"))||(arrCMD[1].equalsIgnoreCase("shutdown")))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 4){
        Interface inf = (Interface)router.getVInt().lastElement();
        inf.noshutInt(router);
        output="%LINEPROTO-5-UPDOWN: Line protocol on Interface "+inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to up\n%LINK-3-UPDOWN: Interface "+inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to up\n";
        //StatusPanel.showOutputConsole(output,//router);
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("shut"))||(arrCMD[0].equalsIgnoreCase("shutdown"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 4){
        Interface inf = (Interface)router.getVInt().lastElement();
        inf.shutInt(router);
        output="%LINEPROTO-5-UPDOWN: Line protocol on Interface "+inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to down\n%LINK-3-UPDOWN: Interface"+ inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to administratively down\n";
        //StatusPanel.showOutputConsole(output,//router);
      }
      else {output = error;
      //StatusPanel.showOutputConsole(output,//router);
      }
    }
    //-----------Mode < 3 -------------//
    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&((arrCMD[1].equalsIgnoreCase("int"))||(arrCMD[1].equalsIgnoreCase("interface")))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() < 3){
        Command c = new Command();
        if (arrCMD[2].length() != 0){
          output="";
          Command.output ="";
          c.showInt(router,arrCMD[2]);
          output = c.getOutput();
          Command.output="";
        }
        else{
          output="";
          Command.output ="";
          c.showInt(router);
          output = c.getOutput();
          Command.output="";
        }
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if(((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&(arrCMD[1].equalsIgnoreCase("ip"))&&(arrCMD[2].equalsIgnoreCase("//route"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() < 3){
        if(arrCMD[3].length() != 0){
          Command c = new Command();
          if (arrCMD[3].equalsIgnoreCase("static")){
            Command.output ="";
            c.showIpRoute(router,'s');
            output = c.getOutput();
            Command.output="";
          }
          else if(arrCMD[3].equalsIgnoreCase("rip")){
            Command.output ="";
            c.showIpRoute(router,'r');
            output = c.getOutput();
            Command.output="";
          }
          else if (arrCMD[3].equalsIgnoreCase("ospf")){
//            c.
          }
        }
        else {
          Command c = new Command();
          Command.output ="";
          if (router.getFlag() != 'o'){
            c.showIpRoute(router);
            output = c.getOutput();
            Command.output="";
          }
          else {
          }
        }//if specific type of ip //route
      }//if correct mode
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("traceroute"))&&(arrCMD[1].length() != 0)){
      if (router.getMode() < 3){
        output = "";//StatusPanel.showOutputConsole(output,//router);
        Command.output ="";
//        System.out.println("Start trace at "+ arrCMD[1] + "\n");
        output = "Start trace at "+ arrCMD[1] + "\n";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        if (router.getFlag() != 'o'){
          c.trace(router,arrCMD[1]);
          //rout = c.getRouter();
          output = c.getOutput();
          Command.output="";
        }
        else {
          output += c.trace_ospf(router,arrCMD[1]);//StatusPanel.showOutputConsole(output,//router);
          Command.output="";
        }
      }
      else{output = error;//StatusPanel.showOutputConsole(output,//router);
           Command.output="";
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("ping"))&&(arrCMD[1].length() != 0)){
      if (router.getMode() < 3){

        output = "";//StatusPanel.showOutputConsole(output,//router);
        Command.output ="";
        Command c = new Command();
        if (router.getFlag() != 'o'){
          c.ping(router,arrCMD[1]);
          //rout = c.getRouter();
          output = c.getOutput();
          Command.output="";
        }
        else {
          output += c.ping_ospf(router,arrCMD[1]);//tatusPanel.showOutputConsole(output,//router);
          Command.output="";
        }
      }
      else{output = error;//StatusPanel.showOutputConsole(output,//router);
       Command.output="";
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("telnet"))&&(arrCMD[1].length() != 0)){
      if (router.getMode() < 3){
        output = "";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
//        c
      }
    }
    //--------Mode  >1 & < 3 -------------//
    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&(arrCMD[1].equalsIgnoreCase("ip"))&&(arrCMD[2].equalsIgnoreCase("protocol"))){
      if (router.getMode() == 2){
        output = "";//StatusPanel.showOutputConsole(output,//router);
        Command.output ="";
        Command c = new Command();
        c.showIPProtocol(router);
        output = c.getOutput();
        Command.output="";
      }
      else {output = error;//StatusPanel.showOutputConsole(output,//router);
            Command.output="";
      }
    }

    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&& (arrCMD[1].equalsIgnoreCase("history"))){
      if (router.getMode() == 2){
        output="";
        Command.output ="";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        c.showHistory(router);
        output = c.getOutput(); Command.output="";
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("erase"))&&(arrCMD[1].equalsIgnoreCase("startup-config"))){
      if (router.getMode() == 2){
        output ="";//tatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        c.eraseStartUp(router);
        //rout = c.getRouter();
        output = c.getOutput();
        Command.output="";
      }
    }
    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&(arrCMD[1].equalsIgnoreCase("startup-config"))){
      if (router.getMode() == 2){
        output ="";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        c.showStartUp(router);
        output = c.getOutput();
        Command.output="";
      }
    }
    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&(arrCMD[1].equalsIgnoreCase("running-config"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 2){
        output = "";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        c.showRunningConfig(router);
        output = c.getOutput();
        Command.output="";
      }
      else {output=error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if ((arrCMD[0].equalsIgnoreCase("copy"))&&(arrCMD[1].equalsIgnoreCase("running-config"))&&(arrCMD[2].equalsIgnoreCase("startup-config"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 2){
        output = "";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        c.saveRunningConfig(router);
        //rout = c.getRouter();
        output = c.getOutput();
        Command.output="";
      }
      else {output=error;//StatusPanel.showOutputConsole(output,//router);
           Command.output="";
      }
    }
    else if((arrCMD[0].equalsIgnoreCase("ip")) && (arrCMD[1].equalsIgnoreCase("ospf")) &&(arrCMD[2].equalsIgnoreCase("cost"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 3){
        if (arrCMD[5]!=null && arrCMD[3]!=null && arrCMD[4] != null){
          Ospf o = (Ospf)router.getOSPF();
          o.setWeight(arrCMD[3],arrCMD[4],Integer.parseInt(arrCMD[5]));
        }
      }
      else {output=error;//StatusPanel.showOutputConsole(output,//router);
            output="";
      }
    }
    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&(arrCMD[1].equalsIgnoreCase("ip"))&&(arrCMD[2].equalsIgnoreCase("ospf"))&&(arrCMD[3].equalsIgnoreCase("neighbor"))){
      output = "";//StatusPanel.showOutputConsole(output,//router);
      if (router.getMode() == 2){
        output ="";//StatusPanel.showOutputConsole(output,//router);
        output += "Neighbor\tID\tPri\tState\tDead Time\tAddress\tInterface\n";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        output += c.show_ip_ospf_neighbor(router);//StatusPanel.showOutputConsole(output,//router);
        Command.output="";
      }
      else {output=error;//StatusPanel.showOutputConsole(output,//router);
      }
    }
    else if (((arrCMD[0].equalsIgnoreCase("sh"))||(arrCMD[0].equalsIgnoreCase("show")))&&(arrCMD[1].equalsIgnoreCase("ip"))&&(arrCMD[2].equalsIgnoreCase("ospf"))&&((arrCMD[3].equalsIgnoreCase("int"))||(arrCMD[3].equalsIgnoreCase("interface")))){
      if (router.getMode() == 2){
        if (arrCMD[4].length() != 0){
          output = "";//StatusPanel.showOutputConsole(output,//router);
          Command c = new Command();
          output += c.show_ip_ospf_inf(router,arrCMD[4]);//StatusPanel.showOutputConsole(output,//router);
          Command.output="";
        }
      }
    }
    else {output=error;//StatusPanel.showOutputConsole(output,//router);
    }
  }
  //-------------------End old Function-----------------------//
  //---------------Command int e0-------------//
  public void setInterface(Router r,String s){
    Interface i1 = new Interface();
    Interface.output="";
    i1.AddNewInt(r,s);
    //rout = Interface.getRouter();
    output= i1.getOutput();
    Interface.output="";

  }
  //-------------Command ip address-----------//
  public void setIpAddress(Router r,String ip,String subnet){
    // check router is right
    System.out.print("Vintsize_out: "+r.getVInt().size());
    for(int i=0;i<NewRouter.vRouter.size();i++)
    {
      Router rt = (Router)NewRouter.vRouter.elementAt(i);
      if(rt.getName().equalsIgnoreCase(r.getName()))
      {
        r=rt;
        System.out.print("Vintsize_in: "+r.getVInt().size());
      }// end if
    }// end for

   Interface.output="";
    boolean dup = false;
    for(int a=0; a < NewRouter.vRouter.size(); a++){
      Router tmp = (Router)NewRouter.vRouter.elementAt(a);
      for(int b=0; b < tmp.getVInt().size(); b++){
        Interface i = (Interface)tmp.getVInt().elementAt(b);
        System.out.println("IP: "+i.getIpAddress());
        System.out.println("net_add: "+i.getNetAddress());//test---------------
        System.out.println("model: "+i.getType());
        if (i.getIpAddress().equalsIgnoreCase(ip)){

          dup = true;
        }//end if
      }//end for
    }//end for

    if (dup){
      output += "Allready " + ip + "\n";//StatusPanel.showOutputConsole(output,r);
       Interface.output="";
      // System.out.println("dup");//test----------------------
    }//end ip
    else{
      Interface i1 = (Interface)r.getVInt().lastElement();
      i1.setIpAddress(r,ip,subnet);
       }
   }
  //------------Command ip rotue-----------------//
  public void setIpRoute(Router r,String des,String subnet,String gw){

    if ((r.getFlag() == 'c')||(r.getFlag() == 's')){
      RoutingTable rt = new RoutingTable();
      rt.ipRoute(r,des,subnet,gw);
      r.setFlag('s');
    }
    else{
      output += "You have another protocol\n";//StatusPanel.showOutputConsole(output,r);
    }
  }
  //----------Command no ip //route--------------//
  public void setNoIpRoute(Router r,String des,String subnet,String gw){
    if(r.getFlag() == 's'){
      RoutingTable rt = new RoutingTable();
      rt.noIpRoute(r,des,subnet,gw);
      output = rt.getOutput();
      boolean have = false;
      for (int a=0;a < r.getVrt().size();a++){
        RoutingTable rrt = (RoutingTable)r.getVrt().elementAt(a);
        if (rrt.getRouteType() == 's'){
          have = true;
        }
      }
      if (!have){
        r.setFlag('c');
      }
    }
    else {
      output += "You don't have static //route\n";//StatusPanel.showOutputConsole(output,r);
    }
  }
  //--------------set ip  database-------------------------------
  public void showip_database(Router r,char f){
    output="";
    String s="";
    for (int i=0;i < r.getVrt().size();i++){
         RoutingTable rt = (RoutingTable)r.getVrt().elementAt(i);

           s = s + rt.getIpDestination();
           switch (rt.getRouteType()){

             case 'r' : s = s +"\n            ["+rt.getMatrice()+"]  via  " + rt.getGateway() + ",  " + rt.getInterface().getType()+rt.getInterface().getNameInt().charAt(rt.getInterface().getNameInt().length()-1) + "\n";
                        break;
             case 'o'  : s = s +"n            ["+rt.getMatrice()+"]  via  " + rt.getGateway() + ",  " + rt.getInterface().getType()+rt.getInterface().getNameInt().charAt(rt.getInterface().getNameInt().length()-1) + "\n";
                        break;
             case 'c' : s = s + "  is directly connected, "+rt.getInterface().getType()+rt.getInterface().getNameInt().charAt(rt.getInterface().getNameInt().length()-1)+"\n";
                        break;
           }//end switch
           output=s;

    }//end for
  }
  //-------------Command Hostname-----------//
  public void setHostname(Router r,String name){
    boolean dup = false;
    System.out.print("VRouter+++++HOST:  "+NewRouter.vRouter.size());
    for(int i=0; i < NewRouter.vRouter.size(); i++){
      Router tmp = (Router)NewRouter.vRouter.elementAt(i);
      if(tmp.getName().equalsIgnoreCase(name)){
        dup = true;
      }//end if
    }//end for
    if (dup){
      output = output + "Already " + name +"\n";//StatusPanel.showOutputConsole(output,r);
    }//end if
    else {
      r.setName(name);
      Status.setInt(r);
      StatusPanel.showStatus_name(r);
      //FrameR.setR(r);
      //Router.setTab(name);
    }//end else
  }
  //---------Commnad Router rip-------------//
  public void setRouterRip(Router r){
    if (r.getFlag() == 'c'){
      r.setFlag('r');
      Status.setInt(r);
      StatusPanel.showStatus_name(r);
      Rip ripf = (Rip)r.getRIP();
//      ripf.start();
    }
    else {
      output += "You have already static //route\n";//StatusPanel.showOutputConsole(output,r);
    }
  }
  //-------Command no //router rip-----------//
  public void setNoRouterRip(Router r){
    if (r.getFlag() == 'r'){
      r.setFlag('c');
      Status.setInt(r);
      StatusPanel.showStatus_name(r);
      Rip ripf = (Rip)r.getRIP();
      ripf.stop();
      //Delete Routing Table with flag 'r'
      for(int b=r.getVrt().size()-1; b > -1; b--){
        RoutingTable rting = (RoutingTable)r.getVrt().elementAt(b);
        if (rting.getRouteType() == 'r'){
          r.getVrt().removeElementAt(b);
        }//end if
      }//end for
    }
    else{
      output += "You don't have Protocol RIP\n";//StatusPanel.showOutputConsole(output,r);
    }
  }
  //---------Command no //router ospf---------//
  public void setNoRouterOspf(Router r){
    if (r.getFlag() == 'o'){
      r.setFlag('c');
      Status.setInt(r);
      StatusPanel.showStatus_name(r);
      Ospf ospff = (Ospf)r.getOSPF();
      ospff.stop();
    }
    else{
      output += "You don't have Protocol OSPF\n";//StatusPanel.showOutputConsole(output,r);
    }
  }
  //--------Set //router OSPF---------------//
  public void setRouterOspf(Router r){
    if(r.getFlag() == 'c'){
      r.setFlag('0');
      Status.setInt(r);
      StatusPanel.showStatus_name(r);
      Ospf ospff = (Ospf)r.getOSPF();
      ospff.start();
    }
    else {
      output += "You have already static //route\n";//StatusPanel.showOutputConsole(output,r);
    }
  }
  public SwitchCMD() {
  }
  //-----------End old Function-----------//


  //---------New Function-------------//
  public void enablecmd(Router router){
   /* for(int i=0;i<NewRouter.vRouter.size();i++)
    {
      Router rt = (Router)NewRouter.vRouter.elementAt(i);
      if(rt.getName().equalsIgnoreCase(router.getName()))
      {*/
        output = "";//StatusPanel.showOutputConsole(output,//router);
        if (!router.getEnablePasswd()){
         router.setMode(2);
          //rout = //router;
          System.out.print("getmode : "+router.getMode()+"\n");
          System.out.print("ranme : "+router.getMode()+"\n");
        }
        else {
          router.setMode(10);
          //rout = //router;
          System.out.print("getmode : "+router.getMode()+"\n");
          System.out.print("ranme : "+router.getMode()+"\n");
        }
      //}
   // }
  }
  //----------------passive---------------------------
  public void passivecmd(Router r,String intname )
  {
    for(int i=0;i<r.getVInt().size();i++)
    {
     Interface inf =(Interface)r.getVInt().elementAt(i);
     if(inf.getNameInt().equalsIgnoreCase(intname))
     {
       inf.setPassive(true);
     }//end if
    }//end for
  }
  //----------------no passive---------------------------
  public void nopassivecmd(Router r,String intname )
  {
    for(int i=0;i<r.getVInt().size();i++)
    {
      Interface inf =(Interface)r.getVInt().elementAt(i);
      if(inf.getNameInt().equalsIgnoreCase(intname))
      {
        inf.setPassive(false);
      }//end if
    }//end for
  }
  //-----------------distribute-list---------------
  public void distributelistcmd(Router r,String gw)
  {

  }
  //-----------------ping------------------------------
  public void pingcmd(Router router,String arg){

        System.out.println("ping");
        Command c = new Command();
        if (router.getFlag() != 'o'){
          c.ping(router,arg);
          //rout = c.getRouter();
          output = c.getOutput();
        }
        else {
          output += c.ping_ospf(router,arg);//StatusPanel.showOutputConsole(output,//router);
        }
       // router = rt;

  }
  public void traceroutecmd(Router router,String arg){

        output += "Start trace at " + arg + "\n";//StatusPanel.showOutputConsole(output,//router);
        Command c = new Command();
        if (router.getFlag() != 'o'){
          c.trace(router,arg);
          //rout = c.getRouter();
          output = c.getOutput();
        }
        else {
          output += c.trace_ospf(router,arg);//StatusPanel.showOutputConsole(output,//router);
        }

  }
  public void telnetcmd(Router r,String ip,Console rconsole){

        Command c = new Command();
        c.telnetCmd(r,ip,rconsole);
        output = c.getOutput();

  }
  public void exitcmd(Router router,Console rconsole){
   /* for(int i=0;i<NewRouter.vRouter.size();i++)
    {
      Router rt = (Router)NewRouter.vRouter.elementAt(i);
      if(rt.getName().equalsIgnoreCase(router.getName()))
      {*/
        System.out.println(rconsole.getRouters().size());
        if (rconsole.getRouters().size() == 1){
          switch (router.getMode()){
            case 1 : router.setMode(0);output+="reset";
             // StatusPanel.showOutputConsole(output,router);
              break;
            case 2 : output += error;
            case 3 : router.setMode(2);output+="%SYS-5-CONFIG_I: Configured from console by console\n";
              //StatusPanel.showOutputConsole(output,//router);
              break;
            case 4 : router.setMode(3);output+="";
              //StatusPanel.showOutputConsole(output,//router);
              break;
            case 5 : router.setMode(2);output+="%SYS-5-CONFIG_I: Configured from console by console\n";
              //StatusPanel.showOutputConsole(output,//router);
              break;
            case 6 : router.setMode(2);router.setLineMode(-1);output+="%SYS-5-CONFIG_I: Configured from console by console\n";
              //StatusPanel.showOutputConsole(output,//router);
              break;
              //      default :output="";

          }//end switch
          //output="";
          //rout = //router;
        }
        else{
          //Exit From Telnet
          Router telnetRouter = (Router)rconsole.getRouters().elementAt(rconsole.getRouters().size()-1);
          telnetRouter.setMode(telnetRouter.getOldMode());
          rconsole.getRouters().removeElementAt(rconsole.getRouters().size()-1);
          rconsole.setRouter((Router)rconsole.getRouters().lastElement());
          Router oldRouter = (Router)rconsole.getRouters().lastElement();
          oldRouter.setMode(oldRouter.getOldMode());
          //router.setTelnet(false);
       }//end else
  }
  public void configtcmd(Router router){
    router.setMode(3);
    //rout = //router;
    output+="Enter configuration commands, one per line. End with CNTL/Z.\n";//StatusPanel.showOutputConsole(output,//router); output="";
    //output="";
  }
  public void configcmd(Router router){
    router.setMode(20);//rout = //router;
    output += "Configuring from terminal, memory, or network[terminal]?";
  }
  public void disablecmd(Router router){
    router.setMode(1);//rout = //router;
  }
  public void clocksetcmd(){
  }
  public void showhistorycmd(Router router){
    Command c = new Command();
    c.showHistory(router);
    output = c.getOutput();
    //rout = //router;
  }
  public void terminaleditcmd(Router router){
    router.setTerminalEdit(true);
    //rout = //router;
  }
  public void terminalnoeditcmd(Router router){
    router.setTerminalEdit(false);
    //rout = //router;
  }
  public void showruncmd(Router router){

        Command c = new Command();
        c.showRunningConfig(router);
        output = c.getOutput();

  }
  public void showstartcmd(Router router){

        Command c = new Command();
        c.showStartUp(router);
        output = c.getOutput();

  }
  public void copyrunstartcmd(Router router){

        Command c = new Command();
        c.saveRunningConfig(router);
        //rout = c.getRouter();
        output = c.getOutput();

  }
  public void copystartruncmd(Router router){
  }
  public void erasestartcmd(Router router){

        Command c = new Command();
        c.eraseStartUp(router);
        //rout = c.getRouter();
        output = c.getOutput();

  }
  public void reloadcmd(Router router){
  }
  public void showversioncmd(Router router){
    Command c = new Command();
    c.showVersion(router);
    output = c.getOutput();
    //rout = //router;
  }
  public void showintcmd(Router router){
    Command c = new Command();
    c.showInt(router);
    output = c.getOutput();
    //rout = //router;
  }
  public void showintcmd(Router router,String type){
    Command c = new Command();
    c.showInt(router,type);
    output = c.getOutput();
    //rout = //router;
  }
  public void showipprotocol(Router router){
    Command c = new Command();
    c.showIPProtocol(router);
    output = c.getOutput();
    //rout = //router;
  }
  public void intcmd(Router router,String intname){
    router.setMode(4);
    Interface i1 = new Interface();
    i1.AddNewInt(router,intname);
    //rout = Interface.getRouter();
    output= i1.getOutput();
    //rout = //router;
  }
  public void enablesecretcmd(Router router,String passwd){

        router.setEnablePasswd(true);
        router.setPasswd(passwd);
        System.out.print("Rname:  "+router.getName()+"\n");
        System.out.print("REnable:  "+router.getEnablePasswd()+"\n");
        System.out.print("Rpassw:  "+router.getPasswd()+"\n");

  }
  public void noenablesecretcmd(Router router){

        router.setEnablePasswd(false);

  }
  public void hostnamecmd(Router router,String name){
    //System.out.println("Hostname1");
    boolean dup = false;
    for(int i=0; i < NewRouter.vRouter.size(); i++){
      Router tmp = (Router)NewRouter.vRouter.elementAt(i);
      if(tmp.getName().equalsIgnoreCase(name)){
        dup = true;
      }//end if
    }//end for
    if (dup){
      output = output + "Already " + name +"\n";//StatusPanel.showOutputConsole(output,//router); output="";
    }//end if
    else {

          router.setName(name);
          // set name of status

          Status.setInt(router);
          System.out.println("Hostname1:"+router.getName()+"\n");
          Status.showInt();
          StatusPanel.showStatus_name(router);

     /* router.setName(name);
      // set name of status
      Status.setInt(router);
      System.out.println("Hostname1:"+router.getName()+"\n");
      Status.showInt();
      StatusPanel.showStatus_name(router);*/
      // set title name of frame

    }//end else
  //rout = //router;
  }
  public void showiproutecmd(Router router){
    Command c = new Command();
    if (router.getFlag() != 'o'){
      c.showIpRoute(router);
      output = c.getOutput();
    }
    else {
      output += c.show_ip_route_ospf(router,true);//StatusPanel.showOutputConsole(output,//router); output="";
    }
    //rout = //router;
  }
  public void showiproutecmd(Router router,String protocol){
    Command c = new Command();
    if (protocol.equalsIgnoreCase("static")){
      c.showIpRoute(router,'s');
      output = c.getOutput();
    }
    else if(protocol.equalsIgnoreCase("rip")){
       c.showIpRoute(router,'r');
      output = c.getOutput();
    }
    else if (protocol.equalsIgnoreCase("ospf")){
            output=c.show_ip_route_ospf(router,false);
            //output = c.getOutput();
    }
    //rout = //router;
  }
  public void iproutecmd(Router router,String des,String subnet,String gw){


        if ((router.getFlag() == 'c')||(router.getFlag() == 's')){
          RoutingTable rt = new RoutingTable();
          rt.ipRoute(router,des,subnet,gw);
          router.setFlag('s');
          //Status.setInt(router);// set protocal for display
          //StatusPanel.showStatus_name(router);
        }
        else{
          output += "You have another protocol\n";//StatusPanel.showOutputConsole(output,//router); output="";
        }

  }
  public void noiproutecmd(Router router,String des,String subnet,String gw){

        if(router.getFlag() == 's'){
          RoutingTable rt = new RoutingTable();
          rt.noIpRoute(router,des,subnet,gw);
          output = rt.getOutput();
          boolean have = false;
          for (int a=0;a < router.getVrt().size();a++){
            RoutingTable rrt = (RoutingTable)router.getVrt().elementAt(a);
            if (rrt.getRouteType() == 's'){
              have = true;
            }//end if
          }//end for
          if (!have){
            router.setFlag('c');

            //Status.setInt(router);// set protocal for display
            //StatusPanel.showStatus_name(router);
          }//end if
        }//end if
        else {
          output += "You don't have static route\n";//StatusPanel.showOutputConsole(output,//router); output="";
        }

  }
  //---------------- Access List Implement commands ----------------------------------------
  public void accessStandardWithWild( Router router , String number , String condition , String source , String wildcard ){

    //-- create access list
    router.newAccessList( number , condition , source , wildcard );
  }

  public void accessStandardWithOutWild( Router router , String number , String condition , String source ){

    //-- create access list
    router.newAccessList( number , condition , source , "");
  }

  public void noAccessList( Router router , String number  ){

    //-- delete access list
    router.deleteAccessList( number ) ;
  }

  public void accessListProtocal( Router router , String number , String condition , String protocal , String source , String sourWild , String destination ,String desWild ){

    //-- set access list for Extended IP
    router.newAccessList( number , condition , protocal , source , sourWild , destination , desWild );
  }

  public void accessListTCP_UDP( Router router , String number , String condition , String protocal , String source , String sourWild , String op1 , String port1 , String destination ,String desWild , String op2 , String port2 ){

    //-- set access list for TCP , UDP
    router.newAccessList(  number , condition , protocal , source , sourWild ,op1,port1, destination , desWild , op2 , port2 );
  }

  public void setAccessListToInterface( Router router , String number , String inout ){

    Interface inf = (Interface)router.getVInt().lastElement();
    boolean b = false;

    //-- check with exits access-list number
    for( int i = 0 ; i < router.getVAccess().size() ; i ++ ){

      AccessList acc = (AccessList)router.getVAccess().elementAt(i);
      if( number.equalsIgnoreCase(acc.getNumber()) ) b = true;
    }
    //-- if have not any match
    if( !b ){
      number = "";
      inout = "";
    }
    inf.setAccessListNumber(number);
    inf.setConditionAccessList(inout);
    System.out.println( "Interfece list : number " + inf.getAccessListNumber() + " Condition " + inf.getConditionAccessLsit());
  }

  public void noAccessListToInterfeace( Router router , String number , String inout ){

    Interface inf = (Interface)router.getVInt().lastElement();
    if( number.equalsIgnoreCase( inf.getAccessListNumber()) && inout.equalsIgnoreCase( inf.getConditionAccessLsit() )){
      inf.setAccessListNumber("");
      inf.setConditionAccessList("");
    }
  }

  public void showAccessList( Router router){

    output = "";

    for( int i = 0 ; i < router.getVAccess().size() ; i++ ){

      AccessList acc1 = (AccessList)router.getVAccess().elementAt(i);
      output += acc1.getAccessType() + acc1.getNumber() + "\n";
      output += acc1.getShow()  + "\n";

      for( int j = i+1 ; j < router.getVAccess().size() ; j++ ){

        AccessList acc2 = (AccessList)router.getVAccess().elementAt(j);

        //-- same number
        if( acc1.getNumber().equalsIgnoreCase(acc2.getNumber())){
          output += acc2.getShow() + "\n";
          i++;
        }
      }
    }
  }

  //----------------------------------------------------------------------------------------
  public void linevtycmd(Router router){
    router.setMode(6);
    router.setLineMode(1);
    //rout = //router;
  }
  public void lineAuxcmd(Router router){
    router.setMode(6);
    router.setLineMode(2);
    //rout = //router;
  }
  public void lineConsolecmd(Router router){
    router.setMode(6);
    router.setLineMode(3);
    //rout = //router;
  }
  public void ipclasslesscmd(Router router){
  }
  public void noipclasslesscmd(Router router){
  }
  public void routercmd(Router router,String protocol,int num){

        if (protocol.equalsIgnoreCase("ospf")){
          if((router.getFlag() == 'c')||(router.getFlag() == 'o')){

            router.setMode(5);
            router.setFlag('o');
            router.setProtocol("OSPF");

            if (!NewRouter.singleMode){
              Ospf ospff = (Ospf)router.getOSPF();
              if (ospff.isAlive()){
                ospff.resume();
                System.out.println("resume not single mode");
              }
              else{
                ospff.start();
                System.out.println("start not single mode");
              }
            }//not single mode
            else{
        }//sigle mode

       // Status.setInt(router);// set protocal for display
       // StatusPanel.showStatus_name(router);
      }//end flag c or o
      else {
        output += "You have already other protocol\n";//StatusPanel.showOutputConsole(output,//router); output="";
      }//end flag is not c or o
    }//end protocol ospf

    //-------Protocol RIP---------------------//
    else if (protocol.equalsIgnoreCase("rip")){
      if ((router.getFlag() == 'c')||(router.getFlag() == 'r')){
        router.setMode(5);
        router.setFlag('r');
        router.setProtocol("RIP");

       //rt=router;
       // Status.setInt(router);
       // StatusPanel.showStatus_name(router);
//        if (!Router.singleMode){
          Rip ripf = (Rip)router.getRIP();
          if (ripf.isAlive()){
            ripf.resume();
            System.out.println("resume not single mode");
          }
          else{
            ripf.start();
            output = router.output;
            System.out.println("start not single mode");
            System.out.println("Vrt size: "+router.getVrt().size()+"\n");
          }

      }//end flag c or r
      else {
        output += "You have already other protocol\n";//StatusPanel.showOutputConsole(output,//router); output="";
      }//end flag is not c or r
    }//end protocol rip
    else {
      output += error;//StatusPanel.showOutputConsole(output,//router); output="";
    }//end if no ospf
     //router = rt;
   // rt = router;

  }//end
  public void noroutercmd(Router router,String protocol){

        if (protocol.equalsIgnoreCase("rip")){
          if (router.getFlag() == 'r'){

            router.setFlag('c');
            router.setProtocol("Not have any");
            Status.setInt(router);
            StatusPanel.showStatus_name(router);
            Rip ripf = (Rip)router.getRIP();
//        ripf.stop();
            ripf.suspend();
            router.setMode(5);
            //Delete Routing Table with flag 'r'
            for(int b=router.getVrt().size()-1; b > -1; b--){
              RoutingTable rting = (RoutingTable)router.getVrt().elementAt(b);
              if (rting.getRouteType() == 'r'){
                router.getVrt().removeElementAt(b);
              }//end if
            }//end for
          }
          else{
            output += "You don't have Protocol RIP\n";//StatusPanel.showOutputConsole(output,//router); output="";
          }
        }//end protocol rip
        else if (protocol.equalsIgnoreCase("ospf")){
          if(router.getFlag() == 'o'){
            router.setFlag('c');
            router.setProtocol("Not have any");
            Status.setInt(router);
            StatusPanel.showStatus_name(router);
            Ospf ospff = (Ospf)router.getOSPF();
//        ospff.stop();
            ospff.suspend();
            router.setMode(5);
            //Delete Routing Table with flag 'o'
            for(int b=router.getVrt().size()-1; b > -1; b--){
              RoutingTable rting = (RoutingTable)router.getVrt().elementAt(b);
              if (rting.getRouteType() == 'o'){
                router.getVrt().removeElementAt(b);
              }//end if
            }//end for
          }
          else{
            output += "You don't have Protocol OSPF\n";//StatusPanel.showOutputConsole(output,//router); output="";
          }
        }//end protocol ospf
        else {
          output += error;//StatusPanel.showOutputConsole(output,//router); output="";
        }
  }
  public void ipaddcmd(Router router,String ip,String subnet){
     System.out.print("VInt size Of router:  "+router.getVInt().size());
     System.out.print("rname:  "+router.getName());
     System.out.print("VRsize:  "+NewRouter.vRouter.size());

    boolean dup = false;
    for(int a=0; a < NewRouter.vRouter.size(); a++){
      Router tmp = (Router)NewRouter.vRouter.elementAt(a);
      System.out.print("Vtmp size:  "+tmp.getVInt().size());
      System.out.print("rname:  "+tmp.getName());
        for(int b=0; b < tmp.getVInt().size(); b++){
          System.out.print("VInt size:  "+router.getVInt().size());
         Interface i = (Interface)tmp.getVInt().elementAt(b);//

        if (i.getIpAddress().equalsIgnoreCase(ip)){//
          dup = true;
          try{
            Interface i1 = (Interface)router.getVInt().lastElement();
            if ((i1.getNameInt().equals(i.getNameInt()))){
              dup = false;
            }//end if
          }//end try
          catch (Exception exp){
          }//end catch
        }//end if
      }//end for
    }//end for
    if (dup){
      output = output + "Allready " + ip + "\n";//StatusPanel.showOutputConsole(output,//router); output="";
    }//end ip
    else{
      try{

            Interface i1 = (Interface)router.getVInt().lastElement();
            System.out.println("invoke show int");
            i1.setIpAddress(router,ip,subnet);
            System.out.print("Vintsize_in: "+router.getVInt().size());
            Status.setInt(router);
            StatusPanel.showStatus_int(router);
      }
      catch(Exception exp){
        output += "Can't add ip address\n";//StatusPanel.showOutputConsole(output,//router); output="";
      }
    }
    //rout = //router;
  }
  public void shutcmd(Router router){

        Interface inf = (Interface)router.getVInt().lastElement();
        inf.shutInt(router);
        Status.setInt(router);
        StatusPanel.showStatus_int(router);
        output+="%LINEPROTO-5-UPDOWN: Line protocol on Interface "+inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to down\n%LINK-3-UPDOWN: Interface"+ inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to administratively down\n";
        //StatusPanel.showOutputConsole(output,//router); output="";
  }
  public void noshutcmd(Router router){

        Interface inf = (Interface)router.getVInt().lastElement();
        inf.noshutInt(router);
        Status.setInt(router);
        StatusPanel.showStatus_int(router);
        output+="%LINEPROTO-5-UPDOWN: Line protocol on Interface "+inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to up\n%LINK-3-UPDOWN: Interface "+inf.getType() + inf.getNameInt().charAt(inf.getNameInt().length()-1)+", changed state to up\n";
        //StatusPanel.showOutputConsole(output,//router); output="";
    //rout = //router;
  }
  public void ringspeedcmd(Router router,int speed){

        Interface inf = (Interface)router.getVInt().lastElement();
        if (inf.getType().equals("Token Ring")){
          inf.setRingSpeed(speed);
        }
        else{
          output += error;//StatusPanel.showOutputConsole(output,//router); output="";
        }

 }
  public void debugipripcmd(Router router){

       Command c = new Command();
       c.debugiprip(router);
       output = c.getOutput();
       c.output="";

  }
  public void undebugipripcmd(Router router){

     Command c = new Command();
     c.undebugiprip(router);
     output = c.getOutput();
     c.output="";

  }
  public void descriptcmd(Router router,String descript){

        Interface i1 = (Interface)router.getVInt().lastElement();
        i1.setDescription(descript);

  }
  public void bandwidthcmd(Router router,int bandwidth){

        Interface i1 = (Interface)router.getVInt().lastElement();
        System.out.println("bandwidth="+bandwidth);
        if (i1.getType().equals("Serial")){
          i1.setBandwidth(bandwidth);
        }
        else {
          output += error;//StatusPanel.showOutputConsole(output,//router); output="";
    }
    //rout = //router;
  }
  public void clockratecmd(Router router,int clockrate){

        Interface i1 = (Interface)router.getVInt().lastElement();
        if (i1.getType().equals("Serial")){
          i1.setClockRate(clockrate);
        }
        else{
          output += error;//StatusPanel.showOutputConsole(output,//router); output="";
    }
    //rout = //router;
  }
  public void linepasswdcmd(Router router,String passwd){

        switch (router.getLineMode()){
          case 1 : router.setVtyPasswd(passwd);break;
          case 2 : router.setAuxPasswd(passwd);break;
          case 3 : router.setConsolePasswd(passwd);break;
          default : output += error;//StatusPanel.showOutputConsole(output,//router); output="";
        }//end switch

  }
  public void logincmd(Router router){

        router.setEnableTelnet(true);
  }
  public void nologincmd(Router router){

        router.setEnableTelnet(false);

  }
  public void showprotocolcmd(Router router){

        Command c = new Command();
        c.showIPProtocol(router);
        output = c.getOutput();

  }
  public void showospfneighbor(Router router){

        output += "Neighbor\tID\tPri\tState\tDead Time\tAddress\tInterface\n";
        Command c = new Command();
        output += c.show_ip_ospf_neighbor(router);//StatusPanel.showOutputConsole(output,//router); output="";

  }
  public void showospfint(Router router,String type){

        Command c = new Command();
        output += c.show_ip_ospf_inf(router,type);//StatusPanel.showOutputConsole(output,//router); output="";

  }
  public void ospfcost(Router router,String name1,int cost){

        System.out.println(name1+":"+cost);
        Ospf o = (Ospf)router.getOSPF();
        o.setWeight(router.getName(),name1,cost);

  }
 /* static Router  getRouter(){
    return rout;
  }*/
  static String getOutput()
  {
    return output;
  }
 /*    public void CheckRouter(Router r)
  {
    for(int i=0;i<NewRouter.vRouter.size();i++){
      Router r1 =(Router)NewRouter.vRouter.elementAt(i);
      if(r1.getName().equalsIgnoreCase(r.getName()))
      {
        setRouter(r1);
      }
    }//end for
  }*/
  public void tabCmd(String findword,int mode){
    StringTokenizer st1 = new StringTokenizer(findword);
    ListCommand allCmd = null;
    output="";
    String returnword="";
    switch (mode){
      case 1 :
                //User Exec Commands
                allCmd = cmdUserExe;
                break;
      case 2 :
                //Privileged EXec Commands
                allCmd = cmdPrivilegedExe;
                break;
      case 3 :
                //Global Config
                allCmd = globalConfig;
                break;
      case 4:
                //Interface Commands
                allCmd = intCmd;
                break;
      case 5 :
                //Routing Engine Commands
                allCmd = routingCmd;
                break;
      case 6 :
                //Line Commands
                allCmd = lineCmd;
                break;
      default : output  += "Error in Mode\n";//StatusPanel.showOutputConsole(output,r);
    }
    allCmd.resetList();
    String usercmd="";
    if (st1.hasMoreTokens()){
      usercmd = st1.nextToken();
    }
    String listcmd = "";
    String commandlist ="";
    String list = (String)allCmd.nextElement();
    String matchCmd = "";
    while (allCmd.hasMoreElements()){
      boolean match = true;
      StringTokenizer tmp1 = new StringTokenizer(findword);
      StringTokenizer tmp2 = new StringTokenizer(list);
      while ((tmp1.hasMoreTokens())&&(match)){
        String checkusercmd = tmp1.nextToken();
        String checklistcmd="";
        if(tmp2.hasMoreTokens()){
          //both have more token
          checklistcmd = tmp2.nextToken();
        }
        else {
          //case usercmd have more token but list not more token
          match = false;
        }
        if ((checkusercmd.length() <= checklistcmd.length())&&(!checklistcmd.startsWith("arg"))){
          if (checkusercmd.equalsIgnoreCase(checklistcmd.substring(0,checkusercmd.length()))){
            //if cmd must equal
          }//end if
          else{
            match = false;
          }//end else
        }//end if screen only keyword
        else if (checklistcmd.startsWith("arg")){
          //when list is argument
        }
        else {
          //when not match keyword and not match argument
          match = false;
        }//end if
      }
//      System.out.println("match="+match+"\nlistcmd="+listcmd);
      if (match){
//        if ((!tmp1.hasMoreTokens())&&(!tmp2.hasMoreTokens())){
          returnword+= list;
          output += list+"   ";//StatusPanel.showOutputConsole(output,r);
//        }
      }//end if
      list = (String)allCmd.nextElement();
    }
    System.out.println("returnword="+returnword);
  }
}
