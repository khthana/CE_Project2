package Sagent2;
import org.jdom.*;
import org.jdom.output.XMLOutputter;
import org.jdom.Element;
import org.jdom.Document;
import org.jdom.input.DOMBuilder;
import java.io.*;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import java.net.URL;
import java.util.List;
public class Profile {
  public int count;
  public Specification2 property[];
  public List propertyList;
  public List tags[];
  public Profile() {
  }
  public void ReadXML(URL url){
    DOMBuilder builder= new DOMBuilder();
    try{
      Document doc = builder.build(url);
      Element root = doc.getRootElement();
      Integer IntTemp = new Integer(root.getAttributeValue("count"));
      count = IntTemp.intValue();
      property = new Specification2[count];
      propertyList = root.getChildren();
      tags = new List[count];
      for(int i=0;i<count;i++){
        property[i] = new Specification2();
        Element EleTemp = (Element)propertyList.get(i);
        property[i].type = EleTemp.getAttributeValue("type");
        property[i].found = EleTemp.getAttributeValue("found");
        tags[i] = EleTemp.getChildren();
        EleTemp = (Element)tags[i].get(0);
        property[i].need_to = EleTemp.getText();
        EleTemp = (Element)tags[i].get(1);
        IntTemp = new Integer(EleTemp.getText());
        property[i].size = IntTemp.intValue();
        EleTemp = (Element)tags[i].get(2);
        IntTemp = new Integer(EleTemp.getText());
        property[i].price = IntTemp.intValue();
        EleTemp = (Element)tags[i].get(3);
        IntTemp = new Integer(EleTemp.getText());
        property[i].bedroom = IntTemp.intValue();
        EleTemp = (Element)tags[i].get(4);
        IntTemp = new Integer(EleTemp.getText());
        property[i].bathroom = IntTemp.intValue();
        EleTemp = (Element)tags[i].get(5);
        String StrTemp = EleTemp.getText();
        property[i].kitchen = StrTemp;
        EleTemp = (Element)tags[i].get(6);
        StrTemp = EleTemp.getText();
        property[i].laundry = StrTemp;
        EleTemp = (Element)tags[i].get(7);
        StrTemp = EleTemp.getText();
        property[i].funished = StrTemp;
        EleTemp = (Element)tags[i].get(8);
        StrTemp = EleTemp.getText();
        property[i].swimming_pool = StrTemp;
        EleTemp = (Element)tags[i].get(9);
        StrTemp = EleTemp.getText();
        property[i].fitness = StrTemp;
        EleTemp = (Element)tags[i].get(10);
        List tempList = EleTemp.getChildren();
        Element EleTemp2 = (Element)tempList.get(0);
        property[i].province = EleTemp2.getText();
        EleTemp2 = (Element)tempList.get(1);
        property[i].area = EleTemp2.getText();
      }
    }catch(Exception e){
      e.printStackTrace();
    }
  }
  public void remove(int number){
    if(number==count) count--;
    else if(count==1) count=0;
    else{
      for(int i=number-1;i<count-1;i++){
        property[i]=property[i+1];
      }
      count--;
    }
  }
  public void writeXml(String username){
    Element  EleTemp;
    Element root = new Element("specification");
    Integer IntTemp = new Integer(count);
    root.addAttribute("count",IntTemp.toString());
    Element propertyTag;
    for(int i=0;i<count;i++)
    {
      propertyTag = new Element("property");
      IntTemp = new Integer(i+1);
      propertyTag.addAttribute("number",IntTemp.toString());
      propertyTag.addAttribute("type",property[i].type);
      propertyTag.addAttribute("found",property[i].found);
      EleTemp = new Element("needto");
      EleTemp.setText(property[i].need_to);
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("size");
      IntTemp = new Integer(property[i].size);
      EleTemp.setText(IntTemp.toString());
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("price");
      IntTemp = new Integer(property[i].price);
      EleTemp.setText(IntTemp.toString());
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("bedroom");
      IntTemp = new Integer(property[i].bedroom);
      EleTemp.setText(IntTemp.toString());
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("bathroom");
      IntTemp = new Integer(property[i].bathroom);
      EleTemp.setText(IntTemp.toString());
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("kitchen");
      EleTemp.setText(property[i].kitchen);
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("laundry");
      EleTemp.setText(property[i].laundry);
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("furnished");
      EleTemp.setText(property[i].funished);
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("swimming_pool");
      EleTemp.setText(property[i].swimming_pool);
      propertyTag.addChild(EleTemp);
      EleTemp = new Element("fitness");
      EleTemp.setText(property[i].fitness);
      propertyTag.addChild(EleTemp);
      Element address = new Element("address");
      EleTemp = new Element("province");
      EleTemp.setText(property[i].province);
      address.addChild(EleTemp);
      EleTemp = new Element("area");
      EleTemp.setText(property[i].area);
      address.addChild(EleTemp);
      propertyTag.addChild(address);
      root.addChild(propertyTag);
    }
    Document doc = new Document(root);
		try {
		  FileOutputStream out = new FileOutputStream("c:\\tomcat\\webapps\\ROOT\\profile\\"+username+".xml");
		  XMLOutputter serializer = new XMLOutputter("  ",true);
		  serializer.output(doc, out);                                 
		  out.flush();	                                               
		  out.close();
		}
		catch (IOException e) {
		  System.err.println(e);                                       
		}     
  }
}
