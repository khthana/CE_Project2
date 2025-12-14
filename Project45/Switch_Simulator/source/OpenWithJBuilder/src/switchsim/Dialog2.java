package switchsim;

import java.awt.*;
import java.util.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;
import java.awt.event.*;

public class Dialog2 extends JDialog {
  Switch sw1 = new Switch();
  Switch sw2 = new Switch();
  InterfaceImg intimg;
  String in1;
  String in2;
  JPanel panel1 = new JPanel();
  XYLayout xYLayout1 = new XYLayout();
  JList jList1 = new JList();
  JList jList2 = new JList();
  JLabel jLabel1 = new JLabel();
  JLabel jLabel2 = new JLabel();
  JLabel jLabel3 = new JLabel();
  JButton jButton1 = new JButton();
  JButton jButton2 = new JButton();
  JScrollPane jScrollPane1 = new JScrollPane();
  JScrollPane jScrollPane2 = new JScrollPane();

  public Dialog2(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
//    try {
//      jbInit();
//      pack();
//    }
//    catch(Exception ex) {
//      ex.printStackTrace();
//    }
  }

  public Dialog2() {
    this(null, "Connection", true);
  }
  void jbInit() throws Exception {
    panel1.setLayout(xYLayout1);
    jLabel1.setBackground(new Color(223, 223, 223));
    jLabel1.setFont(new java.awt.Font("Dialog", 1, 12));
    jLabel1.setHorizontalAlignment(SwingConstants.CENTER);
    jLabel1.setHorizontalTextPosition(SwingConstants.LEADING);
    jLabel1.setText(sw1.getName());
    jLabel2.setBackground(new Color(223, 223, 223));
    jLabel2.setFont(new java.awt.Font("Dialog", 1, 12));
    jLabel2.setHorizontalAlignment(SwingConstants.CENTER);
    jLabel2.setText(sw2.getName());
    jButton1.setBackground(new Color(223, 223, 223));
    jButton1.setText("Connect");
    jButton1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton1_actionPerformed(e);
      }
    });
    jButton2.setBackground(new Color(223, 223, 223));
    jButton2.setText("Close");
    jButton2.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton2_actionPerformed(e);
      }
    });
    this.getContentPane().setBackground(new Color(223, 223, 223));
    panel1.setBackground(new Color(223, 223, 223));
    jScrollPane1.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
    jScrollPane1.getViewport().setBackground(new Color(223, 223, 223));
    jScrollPane2.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
    jScrollPane2.getViewport().setBackground(new Color(223, 223, 223));
    jLabel3.setBackground(new Color(223, 223, 223));
    getContentPane().add(panel1);
    panel1.add(jLabel1,           new XYConstraints(50, 20, 90, 25));
    panel1.add(jLabel2,       new XYConstraints(200, 20, 90, 25));
    panel1.add(jButton1,              new XYConstraints(50, 200, 100, 25));
    panel1.add(jButton2,          new XYConstraints(190, 200, 100, 25));
    panel1.add(jLabel3,            new XYConstraints(0, 0, 340, 250));
    panel1.add(jScrollPane1,      new XYConstraints(50, 50, 90, 120));
    panel1.add(jScrollPane2,    new XYConstraints(200, 50, 90, 120));
    jScrollPane1.getViewport().add(jList1, null);
    jScrollPane2.getViewport().add(jList2, null);
    }

  public void showDialog2(InterfaceImg iimg) {
    for (int i=0; i<Frame1.vSwitch.size(); i++) {
      Switch sw_tmp = (Switch)Frame1.vSwitch.elementAt(i);
      for (int j=0; j<sw_tmp.getVIntSwitch().size(); j++) {
        Interface inf = (Interface)sw_tmp.getVIntSwitch().elementAt(j);
        if (inf.equals(iimg.getInt1())) {
          this.sw1 = sw_tmp;
          j=sw_tmp.getVIntSwitch().size();
        }
        else if (inf.equals(iimg.getInt2())) {
          this.sw2 = sw_tmp;
          j=sw_tmp.getVIntSwitch().size();
        }
      }
    }
    intimg=iimg;
    jLabel1.setText(sw1.getName());
    jLabel2.setText(sw2.getName());
    in1=iimg.getInt1().getNameInt();
    in2=iimg.getInt2().getNameInt();
    showDialog2();

    if (!this.isVisible()) {
      Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
      Dimension frameSize = this.getSize();
      if (frameSize.height > screenSize.height) {
        frameSize.height = screenSize.height;
      }
      if (frameSize.width > screenSize.width) {
        frameSize.width = screenSize.width;
      }
      this.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
      this.setVisible(true);
    }
  }

  public void showDialog2() {
    Vector list1 = new Vector();
    Vector list2 = new Vector();
    for (int i=0; i<sw1.getVIntSort().size(); i++) {
      Interface inf = (Interface)sw1.getVIntSort().elementAt(i);
      if (((inf.getCom()==null) && (inf.getSwitch()==null)) || (in1.equals(inf.getNameInt()))) {
        list1.addElement(inf.getNameInt());
      }
    }
    for (int i=0; i<sw2.getVIntSort().size(); i++) {
      Interface inf = (Interface)sw2.getVIntSort().elementAt(i);
      if (((inf.getCom()==null) && (inf.getSwitch()==null)) || (in2.equals(inf.getNameInt()))) {
        list2.addElement(inf.getNameInt());
      }
    }
    jList1.setListData(list1);
    jList2.setListData(list2);
    jList1.setSelectedValue(in1,false);
    jList2.setSelectedValue(in2,true);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  void jButton1_actionPerformed(ActionEvent e) {
    Interface new1 = new Interface();
    Interface new2 = new Interface();
    for (int i=0; i<sw1.getVIntSwitch().size(); i++) {
      Interface inf = (Interface)sw1.getVIntSwitch().elementAt(i);
      if (inf.getNameInt().equalsIgnoreCase(in1)) {
        sw1.getVIntSwitch().removeElementAt(i);
        inf.setConnectStatus("down");
        inf.setSwitchInt(null);
        i=sw1.getVIntSwitch().size();
      }
    }
    for (int i=0; i<sw2.getVIntSwitch().size(); i++) {
      Interface inf = (Interface)sw2.getVIntSwitch().elementAt(i);
      if (inf.getNameInt().equalsIgnoreCase(in2)) {
        sw2.getVIntSwitch().removeElementAt(i);
        inf.setConnectStatus("down");
        inf.setSwitchInt(null);
        i=sw2.getVIntSwitch().size();
      }
    }
    for (int i=0; i<sw1.getVInt().size(); i++) {
      Interface inf = (Interface)sw1.getVInt().elementAt(i);
      if (inf.getNameInt().equalsIgnoreCase((String)jList1.getSelectedValue())) {
        new1 = inf;
        i=sw1.getVInt().size();
      }
    }
    for (int i=0; i<sw2.getVInt().size(); i++) {
      Interface inf = (Interface)sw2.getVInt().elementAt(i);
      if (inf.getNameInt().equalsIgnoreCase((String)jList2.getSelectedValue())) {
        new2 = inf;
        i=sw2.getVInt().size();
      }
    }
    new1.addNewIntSwitch(sw1,new1.getNameInt(),sw2);
    new2.addNewIntSwitch(sw2,new2.getNameInt(),sw1);
    intimg.setInt1(new1);
    intimg.setInt2(new2);
    for (int i=0; i<Frame1.vSwitch.size(); i++) {
      Switch sw_tmp = (Switch)Frame1.vSwitch.elementAt(i);
      if ((sw_tmp.equals(sw1)) || (sw_tmp.equals(sw2))) {
        Panel1 p = (Panel1)Panel3.vStatus.elementAt(i);
        p.showDetail();
      }
    }
    this.dispose();
  }

  void jButton2_actionPerformed(ActionEvent e) {
    this.dispose();
  }

  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      this.dispose();
    }
  }
}