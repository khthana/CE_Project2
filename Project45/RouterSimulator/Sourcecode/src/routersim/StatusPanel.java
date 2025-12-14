package routersim;

import java.awt.*;
import java.awt.event.*;
import java.rmi.*;
import java.rmi.server.*;

import javax.swing.*;
import javax.swing.border.*;
import com.borland.jbcl.layout.*;
import java.util.*;

public class StatusPanel extends JPanel implements java.io.Serializable{

  private TitledBorder titledBorder1;
  static TitledBorder titledBorder2;
  static JPanel jPanel1 = new JPanel();
  private XYLayout xYLayout1 = new XYLayout();
  private XYLayout xYLayout2 = new XYLayout();
  static JTextArea textarea1;
  static String status="";
  static JTextArea   textarea[];
  static JTextArea textarea2;
  static Vector clientlist = new Vector();
  static boolean show=false;
  static ClientCallbackInt callback= new ClientCallbackImpl();

  static int X=0;

  public StatusPanel() {
    try {
      jbInit();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }
  void jbInit() throws Exception {
    this.setBackground(Color.white);
   // this.setFont(new java.awt.Font("Dialog", 1, 15));
    jPanel1.setBackground(Color.white);
    jPanel1.setLayout(xYLayout2);
    titledBorder1 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(148, 145, 140)),"Status");
    titledBorder2 = new TitledBorder(BorderFactory.createEtchedBorder(Color.white,new Color(178, 178, 157)),"");
    this.setLayout(xYLayout1);
    textarea = new JTextArea[30];
    textarea2 = new JTextArea("");
    textarea[0] = new JTextArea("");textarea[10] = new JTextArea("");textarea[20] = new JTextArea("");
    textarea[1] = new JTextArea("");textarea[11] = new JTextArea("");textarea[21] = new JTextArea("");
    textarea[2] = new JTextArea("");textarea[12] = new JTextArea("");textarea[22] = new JTextArea("");
    textarea[3] = new JTextArea("");textarea[13] = new JTextArea("");textarea[23] = new JTextArea("");
    textarea[4] = new JTextArea("");textarea[14] = new JTextArea("");textarea[24] = new JTextArea("");
    textarea[5] = new JTextArea("");textarea[15] = new JTextArea("");textarea[25] = new JTextArea("");
    textarea[6] = new JTextArea("");textarea[16] = new JTextArea("");textarea[26] = new JTextArea("");
    textarea[7] = new JTextArea("");textarea[17] = new JTextArea("");textarea[27] = new JTextArea("");
    textarea[8] = new JTextArea("");textarea[18] = new JTextArea("");textarea[28] = new JTextArea("");
    textarea[9] = new JTextArea("");textarea[19] = new JTextArea("");textarea[29] = new JTextArea("");
  }
  public void New_Status()
  {
    // set status
   show=true;
   jPanel1.setLayout(new GridLayout(1,textarea.length));
   int k=0;
   String allright = "yes";
     System.out.println("ok1");//test
     // first satatus
     if (NewRouter.vRouter.size()== 0){
     for(int a=0; a < NewRouter.vRouter.size(); a++){
       System.out.println("ok2");//test

       JTextArea tx = (JTextArea)NewRouter.vStatus.elementAt(a);//test----------------------
       if(tx.getText().equals("")){
         Status s = new Status();
         textarea1 = new JTextArea("");
         textarea1.setFont(new java.awt.Font("Dialog", 1, 13));
         textarea1.setText(s.getRname());
         status= textarea1.getText();
         NewRouter.getR().setStatus_detail(s.getRname());
         textarea1.setSize(201,187);
         textarea1.setEditable(false);
         textarea1.setBorder(titledBorder2);
         textarea1.setBackground(Color.white);
         NewRouter.vStatus.addElement(textarea1);//test--------------------------
         textarea1.setText(s.getRname());
         jPanel1.add(textarea1);
       } // end if
      }//end for
     } // end if
     // seccond status and up to
     else {
        Status s = new Status();
        textarea1 = new JTextArea("");
        textarea1.setFont(new java.awt.Font("Dialog", 1, 13));
        textarea1.setText(s.getRname());
        status= textarea1.getText();
        NewRouter.getR().setStatus_detail(s.getRname());
        textarea1.setSize(201,187);
        textarea1.setEditable(false);
        textarea1.setBorder(titledBorder2);
        textarea1.setBackground(Color.white);
        NewRouter.vStatus.addElement(textarea1);//test--------------------------
        jPanel1.add(textarea1);
       }// end else
       try {
         for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
           ChangeStatus   cs = (ChangeStatus) clients.nextElement();
           cs.setStatus(StatusPanel.jPanel1);
           //cs.setStatus(status,-1);
         }
       }
       catch(Exception e) {
         System.out.println("Exception changeStatus2:" +e);
       }
  }
  static void showStatus_int(Router r1) {

    // show status interface
    for(int a=0; a < NewRouter.vRouter.size(); a++){
      String alreadyName = ((Router)NewRouter.vRouter.elementAt(a)).getName();
      if (alreadyName.equalsIgnoreCase(r1.getName())){
        if (a<30){
          // set new status
          String str="";
          Status st = new Status(str);
          r1.setStatus_detail(st.s);

          JTextArea tx = (JTextArea)NewRouter.vStatus.elementAt(a);
          tx.setEditable(false);
          tx.setBorder(titledBorder2);
          str=r1.gets1();
          r1.sets1(st.s1);
          tx.setFont(new java.awt.Font("Dialog", 1, 13));
          tx.setText(r1.getStatus_detail()+st.s1);
          status= tx.getText();
          r1.setStatus_detail(r1.getStatus_detail());//+str
          st.s1="";
          jPanel1.add(tx);

          try{
            for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
              ChangeStatus   cs = (ChangeStatus)clients.nextElement();
              cs.setStatus(StatusPanel.jPanel1);
              //cs.setStatus(status,a);
            }
            //callback.callShowStatus(StatusPanel.jPanel1);
          }
          catch (Exception e)
          {
            e.printStackTrace();
          }
          X=a;
        } // end if
      }//end if
    }//end for
    jPanel1.setLayout(new GridLayout(1,X));

  }
  // chang name of router at status from command hostname
  static void showStatus_name(Router r1) {
   // NewRouter.vPanel.removeAllElements();
   System.out.println("show");
    for(int a=0; a < NewRouter.vRouter.size(); a++){
        String alreadyName = ((Router)NewRouter.vRouter.elementAt(a)).getName();
        if (alreadyName.equalsIgnoreCase(r1.getName())){
          if (a<30){

            // set new status
            System.out.println("show_status");
            Status st = new Status(r1);
           // st.setInt(r1);///////////////////
            r1.setStatus_detail(st.s);
            st.s="";
            JTextArea tx = (JTextArea)NewRouter.vStatus.elementAt(a);
            tx.setEditable(false);
            tx.setBorder(titledBorder2);
            tx.setFont(new java.awt.Font("Dialog", 1, 13));
            tx.setText(r1.getStatus_detail()+r1.gets1());
            status= tx.getText();
            r1.setStatus_detail(r1.getStatus_detail());
            jPanel1.add(tx);
            X=a;
           try {
              for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
                ChangeStatus   cs = (ChangeStatus)clients.nextElement();
                 cs.setStatus(StatusPanel.jPanel1);
                 cs.setFrameTitle(r1.getName(),a);
              }
            }
            catch(Exception e) {
              System.out.println("Exception changeStatus:" +e);
            }
          } // end if

        }//end if
        }//end for
     jPanel1.setLayout(new GridLayout(1,X));
  }
  static void Delete_Router(int index)
  {
    // NewRouter.vPanel.removeAllElements();
    if(index > NewRouter.vStatus.size())
    {  }
    else
    {
         JTextArea tx = (JTextArea)NewRouter.vStatus.elementAt(index);
         status="";
         StatusPanel.jPanel1.remove(tx);//
         NewRouter.vStatus.removeElementAt(index);
     //    NewRouter.vPanel.add(jPanel1);
         try {
           for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
             ChangeStatus   cs = (ChangeStatus)clients.nextElement();
             cs.setStatus(StatusPanel.jPanel1);
              //cs.setStatus(status,index);
           }
         }
         catch(Exception e) {
         System.out.println("Exception changeStatus:" +e);
          }
    }
  }
  static void  registerClientList(ChangeStatus st)
  {
    clientlist.addElement(st);
    System.out.print("ClientList:  "+clientlist.size());
  }
  static void setObject(ClientCallbackInt call)
  {
    callback = call;
  }
  public ClientCallbackInt getObject()
  {
    return callback;
  }
  public JTextArea getTextarea2()
  {
    return textarea2;
  }
  static void Showdebugrip(String output,int index)
  {
    try {
      for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
        ChangeStatus   cs = (ChangeStatus)clients.nextElement();
        cs.showdebugrip(output,index);
      }
    }
    catch(Exception e) {
      System.out.println("Exception changeStatus:" +e);
    }
  }
  static void stopdebugrip(int index)
  {
    try {
      for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
        ChangeStatus   cs = (ChangeStatus)clients.nextElement();
        cs.stopdebugrip(index);
      }
    }
    catch(Exception e) {
      System.out.println("Exception changeStatus:" +e);
    }
  }
  static void showprompt(int index)
  {
    try {
      for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
        ChangeStatus   cs = (ChangeStatus)clients.nextElement();
        cs.showprompt(index);
      }
    }
    catch(Exception e) {
      System.out.println("Exception changeStatus:" +e);
    }
  }
  static void setIndex(int index)
  {
    try {
      for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
        ChangeStatus   cs = (ChangeStatus)clients.nextElement();
        cs.setIndex(index);
      }
    }
    catch(Exception e) {
      System.out.println("Exception changeStatus:" +e);
    }
  }
  static void setCost(int s_index,int d_index,int cost)
  {
    try {
      for(Enumeration clients = clientlist.elements();clients.hasMoreElements();) {
        ChangeStatus   cs = (ChangeStatus)clients.nextElement();
        cs.setCost(s_index,d_index,cost);
      }
    }
    catch(Exception e) {
      System.out.println("Exception changeStatus:" +e);
    }
  }
}
