package Spider2;
import java.awt.event.*;
import java.awt.*;
import java.io.*;
import java.net.*;
import java.util.*;
import org.jdom.*;
import org.jdom.output.XMLOutputter;
import org.jdom.Element;
import org.jdom.Document;
import javax.swing.text.html.*;
import org.jdom.input.DOMBuilder;
import java.sql.*;
/*import org.w3c.dom.Node;
import org.w3c.dom.NodeList; */
//import org.apache.regexp.*;*/
public class Spider implements Runnable,WindowListener,ActionListener,MouseListener{
  ControlServer control;
  Resource ResourcePT[];
  java.util.List ResourceList[];
  int ProductID;
  int ResourceCount;
  int PropertyCount;
  int ProductCount;
  int CurrentResource;
  String tagString[];
  int order[];
  int tagCount;
  int CurrentJob;
  int CurrentProduct;
  int CrawlerCount;
  int FormattorCount;
  int attributeCount;
  InsertValue SQLservice;
  InsertValue SQLservice2;
  String spiderTable;
  String attributeName[];
  Vector CrawlerContainer;
  Vector ProductContainer;
  Vector FormatterContainer;
  Vector Table;
  Vector Keyword;
  Vector Value;
  Vector Province;

  ProductInterface productIn;
  Thread spiderT;
  SpiderInterface spiderWindow;
  ErrorInsertWindow InsertWind;
  Task task;
  public Spider(ControlServer control,int crawlerCount,int formatCount,Task task){
    this.control = control;
    this.task = task;
    SQLservice = new InsertValue(this);
    SQLservice2 = new InsertValue(this);
    /*rst = stmt.executeQuery("select  SPIDER_SPIDER from PROJECT");
      if(rst.next())
      {
        control.spiderTable = rst.getString(1);
      }
      stmt.executeQuery("delete from "+control.spiderTable);  */
    try{
      ResultSet rs;
      rs = SQLservice.query("select  SPIDER_SPIDER from PROJECT");
      if(rs.next())
      {
        spiderTable = rs.getString(1);
      }
      rs = SQLservice.query("delete from "+spiderTable);
    }catch(Exception ee){
      ee.printStackTrace(System.out);
    }
    tagCount = 11;
    this.CrawlerCount = crawlerCount;
    this.FormattorCount = formatCount;
    attributeCount = 11;
    spiderT = new Thread(this);
    attributeName = new String[attributeCount];
    tagString = new String[tagCount];
    order = new int[tagCount];
    tagString[0] = "start_property";
    tagString[1] = "property_size";
    tagString[2] = "property_price";
    tagString[3] = "property_province";
    tagString[4] = "property_area";
    tagString[5] = "more_info_url";
    tagString[6] = "property_address";
    tagString[7] = "property_type";
    tagString[8] = "property_name";
    tagString[9] = "property_bed";
    tagString[10] = "property_need";

    attributeName[0] = "None";
    attributeName[1] = "SIZE";
    attributeName[2] = "PRICE";
    attributeName[3] = "PROVINCE";
    attributeName[4] = "AREA";
    attributeName[5] = "MORE_URL";
    attributeName[6] = "ADDRESS";
    attributeName[7] = "TYPE";
    attributeName[8] = "NAME";
    attributeName[9] = "BED";
    attributeName[10] = "NEED";
    spiderWindow = new SpiderInterface();
    productIn = new ProductInterface();
    InsertWind = new ErrorInsertWindow();
    CrawlerContainer = new Vector();
    ProductContainer = new Vector();
    FormatterContainer = new Vector();
    Table = new Vector();
    Keyword = new Vector();
    Value = new Vector();
    Province = new Vector();
  }
  public void start(){
    CurrentResource = 0;
    spiderWindow.addWindowListener(this);
    spiderWindow.crawler_list.addMouseListener(this);
    spiderWindow.ProductList.addMouseListener(this);
    spiderWindow.URL_list.addActionListener(this);
    spiderWindow.setSize(254,585);
    spiderWindow.setLocation(50,50);
    spiderWindow.setTitle("Spider");
    spiderWindow.setResizable(false);
    spiderWindow.show();
    spiderWindow.requestFocus();
    InsertWind.addWindowListener(this);
    InsertWind.InsertList.addMouseListener(this);
    InsertWind.Insert.addActionListener(this);
    InsertWind.Cancel.addActionListener(this);
    InsertWind.setResizable(false);
    InsertWind.setSize(464,273);
    InsertWind.setLocation(304,364);
    InsertWind.InsertList.addMouseListener(this);
    InsertWind.show();
    productIn.addWindowListener(this);
    productIn.setSize(464,314);
    productIn.setLocation(304,50);
    productIn.setResizable(false);
    productIn.setTitle("Product");
    productIn.ProductDisplay.setEditable(false);
    ReadResourcePT();
    ProductCount = 0;
    spiderT.start();
  }
  public void run(){
    for(int i=0;i<CrawlerCount;i++)
    {
      Crawler crawler = new Crawler(this,i,tagCount);
      CrawlerContainer.add(crawler);
      spiderWindow.crawler_list.addItem("Crawler : "+i);
    }
    for(int i=0;i<FormattorCount;i++)
    {
      Formattor formattor = new Formattor(this);
      FormatterContainer.add(formattor);
      spiderWindow.formattor_list.addItem("Formattor : "+i);
    }
    CurrentJob = 0;
    Enumeration e = CrawlerContainer.elements();
    while(e.hasMoreElements()){
        Crawler c = (Crawler)e.nextElement();
        c.start();
    }
    CurrentProduct = 0;
    e = FormatterContainer.elements();
    while(e.hasMoreElements())
    {
      Formattor f = (Formattor)e.nextElement();
      f.start();
    }
    while(CurrentResource<ResourceCount)
    {
      try{
        spiderT.sleep(5000);
      }catch(Exception es){
        es.printStackTrace(System.out);
      }
    }
    if(spiderTable.compareTo("WEB_PRODUCT1")==0)
    {
      spiderTable = "WEB_PRODUCT2";
      try{
        SQLservice2.query("update project set  spider_spider='WEB_PRODUCT2',search='WEB_PRODUCT1'");
      }catch(Exception eu){
        eu.printStackTrace(System.out);
      }
    }else
    if(spiderTable.compareTo("WEB_PRODUCT2")==0)
    {
      spiderTable = "WEB_PRODUCT1";
      try{
        SQLservice2.query("update project set  spider_spider='WEB_PRODUCT1',search='WEB_PRODUCT2'");
      }catch(Exception eu){
        eu.printStackTrace(System.out);
      }
    }
    control.ServerI.status.append("<----Done Running Spider---->\n");
    task.Running = false;
    try{
      SQLservice2.closeConnection();
      SQLservice2 = SQLservice;
    }catch(Exception ex){
      ex.printStackTrace(System.out);
    }
  }
  public synchronized void addProduct(RareProduct product){
    product.ProductNo = ProductCount;
    ProductCount++;
    this.ProductContainer.addElement(product);
    spiderWindow.ProductList.add(ProductCount+" :"+product.resource.url);
  }
  public synchronized int getProductID(){
    ProductID++;
    return ProductID;
  }
  public void ReadResourcePT(){
    DOMBuilder builder= new DOMBuilder();
    try{
      URL url = new URL("http://161.246.5.185:8080/url_list.xml");
      Document doc = builder.build(url);
      Element root = doc.getRootElement();
      java.util.List resourceTag = root.getChildren();
      ResourceCount = resourceTag.size();
      //Integer IntTemp = new Integer(root.getAttributeValue("count"));
      //ResourceCount = IntTemp.intValue();
      ResourcePT = new Resource[ResourceCount];
      ResourceList = new java.util.List[ResourceCount];
      Element EleTemp;
      Tag tempTag;
      for(int i=0;i<ResourceCount;i++){
        ResourcePT[i] = new Resource(tagCount);
        EleTemp = (Element)resourceTag.get(i);
        if(EleTemp.getChild("name").getText()!=null) ResourcePT[i].name = EleTemp.getChild("name").getText();
        if(EleTemp.getChild("url").getText()!=null)
        {
          ResourcePT[i].url = EleTemp.getChild("url").getText();
          spiderWindow.URL_list.add(ResourcePT[i].url);
        }
        if(EleTemp.getChild("local_site").getText()!=null) ResourcePT[i].local_site = EleTemp.getChild("local_site").getText();
        ResourcePT[i].end_property = Integer.parseInt(EleTemp.getChild("end_property").getText());
        ResourcePT[i].skip_table_head = Integer.parseInt(EleTemp.getChild("skip_table_head").getText());
        StringTokenizer StrTemp5 = new StringTokenizer(EleTemp.getChild("order").getText());
        StringTokenizer StrTemp2,StrTemp;
        StringTokenizer StrTemp3,StrTemp4;
        String temp,temp2,temp3,nameTemp,valueTemp;
        for(int k=0;k<ResourcePT[i].tagCount;k++)
        {
          ResourcePT[i].order[k] = Integer.parseInt(StrTemp5.nextToken());
          ResourcePT[i].skip[k] = Integer.parseInt(EleTemp.getChild(tagString[k]).getAttributeValue("skip"));
          ResourcePT[i].place[k] = EleTemp.getChild(tagString[k]).getAttributeValue("place");
          ResourcePT[i].available[k] = EleTemp.getChild(tagString[k]).getAttributeValue("available");
          ResourcePT[i].value[k] = EleTemp.getChild(tagString[k]).getAttributeValue("value");
          if(k!=0)
          {
            ResourcePT[i].accept_charactor[k] = EleTemp.getChild(tagString[k]).getChild("data_format").getAttributeValue("accept_charactor");
            ResourcePT[i].cut_off_charactor[k] = EleTemp.getChild(tagString[k]).getChild("data_format").getAttributeValue("cut_off_charactor");
            ResourcePT[i].end_charactor[k] = EleTemp.getChild(tagString[k]).getChild("data_format").getAttributeValue("end_charactor");
            ResourcePT[i].prefix[k] = Integer.parseInt(EleTemp.getChild(tagString[k]).getChild("data_format").getAttributeValue("prefix_idx"));
            ResourcePT[i].suffix[k] = Integer.parseInt(EleTemp.getChild(tagString[k]).getChild("data_format").getAttributeValue("suffix_idx"));
          }
          ResourcePT[i].before[k] = new Vector();
          ResourcePT[i].after[k] = new Vector();
          StrTemp = new StringTokenizer(EleTemp.getChild(tagString[k]).getChild("before").getText(),"^^");
          temp = StrTemp.nextToken();
          StrTemp2 = new StringTokenizer(temp,"_");
          tempTag = new Tag();
          temp2 = StrTemp2.nextToken();
          if((temp2.compareTo("open")==0)||(temp2.compareTo("close")==0)||(temp2.compareTo("simple")==0)) tempTag.type = temp2;
          temp2 = StrTemp2.nextToken();
          tempTag.name = temp2;
          while(StrTemp.hasMoreTokens()){
            temp = StrTemp.nextToken();
            if((temp.startsWith("simple"))||(temp.startsWith("open"))||(temp.startsWith("close")))
            {
              ResourcePT[i].before[k].add(tempTag);
              tempTag = new Tag();
              if(temp.startsWith("open")) tempTag.type = "open";else
              if(temp.startsWith("close")) tempTag.type = "close";else
              if(temp.startsWith("simple")) tempTag.type = "simple";
              StrTemp2 = new StringTokenizer(temp,"_");
              temp2 = StrTemp2.nextToken();
              temp2 = StrTemp2.nextToken();
              tempTag.name = temp2;
            }else
            {
              StrTemp3 = new StringTokenizer(temp,"@@");
              while(StrTemp3.hasMoreTokens())
              {
                temp3 = StrTemp3.nextToken();
                nameTemp = temp3.substring(0,temp3.indexOf("="));
                temp3 = temp3.substring(temp3.indexOf("=")+1,temp3.length());
                valueTemp = new String(temp3.substring(1,temp3.length()-1));
                tempTag.attribute_set.addAttribute(new HTML().getAttributeKey(nameTemp),valueTemp);
              }
              //tempTag.attribute_set = temp;
            }
          }
          ResourcePT[i].before[k].add(tempTag);
          StrTemp = new StringTokenizer(EleTemp.getChild(tagString[k]).getChild("after").getText(),"^^");
          temp = StrTemp.nextToken();
          StrTemp2 = new StringTokenizer(temp,"_");
          tempTag = new Tag();
          temp2 = StrTemp2.nextToken();
          if((temp2.compareTo("open")==0)||(temp2.compareTo("close")==0)||(temp2.compareTo("simple")==0)) tempTag.type = temp2;
          temp2 = StrTemp2.nextToken();
          tempTag.name = temp2;
          while(StrTemp.hasMoreTokens()){
            temp = StrTemp.nextToken();
            if((temp.startsWith("simple"))||(temp.startsWith("open"))||(temp.startsWith("close")))
            {
              ResourcePT[i].after[k].add(tempTag);
              tempTag = new Tag();
              if(temp.startsWith("open")) tempTag.type = "open";else
              if(temp.startsWith("close")) tempTag.type = "close";else
              if(temp.startsWith("simple")) tempTag.type = "simple";
              StrTemp2 = new StringTokenizer(temp,"_");
              temp2 = StrTemp2.nextToken();
              temp2 = StrTemp2.nextToken();
              tempTag.name = temp2;
            }else
            {
              StrTemp3 = new StringTokenizer(temp,"@@");
              while(StrTemp3.hasMoreTokens())
              {
                temp3 = StrTemp3.nextToken();
                nameTemp = temp3.substring(0,temp3.indexOf("="));
                temp3 = temp3.substring(temp3.indexOf("=")+1,temp3.length());
                valueTemp = new String(temp3.substring(1,temp3.length()-1));
                tempTag.attribute_set.addAttribute(new HTML().getAttributeKey(nameTemp),valueTemp);
              }
              //tempTag.attribute_set = temp;
            }
          }
          ResourcePT[i].after[k].add(tempTag);
        }
      }
    }catch(Exception e){e.printStackTrace(System.out);
    }
  }
  public synchronized RareProduct getProduct(){
    RareProduct temp;
    if(CurrentProduct!=ProductCount){
      temp = (RareProduct)ProductContainer.elementAt(CurrentProduct);
      CurrentProduct++;
    }else temp = null;
    return temp;
  }
  public synchronized Resource getResource(){
    Resource temp;
    if(CurrentJob!=ResourceCount){
       temp = ResourcePT[CurrentJob];
       CurrentJob++;
    }else temp = null;
    return temp;
  }
  public void actionPerformed(ActionEvent av){
    if(av.getSource()==InsertWind.Insert)
    {
      String temp = InsertWind.TableName.getText();
      if(temp.compareTo("PROVINCE_IDX")==0)
      {
        Vector tempVec = new Vector();
        tempVec.addElement(InsertWind.KeyWord.getText());
        tempVec.addElement(InsertWind.Value.getText());
        SQLservice.insert("PROVINCE_IDX",tempVec);
        Table.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        Keyword.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        Value.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        InsertWind.InsertList.remove(InsertWind.InsertList.getSelectedIndex());
        InsertWind.TableName.setText("");
        InsertWind.KeyWord.setText("");
        InsertWind.Value.setText("");
      }else
      if(temp.compareTo("AREA_IDX")==0)
      {
        Vector tempVec = new Vector();
        tempVec.addElement(InsertWind.KeyWord.getText());
        tempVec.addElement(InsertWind.Value.getText());
        tempVec.addElement(InsertWind.ProvValue.getText());
        SQLservice.insert("AREA_IDX",tempVec);
        Table.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        Keyword.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        Value.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        Province.removeElementAt(InsertWind.InsertList.getSelectedIndex());
        InsertWind.InsertList.remove(InsertWind.InsertList.getSelectedIndex());
        InsertWind.TableName.setText("");
        InsertWind.KeyWord.setText("");
        InsertWind.Value.setText("");
        InsertWind.ProvValue.setText("");
      }
    }else
    {
    }
  }
  public void windowDeactivated(WindowEvent we){
    if(we.getSource()==productIn){
      productIn.hide();
    }
  }
  public void windowActivated(WindowEvent we){
  }
  public void windowDeiconified(WindowEvent we){
  }
  public void windowIconified(WindowEvent we){
  }
  public void windowClosed(WindowEvent we){
  }                                             
  public void windowClosing(WindowEvent we){
    if(we.getSource()==spiderWindow)
    {
      spiderWindow.hide();
      task.Running = false;
    }else
    if(we.getSource()==InsertWind)
    {
      InsertWind.hide();
      try{
        SQLservice.closeConnection();
      }catch(Exception e){
        e.printStackTrace(System.out);
      }
    }
  }
  public void windowOpened(WindowEvent we){
  }
  public void mouseExited(MouseEvent me){
  }
  public void mouseEntered(MouseEvent me){
  }
  public void mouseReleased(MouseEvent me){
  }
  public void mousePressed(MouseEvent me){
  }
  public void mouseClicked(MouseEvent me){
    if(me.getSource()==spiderWindow.crawler_list){
      Crawler c = (Crawler)CrawlerContainer.elementAt(spiderWindow.crawler_list.getSelectedIndex());
      c.output.show();
    }else
    if(me.getSource()==spiderWindow.ProductList){
      RareProduct temp = (RareProduct)ProductContainer.elementAt(spiderWindow.ProductList.getSelectedIndex());
      productIn.ProductDisplay.setText("");
      for(int i=1;i<tagCount;i++)
      {
        if((temp.attribute[i].compareTo("Not Available")!=0)&&(temp.attribute[i].length()!=0))productIn.ProductDisplay.append(tagString[i]+"  : "+temp.attribute[i]+"\n");
        else temp.attribute[i] = "Not Available";
      }
      productIn.show();
    }else
    if(me.getSource()==InsertWind.InsertList)
    {
      InsertWind.ProvValue.setVisible(false);
      InsertWind.TableName.setText((String)Table.elementAt(InsertWind.InsertList.getSelectedIndex()));
      InsertWind.KeyWord.setText((String)Keyword.elementAt(InsertWind.InsertList.getSelectedIndex()));
      InsertWind.Value.setText((String)Value.elementAt(InsertWind.InsertList.getSelectedIndex()));
      String temp = (String)Table.elementAt(InsertWind.InsertList.getSelectedIndex());
      if(temp.compareTo("PROVINCE_IDX")==0)
      {
        InsertWind.ProvValue.setVisible(false);
      }else
      if(temp.compareTo("AREA_IDX")==0)
      {
        InsertWind.ProvValue.setVisible(true);
      }
    }
  }
}
