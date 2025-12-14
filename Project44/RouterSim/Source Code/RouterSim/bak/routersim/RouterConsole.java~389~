package routersim;

import java.util.*;
import java.awt.*;
import com.borland.jbcl.layout.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;

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
  private SwitchCMD sw = new SwitchCMD();
  private boolean waitkey = false;

  public Router getTelnetRouter(){
    return telnetRouter;
  }
  public void setTelnetRouter(Router r){
    telnetRouter = r;
  }
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
      router = r;
      r.getHistory().addElement("");
      routers.addElement(r);
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  public void setRouter(Router r){
    this.router = r;
  }
  public Router getRouterofRconsole(){
    return router;
  }
  void jbInit() throws Exception {
    //-----Set Layout----------//
    this.setLayout(xYLayout1);
    //-----Set Color------------//
    jScrollPane1.getViewport().setBackground(Color.white);
    this.setBackground(new Color(131, 181, 215));
    //-----Set Border--------//
    jScrollPane1.setBorder(null);
    jScrollPane1.addKeyListener(new java.awt.event.KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        jScrollPane1_keyPressed(e);
      }
    });
    //------Set Size---------//
    xYLayout1.setWidth(650);
    xYLayout1.setHeight(400);
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
    this.add(jScrollPane1, new XYConstraints(20, 15, 610, 335));
    //--Other--//
    jScrollPane1.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    jScrollPane1.getViewport().add(jTextArea1, null);
  }
  void jTextArea1_keyPressed(KeyEvent e) {
    String fullcmd = "";
    String cmd="";
    String oldcommand = jTextArea1.getText();
    String backcmd = jTextArea1.getText();
//    System.out.println("position="+position);
    int keyCode = e.getKeyCode();
//    System.out.println(keyCode);
    if (keyCode == 88){
      if (waitkey){
//        e.consume();
        waitkey = false;
//        System.out.println("waitkey");
        //Switch router on telnet
      }
    }
    if ((router.getMode() == 3)||(router.getMode() == 4)){
      //when ctrl+z
      if ((keyCode == 90)&&(e.isControlDown())){
        output="";
        e.consume();
        String s="";
        jTextArea1.append("^z\n");
        jTextArea1.append("%SYS-5-CONFIG_I: Configured from console by console\n");
        if (router.getMode() == 3){
          s = "(config)#^z\n" + "%SYS-5-CONFIG_I: Configured from console by console\n";
        }
        else {
          s = "(config-if)#^z\n" + "%SYS-5-CONFIG_I: Configured from console by console\n";
        }
//        System.out.println(position);
        position += router.getName().length() + s.length();
        router.setMode(2);
        showPrompt("");
//        System.out.println(router.getMode());
      }
    }//end check Ctrl z
    //? commands
    if ((keyCode == 47)&&(e.isShiftDown())){
      output="";
      e.consume();
      position = jTextArea1.getText().length()+2;
      jTextArea1.append("?\n");
      String oldcmd = jTextArea1.getText();
      sw.runCommand(router,"?",this);
      router.getHistory().add(router.getHistory().size()-1,"?");
      numcmd = router.getHistory().size()-1;
      if (!output.equalsIgnoreCase("reset")){
        jTextArea1.append(output);
        if (output.length() > 0){
          position += output.length();
        }
        showPrompt("");
      }
    }
    //Ctrl A
    else if ((keyCode == 65)&&(e.isControlDown())){
      e.consume();
      if (router.getTerminalEdit()){
      int pos = position + router.getName().length();
        switch (router.getMode()){
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
    //Ctrl E
    else if ((keyCode == 69)&&(e.isControlDown())){
      e.consume();
      if (router.getTerminalEdit()){
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
      }
    }
    //Ctrl E
    else if ((keyCode == 66)&&(e.isControlDown())){
      e.consume();
      int pos = position + router.getName().length();
      switch (router.getMode()){
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
    //Ctrl P
    else if ((keyCode == 80)&&(e.isControlDown())){
      e.consume();
//      System.out.println("ctrl+p");
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
      if ((numcmd > 0) && (numcmd <= router.getHistory().size())){
        showPrompt((String)router.getHistory().elementAt(numcmd-1));
        numcmd--;
      }
      else {
        showPrompt((String)router.getHistory().firstElement());
      }
    }
    //Ctrl + Shift + 6 then x
    else if ((keyCode == 54)&&(e.isShiftDown())&&(e.isControlDown())){
      e.consume();
      waitkey=true;
//      System.out.println("to wait");
    }
    //Backspace
    else if (keyCode == 8){
      output="";
      int pos = position + router.getName().length();
      switch (router.getMode()){
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
    //Enter
    else if (keyCode == 10){
      output="";
      e.consume();
      if (jTextArea1.getText().equals(initStr)){
        enterKey(router);
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

  //      System.out.println(position+"&"+jTextArea1.getText().length());
        try{
          fullcmd = jTextArea1.getText(position,jTextArea1.getText().length()-position);
  //        System.out.println("Fullcmd="+fullcmd);
        }
        catch (Exception exp){
          switch(router.getMode()){
            case 1 : fullcmd = router.getName() + ">";break;
            case 2 : fullcmd = router.getName() + "#";break;
            case 3 : fullcmd = router.getName() + "(config)#";break;
            case 4 : fullcmd = router.getName() + "(config-if)#";break;
            case 5 : fullcmd = router.getName() + "(config-router)#";break;
            case 6 : fullcmd = router.getName() + "(config-line)#";break;
            case 10 : fullcmd = "password:";break;
            case 11 : fullcmd = "password:";break;
            case 12 : fullcmd = "password:";break;
            case 20 : fullcmd = "Configuring from terminal, memory, or network[terminal]?";break;
            default : break;
          }
        }//end catch
        position = jTextArea1.getText().length();
        switch(router.getMode()){
          case 0 : jTextArea1.setText(initStr);break;
          case 1 : cmd = fullcmd.substring(router.getName().length()+1);break;
          case 2 : cmd = fullcmd.substring(router.getName().length()+1);break;
          case 3 : cmd = fullcmd.substring(router.getName().length()+9);break;
          case 4 : cmd = fullcmd.substring(router.getName().length()+12);break;
          case 5 : cmd = fullcmd.substring(router.getName().length()+16);break;
          case 6 : cmd = fullcmd.substring(router.getName().length()+14);break;
          case 10 : cmd = fullcmd.substring(9);break;
          case 11 : cmd = fullcmd.substring(9);break;
          case 12 : cmd = fullcmd.substring(9);break;
          case 20 : cmd = fullcmd.substring(56);break;
          default : break;
        }
//        System.out.println(cmd.length());
        if (cmd.length() > 1){
//            System.out.println("cmd="+cmd);
          if (router.getMode() != 20){
            output = "";
            cmd = cmd.trim();
            if ((router.getMode() != 10)&&(router.getMode() != 11)&&(router.getMode() != 12)){
              if (router.getHistory().size() < router.getMaxHistory()+2){
                router.getHistory().add(router.getHistory().size()-1,cmd);
              }
              else{
                router.getHistory().removeElementAt(1);
                router.getHistory().add(router.getHistory().size()-1,cmd);
              }
              sw.runCommand(router,cmd,this);
              numcmd = router.getHistory().size()-1;
            }
            else {
              if (router.getMode() == 10){
                if (router.getPasswd().equalsIgnoreCase(cmd)){
                  router.setMode(2);
                }
              }
              else if (router.getMode() == 11){
                if (router.getConsolePasswd().equalsIgnoreCase(cmd)){
                  router.setMode(1);
                }
              }
              else if (router.getMode() == 12){
                try{
//                  System.out.println("telent->"+telnetRouter.getVtyPasswd());
//                  System.out.println("cmd->"+cmd);
                  if (telnetRouter.getVtyPasswd().equalsIgnoreCase(cmd)){
                    this.getRouters().addElement(telnetRouter);
                    telnetRouter.setOldMode(telnetRouter.getMode());
                    telnetRouter.setMode(2);
                    this.setRouter(telnetRouter);
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
              router.setMode(3);
              RouterConsole.output+="Enter configuration commands, one per line. End with CNTL/Z.\n";
              //            }
          }
        }// if input command line
        else {
          if (router.getMode() == 20){
            router.setMode(3);
            RouterConsole.output+="Enter configuration commands, one per line. End with CNTL/Z.\n";
          }
        }
        if (!output.equalsIgnoreCase("reset")){
  //        jTextArea1.setText(oldtext+output);
          jTextArea1.append(output);
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
      if ((numcmd > 0) && (numcmd <= router.getHistory().size())){
        showPrompt((String)router.getHistory().elementAt(numcmd-1));
        numcmd--;
      }
      else {
        showPrompt((String)router.getHistory().firstElement());
      }
    }
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
      if ((numcmd > -1) && (numcmd < router.getHistory().size())){
        try{
        showPrompt((String)router.getHistory().elementAt(numcmd+1));
        }
        catch (Exception exp){
          showPrompt((String)router.getHistory().lastElement());
//          System.out.println("first");
        }
        numcmd++;
      }//end if
      else {
        showPrompt((String)router.getHistory().lastElement());
      }//end else
    }
    // Page Up
    else if (keyCode == 33){
      e.consume();
    }
    // Page Down
    else if (keyCode == 34){
      e.consume();
    }
    //End
    else if (keyCode == 35){
      e.consume();
    }
    //Home
    else if (keyCode == 36){
      e.consume();
    }
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
        switch(router.getMode()){
          case 1 : fullcmd = router.getName() + ">";break;
          case 2 : fullcmd = router.getName() + "#";break;
          case 3 : fullcmd = router.getName() + "(config)#";break;
          case 4 : fullcmd = router.getName() + "(config-if)#";break;
          case 5 : fullcmd = router.getName() + "(config-router)#";break;
          case 6 : fullcmd = router.getName() + "(config-line)#";break;
          case 10 : fullcmd = "password:";break;
          case 11 : fullcmd = "password:";break;
          default : break;
        }
      }//end catch
      position = jTextArea1.getText().length();
      switch(router.getMode()){
        case 0 : jTextArea1.setText(initStr);break;
        case 1 : cmd = fullcmd.substring(router.getName().length()+1);break;
        case 2 : cmd = fullcmd.substring(router.getName().length()+1);break;
        case 3 : cmd = fullcmd.substring(router.getName().length()+9);break;
        case 4 : cmd = fullcmd.substring(router.getName().length()+12);break;
        case 5 : cmd = fullcmd.substring(router.getName().length()+16);break;
        case 6 : cmd = fullcmd.substring(router.getName().length()+14);break;
        case 10 : cmd = fullcmd.substring(9);break;
        case 11 : cmd = fullcmd.substring(9);break;
        default : break;
      }
      cmd = cmd.trim();
      if (cmd.length() > 1){
        sw.tabCmd(cmd,router.getMode());
      }
      if (output.length()>0){
        jTextArea1.append(output+"\n");
        position += output.length()+1;
      }
      showPrompt(cmd);
    }
  }
  public void showPrompt(String cmd){
//    System.out.println("prompt="+cmd);
    String prompt = router.getName();
    switch(router.getMode()){
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
  public void enterKey(Router r){
    if (jTextArea1.getText().equalsIgnoreCase(initStr)){
      if (r.getEnableConsole()){
        jTextArea1.setEditable(true);
        jTextArea1.requestFocus();
        jTextArea1.append("User Access Verification\n\n");
        position = jTextArea1.getText().length();
        jTextArea1.append("Password:");
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
        r.setMode(11);
      }
      else {
        jTextArea1.setEditable(true);
        jTextArea1.requestFocus();
        position = jTextArea1.getText().length();
        jTextArea1.append(r.getName()+">");
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
        router.setMode(1);
      }
//      System.out.println(router.getMode());
    }
    else {
      jTextArea1.requestFocus();
      jTextArea1.setCaretPosition(jTextArea1.getText().length());
    }
  }

  void jScrollPane1_keyPressed(KeyEvent e) {
    int keyCode = e.getKeyCode();
    if (keyCode == 10){
      enterKey(router);
      output = "";
    }
  }
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

  void jTextArea1_mouseClicked(MouseEvent e) {
    if (!jTextArea1.getText().equalsIgnoreCase(initStr)){
      jTextArea1.setCaretPosition(jTextArea1.getText().length());
    }
    else {
//      System.out.println("enterKey");
      enterKey(router);
    }
  }
  static void terminaledit(boolean b){
    terminalEdit = b;
  }
  public void addRouters(Router r){
    routers.addElement(r);
  }
  public Router getRouter(int i){
    return (Router)routers.elementAt(i);
  }
  public Vector getRouters(){
    return routers;
  }

  void jTextArea1_mouseReleased(MouseEvent e) {
    jTextArea1.setCaretPosition(jTextArea1.getText().length());
  }
}