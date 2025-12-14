import java.applet.*;
import java.awt.*;
import java.io.*;
import java.util.*;
import java.net.URL;
import java.net.*;
//import HttpMessage;

public class ReadFreeApplet extends Applet
{

	Image m_gif[];
	int countImage = 0;
	String strImage;
	int bufCount = 0;
	boolean finishPage = false;

	//TextField httpObject, httpObject1;

	// begin Parameter
	int number_of_page = 10;
	int vol = 1;
	String path = "fungvin";
	//end Parameter

	//Data for store on Database
	int bookMark = 1;
	//end Data....

	final String PARAM_numpage = "numpage";
	final String PARAM_volume = "volume";
	final String PARAM_pt = "pt";
	final String PARAM_bmark = "bmark";

	public void init() 	{

		//number_of_page = Integer.parseInt(getNumPageUsingHttpObject());
		//vol = Integer.parseInt(getVolumeUsingHttpObject());
		//path = getPathUsingHttpObject();
		//bookMark = Integer.parseInt(getMarkUsingHttpObject());

		String param;
		param = getParameter(PARAM_numpage);
		if (param != null)
				number_of_page = Integer.parseInt(param);

		param = getParameter(PARAM_volume);
		if (param != null)
				vol = Integer.parseInt(param);

		param = getParameter(PARAM_pt);
		if (param != null)
				path = param;

		param = getParameter(PARAM_bmark);
		if (param != null)
				bookMark = Integer.parseInt(param);

		resize(800,650);
		setLayout(null);
		Button m_buttonN = new Button("Next page");
		Button m_buttonP = new Button("Previous page");
		Button m_buttonM = new Button("Book mark");
		Button m_buttonG = new Button("Goto mark");
		//Button m_buttonGP = new Button("Goto Page");
		Choice m_choice = new Choice();
		Label m_label = new Label(" Goto Page : ");
		//m_buttonP.setBounds(150,570,90,25);
		m_buttonP.setBounds(241,570,90,25);
   	m_buttonN.setBounds(332,570,90,25);
		//m_buttonN.setBounds(423,570,90,25);
		//m_label.setBounds(514,570,80,25);
    //m_choice.setBounds(514,570,110,25);
    m_choice.setBounds(423,570,90,25);
		//m_buttonGP.setBounds(514,570,90,25);
		add(m_buttonP);
		add(m_buttonN);
		//add(m_buttonM);
		//add(m_buttonG);
		//add(m_label);
		for (int i=1;i<=number_of_page;i++ )
		{
			String st1;
			st1 = "Goto Page :  "+i;
			m_choice.addItem(st1);
		}
		add(m_choice);
		//add(m_buttonGP);

		m_gif = new Image[number_of_page];
		//Loading Image
		for (int i=1 ; i<= 3;i++)	{
			strImage = "images_readfree/"+path+"/vol" + vol + "/" + i + ".jpg";
			bufCount = i-1;
			m_gif[bufCount] = getImage(getCodeBase(),strImage);
		}

		//setLayout(new BorderLayout());
		//Panel west = new Panel();
		//west.setLayout(new GridLayout(5, 1));
		//west.add(new Label("HTTP object: ",Label.RIGHT));
		//west.add(new Label("HTTP object1: ",Label.RIGHT));

		//add("West", west);

		//Panel center = new Panel();
		//center.setLayout(new GridLayout(5, 1));

		//httpObject = new TextField();
		//httpObject.setEditable(false);
		//center.add(httpObject);
		//add("Center", center);

	}
	public void paint(Graphics g)	{
		g.drawImage(m_gif[countImage],20,30,this);
		showStatus("Image # "+ (countImage) +", bufCount " + bufCount +
		", finishPage = " + finishPage + ", number_of_page = " + number_of_page );
		if (((bufCount - countImage) <= 1) && !finishPage)	{
			int buf1;
			if ((bufCount+3) <  number_of_page)
				buf1 = 3;
			else {
				buf1 = number_of_page - (bufCount + 1);
				finishPage = true;
			}
			for (int i=1 ; i<= buf1;i++){
				bufCount++;
				strImage = "images/"+path+"/vol" + vol + "/" + (bufCount+1) + ".jpg";
				m_gif[bufCount] = getImage(getCodeBase(),strImage);
			}	
		}
	}
	public boolean action(Event event,Object obj)	{
		Object oTarget = event.target;
		//BUTTON
		if (oTarget instanceof Button){
			Button buttonTarget = (Button)oTarget;
			String sButtonString = buttonTarget.getLabel();
			if (sButtonString.compareTo("Next page") == 0)
			{
				//showStatus("Next page button");
				if (countImage < (number_of_page-1))
					countImage++;
				repaint();
				return true;
			}
			else if (sButtonString.compareTo("Previous page") == 0)	{
				//showStatus("Previous page button");
				if (countImage > 0)
						countImage--;
				repaint();
				return true;
			}
			else if (sButtonString.compareTo("Book mark") == 0)	{
				bookMark = countImage;
				//httpObject.setText(setMarkUsingHttpObject(bookMark));
				setMarkUsingHttpObject(bookMark);
				
				showStatus("Book mark = " + bookMark);
				repaint();
				return true;
			}
			else if (sButtonString.compareTo("Goto mark") == 0)	{
				countImage = bookMark;
				showStatus("Goto = " + bookMark + " page");
				
				int temp2 = countImage - bufCount;
				if (temp2 > 0)
				{
					for (int i=1 ; i<= temp2;i++){
						bufCount++;
						strImage = "images/"+path+"/vol" + vol + "/" + (bufCount+1) + ".jpg";
						m_gif[bufCount] = getImage(getCodeBase(),strImage);
					}		
				}
				if (countImage == (number_of_page-1))
				{
					finishPage = true;
				}
				repaint();
				
				return true;
			}
		}		//END BUTTON
		if (event.target instanceof Choice)
			{
				Choice x = (Choice)event.target;
				//showStatus(x.getSelectedItem() + "," + x.getSelectedIndex());
				int temp1 = x.getSelectedIndex() - bufCount;
				int y = x.getSelectedIndex();
				if (temp1 > 0)
				{
					for (int i=1 ; i<= temp1;i++){
						bufCount++;
						strImage = "images/"+path+"/vol" + vol + "/" + (bufCount+1) + ".jpg";
						m_gif[bufCount] = getImage(getCodeBase(),strImage);
					}		
				}
				if (y == (number_of_page-1))
				{
					finishPage = true;
				}
				countImage = y;
				repaint();
				return true;
			}
		return false;

	}
	private void setMarkUsingHttpObject(int mark) {
		try
		{											
			URL url = new URL(getCodeBase(), "/jservlets/ReadDetail");
			HttpMessage msg = new HttpMessage(url);
			Properties props = new Properties();
			props.put("markx", String.valueOf(mark));
			InputStream in = msg.sendGetMessage(props);
			//ObjectInputStream result = new ObjectInputStream(in);
			//Object obj = result.readObject();
			//String datex = (String)obj;
			//return datex;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			//return "xxx";
		}
	 }
};
class HttpMessage{

	URL servlet = null;
	String args = null;

	public HttpMessage(URL servlet){
		this.servlet = servlet;
	}

	public InputStream sendGetMessage() throws IOException {
		return sendGetMessage(null);
	}
				//InputStream
	public  InputStream sendGetMessage(Properties args) throws IOException {

		String argString = "";
		if (args != null)
		{
			argString = "?" + toEncodedString(args);
		}
		URL url = new URL(servlet.toExternalForm() + argString);
		//return url.toString();
		URLConnection con = url.openConnection();
		con.setUseCaches(false);
		return con.getInputStream();
	}

	public InputStream sendPostMessage() throws IOException {
		return sendPostMessage(null);
	}

	public InputStream sendPostMessage(Properties args) throws IOException {
		String argString = "";
		
		if (args != null)
		{
			argString = toEncodedString(args);
		}
		URLConnection con = servlet.openConnection();
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);
		con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		DataOutputStream out = new DataOutputStream(con.getOutputStream());
		out.writeBytes(argString);
		out.flush();
		out.close();

		return con.getInputStream();
	}
	private String toEncodedString(Properties args){
		StringBuffer buf = new StringBuffer();
		Enumeration names = args.propertyNames();
		while (names.hasMoreElements())
		{
			String name = (String) names.nextElement();
			String value = args.getProperty(name);
			buf.append(URLEncoder.encode(name) + "=" + URLEncoder.encode(value));
			if (names.hasMoreElements()) buf.append("&");
		}
		return buf.toString();
	}

};
