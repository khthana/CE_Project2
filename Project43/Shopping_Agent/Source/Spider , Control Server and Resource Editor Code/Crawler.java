package Spider2;
import java.awt.event.*;
import java.awt.*;
import java.net.URL;
import java.io.*;
import java.net.MalformedURLException;
import javax.swing.text.*;
import javax.swing.text.html.*;
import javax.swing.text.html.parser.*;
import Sagent.MTThai;
public class Crawler implements WindowListener,ActionListener,Runnable{
  String STATE[];
  String DATA[];
  int SKIP[];
  int found;
  int BeforeIndex[],AfterIndex[];
  int CrawlerNo,TagCount;
  int linkCount;
  int propertyCount;
  Resource resource;
  Spider control;
  CrawlerInterface output = new CrawlerInterface();
  Thread crawThread = new Thread(this);
  public Crawler(Spider control,int No,int TagCount){
    this.TagCount = TagCount;
    STATE = new String[TagCount];
    DATA = new String[TagCount];
    SKIP = new int[TagCount];
    BeforeIndex = new int[TagCount];
    AfterIndex = new int[TagCount];
    for(int i=0;i<TagCount;i++){
      STATE[i] = "before";
      DATA[i] = "";
      BeforeIndex[i] = 0;
      AfterIndex[i] = 0;
    }
    this.control = control;
    output.addWindowListener(this);
    output.ClearScr.addActionListener(this);
    output.setSize(564,415);
    output.setResizable(false);
    output.Display.setEditable(false);
    output.setLocation(50+254,50);
    output.setTitle("Empty");
    output.setBackground(Color.white);
    CrawlerNo = Integer.parseInt(new Integer(No).toString());
  }
  public void start(){
    crawThread.start();
  }
  public void run(){
    Resource temp;
    while((temp = control.getResource())!=null){
      try{
        crawl(temp);
      }catch(Exception e){
        e.printStackTrace(System.out);
      }
    }
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
  public void crawl(Resource r)throws Exception{
    linkCount = 0;
    propertyCount = 1;
    resource = r;
    for(int i=0;i<resource.tagCount;i++) this.SKIP[i] = resource.skip[i];
    getURL(new URL(resource.url),"C:\\tomcat\\webapps\\ROOT\\crawler\\crawler"+CrawlerNo+".html");
    MyParser myParser = null;
		ParserDelegator pd;
		pd = new ParserDelegator();
		try
		{
      myParser = new MyParser(this,"result");
      display("Resource Name :"+r.name+"\n");
      display("Resource URL  :"+r.url+"\n");
      output.setTitle(r.url);
			pd.parse(new InputStreamReader(new URL("http://161.246.5.185:8080/crawler/crawler"+CrawlerNo+".html").openStream()),myParser,true);
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
  public void actionPerformed(ActionEvent av){
    if(av.getSource()==output.ClearScr){
      output.Display.setText("");
    }
  }
  public void windowDeactivated(WindowEvent we){
    output.hide();
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
    output.hide();
  }
  public void windowOpened(WindowEvent we){
  }
  public void display(String s){
    output.Display.append(s);
  }
}

