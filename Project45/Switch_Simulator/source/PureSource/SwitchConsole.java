package switchsim;

import java.util.*;
import java.awt.*;
import com.borland.jbcl.layout.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;


public class SwitchConsole extends JFrame {
  private Switch swtch=null;
  private Panel1 spanel=null;
  private Vector vSwitch = new Vector();
  private String initStr="Switch Con0 is now available\n\nPress return to get start\n\n\n";
  private int position=58;
  private int numcmd = -1;
  private SwitchCMD swcmd=new SwitchCMD();
  private String oldtext="";
  static String output="";
  private boolean waitkey=false;

  JPanel contentPane;
  XYLayout xYLayout1 = new XYLayout();
  JScrollPane jScrollPane1 = new JScrollPane();
  JTextArea jTextArea1 = new JTextArea();
  Border border1;

  public SwitchConsole() {
    try {
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public SwitchConsole(Switch sw) {
    try {
      swtch = sw;
      sw.getHistory().addElement("");
      vSwitch.addElement(sw);
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public void setSwitch(Switch sw) {
    this.swtch = sw;
  }

  public Switch getSwitch() {
    return this.swtch;
  }

  void jbInit() throws Exception {
    contentPane = (JPanel) this.getContentPane();
    border1 = BorderFactory.createEtchedBorder(new Color(180, 218, 236),new Color(91, 118, 140));
    contentPane.setLayout(xYLayout1);
    this.setBackground(new Color(130, 180, 200));
    contentPane.setBackground(new Color(130, 170, 200));
    contentPane.setBorder(border1);
    this.setTitle(swtch.getName()+" - Console");
    this.setResizable(false);
    this.setSize(new Dimension(648, 400));
    jScrollPane1.setBorder(BorderFactory.createEtchedBorder());
    contentPane.add(jScrollPane1,         new XYConstraints(21, 17, 600, 335));
    jScrollPane1.getViewport().add(jTextArea1, null);
    jScrollPane1.getViewport().setBackground(new Color(110, 150, 170));

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
    //--Other--//
    jScrollPane1.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    jScrollPane1.getViewport().add(jTextArea1, null);
  }

  void jTextArea1_mouseClicked(MouseEvent e) {
    if (!jTextArea1.getText().equalsIgnoreCase(initStr)){
      jTextArea1.setCaretPosition(jTextArea1.getText().length());
    }
    else {
//      System.out.println("enterKey");
      enterKey(swtch);
    }
  }

  void jTextArea1_mouseReleased(MouseEvent e) {
    jTextArea1.setCaretPosition(jTextArea1.getText().length());
  }

  void jTextArea1_keyPressed(KeyEvent e) {
    String fullcmd = "";
    String cmd="";
    String oldcommand = jTextArea1.getText();
    String backcmd = jTextArea1.getText();
//    System.out.println("position="+position);
    int keyCode = e.getKeyCode();
    if ((swtch.getMode() == 3)||(swtch.getMode() == 4)){
      //when ctrl+z
      if ((keyCode == 90)&&(e.isControlDown())){
        output="";
        e.consume();
        String s="%SYS-5-CONFIG_I: Configured from console by console\n";
        jTextArea1.append("^z\n");
        jTextArea1.append(s);
        if (swtch.getMode() == 3){
          s += "(config)#^z\n";// + "%SYS-5-CONFIG_I: Configured from console by console\n";
        }
        else {
          s += "(config-if)#^z\n";// + "%SYS-5-CONFIG_I: Configured from console by console\n";
        }
//        System.out.println(position);
        position += swtch.getName().length() + s.length();
        swtch.setMode(2);
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
      swcmd.runCommand(swtch,"?",this);
      swtch.getHistory().add(swtch.getHistory().size()-1,"?");
      numcmd = swtch.getHistory().size()-1;
      if ((!output.equalsIgnoreCase("reset"))){
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
      if (swtch.getTerminalEdit()){
      int pos = position + swtch.getName().length();
        switch (swtch.getMode()){
          case 1 : pos += 1;break;
          case 2 : pos += 1;break;
          case 3 : pos += 9;break;
          case 4 : pos += 12;break;
          case 5 : pos += 7;break;
          case 6 : pos += 14;break;
          case 7 : pos += 14;break;
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
      if (swtch.getTerminalEdit()){
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
      }
    }
    //Ctrl B
    else if ((keyCode == 66)&&(e.isControlDown())){
      e.consume();
      int pos = position + swtch.getName().length();
      switch (swtch.getMode()){
        case 1 : pos += 1;break;
        case 2 : pos += 1;break;
        case 3 : pos += 9;break;
        case 4 : pos += 12;break;
        case 5 : pos += 7;break;
        case 6 : pos += 14;break;
        case 7 : pos += 14;break;
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
      if ((numcmd > 0) && (numcmd <= swtch.getHistory().size())){
        showPrompt((String)swtch.getHistory().elementAt(numcmd-1));
        numcmd--;
      }
      else {
        showPrompt((String)swtch.getHistory().firstElement());
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
      int pos = position + swtch.getName().length();
      switch (swtch.getMode()){
        case 1 : pos += 1;break;
        case 2 : pos += 1;break;
        case 3 : pos += 9;break;
        case 4 : pos += 12;break;
        case 5 : pos += 7;break;
        case 6 : pos += 14;break;
        case 7 : pos += 14;break;
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
        enterKey(swtch);
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
          switch(swtch.getMode()){
            case 1 : fullcmd = swtch.getName() + ">";break;
            case 2 : fullcmd = swtch.getName() + "#";break;
            case 3 : fullcmd = swtch.getName() + "(config)#";break;
            case 4 : fullcmd = swtch.getName() + "(config-if)#";break;
            case 5 : fullcmd = swtch.getName() + "(vlan)#";break;
            case 6 : fullcmd = swtch.getName() + "(config-vlan)#";break;
            case 7 : fullcmd = swtch.getName() + "(config-line)#";break;
            case 10 : fullcmd = "password:";break;
            case 11 : fullcmd = "password:";break;
            case 12 : fullcmd = "password:";break;
            case 20 : fullcmd = "Configuring from terminal, memory, or network[terminal]?";break;
            default : break;
          }
        }//end catch
        position = jTextArea1.getText().length();
        switch(swtch.getMode()){
          case 0 : jTextArea1.setText(initStr);break;
          case 1 : cmd = fullcmd.substring(swtch.getName().length()+1);break;
          case 2 : cmd = fullcmd.substring(swtch.getName().length()+1);break;
          case 3 : cmd = fullcmd.substring(swtch.getName().length()+9);break;
          case 4 : cmd = fullcmd.substring(swtch.getName().length()+12);break;
          case 5 : cmd = fullcmd.substring(swtch.getName().length()+7);break;
          case 6 : cmd = fullcmd.substring(swtch.getName().length()+14);break;
          case 7 : cmd = fullcmd.substring(swtch.getName().length()+14);break;
          case 10 : cmd = fullcmd.substring(9);break;
          case 11 : cmd = fullcmd.substring(9);break;
          case 12 : cmd = fullcmd.substring(9);break;
          case 20 : cmd = fullcmd.substring(56);break;
          default : break;
        }
//        System.out.println(cmd.length());
        if (cmd.length() > 1){
//            System.out.println("cmd="+cmd);
          if (swtch.getMode() != 20){
            output = "";
            cmd = cmd.trim();
//            System.out.println("enter");
            if ((swtch.getMode() != 10)&&(swtch.getMode() != 11)&&(swtch.getMode() != 12)){
              if (swtch.getHistory().size() < swtch.getMaxHistory()+2){
                swtch.getHistory().add(swtch.getHistory().size()-1,cmd);
              }
              else{
                swtch.getHistory().removeElementAt(1);
                swtch.getHistory().add(swtch.getHistory().size()-1,cmd);
              }
//              System.out.println(cmd+" ===> mode : "+swtch.getMode());
              swcmd.runCommand(swtch,cmd,this);
//              System.out.println("mode : "+swtch.getMode());
              numcmd = swtch.getHistory().size()-1;
            }
            else {
              if (swtch.getMode() == 10){
                if (swtch.getPassword().equalsIgnoreCase(cmd)){
                  swtch.setMode(2);
                }
              }
              else if (swtch.getMode() == 11){
                if (swtch.getConsolePasswd().equalsIgnoreCase(cmd)){
                  swtch.setMode(1);
                }
              }
/*              else if (swtch.getMode() == 12){
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
              }*/
            }//case mode 10
          }//mode != 20
          else{
//            if (cmd.equals("t")){
              swtch.setMode(3);
              SwitchConsole.output+="Enter configuration commands, one per line. End with CNTL/Z.\n";
              //            }
          }
        }// if input command line
        else {
          if (swtch.getMode() == 20){
            swtch.setMode(3);
            SwitchConsole.output+="Enter configuration commands, one per line. End with CNTL/Z.\n";
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
      if ((numcmd > 0) && (numcmd <= swtch.getHistory().size())){
        showPrompt((String)swtch.getHistory().elementAt(numcmd-1));
        numcmd--;
      }
      else {
        showPrompt((String)swtch.getHistory().firstElement());
      }
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
        switch(swtch.getMode()){
          case 1 : fullcmd = swtch.getName() + ">";break;
          case 2 : fullcmd = swtch.getName() + "#";break;
          case 3 : fullcmd = swtch.getName() + "(config)#";break;
          case 4 : fullcmd = swtch.getName() + "(config-if)#";break;
          case 5 : fullcmd = swtch.getName() + "(vlan)#";break;
          case 6 : fullcmd = swtch.getName() + "(config-vlan)#";break;
          case 7 : fullcmd = swtch.getName() + "(config-line)#";break;
          case 10 : fullcmd = "password:";break;
          case 11 : fullcmd = "password:";break;
          default : break;
        }
      }//end catch
      position = jTextArea1.getText().length();
      switch(swtch.getMode()){
        case 0 : jTextArea1.setText(initStr);break;
        case 1 : cmd = fullcmd.substring(swtch.getName().length()+1);break;
        case 2 : cmd = fullcmd.substring(swtch.getName().length()+1);break;
        case 3 : cmd = fullcmd.substring(swtch.getName().length()+9);break;
        case 4 : cmd = fullcmd.substring(swtch.getName().length()+12);break;
        case 5 : cmd = fullcmd.substring(swtch.getName().length()+7);break;
        case 6 : cmd = fullcmd.substring(swtch.getName().length()+14);break;
        case 7 : cmd = fullcmd.substring(swtch.getName().length()+14);break;
        case 10 : cmd = fullcmd.substring(9);break;
        case 11 : cmd = fullcmd.substring(9);break;
        default : break;
      }
      cmd = cmd.trim();
      if (cmd.length() > 1){
        swcmd.tabCmd(cmd,swtch.getMode());
      }
      if (output.length()>0){
        jTextArea1.append(output+"\n");
        position += output.length()+1;
      }
      showPrompt(cmd);
    }
  }

  public void enterKey(Switch sw){
    if (jTextArea1.getText().equalsIgnoreCase(initStr)){
      if (sw.getEnableConsole()){
        jTextArea1.setEditable(true);
        jTextArea1.requestFocus();
        jTextArea1.append("User Access Verification\n\n");
        position = jTextArea1.getText().length();
        jTextArea1.append("Password: ");
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
        sw.setMode(11);
      }
      else {
        jTextArea1.setEditable(true);
        jTextArea1.requestFocus();
        position = jTextArea1.getText().length();
        jTextArea1.append(sw.getName()+">");
        jTextArea1.setCaretPosition(jTextArea1.getText().length());
        swtch.setMode(1);
      }
//      System.out.println(router.getMode());
    }
    else {
      jTextArea1.requestFocus();
      jTextArea1.setCaretPosition(jTextArea1.getText().length());
    }
  }

  public void showPrompt(String cmd){
//    System.out.println("prompt="+cmd);
    String prompt = swtch.getName();
    switch(swtch.getMode()){
      case 1 : prompt += ">"+cmd;break;
      case 2 : prompt += "#"+cmd;break;
      case 3 : prompt += "(config)#"+cmd;break;
      case 4 : prompt += "(config-if)#"+cmd;break;
      case 5 : prompt += "(vlan)#"+cmd;break;
      case 6 : prompt += "(config-vlan)#"+cmd;break;
      case 7 : prompt += "(config-line)#"+cmd;break;
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

}