package Spider2;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.borland.jbcl.layout.*;
import javax.swing.border.*;
import javax.swing.text.html.*;
import java.util.*;
import org.jdom.*;
import org.jdom.output.XMLOutputter;
import org.jdom.Element;
import org.jdom.Document;
import org.jdom.input.DOMBuilder;
import java.io.*;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import java.net.URL;
import java.util.*;
public class RulesEditorFrame extends JFrame implements MouseListener,ActionListener,ChangeListener,ItemListener{
  int CurrentResource,CurrentAttribute;
  HTML.Tag[] htmlTag;
  RulesEditor control;
  JList resource_list;
  JPanel jPanel1 = new JPanel();
  JPanel jPanel2 = new JPanel();
  DefaultListModel resource_list_model = new DefaultListModel();
  JTextField url = new JTextField();
  JLabel jLabel3 = new JLabel();
  JLabel jLabel4 = new JLabel();
  JTextField name = new JTextField();
  TitledBorder titledBorder1;
  JLabel jLabel1 = new JLabel();
  JTextField end_property = new JTextField();
  JLabel jLabel2 = new JLabel();
  JTextField skip_head = new JTextField();
  JList order_list;
  DefaultListModel order_list_model = new DefaultListModel();
  JButton order_up = new JButton();
  JButton order_down = new JButton();
  JLabel jLabel5 = new JLabel();
  JTextField local_site = new JTextField();
  DefaultListModel attribute_list_model = new DefaultListModel();
  JList attribute_list = new JList(attribute_list_model);
  JCheckBox available = new JCheckBox();
  JLabel jLabel6 = new JLabel();
  JComboBox place = new JComboBox();
  JLabel jLabel7 = new JLabel();
  JTextField skip = new JTextField();
  JLabel jLabel8 = new JLabel();
  JTextField value = new JTextField();
  JLabel jLabel9 = new JLabel();
  JLabel jLabel10 = new JLabel();
  JLabel jLabel11 = new JLabel();
  JLabel jLabel12 = new JLabel();
  JLabel jLabel13 = new JLabel();
  JTextField pre_idx = new JTextField();
  JTextField end_char = new JTextField();
  JTextField suf_idx = new JTextField();
  JTextField accept_char = new JTextField();
  JTextField cut_off_char = new JTextField();
  DefaultListModel before_list_model = new DefaultListModel();
  DefaultListModel after_list_model = new DefaultListModel();
  JList before_list = new JList(before_list_model);
  JLabel jLabel14 = new JLabel();
  JList after_list = new JList(after_list_model);
  JComboBox html_tag2 = new JComboBox();
  JComboBox html_tag1 = new JComboBox();
  JButton add_after = new JButton();
  JButton add_before = new JButton();
  JButton remove_after = new JButton();
  JButton remove_before = new JButton();
  JLabel jLabel15 = new JLabel();
  JScrollPane jScrollPane1 = new JScrollPane();
  JScrollPane jScrollPane2 = new JScrollPane();
  JScrollPane jScrollPane3 = new JScrollPane();
  JScrollPane jScrollPane4 = new JScrollPane();
  JScrollPane jScrollPane5 = new JScrollPane();
  JComboBox tag_type2 = new JComboBox();
  JComboBox tag_type1 = new JComboBox();
  JButton remove_resource = new JButton();
  JButton add_resource = new JButton();
  JButton copy_resource = new JButton();
  JButton save = new JButton();
  JButton test = new JButton();
  TextArea testResult = new TextArea();

  //Construct the frame
  public RulesEditorFrame(RulesEditor control) {
    this.control = control;
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //Component initialization
  private void jbInit() throws Exception  {
    CurrentAttribute = 0;
    CurrentResource = 0;
    titledBorder1 = new TitledBorder("");
    this.getContentPane().setLayout(null);
    this.setResizable(false);
    this.setSize(new Dimension(612, 523));
    this.setTitle("Rules Editor");
    jPanel1.setBorder(BorderFactory.createLineBorder(Color.black));
    jPanel1.setBounds(new Rectangle(241, 0, 360, 496));
    jPanel1.setLayout(null);
    jPanel2.setBorder(BorderFactory.createLineBorder(Color.black));
    jPanel2.setBounds(new Rectangle(0, 0, 241, 496));
    jPanel2.setLayout(null);
    resource_list = new JList(resource_list_model);
    resource_list.addMouseListener(this);
    resource_list.setBorder(BorderFactory.createLineBorder(Color.black));
    resource_list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    jLabel3.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel3.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel3.setText("Name");
    jLabel3.setBounds(new Rectangle(6, 6, 290, 17));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setText("URL");
    jLabel4.setBounds(new Rectangle(6, 54, 290, 17));
    jLabel4.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel4.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel4.setBounds(new Rectangle(99, 51, 40, 23));
    name.setBounds(new Rectangle(46, 9, 247, 22));
    jLabel1.setText("End Attribute");
    jLabel1.setBounds(new Rectangle(6, 192, 77, 17));
    jLabel2.setText("Skip Table \'s Head");
    jLabel2.setBounds(new Rectangle(6, 158, 112, 17));
    skip_head.setBorder(BorderFactory.createLineBorder(Color.black));
    skip_head.setBounds(new Rectangle(121, 157, 26, 21));
    end_property.setBorder(BorderFactory.createLineBorder(Color.black));
    end_property.setBounds(new Rectangle(80, 190, 26, 21));
    url.setBorder(BorderFactory.createLineBorder(Color.black));
    url.setBounds(new Rectangle(6, 76, 220, 21));
    name.setBorder(BorderFactory.createLineBorder(Color.black));
    name.setBounds(new Rectangle(6, 28, 219, 21));
    order_list = new JList(order_list_model);
    order_list.setBorder(BorderFactory.createLineBorder(Color.black));
    order_list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    order_list.setVisibleRowCount(10);
    order_up.setText("Up");
    order_up.setBounds(new Rectangle(177, 159, 50, 27));
    order_down.setBounds(new Rectangle(137, 112, 28, 27));
    order_down.setBounds(new Rectangle(95, 235, 74, 27));
    order_down.setMargin(new Insets(2, 0, 2, 0));
    order_down.setText("Down");
    jLabel5.setBounds(new Rectangle(7, 51, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(6, 54, 290, 17));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(7, 51, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(6, 54, 290, 17));
    jLabel5.setText("Local Site");
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(7, 51, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(6, 54, 290, 17));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(7, 51, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(6, 54, 290, 17));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(0, 0, 40, 23));
    jLabel5.setBounds(new Rectangle(8, 8, 40, 23));
    jLabel5.setBounds(new Rectangle(87, 106, 57, 23));
    local_site.setBorder(BorderFactory.createLineBorder(Color.black));
    local_site.setBounds(new Rectangle(6, 130, 221, 21));
    attribute_list.setBorder(BorderFactory.createLineBorder(Color.black));
    attribute_list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    attribute_list.addMouseListener(this);
    available.setBorder(BorderFactory.createLineBorder(Color.black));
    available.setText("Available");
    available.setBounds(new Rectangle(136, 270, 71, 26));
    jLabel6.setText("Place");
    jLabel6.setBounds(new Rectangle(136, 299, 41, 17));
    place.setBorder(BorderFactory.createLineBorder(Color.black));
    place.setBounds(new Rectangle(173, 296, 69, 24));
    place.addItem("result");
    place.addItem("extend");
    jLabel7.setText("Skip");
    jLabel7.setBounds(new Rectangle(137, 334, 29, 17));
    skip.setBorder(BorderFactory.createLineBorder(Color.black));
    skip.setBounds(new Rectangle(173, 333, 30, 20));
    jLabel8.setText("Value");
    jLabel8.setBounds(new Rectangle(253, 298, 38, 17));
    value.setBorder(BorderFactory.createLineBorder(Color.black));
    value.setBounds(new Rectangle(289, 296, 58, 21));
    jLabel9.setText("Prefix index");
    jLabel9.setBounds(new Rectangle(6, 392, 62, 17));
    jLabel10.setText("Suffix Index");
    jLabel10.setBounds(new Rectangle(6, 408, 66, 17));
    jLabel11.setText("Accept Char");
    jLabel11.setBounds(new Rectangle(7, 423, 70, 17));
    jLabel12.setText("End Char");
    jLabel12.setBounds(new Rectangle(7, 472, 57, 17));
    jLabel13.setText("Cut off char");
    jLabel13.setBounds(new Rectangle(6, 455, 69, 17));
    pre_idx.setBounds(new Rectangle(72, 395, 58, 15));
    end_char.setBounds(new Rectangle(71, 394, 58, 15));
    end_char.setBounds(new Rectangle(71, 410, 58, 15));
    suf_idx.setBounds(new Rectangle(71, 394, 58, 15));
    suf_idx.setBounds(new Rectangle(69, 457, 61, 15));
    accept_char.setBounds(new Rectangle(71, 394, 58, 15));
    accept_char.setBounds(new Rectangle(7, 439, 123, 15));
    cut_off_char.setBounds(new Rectangle(71, 394, 58, 15));
    cut_off_char.setBounds(new Rectangle(62, 474, 68, 15));
    before_list.setBorder(BorderFactory.createLineBorder(Color.black));
    before_list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    jLabel14.setText("Before");
    jLabel14.setBounds(new Rectangle(140, 355, 48, 17));
    after_list.setBorder(BorderFactory.createLineBorder(Color.black));
    after_list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    html_tag2.setBounds(new Rectangle(307, 440, 48, 22));
    html_tag2.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        html_tag2_actionPerformed(e);
      }
    });
    html_tag1.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        html_tag1_actionPerformed(e);
      }
    });
    html_tag1.setBounds(new Rectangle(197, 373, 48, 22));
    html_tag1.setBounds(new Rectangle(309, 373, 48, 22));
    html_tag1.setBounds(new Rectangle(197, 373, 48, 22));
    html_tag1.setBounds(new Rectangle(195, 440, 50, 22));
    add_after.setMargin(new Insets(2, 2, 2, 2));
    add_after.setText("ADD");
    add_after.setBounds(new Rectangle(309, 468, 48, 25));
    add_before.setBounds(new Rectangle(197, 397, 48, 96));
    add_before.setBounds(new Rectangle(309, 397, 48, 96));
    add_before.setText("ADD");
    add_before.setMargin(new Insets(2, 2, 2, 2));
    remove_after.setMargin(new Insets(2, 0, 2, 0));
    remove_after.setText("Remove");
    remove_after.setBounds(new Rectangle(247, 467, 60, 26));
    remove_before.setBounds(new Rectangle(135, 435, 58, 58));
    remove_before.setBounds(new Rectangle(247, 435, 60, 58));
    remove_before.setText("Remove");
    remove_before.setMargin(new Insets(2, 0, 2, 0));
    jLabel15.setText("After");
    jLabel15.setBounds(new Rectangle(256, 353, 43, 16));
    jScrollPane1.setBounds(new Rectangle(4, 251, 233, 243));
    jScrollPane2.setBounds(new Rectangle(233, 3, 122, 245));
    jScrollPane3.setBounds(new Rectangle(2, 252, 131, 136));
    jScrollPane4.setBounds(new Rectangle(251, 370, 103, 63));
    jScrollPane5.setBounds(new Rectangle(134, 370, 107, 63));
    tag_type2.setBounds(new Rectangle(255, 441, 49, 22));
    tag_type1.setBounds(new Rectangle(198, 404, 45, 22));
    tag_type1.setBounds(new Rectangle(311, 405, 45, 22));
    tag_type1.setBounds(new Rectangle(198, 404, 45, 22));
    tag_type1.setBounds(new Rectangle(140, 440, 49, 22));
    remove_resource.setMargin(new Insets(2, 0, 2, 0));
    remove_resource.setText("Remove");
    remove_resource.setBounds(new Rectangle(164, 217, 64, 26));
    add_resource.setBounds(new Rectangle(172, 217, 64, 26));
    add_resource.setBounds(new Rectangle(103, 217, 64, 26));
    add_resource.setMargin(new Insets(2, 0, 2, 0));
    add_resource.setText("Add");
    copy_resource.setMargin(new Insets(2, 0, 2, 0));
    copy_resource.setText("Copy");
    copy_resource.setBounds(new Rectangle(89, 216, 60, 26));
    save.setMargin(new Insets(2, 0, 2, 0));
    save.setText("Save");
    save.setBounds(new Rectangle(164, 176, 64, 31));
    test.setText("Test");
    test.setBounds(new Rectangle(89, 177, 61, 30));
    testResult.setBounds(new Rectangle(5, 8, 229, 157));
    this.getContentPane().add(jPanel2, null);
    jPanel2.add(jScrollPane1, null);
    jPanel2.add(add_resource, null);
    jPanel2.add(remove_resource, null);
    jPanel2.add(copy_resource, null);
    jPanel2.add(save, null);
    jPanel2.add(test, null);
    jPanel2.add(testResult, null);
    jScrollPane1.getViewport().add(resource_list, null);
    this.getContentPane().add(jPanel1, null);
    jPanel1.add(name, null);
    jPanel1.add(url, null);
    jPanel1.add(local_site, null);
    jPanel1.add(available, null);
    jPanel1.add(jLabel6, null);
    jPanel1.add(place, null);
    jPanel1.add(jLabel7, null);
    jPanel1.add(skip, null);
    jPanel1.add(jLabel8, null);
    jPanel1.add(value, null);
    jPanel1.add(jLabel9, null);
    jPanel1.add(jLabel10, null);
    jPanel1.add(jLabel11, null);
    jPanel1.add(jLabel13, null);
    jPanel1.add(jLabel12, null);
    jPanel1.add(jLabel14, null);
    jPanel1.add(add_before, null);
    jPanel1.add(remove_before, null);
    jPanel1.add(pre_idx, null);
    jPanel1.add(suf_idx, null);
    jPanel1.add(end_char, null);
    jPanel1.add(cut_off_char, null);
    jPanel1.add(accept_char, null);
    jPanel1.add(remove_after, null);
    jPanel1.add(add_after, null);
    jPanel1.add(jLabel15, null);
    jPanel1.add(jLabel4, null);
    jPanel1.add(jLabel5, null);
    jPanel1.add(jLabel3, null);
    jPanel1.add(jScrollPane2, null);
    jPanel1.add(jScrollPane4, null);
    jPanel1.add(jScrollPane5, null);
    jPanel1.add(jScrollPane3, null);
    jPanel1.add(tag_type1, null);
    jPanel1.add(html_tag1, null);
    jPanel1.add(tag_type2, null);
    jPanel1.add(html_tag2, null);
    jPanel1.add(order_up, null);
    jPanel1.add(order_down, null);
    jPanel1.add(jLabel2, null);
    jPanel1.add(skip_head, null);
    jPanel1.add(jLabel1, null);
    jPanel1.add(end_property, null);
    jScrollPane3.getViewport().add(attribute_list, null);
    jScrollPane5.getViewport().add(before_list, null);
    jScrollPane4.getViewport().add(after_list, null);
    jScrollPane2.getViewport().add(order_list, null);
    jLabel3.setBounds(new Rectangle(94, 2, 40, 23));
    order_down.setBounds(new Rectangle(137, 112, 28, 27));
    order_down.setBounds(new Rectangle(177, 194, 50, 27));
    end_char.setBounds(new Rectangle(71, 394, 58, 15));
    end_char.setBounds(new Rectangle(61, 475, 69, 15));
    suf_idx.setBounds(new Rectangle(71, 394, 58, 15));
    suf_idx.setBounds(new Rectangle(72, 410, 58, 15));
    accept_char.setBounds(new Rectangle(71, 394, 58, 15));
    accept_char.setBounds(new Rectangle(6, 439, 123, 15));
    cut_off_char.setBounds(new Rectangle(71, 394, 58, 15));
    cut_off_char.setBounds(new Rectangle(72, 456, 58, 15));
    add_before.setBounds(new Rectangle(197, 397, 48, 96));
    add_before.setBounds(new Rectangle(197, 466, 48, 27));
    remove_before.setBounds(new Rectangle(135, 435, 58, 58));
    remove_before.setBounds(new Rectangle(135, 466, 58, 27));

    order_down.addActionListener(this);
    order_up.addActionListener(this);
    name.addActionListener(this);
    url.addActionListener(this);
    local_site.addActionListener(this);
    skip_head.addActionListener(this);
    end_property.addActionListener(this);
    value.addActionListener(this);
    skip.addActionListener(this);
    accept_char.addActionListener(this);
    pre_idx.addActionListener(this);
    suf_idx.addActionListener(this);
    end_char.addActionListener(this);
    cut_off_char.addActionListener(this);
    remove_before.addActionListener(this);
    remove_after.addActionListener(this);
    add_before.addActionListener(this);
    add_after.addActionListener(this);
    add_resource.addActionListener(this);
    remove_resource.addActionListener(this);
    copy_resource.addActionListener(this);
    save.addActionListener(this);
    test.addActionListener(this);
    available.addChangeListener(this);
    place.addItemListener(this);

    tag_type1.addItem("open");
    tag_type1.addItem("close");
    tag_type1.addItem("simple");
    tag_type2.addItem("open");
    tag_type2.addItem("close");
    tag_type2.addItem("simple");
    htmlTag = HTML.getAllTags();
    int i = 0;
    try{
      while(true)
      {
        html_tag1.addItem(htmlTag[i].toString());
        html_tag2.addItem(htmlTag[i].toString());
        i++;
      }
    }catch(Exception e){
    }
    add_resource.setBounds(new Rectangle(172, 217, 64, 26));
    add_resource.setBounds(new Rectangle(11, 216, 64, 26));
  }

  public void actionPerformed(ActionEvent ae)
  {
    if(ae.getSource()==order_up){
      if(order_list.getSelectedIndex()!=0)
      {
        int tmp,tmp2;
        tmp2 = order_list.getSelectedIndex();
        tmp = control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()];
        control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()] = control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()-1];
        control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()-1] = tmp;
        order_list_model.removeAllElements();
        for(int i=0;i<11;i++)
        {
          order_list_model.addElement(control.ResourcePT[CurrentResource].order[i]+"--->"+control.tagString[control.ResourcePT[CurrentResource].order[i]]);
        }
        order_list.setSelectedIndex(tmp2-1);
      }
    }else
    if(ae.getSource()==order_down)
    {
      if(order_list.getSelectedIndex()!=order_list_model.getSize()-1)
      {
        int tmp,tmp2;
        tmp2 = order_list.getSelectedIndex();
        tmp = control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()];
        control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()] = control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()+1];
        control.ResourcePT[CurrentResource].order[order_list.getSelectedIndex()+1] = tmp;
        order_list_model.removeAllElements();
        for(int i=0;i<11;i++)
        {
          order_list_model.addElement(control.ResourcePT[CurrentResource].order[i]+"--->"+control.tagString[control.ResourcePT[CurrentResource].order[i]]);
        }
        order_list.setSelectedIndex(tmp2+1);
      }
    }else
    if(ae.getSource()==name)
    {
      control.ResourcePT[CurrentResource].name = name.getText();
      resource_list_model.setElementAt(control.ResourcePT[CurrentResource].name,resource_list.getSelectedIndex());
    }else
    if(ae.getSource()==url)
    {
      control.ResourcePT[CurrentResource].url = url.getText();
    }else
    if(ae.getSource()==local_site)
    {
      control.ResourcePT[CurrentResource].local_site = local_site.getText();
    }else
    if(ae.getSource()==skip_head)
    {
      control.ResourcePT[CurrentResource].skip_table_head = Integer.parseInt(skip_head.getText());
    }else
    if(ae.getSource()==end_property)
    {
      control.ResourcePT[CurrentResource].end_property = Integer.parseInt(end_property.getText());
    }else
    if(ae.getSource()==skip)
    {
      control.ResourcePT[CurrentResource].skip[CurrentAttribute] = Integer.parseInt(skip.getText());
    }else
    if(ae.getSource()==value)
    {
      control.ResourcePT[CurrentResource].value[CurrentAttribute] = value.getText();
    }else
    if(ae.getSource()==pre_idx)
    {
      control.ResourcePT[CurrentResource].prefix[CurrentAttribute] = Integer.parseInt(pre_idx.getText());
    }else
    if(ae.getSource()==suf_idx)
    {
      control.ResourcePT[CurrentResource].suffix[CurrentAttribute] = Integer.parseInt(suf_idx.getText());
    }else
    if(ae.getSource()==accept_char)
    {
      control.ResourcePT[CurrentResource].accept_charactor[CurrentAttribute] = accept_char.getText();
    }else
    if(ae.getSource()==cut_off_char)
    {
      control.ResourcePT[CurrentResource].cut_off_charactor[CurrentAttribute] = cut_off_char.getText();
    }else
    if(ae.getSource()==end_char)
    {
      control.ResourcePT[CurrentResource].end_charactor[CurrentAttribute] = end_char.getText();
    }else
    if(ae.getSource()==remove_before)
    {
      if((!before_list_model.isEmpty())&&(!before_list.isSelectionEmpty()))
      {
        int temp = before_list.getSelectedIndex();
        control.ResourcePT[CurrentResource].before[CurrentAttribute].removeElementAt(temp);
        before_list_model.removeElementAt(temp);
      }
    }else
    if(ae.getSource()==remove_after)
    {
      if((!after_list_model.isEmpty())&&(!after_list.isSelectionEmpty()))
      {
        int temp = after_list.getSelectedIndex();
        control.ResourcePT[CurrentResource].after[CurrentAttribute].removeElementAt(temp);
        after_list_model.removeElementAt(temp);
      }
    }else
    if(ae.getSource()==add_before)
    {
      Tag temp = new Tag();
      temp.type = (String)tag_type1.getSelectedItem();
      temp.name = (String)html_tag1.getSelectedItem();
      control.ResourcePT[CurrentResource].before[CurrentAttribute].addElement(temp);
      before_list_model.addElement(temp.type+"_"+temp.name);
      before_list.setSelectedIndex(0);
    }else
    if(ae.getSource()==add_after)
    {
      Tag temp = new Tag();
      temp.type = (String)tag_type2.getSelectedItem();
      temp.name = (String)html_tag2.getSelectedItem();
      control.ResourcePT[CurrentResource].after[CurrentAttribute].addElement(temp);
      after_list_model.addElement(temp.type+"_"+temp.name);
      after_list.setSelectedIndex(0);
    }else
    if(ae.getSource()==remove_resource)
    {
      if(!resource_list_model.isEmpty())
      {
        int seld = resource_list.getSelectedIndex();
        control.ResourceCount--;
        for(int i=seld;i<control.ResourceCount;i++)
        {
          control.ResourcePT[i] = control.ResourcePT[i+1];
        }
        resource_list_model.removeElementAt(seld);
        if(!resource_list_model.isEmpty())
        {
          resource_list.setSelectedIndex(0);
          displayResource();
        }
        else
        {
          accept_char.setText("");
          cut_off_char.setText("");
          end_char.setText("");
          pre_idx.setText("");
          suf_idx.setText("");
          value.setText("");
          name.setText("");
          url.setText("");
          local_site.setText("");
          skip_head.setText("");
          end_property.setText("");
          order_list_model.removeAllElements();
          attribute_list_model.removeAllElements();
          place.setSelectedIndex(0);
          value.setText("");
          available.setSelected(false);
          skip.setText("");
          before_list_model.removeAllElements();
          after_list_model.removeAllElements();
        }
      }
    }else
    if(ae.getSource()==add_resource)
    {
      /*Resource newResource = new Resource(control.tagCount);
      newResource.name = "No name";
      newResource.url = "None";
      newResource.end_property = 0;
      newResource.skip_table_head = 0;
      newResource.local_site = "None";
      Tag tmpTag;
      for(int i=0;i<control.tagCount;i++)
      {
        newResource.prefix[i] = 0;
        newResource.suffix[i] = 0;
        newResource.order[i] = i;
        newResource.available[i] = "No";
        newResource.place[i] = "result";
        newResource.value[i] = "";
        newResource.skip[i] = 0;
        tmpTag = new Tag();
        tmpTag.name = "body";
        tmpTag.type = "open";
        newResource.before[i] = new Vector();
        newResource.before[i].addElement(tmpTag);
        tmpTag = new Tag();
        tmpTag.name = "body";
        tmpTag.type = "close";
         newResource.after[i] = new Vector();
        newResource.after[i].addElement(tmpTag);
      }         */
        Resource newResource;
        newResource = new Resource(control.tagCount);

        newResource.name = "Name";
        newResource.url = "URL";
        newResource.local_site = "Local Site";
        newResource.end_property = 0;
        newResource.skip_table_head = 0;
        Enumeration ea;
        Tag tmpTag;
        for(int i=0;i<control.tagCount;i++)
        {
          newResource.skip[i] = 0;
          newResource.place[i] = "result";
          newResource.value[i] = "";
          newResource.available[i] = "No";
          newResource.before[i] = new Vector();
          newResource.after[i] = new Vector();
          newResource.order[i] = i;
          tmpTag = new Tag();
          tmpTag.name = "body";
          tmpTag.type = "open";
          newResource.before[i].addElement(tmpTag);
          tmpTag = new Tag();
          tmpTag.name = "body";
          tmpTag.type = "close";
          newResource.after[i].addElement(tmpTag);
          newResource.accept_charactor[i] = "";
          newResource.cut_off_charactor[i] = "";
          newResource.end_charactor[i] = "";
          newResource.prefix[i] = 0;
          newResource.suffix[i] = 0;
        }
      Resource[] tmpResource = new Resource[control.ResourceCount+1];
      for(int i=0;i<control.ResourceCount;i++)
      {
        tmpResource[i] = control.ResourcePT[i];
      }
      tmpResource[control.ResourceCount] = newResource;
      control.ResourceCount++;
      control.ResourcePT = new Resource[control.ResourceCount];
      control.ResourcePT = tmpResource;
      resource_list_model.addElement(newResource.name);
      resource_list.setSelectedIndex(0);
      displayResource();
    }else
    if(ae.getSource()==copy_resource)
    {
      if(!resource_list.isSelectionEmpty())
      {
        Resource newResource;
        newResource = new Resource(control.tagCount);
        int sel = resource_list.getSelectedIndex();

        newResource.name = control.ResourcePT[sel].name;
        newResource.url = control.ResourcePT[sel].url;
        newResource.local_site = control.ResourcePT[sel].local_site;
        newResource.end_property = control.ResourcePT[sel].end_property;
        newResource.skip_table_head = control.ResourcePT[sel].skip_table_head;
        Enumeration ea;
        for(int i=0;i<control.tagCount;i++)
        {
          newResource.skip[i] = control.ResourcePT[sel].skip[i];
          newResource.place[i] = control.ResourcePT[sel].place[i];
          newResource.value[i] = control.ResourcePT[sel].value[i];
          newResource.available[i] = control.ResourcePT[sel].available[i];
          newResource.before[i] = new Vector();
          newResource.after[i] = new Vector();
          newResource.order[i] = control.ResourcePT[sel].order[i];
          ea = control.ResourcePT[sel].before[i].elements();
          while(ea.hasMoreElements())
          {
            newResource.before[i].addElement((Tag)ea.nextElement());
          }
          ea = control.ResourcePT[sel].after[i].elements();
          while(ea.hasMoreElements())
          {
            newResource.after[i].addElement((Tag)ea.nextElement());
          }
          newResource.accept_charactor[i] = control.ResourcePT[sel].accept_charactor[i];
          newResource.cut_off_charactor[i] = control.ResourcePT[sel].cut_off_charactor[i];
          newResource.end_charactor[i] = control.ResourcePT[sel].end_charactor[i];
          newResource.prefix[i] = control.ResourcePT[sel].prefix[i];
          newResource.suffix[i] = control.ResourcePT[sel].suffix[i];
        }

        Resource[] tmpResource = new Resource[control.ResourceCount+1];
        for(int i=0;i<control.ResourceCount;i++)
        {
          tmpResource[i] = control.ResourcePT[i];
        }
        tmpResource[control.ResourceCount] = newResource;
        control.ResourceCount++;
        control.ResourcePT = new Resource[control.ResourceCount];
        control.ResourcePT = tmpResource;
        resource_list_model.addElement(newResource.name);
        resource_list.setSelectedIndex(0);
        displayResource();
      }
    }else
    if(ae.getSource()==save)
    {
      Element root = new Element("resource_pointer");
      Element resourceTag;
      Element EleTemp,EleTemp2;
      Integer IntTemp;
      Enumeration en;
      Tag TagTemp;
      String StrTemp = "";
      for(int i=0;i<control.ResourceCount;i++)
      {
        resourceTag = new Element("resource");
        EleTemp = new Element("name");
        EleTemp.setText(control.ResourcePT[i].name);
        resourceTag.addChild(EleTemp);
        EleTemp = new Element("url");
        EleTemp.setText(control.ResourcePT[i].url);
        resourceTag.addChild(EleTemp);
        EleTemp = new Element("local_site");
        EleTemp.setText(control.ResourcePT[i].local_site);
        resourceTag.addChild(EleTemp);
        StrTemp = "";
        for(int h=0;h<control.tagCount;h++)
        {
          IntTemp = new Integer(control.ResourcePT[i].order[h]);
          StrTemp = StrTemp + IntTemp.toString();
          if(h!=control.tagCount-1) StrTemp = StrTemp + " ";
        }
        EleTemp = new Element("order");
        EleTemp.setText(StrTemp);
        resourceTag.addChild(EleTemp);
        IntTemp = new Integer(control.ResourcePT[i].end_property);
        EleTemp = new Element("end_property");
        EleTemp.setText(IntTemp.toString());
        resourceTag.addChild(EleTemp);
        IntTemp = new Integer(control.ResourcePT[i].skip_table_head);
        EleTemp = new Element("skip_table_head");
        EleTemp.setText(IntTemp.toString());
        resourceTag.addChild(EleTemp);
        for(int j=0;j<control.tagCount;j++)
        {
          EleTemp = new Element(control.tagString[j]);
          EleTemp.addAttribute("available",control.ResourcePT[i].available[j]);
          EleTemp.addAttribute("place",control.ResourcePT[i].place[j]);
          IntTemp = new Integer(control.ResourcePT[i].skip[j]);
          EleTemp.addAttribute("skip",IntTemp.toString());
          EleTemp.addAttribute("value",control.ResourcePT[i].value[j]);
          StrTemp = "";
          en = control.ResourcePT[i].before[j].elements();
          while(en.hasMoreElements())
          {
            TagTemp = (Tag)en.nextElement();
            if(TagTemp.type.compareTo("open")==0) StrTemp = StrTemp + "open_"+TagTemp.name;else
            if(TagTemp.type.compareTo("close")==0) StrTemp = StrTemp + "close_"+TagTemp.name;else
            if(TagTemp.type.compareTo("simple")==0) StrTemp = StrTemp + "simple_"+TagTemp.name;
            StrTemp = StrTemp + "^^";
          }
          StrTemp = StrTemp.substring(0,StrTemp.length()-2);
          EleTemp2 = new Element("before");
          EleTemp2.setText(StrTemp);
          EleTemp.addChild(EleTemp2);
          StrTemp = "";
          en = control.ResourcePT[i].after[j].elements();
          while(en.hasMoreElements())
          {
            TagTemp = (Tag)en.nextElement();
            if(TagTemp.type.compareTo("open")==0) StrTemp = StrTemp + "open_"+TagTemp.name;else
            if(TagTemp.type.compareTo("close")==0) StrTemp = StrTemp + "close_"+TagTemp.name;else
            if(TagTemp.type.compareTo("simple")==0) StrTemp = StrTemp + "simple_"+TagTemp.name;
            StrTemp = StrTemp + "^^";
          }
          StrTemp = StrTemp.substring(0,StrTemp.length()-2);
          EleTemp2 = new Element("after");
          EleTemp2.setText(StrTemp);
          EleTemp.addChild(EleTemp2);
          if(j!=0)
          {
            EleTemp2 = new Element("data_format");
            IntTemp = new Integer(control.ResourcePT[i].prefix[j]);
            EleTemp2.addAttribute("prefix_idx",IntTemp.toString());
            IntTemp = new Integer(control.ResourcePT[i].suffix[j]);
            EleTemp2.addAttribute("suffix_idx",IntTemp.toString());
            EleTemp2.addAttribute("accept_charactor",control.ResourcePT[i].accept_charactor[j]);
            EleTemp2.addAttribute("cut_off_charactor",control.ResourcePT[i].cut_off_charactor[j]);
            EleTemp2.addAttribute("end_charactor",control.ResourcePT[i].end_charactor[j]);
            EleTemp.addChild(EleTemp2);
          }

          resourceTag.addChild(EleTemp);
        }
        root.addChild(resourceTag);
      }
      Document doc = new Document(root);
		  try {
  		  FileOutputStream out = new FileOutputStream("c:\\tomcat\\webapps\\ROOT\\url_list.xml");
	  	  XMLOutputter serializer = new XMLOutputter("      ",true);
		    serializer.output(doc, out);
		    out.flush();
  		  out.close();
		  }
  		catch (IOException e) {
	  	  System.err.println(e);
		  }
    }else
    if(ae.getSource()==test)
    {
      if(!resource_list.isSelectionEmpty())
      {
        int sel = resource_list.getSelectedIndex();
        Tester tester = new Tester(control,control.ResourcePT[sel]);
        tester.start();
      }
    }
  }

  public void stateChanged(ChangeEvent ce)
  {
    if(ce.getSource()==available)
    {
      if(available.isSelected()) control.ResourcePT[CurrentResource].available[CurrentAttribute] = "Yes";else
      control.ResourcePT[CurrentResource].available[CurrentAttribute] = "No";
    }
  }
  public void itemStateChanged(ItemEvent ie)
  {
    if(ie.getSource()==place)
    {
      control.ResourcePT[CurrentResource].place[CurrentAttribute] = (String)place.getSelectedItem();
    }
  }
  //Overridden so we can exit on System Close
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if(e.getID() == WindowEvent.WINDOW_CLOSING) {
      System.exit(0);
    }
  }

  void html_tag2_actionPerformed(ActionEvent e) {

  }

  void html_tag1_actionPerformed(ActionEvent e) {

  }
  public void mouseExited(MouseEvent me){
  }
  public void mouseEntered(MouseEvent me){
  }
  public void mouseReleased(MouseEvent me){
  }
  public void mousePressed(MouseEvent me){
    if(me.getSource()==resource_list)
    {
      CurrentResource = resource_list.getSelectedIndex();
      displayResource();
    }else
    if(me.getSource()==attribute_list)
    {
      CurrentAttribute = attribute_list.getSelectedIndex();
      displayAttribute();
    }
  }
  public void mouseClicked(MouseEvent me){
  }
  public void displayAttribute(){
      Integer temp;
      if(control.ResourcePT[CurrentResource].place[CurrentAttribute].compareTo("result")==0)
      {
        place.setSelectedIndex(0);
      }else place.setSelectedIndex(1);
      if(control.ResourcePT[CurrentResource].available[CurrentAttribute].compareTo("Yes")==0)
      {
        available.setSelected(true);
      }else available.setSelected(false);
      temp = new Integer(control.ResourcePT[CurrentResource].skip[CurrentAttribute]);
      skip.setText(temp.toString());
      Enumeration e = control.ResourcePT[CurrentResource].before[CurrentAttribute].elements();
      before_list_model.removeAllElements();
      Tag tempTag;
      while(e.hasMoreElements())
      {
        tempTag = (Tag)e.nextElement();
        before_list_model.addElement(tempTag.type+"_"+tempTag.name);
      }
      before_list.setSelectedIndex(0);
      e = control.ResourcePT[CurrentResource].after[CurrentAttribute].elements();
      after_list_model.removeAllElements();
      while(e.hasMoreElements())
      {
        tempTag = (Tag)e.nextElement();
        after_list_model.addElement(tempTag.type+"_"+tempTag.name);
      }
      after_list.setSelectedIndex(0);
      if(CurrentAttribute!=0)
      {
        accept_char.setText(control.ResourcePT[CurrentResource].accept_charactor[CurrentAttribute]);
        cut_off_char.setText(control.ResourcePT[CurrentResource].cut_off_charactor[CurrentAttribute]);
        end_char.setText(control.ResourcePT[CurrentResource].end_charactor[CurrentAttribute]);
        temp = new Integer(control.ResourcePT[CurrentResource].prefix[CurrentAttribute]);
        pre_idx.setText(temp.toString());
        temp = new Integer(control.ResourcePT[CurrentResource].suffix[CurrentAttribute]);
        suf_idx.setText(temp.toString());
        value.setText(control.ResourcePT[CurrentResource].value[CurrentAttribute]);
      }else
      {
        accept_char.setText("");
        cut_off_char.setText("");
        end_char.setText("");
        pre_idx.setText("");
        suf_idx.setText("");
        value.setText("");
      }
  }
  public void displayResource(){
      Integer temp;
      name.setText(control.ResourcePT[CurrentResource].name);
      url.setText(control.ResourcePT[CurrentResource].url);
      local_site.setText(control.ResourcePT[CurrentResource].local_site);
      temp = new Integer(control.ResourcePT[CurrentResource].end_property);
      end_property.setText(temp.toString());
      temp = new Integer(control.ResourcePT[CurrentResource].skip_table_head);
      skip_head.setText(temp.toString());
      order_list_model.removeAllElements();
      for(int i=0;i<11;i++)
      {
        order_list_model.addElement(control.ResourcePT[CurrentResource].order[i]+"--->"+control.tagString[control.ResourcePT[CurrentResource].order[i]]);
      }
      order_list.setSelectedIndex(0);
      if(control.ResourcePT[CurrentResource]!=null)
      {
        attribute_list_model.removeAllElements();
        for(int j=0;j<11;j++)
        {
          attribute_list_model.addElement(control.tagString[j]);
        }
        attribute_list.setSelectedIndex(0);
        if(control.ResourcePT[CurrentResource].place[0].compareTo("result")==0)
        {
          place.setSelectedIndex(0);
        }else place.setSelectedIndex(1);
        if(control.ResourcePT[CurrentResource].available[0].compareTo("Yes")==0)
        {
          available.setSelected(true);
        }else available.setSelected(false);
        temp = new Integer(control.ResourcePT[CurrentResource].skip[0]);
        skip.setText(temp.toString());
        Tag tempTag;
        Enumeration e = control.ResourcePT[CurrentResource].before[0].elements();
        before_list_model.removeAllElements();
        while(e.hasMoreElements())
        {
          tempTag = (Tag)e.nextElement();
          before_list_model.addElement(tempTag.type+"_"+tempTag.name);
        }
        if(!before_list_model.isEmpty())before_list.setSelectedIndex(0);
        e = control.ResourcePT[CurrentResource].after[0].elements();
        after_list_model.removeAllElements();
        while(e.hasMoreElements())
        {
          tempTag = (Tag)e.nextElement();
          after_list_model.addElement(tempTag.type+"_"+tempTag.name);
        }
        if(!after_list_model.isEmpty()) after_list.setSelectedIndex(0);
        accept_char.setText("");
        cut_off_char.setText("");
        end_char.setText("");
        pre_idx.setText("");
        suf_idx.setText("");
        value.setText("");
      }
  }
}
