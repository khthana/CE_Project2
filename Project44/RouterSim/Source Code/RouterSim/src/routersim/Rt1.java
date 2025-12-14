package routersim;

import java.awt.*;
import com.borland.jbcl.layout.*;
import javax.swing.*;
import java.awt.event.*;
import java.io.*;
import java.lang.String;
import java.util.*;
/**********************new************/
import java.io.*;
import javax.swing.border.*;
/***************************************/
public class Rt1 extends JPanel {
//  public SwitchCMD sw ;
  private Router router = new Router();
  private int position = -1;
  private int promptp = -1;
  public static String output="";
  SwitchCMD sw = new SwitchCMD();
  XYLayout xYLayout1 = new XYLayout();
  TextArea jTextArea2 = new TextArea();
  JTextField jTextField1 = new JTextField();
  JScrollPane jScrollPane1 = new JScrollPane();
  JTextArea jTextArea1 = new JTextArea();
  TitledBorder titledBorder1;
  Border border1;

  public void setOutput(String s){
    output = s;
  }
  public String getOutput(){
    return output;
  }
  //----------Constructor---------------//
  public Rt1() {
    try {
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
    public Rt1(Router r) {
    try {
      router = r;
      r.getHistory().addElement("");
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  void jbInit() throws Exception {
    titledBorder1 = new TitledBorder(BorderFactory.createEtchedBorder(new Color(234, 255, 255),new Color(114, 139, 168)),"");
    border1 = BorderFactory.createCompoundBorder(titledBorder1,BorderFactory.createEmptyBorder(2,2,2,2));
    jTextArea1.setText("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    jTextArea1.setEditable(false);
    jTextArea1.setCursor(null);
    this.setLayout(xYLayout1);
    jTextField1.setText(router.getName()+">");
    jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        jTextField1_keyPressed(e);
      }
    });
    jTextField1.setBorder(null);
    //---------can del-------------//
    jTextArea2.setEditable(false);
    jTextArea2.setFont(new java.awt.Font("Serif", 0, 12));
//    this.add(jTextArea2, new XYConstraints(510, 18, 110, 329));
    //--------------------------------//
    xYLayout1.setWidth(620);
    xYLayout1.setHeight(417);
    this.setBackground(new Color(131, 181, 215));
    this.setBorder(border1);
    jScrollPane1.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    jScrollPane1.getViewport().setBackground(Color.white);
    jScrollPane1.setBorder(null);
    this.add(jTextField1, new XYConstraints(20, 345, 598, 25));
//    this.add(jScrollPane1, new XYConstraints(20, 18, 490, 330));
    this.add(jScrollPane1, new XYConstraints(20, 18, 598, 330));
    jScrollPane1.getViewport().add(jTextArea1, null);
    //-----------Add Listener-----------------//
    jTextField1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e){
        jTextField1_actionPerformed(e);
      }
    });

//    jTextArea1.setFocusAccelerator('>');
  }//end jbInit
  public void showcmd(String s){
    jTextArea1.append(s);
  }
  public void showprompt(String s){
    jTextField1.setText(s);
  }
  void jTextField1_actionPerformed(ActionEvent e){
    String cmd = e.getActionCommand();
    jTextArea1.append(cmd+"\n");
    switch(router.getMode()){
      case 1 : cmd = cmd.substring(router.getName().length()+1);break;
      case 2: cmd = cmd.substring(router.getName().length()+1);break;
      case 3 : cmd = cmd.substring(router.getName().length()+9);break;
      case 4 : cmd = cmd.substring(router.getName().length()+12);break;
      case 5 : cmd = cmd.substring(router.getName().length()+16);break;
      default : break;
    }
    sw.sendCMD(router,cmd);
    jTextArea2.append(router.getName()+"\n");
    jTextArea2.append(router.getMode()+"\n");
    jTextArea1.append(output);
    if(!Rt1.output.startsWith("%  Invalid input detected at '^' marker.")){
      router.getHistory().add(router.getHistory().size()-1,cmd);
      position = router.getHistory().size()-1;
    }
    showPrompt("");
//    c.showPrompt(router);
//    jTextField1.setText(router.getName()+router.getPrompt());
  }
  public void showPrompt(String cmd){
    String prompt = router.getName();
    switch(router.getMode()){
      case 1 : prompt += ">"+cmd;break;
      case 2: prompt += "#"+cmd;break;
      case 3 : prompt += "(config)#"+cmd;break;
      case 4 : prompt += "(config-if)#"+cmd;break;
      case 5 : prompt += "(config-router)#"+cmd;break;
      default : break;
    }
    jTextField1.setText(prompt);
  }
  public static void printText(String s){
  }

  void jTextField1_keyPressed(KeyEvent e) {
    int keyCode = e.getKeyCode();
//    System.out.println(keyCode);
    //Left Arrow
    if(keyCode == 37){
      String cmd = jTextField1.getText();
      System.out.println(cmd);
      jTextField1.setText(cmd);
    }
    //Up Arrow
    if(keyCode == 38){
      if (position == -1){
        position = router.getHistory().size();
      }//end if
      else {
        if (position != 0){
        position--;
        }
      }//end else
      System.out.println(position);
      if ((position >-1) && (position < router.getHistory().size())){
        showPrompt((String)router.getHistory().elementAt(position));
      }
    }
    //Right Arrow
    if(keyCode == 39){
      String cmd = jTextField1.getText();
      jTextField1.setText(cmd);
    }
    //Down Arrow
    if(keyCode == 40){
      if (position == -1){
//        position = 0;
      }//end if
      else {
        if(position < router.getHistory().size()-1){
          position++;
        }
      }//end else
      System.out.println(position);
      if ((position >-1) && (position < router.getHistory().size())){
          showPrompt((String)router.getHistory().elementAt(position));
      }//end if
    }//end listener
  }
}