package switchsim;

import java.awt.*;
import java.util.*;
import javax.swing.*;
import com.borland.jbcl.layout.*;
import java.awt.event.*;
import javax.swing.event.*;

public class Dialog4 extends JDialog {
  JPanel panel1 = new JPanel();
  XYLayout xYLayout1 = new XYLayout();
  JComboBox jComboBox1 = new JComboBox();
  JComboBox jComboBox2 = new JComboBox();
  JScrollPane jScrollPane1 = new JScrollPane();
  JScrollPane jScrollPane2 = new JScrollPane();
  JList jList1 = new JList();
  JList jList2 = new JList();
  JButton jButton1 = new JButton();
  JButton jButton2 = new JButton();

  String select1 = "";
  String select2 = "";
  String iselect1 = "";
  String iselect2 = "";
  int type1 = 0; // 0-none, 1-is switch, 2-is com
  int type2 = 0; // 0-none, 1-is switch, 2-is com
  Vector list1 = new Vector();
  Vector list2 = new Vector();
  JLabel jLabel1 = new JLabel();
  boolean cbListen1 = true;
  boolean cbListen2 = true;
  boolean lListen1 = true;
  boolean lListen2 = true;

  public Dialog4(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    try {
      jbInit();
      pack();
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public Dialog4() {
    this(null, "Connection", true);
  }
  void jbInit() throws Exception {
    showDialog4();
    panel1.setLayout(xYLayout1);
    jButton1.setBackground(new Color(223, 223, 223));
    jButton1.setText("Connect");
    jButton1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jButton1_actionPerformed(e);
      }
    });
    jButton2.setBackground(new Color(223, 223, 223));
    jButton2.setText("Cancel");
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
    jComboBox1.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jComboBox1_actionPerformed(e);
      }
    });
    jComboBox2.addActionListener(new java.awt.event.ActionListener() {
      public void actionPerformed(ActionEvent e) {
        jComboBox2_actionPerformed(e);
      }
    });
    getContentPane().add(panel1);
    panel1.add(jComboBox1,         new XYConstraints(70, 40, 90, 20));
    panel1.add(jComboBox2,       new XYConstraints(220, 40, 90, 20));
    panel1.add(jScrollPane1,       new XYConstraints(70, 80, 90, 120));
    jScrollPane1.getViewport().add(jList1, null);
    panel1.add(jScrollPane2,      new XYConstraints(220, 80, 90, 120));
    panel1.add(jButton1,     new XYConstraints(70, 230, 100, 25));
    panel1.add(jButton2,     new XYConstraints(210, 230, 100, 25));
    panel1.add(jLabel1,    new XYConstraints(0, 0, 380, 285));
    jScrollPane2.getViewport().add(jList2, null);
    jList1.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
      public void valueChanged(ListSelectionEvent e) {
        jList1_valueChanged(e);
      }
    });
    jList2.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
      public void valueChanged(ListSelectionEvent e) {
        jList2_valueChanged(e);
      }
    });
  }

  public void showDialog4() {
    cbListen1 = false;
    cbListen2 = false;
    lListen1 = false;
    lListen2 = false;
    if (Frame1.vSwitch.size()>0) {
      Switch sw = (Switch)Frame1.vSwitch.elementAt(0);
      select1 = sw.getName();
      type1 = 1;
    }
    else {
      for (int i=0; i<Frame1.vWorkstation.size(); i++) {
        Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
        if (!com.getConnection())
          select1 = com.getName();
          type1 = 2;
          i=Frame1.vWorkstation.size();
      }
    }

    // add jComboBox2;
    for (int i=0; i<Frame1.vSwitch.size(); i++) {
      Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
      if ((!sw.getName().equals(select1)) && (canConnect(select1,sw.getName()))) {
        jComboBox2.addItem(sw.getName());
        type2 = 1;
      }
    }
    if (type1!=2) {
      boolean have = false;
      for (int i=0; i<Frame1.vWorkstation.size(); i++) {
        Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
        if ((!com.getConnection()) && (!com.getName().equals(select1))) {
          jComboBox2.addItem(com.getName());
          have = true;
        }
      }
      if ((type2!=1) && (have)) {
        type2 = 2;
      }
    }
    select2 = (String)jComboBox2.getItemAt(0);

    // add jComboBox1
    for (int i=0; i<Frame1.vSwitch.size(); i++) {
      Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
      if ((!sw.getName().equals(select2)) && (canConnect(select2,sw.getName()))) {
        jComboBox1.addItem(sw.getName());
      }
    }
    if (type1!=2) {
      for (int i=0; i<Frame1.vWorkstation.size(); i++) {
        Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
        if ((!com.getConnection()) && (!com.getName().equals(select2))) {
          jComboBox1.addItem(com.getName());
        }
      }
    }

    // add list1
    if (type1==1) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw.getName().equals(select1)) {
          for (int j=0; j<sw.getVIntSort().size(); j++) {
            Interface inf = (Interface)sw.getVIntSort().elementAt(j);
            if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
              list1.addElement(inf.getNameInt());
            }
          }
        }
      }
    }
    // add list2
    if (type2==1) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw.getName().equals(select2)) {
          for (int j=0; j<sw.getVIntSort().size(); j++) {
            Interface inf = (Interface)sw.getVIntSort().elementAt(j);
            if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
              list2.addElement(inf.getNameInt());
            }
          }
        }
      }
    }
    jList1.setListData(list1);
    jList2.setListData(list2);
    System.out.println("Init Select1 : "+select1);
    System.out.println("Init Select2 : "+select2);
    cbListen1 = true;
    cbListen2 = true;
    lListen1 = true;
    lListen2 = true;
  }

  void jComboBox1_actionPerformed(ActionEvent e) {
//    System.out.println("Select1 : "+(String)jComboBox1.getSelectedItem());
    if ((cbListen1) && (!select1.equals(jComboBox1.getSelectedItem()))) {
      cbListen2 = false;
      lListen1 = false;
      lListen2 = false;
      // update jComboBox2
      jComboBox2.removeAllItems();
      boolean isUTP = true;
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
        if ((!sw.getName().equals(jComboBox1.getSelectedItem())) && (canConnect((String)jComboBox1.getSelectedItem(),sw.getName()))) {
          jComboBox2.addItem(sw.getName());
        }
        else if ((sw.getName().equals(jComboBox1.getSelectedItem()) && (sw.getModel()==3) || (sw.getModel()==5))) {
          if ((iselect2!=null) && (!iselect2.equals("")) && (iselect2.substring(0,2).equals("Gi"))) {
            isUTP=false;
          }
        }
      }
      if (type1!=2) {
        for (int i=0; i<Frame1.vWorkstation.size(); i++) {
          Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
          if ((isUTP) && (!com.getConnection()) && (!com.getName().equals(jComboBox1.getSelectedItem()))) {
            jComboBox2.addItem(com.getName());
          }
        }
      }
      jComboBox2.setSelectedItem(select2);
      // update jList2
        list2.removeAllElements();
        type2 = 2;
        for (int i=0; i<Frame1.vSwitch.size(); i++) {
          Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
          if (sw.getName().equals(jComboBox2.getSelectedItem())) {
            type2 = 1;
            for (int j=0; j<sw.getVIntSort().size(); j++) {
              Interface inf = (Interface)sw.getVIntSort().elementAt(j);
              if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                list2.addElement(inf.getNameInt());
              }
            }
          }
        }
        jList2.setListData(list2);
      boolean found = false;
      for (int i=0; i<list2.size(); i++) {
        String temp = (String)list2.elementAt(i);
        if (temp.equals(iselect2)) {
          jList2.setSelectedIndex(i);
          found = true;
          i=list2.size();
        }
      }
      if (found)
        iselect2 = (String)jList2.getSelectedValue();
      else iselect2 = "";
      // update jList1
      if (type1==1)
        if ((jList2.getSelectedValue()!=null) && (!jList2.getSelectedValue().equals("")))
          updatejList1();
        else {
          list1.removeAllElements();
          type1 = 2;
          for (int i=0; i<Frame1.vSwitch.size(); i++) {
            Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
            if (sw.getName().equals(jComboBox1.getSelectedItem())) {
              type1 = 1;
              for (int j=0; j<sw.getVIntSort().size(); j++) {
                Interface inf = (Interface)sw.getVIntSort().elementAt(j);
                if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                  list1.addElement(inf.getNameInt());
                }
              }
            }
          }
          jList1.setListData(list1);
        }
      else {
        list1.removeAllElements();
        jList1.setListData(list1);
      }
      iselect1 = "";

      cbListen2 = true;
      lListen1 = true;
      lListen2 = true;

      select1 = (String)jComboBox1.getSelectedItem();
    }
  }

  void jComboBox2_actionPerformed(ActionEvent e) {
    if ((cbListen2) && (!select2.equals(jComboBox2.getSelectedItem()))) {
      cbListen1 = false;
      lListen1 = false;
      lListen2 = false;
      // update jComboBox1
      jComboBox1.removeAllItems();
      boolean isUTP = true;
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
        if ((!sw.getName().equals(jComboBox2.getSelectedItem())) && (canConnect((String)jComboBox2.getSelectedItem(),sw.getName()))) {
          jComboBox1.addItem(sw.getName());
        }
        else if ((sw.getName().equals(jComboBox2.getSelectedItem()) && (sw.getModel()==3) || (sw.getModel()==5))) {
          if ((iselect1!=null) && (!iselect1.equals("")) && (iselect1.substring(0,2).equals("Gi"))) {
            isUTP=false;
          }
        }
      }
      if (type2!=2) {
        for (int i=0; i<Frame1.vWorkstation.size(); i++) {
          Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
          if ((isUTP) && (!com.getConnection()) && (!com.getName().equals(jComboBox2.getSelectedItem()))) {
            jComboBox1.addItem(com.getName());
          }
        }
      }
      jComboBox1.setSelectedItem(select1);
      // update jList1

        list1.removeAllElements();
        type1 = 2;
        for (int i=0; i<Frame1.vSwitch.size(); i++) {
          Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
          if (sw.getName().equals(jComboBox1.getSelectedItem())) {
            type1 = 1;
            for (int j=0; j<sw.getVIntSort().size(); j++) {
              Interface inf = (Interface)sw.getVIntSort().elementAt(j);
              if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                list1.addElement(inf.getNameInt());
              }
            }
          }
        }
        jList1.setListData(list1);
      boolean found = false;
      for (int i=0; i<list1.size(); i++) {
        String temp = (String)list1.elementAt(i);
        if (temp.equals(iselect1)) {
          jList1.setSelectedIndex(i);
          found = true;
          i=list1.size();
        }
      }
      if (found)
        iselect1 = (String)jList1.getSelectedValue();
      else iselect1 = "";
      // update jList2
      if ((jList1.getSelectedValue()!=null) && (!jList1.getSelectedValue().equals("")))
        updatejList2();
      else {
        list2.removeAllElements();
        type2 = 2;
        for (int i=0; i<Frame1.vSwitch.size(); i++) {
          Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
          if (sw.getName().equals(jComboBox2.getSelectedItem())) {
            type2 = 1;
            for (int j=0; j<sw.getVIntSort().size(); j++) {
              Interface inf = (Interface)sw.getVIntSort().elementAt(j);
              if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                list2.addElement(inf.getNameInt());
              }
            }
          }
        }
        jList2.setListData(list2);
      }
      iselect2 = "";


      cbListen1 = true;
      lListen1 = true;
      lListen2 = true;

      select2 = (String)jComboBox2.getSelectedItem();
    }
  }

  void jList1_valueChanged(ListSelectionEvent e) {
    cbListen2 = false;
    lListen2 = false;
    if (lListen1) {
    String tmp = (String)jList1.getSelectedValue();
    iselect1 = tmp;
    if ((tmp!=null) && (!tmp.equals("")) && (iselect1.equals(tmp)))
    if (type1==1) {
      boolean isUTP = true;
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw1 = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw1.getName().equals(select1)) {
          // is UTP
          if ((sw1.getModel()==1) || (sw1.getModel()==2) || (sw1.getModel()==4)) {
            System.out.println("UTP");
            // update jList2
            if (type2==1) {
              list2.removeAllElements();
              String s = iselect2;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(select2)) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                        if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                          list2.addElement(inf.getNameInt());
                        }
                      }
                      else list2.addElement(inf.getNameInt());
                    }
                  }
                }
              }
              jList2.setListData(list2);
              }
            }
          }
          // is GBIC
          else if (sw1.getModel()==3) {
            System.out.println("GBIC");
            // update jList2
            if (type2==1) {
              list2.removeAllElements();
              String s = iselect2;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(select2)) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list2.addElement(inf.getNameInt());
                          }
                        }
                        else list2.addElement(inf.getNameInt());
                      }
                      else {
                        isUTP = false;
                        if ((sw2.getModel()==3) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet")))
                          list2.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList2.setListData(list2);
            }

          }
          // is COAX
          else {
            System.out.println("COAX");
            // update jList2
            if (type2==1) {
              list2.removeAllElements();
              String s = iselect2;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(select2)) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list2.addElement(inf.getNameInt());
                          }
                        }
                        else list2.addElement(inf.getNameInt());
                      }
                      else {
                        isUTP = false;
                        if ((sw2.getModel()==5) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet")))
                          list2.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList2.setListData(list2);
            }
          }
          i=Frame1.vSwitch.size();
        }
          // update jComboBox2
          jComboBox2.removeAllItems();
          for (int i=0; i<Frame1.vSwitch.size(); i++) {
            Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
            if ((!sw.getName().equals(jComboBox1.getSelectedItem())) && (canConnect((String)jComboBox1.getSelectedItem(),sw.getName()))) {
              jComboBox2.addItem(sw.getName());
            }
          }
          if (isUTP) {
            for (int i=0; i<Frame1.vWorkstation.size(); i++) {
              Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
              if ((!com.getConnection()) && (!com.getName().equals(jComboBox1.getSelectedItem()))) {
                jComboBox2.addItem(com.getName());
              }
            }
          }
          jComboBox2.setSelectedItem(select2);
      }
    boolean found = false;
    for (int i=0; i<list2.size(); i++) {
      String temp = (String)list2.elementAt(i);
      if (temp.equals(iselect2)) {
        jList2.setSelectedIndex(i);
        found = true;
        i=list2.size();
      }
    }
    if (found)
      iselect2 = (String)jList2.getSelectedValue();
    else iselect2 = "";
    }
    cbListen2 = true;
    lListen2 = true;
  }

  void jList2_valueChanged(ListSelectionEvent e) {
    cbListen1 = false;
    lListen1 = false;
    if (lListen2) {
      String tmp = (String)jList2.getSelectedValue();
      iselect2 = tmp;
    if ((tmp!=null) && (!tmp.equals("")) && (iselect2.equals(tmp)))
    if (type2==1) {
      boolean isUTP = true;
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw2 = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw2.getName().equals(select2)) {
          // is UTP
          if ((sw2.getModel()==1) || (sw2.getModel()==2) || (sw2.getModel()==4)) {
            System.out.println("UTP");
            // update jList1
            if (type1==1) {
              list1.removeAllElements();
              String s = iselect1;
              for (int j = 0; j < Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch) Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(select1)) {
                  for (int k = 0; k < sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface) sw1.getVIntSort().elementAt(
                        k);
                    if ( (inf.getCom() == null) && (inf.getSwitch() == null)) {
                      if ( (sw1.getModel() == 3) || (sw1.getModel() == 5)) {
                        if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                          list1.addElement(inf.getNameInt());
                        }
                      }
                      else
                        list1.addElement(inf.getNameInt());
                    }
                  }
                }
              }
              jList1.setListData(list1);
            }
            }
          }
          // is GBIC
          else if (sw2.getModel()==3) {
            System.out.println("GBIC");
            // update jList1
            if (type1==1) {
              list1.removeAllElements();
              String s = iselect1;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(select1)) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list1.addElement(inf.getNameInt());
                          }
                        }
                        else list1.addElement(inf.getNameInt());
                      }
                      else {
                        isUTP = false;
                        if ((sw1.getModel()==3) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet")))
                          list1.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList1.setListData(list1);
            }

          }
          // is COAX
          else {
            System.out.println("COAX");
            // update jList2
            if (type1==1) {
              list1.removeAllElements();
              String s = iselect1;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(select1)) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list1.addElement(inf.getNameInt());
                          }
                        }
                        else list1.addElement(inf.getNameInt());
                      }
                      else {
                        isUTP = false;
                        if ((sw1.getModel()==5) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet")))
                          list1.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList1.setListData(list1);
            }
          }
          i=Frame1.vSwitch.size();
        }
        // update jComboBox1
        jComboBox1.removeAllItems();
        for (int i=0; i<Frame1.vSwitch.size(); i++) {
          Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
          if ((!sw.getName().equals(jComboBox2.getSelectedItem())) && (canConnect((String)jComboBox2.getSelectedItem(),sw.getName()))) {
            jComboBox1.addItem(sw.getName());
          }
        }
        jComboBox1.setSelectedItem(select1);
        if (isUTP) {
          for (int i=0; i<Frame1.vWorkstation.size(); i++) {
            Workstation com = (Workstation)Frame1.vWorkstation.elementAt(i);
            if ((!com.getConnection()) && (!com.getName().equals(jComboBox2.getSelectedItem()))) {
              jComboBox1.addItem(com.getName());
            }
          }
        }
      }
    boolean found = false;
    for (int i=0; i<list1.size(); i++) {
      String temp = (String)list1.elementAt(i);
      if (temp.equals(iselect1)) {
        jList1.setSelectedIndex(i);
        found = true;
        i=list1.size();
      }
    }
    if (found)
      iselect1 = (String)jList1.getSelectedValue();
    else iselect1 = "";
    }
    cbListen1 = true;
    lListen1 = true;
  }

  void jButton1_actionPerformed(ActionEvent e) {
    if ((type1==1) && (type2==1)) {
      if (connectSwToSw())
        this.dispose();
      else Frame1.errmsg1.showErrorMsg1("Please select Interface.");
    }
    else if (((type1==1) && (type2==2)) || ((type1==2) && (type2==1))) {
      if (connectSwToCom())
        this.dispose();
      else Frame1.errmsg1.showErrorMsg1("Please select Interface.");
    }
    else Frame1.errmsg1.showErrorMsg1("Please select Interface.");
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

  boolean connectSwToSw() {
    Switch sw1 = null;
    Switch sw2 =  null;
    SwitchImg simg1 = null;
    SwitchImg simg2 = null;
    Panel1 p1 = null;
    Panel1 p2 = null;

    String int1 = "";
    String int2 = "";
    boolean found = false;
    for (int i=0; i<Frame1.vSwitch.size(); i++) {
      Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
      if (sw.getName().equals(select1)) {
        SwitchImg simg = (SwitchImg)Panel2.vImgSwitch.elementAt(i);
        Panel1 p = (Panel1)Panel3.vStatus.elementAt(i);
        if (!found) {
          sw1 = sw;
          simg1 = simg;
          p1 = p;
          int1 = (String)jList1.getSelectedValue();
          found = true;
        }
        else {
          sw2 = sw;
          simg2 = simg;
          p2 = p;
          int2 = (String)jList1.getSelectedValue();
        }
      }
      else if (sw.getName().equals(select2)) {
        SwitchImg simg = (SwitchImg)Panel2.vImgSwitch.elementAt(i);
        Panel1 p = (Panel1)Panel3.vStatus.elementAt(i);
        if (!found) {
          sw1 = sw;
          simg1 = simg;
          p1 = p;
          int1 = (String)jList2.getSelectedValue();
          found = true;
        }
        else {
          sw2 = sw;
          simg2 = simg;
          p2 = p;
          int2 = (String)jList2.getSelectedValue();
        }
      }
    }
    if ((sw1!=null) && (sw2!=null) && (simg1!=null) && (simg2!=null) && (p1!=null) && (p2!=null) &&
        (int1!=null) && (int2!=null) && (!int1.equals("")) && (!int2.equals(""))) {
      InterfaceImg intimg = new InterfaceImg();
      for (int i=0; i<sw1.getVInt().size(); i++) {
        Interface inf = (Interface)sw1.getVInt().elementAt(i);
        if (inf.getNameInt().equals(int1)) {
          inf.addNewIntSwitch(sw1,inf.getNameInt(),sw2);
          intimg.setInt1(inf);
          intimg.setXPos1(simg1.getXPos()+(simg1.getWide()/2));
          intimg.setYPos1(simg1.getYPos()+(simg1.getHigh()/2));
          i=sw1.getVInt().size();
        }
      }
      for (int i=0; i<sw2.getVInt().size(); i++) {
        Interface inf = (Interface)sw2.getVInt().elementAt(i);
        if (inf.getNameInt().equals(int2)) {
          inf.addNewIntSwitch(sw2,inf.getNameInt(),sw1);
          intimg.setInt2(inf);
          intimg.setXPos2(simg2.getXPos()+(simg2.getWide()/2));
          intimg.setYPos2(simg2.getYPos()+(simg2.getHigh()/2));
          i=sw2.getVInt().size();
        }
      }
      intimg.setIntSwToSw();
      Panel2.vImgInt.addElement(intimg);
      Frame1.panel.repaintView();
      p1.showDetail();
      p2.showDetail();
      return true;
    }
    return false;
  }

  boolean connectSwToCom() {
    Switch sw = null;
    Workstation com = null;
    SwitchImg simg = null;
    ComImg cimg = null;
    Panel1 p = null;

    String intname = (String)jList1.getSelectedValue();
    // Switch connect to Computer
    if (type2==2) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        sw = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw.getName().equals(select1)) {
          simg = (SwitchImg)Panel2.vImgSwitch.elementAt(i);
          p = (Panel1)Panel3.vStatus.elementAt(i);
          intname = (String)jList1.getSelectedValue();
          i=Frame1.vSwitch.size();
        }
      }
      for (int i=0; i<Frame1.vWorkstation.size(); i++) {
        com = (Workstation)Frame1.vWorkstation.elementAt(i);
        if (com.getName().equals(select2)) {
          cimg = (ComImg)Panel2.vImgCom.elementAt(i);
          i=Frame1.vWorkstation.size();
        }
      }
    }
    // Computer connect to Switch
    else if (type1==2) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        sw = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw.getName().equals(select2)) {
          simg = (SwitchImg)Panel2.vImgSwitch.elementAt(i);
          p = (Panel1)Panel3.vStatus.elementAt(i);
          intname = (String)jList2.getSelectedValue();
          i=Frame1.vSwitch.size();
        }
      }
      for (int i=0; i<Frame1.vWorkstation.size(); i++) {
        com = (Workstation)Frame1.vWorkstation.elementAt(i);
        if (com.getName().equals(select1)) {
          cimg = (ComImg)Panel2.vImgCom.elementAt(i);
          i=Frame1.vWorkstation.size();
        }
      }
    }
    if ((sw!=null) && (com!=null) && (simg!=null) && (cimg!=null) && (p!=null) &&
        (intname!=null) && (!intname.equals(""))) {
      InterfaceImg intimg = new InterfaceImg();
      for (int i=0; i<sw.getVInt().size(); i++) {
        Interface inf = (Interface)sw.getVInt().elementAt(i);
        if (inf.getNameInt().equals(intname)) {
          inf.addNewIntCom(sw,inf.getNameInt(),com);
          com.setConnection(true);
          intimg.setInt1(inf);
          intimg.setWorkstation(com);
          intimg.setXPos1(simg.getXPos()+(simg.getWide()/2));
          intimg.setYPos1(simg.getYPos()+(simg.getHigh()/2));
          intimg.setXPos2(cimg.getXPos()+(cimg.getWide()/2));
          intimg.setYPos2(cimg.getYPos()+(cimg.getHigh()/2));
          intimg.setIntSwToCom();
          Panel2.vImgInt.addElement(intimg);
          Frame1.panel.repaintView();
          p.showDetail();
          i=sw.getVInt().size();
          return true;
        }
      }
    }
    return false;
  }

  boolean canConnect(String sw1, String sw2) {
    for (int i=0; i<Frame1.vSwitch.size(); i++) {
      Switch sw = (Switch)Frame1.vSwitch.elementAt(i);
      if (sw.getName().equals(sw1))
        for (int j=0; j<sw.getVIntSwitch().size(); j++) {
          Interface inf = (Interface)sw.getVIntSwitch().elementAt(j);
          if (inf.getSwitch().getName().equals(sw2)) {
            return false;
        }
      }
    }
    return true;
  }

  void updatejList1() {
    System.out.println("Update jList1");
//    cbListen1 = false;
    lListen1 = false;
    String tmp = (String)jList2.getSelectedValue();
    if (type2==1) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw2 = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw2.getName().equals(select2)) {
          // is UTP
          if ((sw2.getModel()==1) || (sw2.getModel()==2) || (sw2.getModel()==4)) {
            System.out.println("UTP");
            // update jList1
            if (type1==1) {
              list1.removeAllElements();
              String s = iselect1;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(jComboBox1.getSelectedItem())) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                        if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                          list1.addElement(inf.getNameInt());
                        }
                      }
                      else list1.addElement(inf.getNameInt());
                    }
                  }
                }
              }
              jList1.setListData(list1);
            }
          }
          // is GBIC
          else if (sw2.getModel()==3) {
            System.out.println("GBIC");
            // update jList1
            if (type1==1) {
              list1.removeAllElements();
              String s = iselect1;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(jComboBox1.getSelectedItem())) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list1.addElement(inf.getNameInt());
                          }
                        }
                        else list1.addElement(inf.getNameInt());
                      }
                      else if ((sw1.getModel()==3) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list1.addElement(inf.getNameInt());
                      }
                    }
                  }
                  j=Frame1.vSwitch.size();
                }
              }
              jList1.setListData(list1);
            }

          }
          // is COAX
          else {
            System.out.println("COAX");
            // update jList2
            if (type1==1) {
              list1.removeAllElements();
              String s = iselect1;

              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(jComboBox1.getSelectedItem())) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list1.addElement(inf.getNameInt());
                          }
                        }
                        else list1.addElement(inf.getNameInt());
                      }
                      else if ((sw1.getModel()==5) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list1.addElement(inf.getNameInt());
                      }
                    }
                  }
                  j=Frame1.vSwitch.size();
                }
              }
              jList1.setListData(list1);
            }
          }
          i=Frame1.vSwitch.size();
        }
      }
    }
//    cbListen1 = true;
    lListen1 = true;
  }

  void updatejList2() {
    System.out.println("Update jList2");
//    cbListen2 = false;
    lListen2 = false;
    String tmp = (String)jList1.getSelectedValue();
    if (type1==1) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw1 = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw1.getName().equals(select1)) {
          // is UTP
          if ((sw1.getModel()==1) || (sw1.getModel()==2) || (sw1.getModel()==4)) {
            System.out.println("UTP");
            // update jList2
            if (type2==1) {
              list2.removeAllElements();
              String s = iselect2;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(jComboBox2.getSelectedItem())) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                        if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                          list2.addElement(inf.getNameInt());
                        }
                      }
                      else list2.addElement(inf.getNameInt());
                    }
                  }
                  j=Frame1.vSwitch.size();
                }
              }
              jList2.setListData(list2);
            }
          }
          // is GBIC
          else if (sw1.getModel()==3) {
            System.out.println("GBIC");
            // update jList2
            if (type2==1) {
              list2.removeAllElements();
              String s = iselect2;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(jComboBox2.getSelectedItem())) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list2.addElement(inf.getNameInt());
                          }
                        }
                        else list2.addElement(inf.getNameInt());
                      }
                      else if ((sw2.getModel()==3) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list2.addElement(inf.getNameInt());
                      }
                    }
                  }
                  j=Frame1.vSwitch.size();
                }
              }
              jList2.setListData(list2);
            }

          }
          // is COAX
          else {
            System.out.println("COAX");
            // update jList2
            if (type2==1) {
              list2.removeAllElements();
              String s = iselect2;
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(jComboBox2.getSelectedItem())) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list2.addElement(inf.getNameInt());
                          }
                        }
                        else list2.addElement(inf.getNameInt());
                      }
                      else if ((sw2.getModel()==5) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list2.addElement(inf.getNameInt());
                      }
                    }
                  }
                  j=Frame1.vSwitch.size();
                }
              }
              jList2.setListData(list2);
            }
          }
          i=Frame1.vSwitch.size();
        }
      }
    }
//    cbListen2 = true;
    lListen2 = true;
  }

/*
  void jList1_valueChanged(ListSelectionEvent e) {
    cbListen2 = false;
    lListen2 = false;
    String tmp = (String)jList1.getSelectedValue();
    if ((lListen1) && (tmp!=null) && (!tmp.equals("")))
    if (type1==1) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw1 = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw1.getName().equals(select1)) {
          // is UTP
          if ((sw1.getModel()==1) || (sw1.getModel()==2) || (sw1.getModel()==4)) {
            System.out.println("UTP");
            // update jComboBox2
            jComboBox2.removeAllItems();
            for (int j=0; j<Frame1.vSwitch.size(); j++) {
              Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
              if ((!sw2.getName().equals(select1)) && (canConnect(select1,sw2.getName()))) {
                jComboBox2.addItem(sw2.getName());
                type2 = 1;
              }
            }
            boolean have = false;
            for (int j=0; j<Frame1.vWorkstation.size(); j++) {
              Workstation com = (Workstation)Frame1.vWorkstation.elementAt(j);
              if ((!com.getConnection()) && (!com.getName().equals(select1))) {
                jComboBox2.addItem(com.getName());
                have = true;
              }
            }
            if ((type2!=1) && (have)) {
              type2 = 2;
            }
            try {
              jComboBox2.setSelectedItem(select2);
            }
            catch(Exception exp) {
              jComboBox2.setSelectedIndex(0);
              select2 = (String)jComboBox2.getSelectedItem();
            }
            // update jList2
            if (type2==1) {
              Vector list2 = new Vector();
              String s = (String)jList2.getSelectedValue();
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(select2)) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                        if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                          list2.addElement(inf.getNameInt());
                        }
                      }
                      else list2.addElement(inf.getNameInt());
                    }
                  }
                }
              }
              jList2.setListData(list2);
              try {
                jList2.setSelectedValue(s, true);
              }
              catch(Exception exp) {
                jList2.setSelectedIndex(0);
              }
            }
          }
          // is GBIC
          else if (sw1.getModel()==3) {
            System.out.println("GBIC");
            // update jComboBox2
            jComboBox2.removeAllItems();
            for (int j=0; j<Frame1.vSwitch.size(); j++) {
              Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
              if ((!sw2.getName().equals(select1)) && (canConnect(select1,sw2.getName()))) {
                if (tmp.substring(0,2).equals("Fa")) {
                  jComboBox2.addItem(sw2.getName());
                  type2 = 1;
                }
                else if (sw2.getModel()==3) {
                  jComboBox2.addItem(sw2.getName());
                  type2 = 1;
                }
              }
            }
            if (tmp.substring(0,2).equals("Fa")) {
              boolean have = false;
              for (int j=0; j<Frame1.vWorkstation.size(); j++) {
                Workstation com = (Workstation)Frame1.vWorkstation.elementAt(j);
                if ((!com.getConnection()) && (!com.getName().equals(select1))) {
                  jComboBox2.addItem(com.getName());
                  have = true;
                }
              }
              if ((type2!=1) && (have)) {
                type2 = 2;
              }
              try {
                jComboBox2.setSelectedItem(select2);
              }
              catch(Exception exp) {
                jComboBox2.setSelectedIndex(0);
                select2 = (String)jComboBox2.getSelectedItem();
              }
            }
            // update jList2
            if (type2==1) {
              Vector list2 = new Vector();
              String s = (String)jList2.getSelectedValue();
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(select2)) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list2.addElement(inf.getNameInt());
                          }
                        }
                        else list2.addElement(inf.getNameInt());
                      }
                      else if ((sw2.getModel()==3) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list2.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList2.setListData(list2);
              try {
                jList2.setSelectedValue(s, true);
              }
              catch(Exception exp) {
                jList2.setSelectedIndex(0);
              }
            }

          }
          // is COAX
          else {
            System.out.println("COAX");
            // update jComboBox2
            jComboBox2.removeAllItems();
            for (int j=0; j<Frame1.vSwitch.size(); j++) {
              Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
              if ((!sw2.getName().equals(select1)) && (canConnect(select1,sw2.getName()))) {
                if (tmp.substring(0,2).equals("Fa")) {
                  jComboBox2.addItem(sw2.getName());
                  type2 = 1;
                }
                else if (sw2.getModel()==5) {
                  jComboBox2.addItem(sw2.getName());
                  type2 = 1;
                }
              }
            }
            if (tmp.substring(0,2).equals("Fa")) {
              boolean have = false;
              for (int j=0; j<Frame1.vWorkstation.size(); j++) {
                Workstation com = (Workstation)Frame1.vWorkstation.elementAt(j);
                if ((!com.getConnection()) && (!com.getName().equals(select1))) {
                  jComboBox2.addItem(com.getName());
                  have = true;
                }
              }
              if ((type2!=1) && (have)) {
                type2 = 2;
              }
              try {
                jComboBox2.setSelectedItem(select2);
              }
              catch(Exception exp) {
                jComboBox2.setSelectedIndex(0);
                select2 = (String)jComboBox2.getSelectedItem();
              }
            }
            // update jList2
            if (type2==1) {
              Vector list2 = new Vector();
              String s = (String)jList2.getSelectedValue();
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw2 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw2.getName().equals(select2)) {
                  for (int k=0; k<sw2.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw2.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw2.getModel()==3) || (sw2.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list2.addElement(inf.getNameInt());
                          }
                        }
                        else list2.addElement(inf.getNameInt());
                      }
                      else if ((sw2.getModel()==5) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list2.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList2.setListData(list2);
              try {
                jList2.setSelectedValue(s, true);
              }
              catch(Exception exp) {
                jList2.setSelectedIndex(0);
              }
            }
          }
          i=Frame1.vSwitch.size();
        }
      }
    }
    cbListen2 = true;
    lListen2 = true;
  }

  void jList2_valueChanged(ListSelectionEvent e) {
    cbListen1 = false;
    lListen1 = false;
    String tmp = (String)jList2.getSelectedValue();
    if ((lListen2) && (tmp!=null) && (!tmp.equals("")))
    if (type2==1) {
      for (int i=0; i<Frame1.vSwitch.size(); i++) {
        Switch sw2 = (Switch)Frame1.vSwitch.elementAt(i);
        if (sw2.getName().equals(select2)) {
          // is UTP
          if ((sw2.getModel()==1) || (sw2.getModel()==2) || (sw2.getModel()==4)) {
            System.out.println("UTP");
            // update jComboBox1
            jComboBox1.removeAllItems();
            for (int j=0; j<Frame1.vSwitch.size(); j++) {
              Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
              if ((!sw1.getName().equals(select2)) && (canConnect(select2,sw1.getName()))) {
                jComboBox1.addItem(sw1.getName());
                type1 = 1;
              }
            }
            boolean have = false;
            for (int j=0; j<Frame1.vWorkstation.size(); j++) {
              Workstation com = (Workstation)Frame1.vWorkstation.elementAt(j);
              if ((!com.getConnection()) && (!com.getName().equals(select2))) {
                jComboBox1.addItem(com.getName());
                have = true;
              }
            }
            if ((type1!=1) && (have)) {
              type1 = 2;
            }
            try {
              jComboBox1.setSelectedItem(select1);
            }
            catch(Exception exp) {
              jComboBox1.setSelectedIndex(0);
              select1 = (String)jComboBox1.getSelectedItem();
            }
            // update jList1
            if (type1==1) {
              Vector list1 = new Vector();
              String s = (String)jList1.getSelectedValue();
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(select1)) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                        if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                          list1.addElement(inf.getNameInt());
                        }
                      }
                      else list1.addElement(inf.getNameInt());
                    }
                  }
                }
              }
              jList1.setListData(list1);
              try {
                jList1.setSelectedValue(s, true);
              }
              catch(Exception exp) {
                jList1.setSelectedIndex(0);
              }
            }
          }
          // is GBIC
          else if (sw2.getModel()==3) {
            System.out.println("GBIC");
            // update jComboBox1
            jComboBox1.removeAllItems();
            for (int j=0; j<Frame1.vSwitch.size(); j++) {
              Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
              if ((!sw1.getName().equals(select2)) && (canConnect(select2,sw1.getName()))) {
                if (tmp.substring(0,2).equals("Fa")) {
                  jComboBox1.addItem(sw1.getName());
                  type1 = 1;
                }
                else if (sw1.getModel()==3) {
                  jComboBox1.addItem(sw1.getName());
                  type1 = 1;
                }
              }
            }
            if (tmp.substring(0,2).equals("Fa")) {
              boolean have = false;
              for (int j=0; j<Frame1.vWorkstation.size(); j++) {
                Workstation com = (Workstation)Frame1.vWorkstation.elementAt(j);
                if ((!com.getConnection()) && (!com.getName().equals(select2))) {
                  jComboBox1.addItem(com.getName());
                  have = true;
                }
              }
              if ((type1!=1) && (have)) {
                type1 = 2;
              }
              try {
                jComboBox1.setSelectedItem(select1);
              }
              catch(Exception exp) {
                jComboBox1.setSelectedIndex(0);
                select1 = (String)jComboBox1.getSelectedItem();
              }
            }
            // update jList1
            if (type1==1) {
              Vector list1 = new Vector();
              String s = (String)jList1.getSelectedValue();
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(select1)) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list1.addElement(inf.getNameInt());
                          }
                        }
                        else list1.addElement(inf.getNameInt());
                      }
                      else if ((sw1.getModel()==3) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list1.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList1.setListData(list1);
              try {
                jList1.setSelectedValue(s, true);
              }
              catch(Exception exp) {
                jList1.setSelectedIndex(0);
              }
            }

          }
          // is COAX
          else {
            System.out.println("COAX");
            // update jComboBox1
            jComboBox1.removeAllItems();
            for (int j=0; j<Frame1.vSwitch.size(); j++) {
              Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
              if ((!sw1.getName().equals(select2)) && (canConnect(select2,sw1.getName()))) {
                if (tmp.substring(0,2).equals("Fa")) {
                  jComboBox1.addItem(sw1.getName());
                  type1 = 1;
                }
                else if (sw1.getModel()==5) {
                  jComboBox1.addItem(sw1.getName());
                  type1 = 1;
                }
              }
            }
            if (tmp.substring(0,2).equals("Fa")) {
              boolean have = false;
              for (int j=0; j<Frame1.vWorkstation.size(); j++) {
                Workstation com = (Workstation)Frame1.vWorkstation.elementAt(j);
                if ((!com.getConnection()) && (!com.getName().equals(select2))) {
                  jComboBox1.addItem(com.getName());
                  have = true;
                }
              }
              if ((type1!=1) && (have)) {
                type1 = 2;
              }
              try {
                jComboBox1.setSelectedItem(select1);
              }
              catch(Exception exp) {
                jComboBox1.setSelectedIndex(0);
                select1 = (String)jComboBox1.getSelectedItem();
              }
            }
            // update jList2
            if (type1==1) {
              Vector list1 = new Vector();
              String s = (String)jList1.getSelectedValue();
              for (int j=0; j<Frame1.vSwitch.size(); j++) {
                Switch sw1 = (Switch)Frame1.vSwitch.elementAt(j);
                if (sw1.getName().equals(select1)) {
                  for (int k=0; k<sw1.getVIntSort().size(); k++) {
                    Interface inf = (Interface)sw1.getVIntSort().elementAt(k);
                    if ((inf.getCom()==null) && (inf.getSwitch()==null)) {
                      if (tmp.substring(0,2).equals("Fa")) {
                        if ((sw1.getModel()==3) || (sw1.getModel()==5)) {
                          if (inf.getType().equalsIgnoreCase("Fast Ethernet")) {
                            list1.addElement(inf.getNameInt());
                          }
                        }
                        else list1.addElement(inf.getNameInt());
                      }
                      else if ((sw1.getModel()==5) && (inf.getType().equalsIgnoreCase("Gigabit Ethernet"))) {
                        list1.addElement(inf.getNameInt());
                      }
                    }
                  }
                }
              }
              jList1.setListData(list1);
              try {
                jList1.setSelectedValue(s, true);
              }
              catch(Exception exp) {
                jList1.setSelectedIndex(0);
              }
            }
          }
          i=Frame1.vSwitch.size();
        }
      }
    }
    cbListen1 = true;
    lListen1 = true;
  }*/
}