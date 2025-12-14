package routersim;

import java.util.*;
import java.awt.*;
import com.borland.jbcl.layout.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.rmi.Naming;
import java.util.Date;

public class RouterConsole extends JPanel {
  private XYLayout xYLayout1 = new XYLayout();
  private JScrollPane jScrollPane1 = new JScrollPane();
  private JTextArea jTextArea1 = new JTextArea();
  private Router router = null;
  private Router telnetRouter = new Router();
  private String oldtext = "";
  private int position = 58;
  private int numcmd = -1;
  private int promptp = -1;
  private static boolean terminalEdit=false;
  private String initStr = "Router con0 is now available\n\nPress return to get start\n\n\n";
  static String output="";
  private Vector routers = new Vector();
  static char switchRouter = 'n';
 // private SwitchCMD sw = new SwitchCMD();
  private boolean waitkey = false;
  private TitledBorder titledBorder1;
  private JList jList1 = new JList();
  static int focus = 0;
  static String serverName="";
  private RouterConsoleInt rcon1;
  private int index=-1;


 /*public Router getTelnetRouter(){
   return telnetRouter;
  }
  public void setTelnetRouter(Router r){
   telnetRouter = r;
  }*/
  public RouterConsole() {
  try {

    jbInit();
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
  }
  public RouterConsole(Router r) {
    try {
      serverName = Frame3.serverName;
      NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
      rcon1 = (RouterConsoleInt)Naming.lookup("//"+serverName+"/RouterConsoleService");
      for(int i=0;i<nr.getvRouter().size();i++)
      {
      Router router =(Router)nr.getvRouter().elementAt(i);
        if(r.getName().equalsIgnoreCase(router.getName()))
        {
          index = i;
          router = r;
          rcon1.NewConsole(index);
          //setRouter(rcon1.getrouter());
          rcon1.setrouter(rcon1.getrouter());
          System.out.print("History size---:00"+rcon1.gethistory(index).size());
          jbInit();
        }
      }// end for

     }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
 /* public void setRouter(Router r){
    this.router = r;
  }*/
  //public Router getRouterofRconsole(){
  //  return router;
  //}
  void jbInit() throws Exception {
    //-----Set Layout----------//
    titledBorder1 = new TitledBorder("");
    this.setLayout(xYLayout1);
    //-----Set Color------------//
    jScrollPane1.getViewport().setBackground(Color.white);
    this.setBackground(Color.lightGray);
    //-----Set Border--------//
    jScrollPane1.setBorder(titledBorder1);
    jScrollPane1.addKeyListener(new java.awt.event.KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        jScrollPane1_keyPressed(e);
      }
    });
    //------Set Size---------//
    xYLayout1.setWidth(634);
    xYLayout1.setHeight(477);
    //------Add Component---------//
    jTextArea1.setLineWrap(true);
    jTextArea1.setWrapStyleWord(true);
    jTextArea1.setBorder(null);
    jTextArea1.setEditable(false);
    jTextArea1.setText(initStr);
    jTextArea1.addMouseListener(new java.awt.event.MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        jTextArea1_mouseClicked(e);
      }
      public void mouseReleased(MouseEvent e) {
        jTextArea1_mouseReleased(e);
      }
    });
    jTextArea1.addKeyListener(new java.awt.event.KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        jTextArea1_keyPressed(e);
      }
    });
    this.add(jScrollPane1,new XYConstraints(8, 7, 602, 455));
    this.add(jList1, new XYConstraints(249, 422, -1, -1));
    jScrollPane1.getViewport().add(jTextArea1, null);
    //--Other--//
  }
  void jTextArea1_keyPressed(KeyEvent e) {
   try{
    String fullcmd = "";
    String cmd="";
    String oldcommand = jTextArea1.getText();
    String backcmd = jTextArea1.getText();
    int keyCode = e.getKeyCode();
    if (keyCode == 88){
      if (waitkey){
       waitkey = false;
      }
    }
//------------------------------------------------------------------------------//
       //when ctrl+z
    if (( rcon1.getMode(index)== 3)||(rcon1.getMode(index) == 4)){
       if ((keyCode == 90)&&(e.isControlDown())){
        output="";
        e.consume();
        String s="";
        jTextArea1.append("^z\n");
        jTextArea1.append("%SYS-5-CONFIG_I: Configured from console by console\n");
        if (rcon1.getMode(index) == 3){
          s = "(config)#^z\n" + "%SYS-5-CONFIG_I: Configured from console by console\n";
        }
        else {
          s = "(config-if)#^z\n" + "%SYS-5-CONFIG_I: Configured from console by console\n";
        }
//        System.out.println(position);
        position += rcon1.getName(index).length() + s.length();
        rcon1.setMode(index,2);
         rcon1.setrouter(rcon1.getrouter());
        showPrompt("");
//        System.out.println(router.getMode());
      }
    }//end check Ctrl z
//------------------------------------------------------------------------------//
    //? commands
    if ((keyCode == 47)&&(e.isShiftDown())){
      output="";
      e.consume();
      position = jTextArea1.getText().length()+2;
      jTextArea1.append("?\n");
      String oldcmd = jTextArea1.getText();

      rcon1.runCMD(index,"?");
       rcon1.setrouter(rcon1.getrouter());
      output=rcon1.getOutput(index);
      rcon1.setOutput(index);
      rcon1.setOutput(index);
      //router.getHistory().add(router.getHistory().size()-1,"?");
      rcon1.addhistory(index,"?");
       rcon1.setrouter(rcon1.getrouter());
      numcmd = rcon1.gethistory(index).size()-1;//.getHistory().size()-1;
      if (!output.equalsIgnoreCase("reset")){
          //output=rcon1.getOutput();
          jTextArea1.append(output);//--------------------------------------------// display output
          //jTextArea1.append(rcon1.getOutput());
           rcon1.setOutput(index);
          // output="";
        if (output.length() > 0){
          position += output.length();
        }
        showPrompt("");
      }
    }
//------------------------------------------------------------------------------//
    //Ctrl A
    else if ((keyCode == 65)&&(e.isControlDown())){
      e.consume();
      if (rcon1.getTedit(index)){
      int pos = position + rcon1.getName(index).length();
        switch (rcon1.getMode(index)){
          case 1 : pos += 1;break;
          case 2 : pos += 1;break;
          case 3 : pos += 9;break;
          case 4 : pos += 12;break;
          case 5 : pos += 16;break;
          case 6 : pos += 14;break;
          case 10 : pos = position + 9;break;
          case 11 : pos = position + 9;break;
          case 12 : pos = position + 9;break;
          default : break;
        }//end switch
//        System.out.println("Ctrl+a"+pos);
        jTextArea1.setCaretPosition(pos);
      }//end if
    }
//------------------------------------------------------------------------------//
    //Ctrl E
    else if ((keyCode == 69)&&(e.isControlDown())){
      e.consume();
      if (rcon1.getTedit(index)){
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
      }
    }
    //Ctrl E
    else if ((keyCode == 66)&&(e.isControlDown())){
      e.consume();
      int pos = position + rcon1.getName(index).length();
      switch (rcon1.getMode(index)){
        case 1 : pos += 1;break;
        case 2 : pos += 1;break;
        case 3 : pos += 9;break;
        case 4 : pos += 12;break;
        case 5 : pos += 16;break;
        case 6 : pos += 14;break;
        case 10 : pos = position + 9;break;
        case 11 : pos = position + 9;break;
        case 12 : pos = position + 9;break;
        default : break;
      }//end switch
      int nowpos = jTextArea1.getCaretPosition();
      if (nowpos > pos){
        jTextArea1.setCaretPosition(nowpos-1);
      }
    }
//------------------------------------------------------------------------------//
    //Ctrl F
    else if ((keyCode == 70)&&(e.isControlDown())){
      e.consume();
      try{
        int pos = jTextArea1.getCaretPosition();
        jTextArea1.setCaretPosition(pos+1);
      }
      catch (Exception exp){
//        System.out.println("over line");
      }
    }
//------------------------------------------------------------------------------//
    //Ctrl P
    else if ((keyCode == 80)&&(e.isControlDown())){
      e.consume();
//      System.out.println("ctrl+p");
      if (numcmd != 0){
        String oldcmd="";
        try{
          oldcmd = jTextArea1.getText(0,position);
//        System.out.println("oldcmd:"+oldcmd);
        }
        catch(Exception exp){
        }
        jTextArea1.setText(oldcmd);
      }//end if num != 0
      else {
        String oldcmd="";
        try{
          oldcmd = jTextArea1.getText(0,position);
//        System.out.println("oldcmd:"+oldcmd);
        }
        catch(Exception exp){
        }
        jTextArea1.setText(oldcmd);
      }//end else num = 0
      if ((numcmd > 0) && (numcmd <= rcon1.gethistory(index).size())){
        showPrompt((String)rcon1.gethistory(index).elementAt(numcmd-1));
        numcmd--;
      }
      else {
        showPrompt((String)rcon1.gethistory(index).firstElement());
      }
    }
//------------------------------------------------------------------------------//
    //Ctrl + Shift + 6 then x
    else if ((keyCode == 54)&&(e.isShiftDown())&&(e.isControlDown())){
      e.consume();
      waitkey=true;
//      System.out.println("to wait");
    }
    //Backspace
    else if (keyCode == 8){
      output="";
      int pos = position + rcon1.getName(index).length();
      switch (rcon1.getMode(index)){
        case 1 : pos += 1;break;
        case 2 : pos += 1;break;
        case 3 : pos += 9;break;
        case 4 : pos += 12;break;
        case 5 : pos += 16;break;
        case 6 : pos += 14;break;
        case 10 : pos = position + 9;break;
        case 11 : pos = position + 9;break;
        case 12 : pos = position + 9;break;
        default : break;
      }
      int nowpos = jTextArea1.getText().length()-1;
      if (nowpos < pos){
        jTextArea1.append("a");
      }
    }
//------------------------------------------------------------------------------//Enter
    //Enter
    else if (keyCode == 10){
      output="";
      e.consume();
      if (jTextArea1.getText().equals(initStr)){
        enterKey(rcon1.getrouter());
      }
      else {
        jTextArea1.append("\n");
        try{
        oldtext = jTextArea1.getText(0,position);
        oldtext += "\n";
//        System.out.println("oldtext:"+oldtext+"end oldtext");
        }
        catch(Exception excep){
//          System.out.print("error");
        }

        try{
          fullcmd = jTextArea1.getText(position,jTextArea1.getText().length()-position);
  //        System.out.println("Fullcmd="+fullcmd);
        }
        catch (Exception exp){
          switch(rcon1.getMode(index)){
            case 1 : fullcmd = rcon1.getName(index) + ">";break;
            case 2 : fullcmd = rcon1.getName(index) + "#";break;
            case 3 : fullcmd = rcon1.getName(index) + "(config)#";break;
            case 4 : fullcmd = rcon1.getName(index) + "(config-if)#";break;
            case 5 : fullcmd = rcon1.getName(index) + "(config-router)#";break;
            case 6 : fullcmd = rcon1.getName(index) + "(config-line)#";break;
            case 10 : fullcmd = "password:";break;
            case 11 : fullcmd = "password:";break;
            case 12 : fullcmd = "password:";break;
            case 20 : fullcmd = "Configuring from terminal, memory, or network[terminal]?";break;
            default : break;
          }
        }//end catch
        position = jTextArea1.getText().length();
        switch(rcon1.getMode(index)){
          case 0 : jTextArea1.setText(initStr);break;
          case 1 : cmd = fullcmd.substring(rcon1.getName(index).length()+1);break;
          case 2 : cmd = fullcmd.substring(rcon1.getName(index).length()+1);break;
          case 3 : cmd = fullcmd.substring(rcon1.getName(index).length()+9);break;
          case 4 : cmd = fullcmd.substring(rcon1.getName(index).length()+12);break;
          case 5 : cmd = fullcmd.substring(rcon1.getName(index).length()+16);break;
          case 6 : cmd = fullcmd.substring(rcon1.getName(index).length()+14);break;
          case 10 : cmd = fullcmd.substring(9);break;
          case 11 : cmd = fullcmd.substring(9);break;
          case 12 : cmd = fullcmd.substring(9);break;
          case 20 : cmd = fullcmd.substring(56);break;
          default : break;
        }
//        System.out.println(cmd.length());
        if (cmd.length() > 1){
//            System.out.println("cmd="+cmd);
          if (rcon1.getMode(index) != 20){
            output = "";
            cmd = cmd.trim();
            if ((rcon1.getMode(index) != 10)&&(rcon1.getMode(index) != 11)&&(rcon1.getMode(index) != 12)){
              if (rcon1.gethistory(index).size() < rcon1.getMaxhistory(index)+2){
                System.out.print("history Size : "+rcon1.gethistory(index).size());
                rcon1.addhistory(index,cmd);
                 rcon1.setrouter(rcon1.getrouter());
              }
              else{
                rcon1.removehistory(index,1);//.getHistory().removeElementAt(1);
                rcon1.addhistory(index,cmd);//.getHistory().add(router.getHistory().size()-1,cmd);
                 rcon1.setrouter(rcon1.getrouter());
              }
              //sw.runCommand(cmd,this);
              rcon1.runCMD(index,cmd);
               rcon1.setrouter(rcon1.getrouter());
              //System.out.print("getmode---- : "+router.getMode()+"\n");
              //System.out.print("ranme---- : "+router.getMode()+"\n");
              output=rcon1.getOutput(index);
              rcon1.setOutput(index);
              numcmd = rcon1.gethistory(index).size()-1;//.getHistory().size()-1;
            }
            else {
              if (rcon1.getMode(index) == 10){
                if (rcon1.getPwd(index).equalsIgnoreCase(cmd)){
                  rcon1.setMode(index,2);
                   rcon1.setrouter(rcon1.getrouter());
                }
              }
              else if (rcon1.getMode(index) == 11){
                if (rcon1.getConsolePwd(index).equalsIgnoreCase(cmd)){
                  //router.setMode(1);
                  rcon1.setMode(index,1);
                   rcon1.setrouter(rcon1.getrouter());
                }
              }
              else if (rcon1.getMode(index) == 12){
                try{

                  if (rcon1.getVtyPwd(index).equalsIgnoreCase(cmd)){
                    rcon1.addVrouters(index);
                    //rcon1.setrouter(rcon1.getrouter());
                    rcon1.setOldMode(index);
                    //rcon1.setrouter(rcon1.getrouter());
                    rcon1.setModetelnet(index,2);
                    //rcon1.setrouter(rcon1.getrouter());
                    //rcon1.setrouter(rcon1.gettelnetrouter());
                  }
                }
                catch (Exception exp){
//                  System.out.println(exp);
                }
              }
            }//case mode 10
          }//mode != 20
          else{
//            if (cmd.equals("t")){
              //router.setMode(3);
              rcon1.setMode(index,3);
               rcon1.setrouter(rcon1.getrouter());
              RouterConsole.output+="Enter configuration commands, one per line. End with CNTL/Z.\n";
              //            }
          }
        }// if input command line
        else {
          if (rcon1.getMode(index) == 20){
           //router.setMode(3);
            rcon1.setMode(index,3);
            rcon1.setrouter(rcon1.getrouter());
            RouterConsole.output+="Enter configuration commands, one per line. End with CNTL/Z.\n";
          }
        }
        if (!output.equalsIgnoreCase("reset")){
  //        jTextArea1.setText(oldtext+output);
         /*if(rcon1.getdisplay(router).equalsIgnoreCase("save-running"))
          {
           jTextArea1.append(output);//------------------------------------------// display output
           long i =0;
           while(i<1000000000*100){
           i++;
           }
           output="";
           output = "[OK]\n";
           jTextArea1.append(output);//------------------------------------------// display output
           rcon1.setOutput(router);
           output="";
           rcon1.setdisplay(router);
          }
          if(rcon1.getdisplay(router).equalsIgnoreCase("show-running"))
         {
          String output1 = "Buliding Configuration\n...\n\n";
          jTextArea1.append(output1);//------------------------------------------// display output
          long i =0;
          while(i<1000000000*100){
          i++;
          }
          //output="";
          output +=output1;
          jTextArea1.append(output);//------------------------------------------// display output
          rcon1.setOutput(router);
          output="";
          rcon1.setdisplay(router);

          }
         else{*/
          //************************************//

          jTextArea1.append(output);//------------------------------------------// display output
        /*  if(rcon1.getdisplay(router).equalsIgnoreCase("save-running"))
          {
           // jTextArea1.append(output);
            output="";
            int i=0;
            while(i<10000000*1000)
            {
             i++;
            }
            output = "[OK]\n";
            jTextArea1.append(output);
            rcon1.setOutput(router);
            rcon1.setdisplay(router);
          }
          else{
          jTextArea1.append(output);
          rcon1.setOutput(router);
          }*/

          //output="";
         //}
         // jTextArea1.append(rcon1.getOutput());
          if (output.length() > 0){
            position += output.length();
          }
          showPrompt("");
        }
        else {
          jTextArea1.setText(initStr);
          jScrollPane1.requestFocus();
        }
      }
    }
//------------------------------------------------------------------------------// left arraow
    //Left Arrow
    else if(keyCode == 37){
      e.consume();
    }
    //Up Arrow
    else if(keyCode == 38){
      e.consume();
//      System.out.println(numcmd);
      if (numcmd != 0){
        String oldcmd="";
        try{
          oldcmd = jTextArea1.getText(0,position);
//          System.out.println("oldcmd:"+oldcmd);
        }
        catch(Exception exp){
        }
        jTextArea1.setText(oldcmd);
      }//end if num != 0
      else {
        String oldcmd="";
        try{
          oldcmd = jTextArea1.getText(0,position);
//          System.out.println("oldcmd:"+oldcmd);
        }
        catch(Exception exp){
        }
        jTextArea1.setText(oldcmd);
      }//end else num = 0
      if ((numcmd > 0) && (numcmd <= rcon1.gethistory(index).size())){
        showPrompt((String)rcon1.gethistory(index).elementAt(numcmd-1));
        numcmd--;
      }
      else {
        showPrompt((String)rcon1.gethistory(index).firstElement());
      }
    }
//------------------------------------------------------------------------------// right arrow
    //Right Arrow
    else if(keyCode == 39){
      e.consume();
    }
    //Down Arrow
    else if(keyCode == 40){
      e.consume();
//      System.out.println(numcmd);
      if (numcmd != 0){
        String oldcmd="";
        try{
          oldcmd = jTextArea1.getText(0,position);
//          System.out.println("oldcmd:"+oldcmd);
        }
        catch(Exception exp){
        }
        jTextArea1.setText(oldcmd);
      }//end if num != 0
      else {
        String oldcmd="";
        try{
          oldcmd = jTextArea1.getText(0,position);
//          System.out.println("oldcmd:"+oldcmd);
        }
        catch(Exception exp){
        }
        jTextArea1.setText(oldcmd);
      }//end else num = 0
      if ((numcmd > -1) && (numcmd < rcon1.gethistory(index).size())){
        try{
        showPrompt((String)rcon1.gethistory(index).elementAt(numcmd+1));
        }
        catch (Exception exp){
          showPrompt((String)rcon1.gethistory(index).lastElement());
//          System.out.println("first");
        }
        numcmd++;
      }//end if
      else {
        showPrompt((String)rcon1.gethistory(index).lastElement());
      }//end else
    }
//------------------------------------------------------------------------------//
    // Page Up
    else if (keyCode == 33){
      e.consume();
    }
//------------------------------------------------------------------------------//
    // Page Down
    else if (keyCode == 34){
      e.consume();
    }
//------------------------------------------------------------------------------//
    //End
    else if (keyCode == 35){
      e.consume();
    }
//------------------------------------------------------------------------------//
    //Home
    else if (keyCode == 36){
      e.consume();
    }
//------------------------------------------------------------------------------//
    // Tab
    else if (keyCode == 9){
       e.consume();
      output="";
      jTextArea1.append("\n");
      try{
        oldtext = jTextArea1.getText(0,position);
        oldtext += "\n";
      }
      catch(Exception excep){
//        System.out.print("error");
      }
      try{
        fullcmd = jTextArea1.getText(position,jTextArea1.getText().length()-position);
      }
      catch (Exception exp){
        switch(rcon1.getMode(index)){
          case 1 : fullcmd = rcon1.getName(index) + ">";break;
          case 2 : fullcmd = rcon1.getName(index) + "#";break;
          case 3 : fullcmd = rcon1.getName(index) + "(config)#";break;
          case 4 : fullcmd = rcon1.getName(index) + "(config-if)#";break;
          case 5 : fullcmd = rcon1.getName(index) + "(config-router)#";break;
          case 6 : fullcmd = rcon1.getName(index) + "(config-line)#";break;
          case 10 : fullcmd = "password:";break;
          case 11 : fullcmd = "password:";break;
          default : break;
        }
      }//end catch
      position = jTextArea1.getText().length();
      switch(rcon1.getMode(index)){
        case 0 : jTextArea1.setText(initStr);break;
        case 1 : cmd = fullcmd.substring(rcon1.getName(index).length()+1);break;
        case 2 : cmd = fullcmd.substring(rcon1.getName(index).length()+1);break;
        case 3 : cmd = fullcmd.substring(rcon1.getName(index).length()+9);break;
        case 4 : cmd = fullcmd.substring(rcon1.getName(index).length()+12);break;
        case 5 : cmd = fullcmd.substring(rcon1.getName(index).length()+16);break;
        case 6 : cmd = fullcmd.substring(rcon1.getName(index).length()+14);break;
        case 10 : cmd = fullcmd.substring(9);break;
        case 11 : cmd = fullcmd.substring(9);break;
        default : break;
      }
      cmd = cmd.trim();
      if (cmd.length() > 1){
       // sw.tabCmd(cmd,router.getMode());
        rcon1.tabCmd(index,cmd);
        rcon1.setrouter(rcon1.getrouter());
        output=rcon1.getOutput(index);
      }
      if (output.length()>0){
        jTextArea1.append(output+"\n");//---------------------------------------// display output
        //jTextArea1.append(rcon1.getOutput());
        rcon1.setOutput(index);
        //output="";
        position += output.length()+1;
      }
      showPrompt(cmd);
    }
  }
  catch(Exception e1){e1.printStackTrace();}
}
  public void showPrompt(String cmd){
    try{
//    System.out.println("prompt="+cmd);
    String prompt = rcon1.getName(index);
    switch(rcon1.getMode(index)){
      case 1 : prompt += ">"+cmd;break;
      case 2 : prompt += "#"+cmd;break;
      case 3 : prompt += "(config)#"+cmd;break;
      case 4 : prompt += "(config-if)#"+cmd;break;
      case 5 : prompt += "(config-router)#"+cmd;break;
      case 6 : prompt += "(config-line)#"+cmd;break;
      case 10 : prompt = "Password:";break;
      case 11 : prompt = "Password:";break;
      case 12 : prompt = "Password:";break;
      case 20 : prompt = "Configuring from terminal, memory, or network[terminal]?";break;
      default : break;
    }
    jTextArea1.requestFocus();
    jTextArea1.append(prompt);
//    System.out.println("debug:"+jTextArea1.getText()+"end debug");
    jTextArea1.setCaretPosition(jTextArea1.getText().length());
//    System.out.println(position+"&"+jTextArea1.getText().length());
//    System.out.println("Position:"+jTextArea1.getText().length());
    }
    catch(Exception e2){e2.printStackTrace();}
  }
  public void showPrompt(int index,String cmd){
   try{
//    System.out.println("prompt="+cmd);
   String prompt = rcon1.getName(index);
   switch(rcon1.getMode(index)){
     case 1 : prompt += ">"+cmd;break;
     case 2 : prompt += "#"+cmd;break;
     case 3 : prompt += "(config)#"+cmd;break;
     case 4 : prompt += "(config-if)#"+cmd;break;
     case 5 : prompt += "(config-router)#"+cmd;break;
     case 6 : prompt += "(config-line)#"+cmd;break;
     case 10 : prompt = "Password:";break;
     case 11 : prompt = "Password:";break;
     case 12 : prompt = "Password:";break;
     case 20 : prompt = "Configuring from terminal, memory, or network[terminal]?";break;
     default : break;
   }
   jTextArea1.requestFocus();
   jTextArea1.append(prompt);
//    System.out.println("debug:"+jTextArea1.getText()+"end debug");
   jTextArea1.setCaretPosition(jTextArea1.getText().length());
//    System.out.println(position+"&"+jTextArea1.getText().length());
//    System.out.println("Position:"+jTextArea1.getText().length());
   }
   catch(Exception e2){e2.printStackTrace();}
  }
  public void enterKey(Router r){
    try{
    if (jTextArea1.getText().equalsIgnoreCase(initStr)){
      if (rcon1.getEnConsole(index)){
        jTextArea1.setEditable(true);
        jTextArea1.requestFocus();
        jTextArea1.append("User Access Verification\n\n");
        position = jTextArea1.getText().length();
        jTextArea1.append("Password:");
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
        //r.setMode(11);
        rcon1.setMode(index,1);
         rcon1.setrouter(rcon1.getrouter());
      }
      else {
        jTextArea1.setEditable(true);
        jTextArea1.requestFocus();
        position = jTextArea1.getText().length();
        jTextArea1.append(rcon1.getName(index)+">");
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
       // router.setMode(1);
        rcon1.setMode(index,1);
         rcon1.setrouter(rcon1.getrouter());
      }
//      System.out.println(router.getMode());
    }
    else {
      jTextArea1.requestFocus();
      jTextArea1.setCaretPosition(jTextArea1.getText().length());
    }
    }
    catch(Exception e3){e3.printStackTrace();}
  }
//------------------------------------------------------------------------------//
  void jScrollPane1_keyPressed(KeyEvent e) {
    int keyCode = e.getKeyCode();
    if (keyCode == 10){
      try{
      enterKey(rcon1.getrouter());
      output = "";
      }
      catch(Exception e4){e4.printStackTrace();}
    }
  }
//------------------------------------------------------------------------------//
  public void enterKey(){
      if (!output.equalsIgnoreCase("reset")){
//        System.out.println("eneter kye");
//        jTextArea1.setText(oldtext+output);
//        jTextArea1.append(output);
        if (output.length() > 0){
          position += output.length();
        }
        showPrompt("");
      }
      else {
        jTextArea1.setText(initStr);
        jScrollPane1.requestFocus();
      }
  }
//------------------------------------------------------------------------------//
  void jTextArea1_mouseClicked(MouseEvent e) {
    if (!jTextArea1.getText().equalsIgnoreCase(initStr)){
      jTextArea1.setCaretPosition(jTextArea1.getText().length());
     // jTextArea1.setEditable(true);
      focus=1;
      System.out.println("ok");

    }
    else {
//      System.out.println("enterKey");
      try{
      enterKey(rcon1.getrouter());
      }
      catch(Exception e3){e3.printStackTrace();}
    }
  }
/*  static void terminaledit(boolean b){
    terminalEdit = b;
  }
/*  public void addRouters(Router r){
    routers.addElement(r);
  }*/
  /*public Router getRouter(int i){
    return (Router)routers.elementAt(i);
  }
  /*public Vector getRouters(){
    return routers;
  }*/
  public JTextArea getJTextArea()
  {
    return jTextArea1;
  }
 public void setIndex(int index)
 {
   this.index = index;
  // showPrompt("");

 }
  void jTextArea1_mouseReleased(MouseEvent e) {
    jTextArea1.setCaretPosition(jTextArea1.getText().length());
  }
}