package Spider2;
import javax.swing.UIManager;
import java.awt.*;
import java.net.*;
import java.util.*;
import org.jdom.*;
import org.jdom.output.XMLOutputter;
import org.jdom.Element;
import org.jdom.Document;
import javax.swing.text.html.*;
import org.jdom.input.DOMBuilder;
import java.io.*;
import javax.swing.text.*;
import javax.swing.text.html.*;
import javax.swing.text.html.parser.*;
import Sagent.MTThai;
public class RulesEditor {
  Resource resource;
  String STATE[];
  String DATA[];
  int SKIP[];
  int BeforeIndex[],AfterIndex[];
  int propertyCount;
  int TagCount;
  boolean packFrame = false;
  int ResourceCount;
  Resource ResourcePT[];
  java.util.List ResourceList[];
  int tagCount;
  String tagString[];
  RulesEditorFrame frame;
  //Construct the application
  public RulesEditor() {
    TagCount = 11;
    STATE = new String[TagCount];
    DATA = new String[TagCount];
    BeforeIndex = new int[TagCount];
    AfterIndex = new int[TagCount];
    SKIP = new int[TagCount];
    for(int i=0;i<TagCount;i++){
      STATE[i] = "before";
      DATA[i] = "";
      BeforeIndex[i] = 0;
      AfterIndex[i] = 0;
    }
    frame = new RulesEditorFrame(this);
    //Validate frames that have preset sizes
    //Pack frames that have useful preferred size info, e.g. from their layout
    if (packFrame)
      frame.pack();
    else
      frame.validate();
    //Center the window
    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    Dimension frameSize = frame.getSize();
    if (frameSize.height > screenSize.height)
      frameSize.height = screenSize.height;
    if (frameSize.width > screenSize.width)
      frameSize.width = screenSize.width;
    frame.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
    frame.setVisible(true);
    tagCount = 11;
    tagString = new String[tagCount];
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
    ReadResourcePT();
  }

  //Main method
  public static void main(String[] args) {
    try  {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    }
    catch(Exception e) {
    }
    new RulesEditor();
  }
  public void getURL(URL url,String filename){
    try{
      BufferedReader bufferedReader;
      InputStream in = url.openStream();
      InputStreamReader reader = new InputStreamReader(in,"latin1");
      bufferedReader = new BufferedReader(reader);
      String line;
      FileWriter fw = new FileWriter(filename);
      while((line = bufferedReader.readLine())!=null) {
        line = MTThai.MS874ToUnicode(line);
        fw.write(line+"\n");
      }
      fw.close();
      bufferedReader.close();
    }catch(Exception e){e.printStackTrace(System.out);}
  }
  public void display(String s){
    frame.testResult.append(s);
  }
  public Tag getTag(Resource r,String indicator,int index,int ResourceIndex){
    Tag temp = new Tag();
    if(indicator.compareTo("before")==0){
      try{
        temp = (Tag)r.before[ResourceIndex].elementAt(index);
      }catch(ArrayIndexOutOfBoundsException aa)
      {
        temp = null;
      }
    }else
    if(indicator.compareTo("after")==0){
      try{
        temp = (Tag)r.after[ResourceIndex].elementAt(index);
      }catch(ArrayIndexOutOfBoundsException aa)
      {
        temp = null;
      }
    }
    return temp;
  }
  public void TestResource(Resource r){
    frame.testResult.setText("");
    frame.testResult.append("Starting Test\n");
    propertyCount = 1;
    resource = r;
    for(int i=0;i<TagCount;i++){
      STATE[i] = "before";
      DATA[i] = "";
      BeforeIndex[i] = 0;
      AfterIndex[i] = 0;
      this.SKIP[i] = resource.skip[i];
    }
    try{
      getURL(new URL(resource.url),"C:\\tomcat\\webapps\\ROOT\\crawlerTemp.html");
    }catch(Exception e){
      e.printStackTrace(System.out);
    }
    MyParserTest myParser = null;
		ParserDelegator pd;
		pd = new ParserDelegator();
		try
		{
      myParser = new MyParserTest(this,resource,"result");
      display("Resource Name :"+r.name+"\n");
      display("Resource URL  :"+r.url+"\n");
      //output.setTitle(r.url);
			pd.parse(new InputStreamReader(new URL("http://161.246.5.185:8080/crawlerTemp.html").openStream()),myParser,true);
		}
		catch (MalformedURLException murle)
		{
			System.out.println("malformed");
		}
		catch (IOException ioe)
		{
			System.out.println("io");
		}
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
          frame.resource_list_model.addElement(ResourcePT[i].name);
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
}
