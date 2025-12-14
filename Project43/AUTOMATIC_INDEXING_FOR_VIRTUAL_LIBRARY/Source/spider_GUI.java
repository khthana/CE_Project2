import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.util.*;
import javax.swing.text.*;
import javax.swing.text.html.*;
import javax.swing.text.html.parser.*;
import com.borland.jbcl.layout.*;
import javax.swing.border.*;

public class spider_GUI extends Frame implements WindowListener,Runnable
{
  TextField depth = new TextField();
  TextField init_url = new TextField("http://161.246.5.184/web_spider/web1.html");
  Label jLabel1 = new Label();
  Label jLabel2 = new Label();
  Panel jPanel1 = new Panel();
  Vector xml_interface = new Vector();
  Vector html_interface = new Vector();
  java.awt.List xml_list = new java.awt.List();
  java.awt.List html_list = new java.awt.List();
  Button runindex = new Button();
  Panel jPanel2 = new Panel();
  java.awt.List jList1 = new java.awt.List();
  TextArea status_list = new TextArea();
  Button RUN = new Button();
  Label jLabel3 = new Label();
  Label jLabel4 = new Label();

  public spider_GUI()
  {
    try
    {
      jbInit();
	  setSize(515,515);
      show();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  }

  public static void main(String args[])
  {
    new spider_GUI();
  }

  private void jbInit() throws Exception
  {
    this.setLayout(null);
    depth.setBounds(new Rectangle(416, 29, 38, 24));
    depth.setName("depth");
    depth.addActionListener(new java.awt.event.ActionListener()
    {

      public void actionPerformed(ActionEvent e)
      {
        depth_actionPerformed(e);
      }
    });
    init_url.setBounds(new Rectangle(72, 30, 277, 24));
    init_url.setName("");
    jLabel1.setText("XML File");
    this.setBackground(Color.lightGray);
    jLabel2.setText("URL");
    jPanel1.setBounds(new Rectangle(16, 61, 286, 436));
	jPanel1.setLayout(null);
    runindex.setActionCommand("runindex");
    runindex.setLabel("Run index");
	runindex.addActionListener(new ActionListener() 
	{
      public void actionPerformed(ActionEvent e) 
	  {
        runindex_actionPerformed(e);
      }
    });
    jPanel2.setBounds(new Rectangle(311, 61, 185, 437));
	jPanel2.setLayout(null);
    //runindex.setEnabled(false);
    RUN.setLabel("Run spider");
	RUN.addActionListener(new ActionListener() 
	{
      public void actionPerformed(ActionEvent e) 
	  {
        RUN_actionPerformed(e);
      }
    });
	RUN.setFont(new java.awt.Font("MS Sans Serif",0,12));
	jLabel1.setFont(new java.awt.Font("MS Sans Serif",0,12));
	jLabel2.setFont(new java.awt.Font("MS Sans Serif",0,12));
	jLabel3.setFont(new java.awt.Font("MS Sans Serif",0,12));
	jLabel4.setFont(new java.awt.Font("MS Sans Serif",0,12));
	runindex.setFont(new java.awt.Font("MS Sans Serif",0,12));
    jLabel3.setText("Initial URL");
    jLabel3.setBounds(new Rectangle(9, 26, 57, 29));
    jLabel4.setText("Depth");
    jLabel4.setBounds(new Rectangle(365, 28, 44, 26));
    this.add(jPanel1, null);
	xml_list.setBounds(1,36,273,170);
	html_list.setBounds(2,242,271,181);
	jLabel2.setBounds(8,210,70,31);
	jLabel1.setBounds(1,7,62,29);
	RUN.setBounds(200,2,75,30);
	jPanel1.setLayout(null);
	jPanel1.add(xml_list);
	jPanel1.add(html_list);
	jPanel1.add(jLabel2);
	jPanel1.add(jLabel1);
	jPanel1.add(RUN);
    this.add(jPanel2, null);
	status_list.setBounds(4,36,166,388);
	runindex.setBounds(50,2,75,30);
	jPanel2.add(status_list);
	jPanel2.add(runindex);
    this.add(init_url, null);
    this.add(depth, null);
    this.add(jLabel3, null);
    this.add(jLabel4, null);
	this.addWindowListener(this);
	status_list.setEditable(false);
  }

  void depth_actionPerformed(ActionEvent e)
  {
  }

  void runindex_actionPerformed(ActionEvent e)
  {
	status_list.setText("");
	status_list.append("- AUTOMATIC INDEXING -\n");
	File t = new File("");
	ListFile lf = new ListFile(t.getAbsolutePath(),status_list);
	lf.recursive();
  }

  void RUN_actionPerformed(ActionEvent e) 
  {
	xml_list.removeAll();
	html_list.removeAll();
	status_list.setText("");
	String initial = init_url.getText();
	int deep = Integer.parseInt(depth.getText());
	spider1  spider = new spider1(initial,deep,xml_list,html_list);
	spider.start();
	Thread thread = new Thread(this);
	thread.setPriority(Thread.MIN_PRIORITY);
	thread.start();
  }

  public void windowClosed(WindowEvent e){}
  public void windowClosing(WindowEvent e)
  {	
    this.hide();
	System.exit(0);
  }
  public void windowActivated(WindowEvent e){}  
  public void windowDeactivated(WindowEvent e){}
  public void windowDeiconified(WindowEvent e){}
  public void windowIconified (WindowEvent e){}
  public void windowOpened(WindowEvent e)
  {
  }
  public void run()
  {
	
	while (spider1.count != 0) 
	{
		try
		{
			Thread.sleep(200);
		}
		catch(InterruptedException iko){}
		//System.out.println("---"+spider1.count);
	}
	//--------- call SAX ------------
	status_list.append("==== FINISH SPIDER ===="+'\n');
	runindex.setEnabled(true);
  }
}

class spider1 extends Thread 
{
	public static int count = 0;
	LinkHandler linkhandler = null;
	Enumeration enumerate_list;
	Enumeration enumx_list;
	ParserDelegator pd;
	spider1[] crawler;
	String url = "";
	int depth = 0;
	java.awt.List xml_list;
	java.awt.List html_list;
		
	spider1(String add, int d,java.awt.List xml_list, java.awt.List html_list)
	{
		pd = new ParserDelegator();
		url = add;
		depth = d;
		this.xml_list = xml_list;
		this.html_list = html_list;
		count++;
	}

	public static void main(String[] args)
	{
		/*if (args.length == 2)
		{
			spider1  spider = new spider1(args[0],Integer.parseInt(args[1]));
			spider.start();
		}*/
	}
	
	public void run()
	{
		if (depth > 0)
		{
			try
			{
				linkhandler = new LinkHandler(new URL(url),xml_list,html_list);
				InputStream temp_url = new URL(url).openStream();
				pd.parse(new InputStreamReader(temp_url),linkhandler,true);
			}
			catch (MalformedURLException murle)
			{
				System.out.println("malformed");
			}
			catch (IOException ioe)
			{
				System.out.println(ioe);
			}

			//----------- WRITE XML FILE ---------------
			enumx_list = linkhandler.getXML().elements();
			int xlink = linkhandler.getXML().size();
			URL url = null;
			BufferedReader buffer = null ;
			FileWriter fw;
			BufferedWriter bw;
			String line;
			char flag = '0';
			while (enumx_list.hasMoreElements())
			{	
				String xml_name = (String)enumx_list.nextElement();
				try
				{
					url = new URL (xml_name);
				}
				catch(MalformedURLException e){}
				try
				{
					buffer = new BufferedReader(new InputStreamReader(url.openStream()));
				}
				catch(IOException e){flag = '1';}
				if (flag == '0')
				{
					String filename = url.getPath();
					filename = filename.substring(filename.lastIndexOf('/')+1,filename.length());
					try
					{
						fw = new FileWriter(filename);
						bw = new BufferedWriter(fw);
						//bw.write(xml_name+"\n");
						for (int i=0; i<2; i++)
						{
							if ((line = buffer.readLine()) != null)
							{
								bw.write(line+"\n");
							}
						}
						bw.write("<url>"+xml_name+"</url>"+"\n");
							
						while ((line = buffer.readLine()) != null)
						{
							bw.write(line+"\n");
						}
						bw.close();
					}
					catch(IOException e){}
					try
					{
						buffer.close();
					}
					catch (IOException e)
					{
					}
				}
				flag = '0';
			}

		//-------------------------------------------------------//

			enumerate_list = linkhandler.getLinkURL().elements();
			int ulink = linkhandler.getLinkURL().size();
			if (ulink > 0)
			{
				crawler = new spider1[ulink];
				int i = 0;	//number of thread
				while (enumerate_list.hasMoreElements())
				{
					if (depth != 0)
					{
						String temp_enum = (String)enumerate_list.nextElement();
						int j = 0;
						crawler[i] = new spider1(temp_enum,depth-1,xml_list,html_list);
						crawler[i].start(); 
						i++;
					}
					else
					{
						count--;
						interrupt();
					}
				}
			}
		}
		count--;
	}
};

class LinkHandler extends HTMLEditorKit.ParserCallback 
{
	Vector url_list;
	Vector xml_list;
	URL init_url;
	String path_url;
	String host;
	String new_url = "";
	java.awt.List xml_interface;
	java.awt.List html_interface;

	LinkHandler(URL init_url,java.awt.List xml_interface,java.awt.List html_interface)
	{
		this.html_interface = html_interface;
		this.xml_interface = xml_interface;
		this.init_url = init_url;
		url_list = new Vector();
		xml_list = new Vector();
		String host = "";
		host = init_url.getHost();
		this.host = host;
		path_url = init_url.getPath();
		path_url = path_url.substring(0,path_url.lastIndexOf('/')+1);
	}

	public void handleStartTag(HTML.Tag tag,MutableAttributeSet attribute_set, int pos)
	{
		if (tag.toString().compareToIgnoreCase("A") == 0)
		{
			String temp_link;
			temp_link = (String)attribute_set.getAttribute(new HTML().getAttributeKey("href"));
			if (temp_link != null)
			{
				if (!temp_link.trim().toUpperCase().startsWith("MAILTO:"))
				{
					if (!temp_link.startsWith("http://"))
					{
						new_url ="http://"+host+path_url+temp_link;
					}
					else
					{
						new_url = temp_link;
					}
				}
			}
			if (new_url.trim().endsWith(".xml"))
			{
				if(!xml_list.contains(new_url))
				{
					int i=0;
					int bit = 0;
					while (i < xml_interface.getItemCount())
					{	   
						if ((xml_interface.getItem(i)).trim().compareTo(new_url.trim()) == 0)
						{
							bit =1;
							break;
						}
						i++;
					}
					if (bit == 0) // not found in x_list then add
					{
						xml_list.addElement(new_url);
						xml_interface.add(new_url);
					}
					else
					{
//						System.out.println("-------------------NEW URL = "+new_url);
						bit = 0;
					}
					
				}
			}
			else 
			{ 
				/* check if not contain then add to link*/
				if(!url_list.contains(new_url))
				{
					int i=0;
					int bit = 0;
					while (i < html_interface.getItemCount())
					{
						if ((html_interface.getItem(i)).trim().compareTo(new_url.trim()) == 0)
						{
							bit =1;
							break;
						}
						i++;
					}
					if (bit == 0) // not found in x_list then add
					{
						System.out.println(new_url);
						url_list.addElement(new_url);	
						html_interface.add(new_url);
					}
					else
					{
						bit = 0;
					}
				}
			}
		}
	}

	public void handleEndTag(HTML.Tag t, int pos)
	{
	}

	public Vector getLinkURL()
	{
		return url_list;
	}

	public Vector getXML()
	{
		return xml_list;
	}
};