import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.net.URL.*;

public class Readb extends Applet
{
	TextField text_name = new TextField(20);
	TextField text_password = new TextField(10);
	Choice book_choice = new Choice();
	//Choice book_choice2 = new Choice();
	TextField text_status = new TextField(20);

	//TextField text_book_name = new TextField(20);
	//TextField text_volume = new TextField(20);
	//TextField text_page_quantity = new TextField(20);
	//TextField text_book_path = new TextField(20);
	//TextField text_book_mark = new TextField(20);
	//TextField text_expire = new TextField(20);
	//TextField text_id_book = new TextField(20);

	String[] data = new String[20];
	String username_buf = "";
	String password_buf = "";

	String var_book_name="";
	String var_volume="";
	String var_page_quantity="";
	String var_book_path="";
	String var_book_mark="";
	String var_expire="";
	String var_id_book="";

	int count_book=0;
	
	Button m_buttonN = new Button("Next page");
	Button m_buttonP = new Button("Previous page");
	Button m_buttonM = new Button("Book mark");
	Button m_buttonG = new Button("Goto mark");
	Choice m_choice = new Choice();
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

	public void init(){
		resize(800,700);
		setLayout(null);
		Label name = new Label("Name");
		Label password = new Label("Password");
		text_password.setEchoChar('*');
		Button B_Send = new Button("Login");
		Button B_Remove = new Button("Remove");
		name.setBounds(10,25,30,10);
		text_name.setBounds(45,20,100,20);
		password.setBounds(155,25,50,10);
		text_password.setBounds(210,20,100,20);
		B_Send.setBounds(315,20,50,20);
		book_choice.setBounds(370,20,100,20);
		//book_choice2.setBounds(370,50,100,20);
		B_Remove.setBounds(475,20,70,20);
		text_status.setBounds(550,20,170,20);

		//text_book_name.setBounds(10,55,100,20);
		//text_volume.setBounds(115,55,100,20);
		//text_page_quantity.setBounds(220,55,100,20);
		//text_book_path.setBounds(325,55,100,20);
		//text_book_mark.setBounds(430,55,100,20);
		//text_expire.setBounds(535,55,100,20);
		//text_id_book.setBounds(640,55,100,20);

		add(name);
		add(text_name);
		add(password);
		add(text_password);
		add(B_Send);
		add(book_choice);
		//add(book_choice2);
		add(B_Remove);
		//add(text_book_name);add(text_volume);add(text_page_quantity);
		//add(text_book_path);add(text_book_mark);add(text_expire);add(text_id_book);
		add(text_status);
		
		//book_choice2.addItemListener(i);
		//book_choice.addItem("Hello");
		//book_choice.addItem("World");
		//book_choice.addItem("Hi");

		//book_choice2.addItem("Hello2");
		//book_choice2.addItem("World2");
		//book_choice2.addItem("Hi2");
		
		
		//Button m_buttonGP = new Button("Goto Page");
		
		//Label m_label = new Label(" Goto Page : ");
		m_buttonP.setBounds(150,610,90,25);
		m_buttonN.setBounds(241,610,90,25);
		m_buttonM.setBounds(332,610,90,25);
		m_buttonG.setBounds(423,610,90,25);
		//m_label.setBounds(514,570,80,25);
		m_choice.setBounds(514,610,110,25);
		//m_buttonGP.setBounds(514,570,90,25);
		add(m_buttonP);
		add(m_buttonN);
		add(m_buttonM);
		add(m_buttonG);
		add(m_choice);

		
		

		MyActionListener al = new MyActionListener(this);
		MyItemListener i = new MyItemListener(this);
		B_Send.addActionListener(al);
		B_Remove.addActionListener(al);
		book_choice.addItemListener(i);
		m_choice.addItemListener(i);
		m_buttonP.addActionListener(al);
		m_buttonN.addActionListener(al);
		m_buttonM.addActionListener(al);
		m_buttonG.addActionListener(al);

	}
	public void paint(Graphics g)	{
		if (!var_expire.equals("expired")){
			g.drawImage(m_gif[countImage],30,60,this);
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
	}

	public void setLoginUsingHttpObject() {
		try
		{											
			text_status.setText("Please wait...");
			book_choice.removeAll();
			text_name.setText("");
			text_password.setText("");
			var_book_name = "";
			//text_book_name.setText(var_book_name);
			var_volume = "";
			//text_volume.setText(var_volume);
			var_page_quantity = "";
			//text_page_quantity.setText(var_page_quantity);
			var_book_path = "";
			//text_book_path.setText(var_book_path);
			var_book_mark = "";
			//text_book_mark.setText(var_book_mark);
			var_expire = "";
			//text_expire.setText(var_expire);
			var_id_book = "";
			//text_id_book.setText(var_id_book);
			count_book=0;

			URL url = new URL(getCodeBase(), "/jservlets/ServletRead");
			HttpMessage msg = new HttpMessage(url);
			Properties props = new Properties();
			Properties output = new Properties();
			props.put("user", username_buf);
			props.put("password", password_buf);
			InputStream in = msg.sendGetMessage(props);
			ObjectInputStream result = new ObjectInputStream(in);
			Object obj = result.readObject();
			output = (Properties)obj;


			if (output.getProperty("status")!=null)	{
				text_status.setText(output.getProperty("status"));
				book_choice.addItem("Sorry!!");
			}
			else {
				text_status.setText("Login compleate");
				Enumeration e = output.propertyNames();

				while (e.hasMoreElements())	{
					String str_value = (String)e.nextElement();
					data[count_book++] = (String)output.getProperty(str_value);
				}
				if (count_book==0){
					book_choice.addItem("No have cartoon");
				}
				int k,m;
				String str="";
				for (int i=0;i<count_book ;i++ ){
					k = data[i].indexOf('+');
					str = data[i].substring(0,k);
					m = data[i].indexOf('+', k+1);
					str = str +" "+ data[i].substring(k+1, m);
					book_choice.addItem(str);
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	 }


	public void setRemoveUsingHttpObject() {
		try
		{
			text_status.setText("Please wait...");
			URL url = new URL(getCodeBase(), "/jservlets/ServletRead");
			HttpMessage msg = new HttpMessage(url);
			Properties props = new Properties();
			props.put("remove_user", username_buf);
			props.put("remove_id_book", var_id_book);
			InputStream in = msg.sendGetMessage(props);
			ObjectInputStream result = new ObjectInputStream(in);
			Object obj = result.readObject();
			String str1 = (String)obj;
			text_status.setText(str1);


		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public void setMarkUsingHttpObject() {
		try
		{
			text_status.setText("Please wait...");
			URL url = new URL(getCodeBase(), "/jservlets/ServletRead");
			HttpMessage msg = new HttpMessage(url);
			Properties props = new Properties();
			props.put("mark_user", username_buf);
			props.put("mark_id_book", var_id_book);
			props.put("mark_page", bookMark+"");
			InputStream in = msg.sendGetMessage(props);
			ObjectInputStream result = new ObjectInputStream(in);
			Object obj = result.readObject();
			String str1 = (String)obj;
			text_status.setText(str1);


		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

};
class MyActionListener implements ActionListener {
	Read a;int status_selected=0,remove_loop=0;
	MyActionListener(Read a){ this.a = a; }
	public void actionPerformed(ActionEvent e){

			if (e.getActionCommand().equals("Login")){
				a.username_buf = a.text_name.getText();
				a.password_buf = a.text_password.getText();
				a.setLoginUsingHttpObject();
			}
			else if (e.getActionCommand().equals("Remove")){
				status_selected = a.book_choice.getSelectedIndex();
				a.book_choice.remove(a.book_choice.getSelectedItem());
				a.setRemoveUsingHttpObject();
				a.count_book--;
				remove_loop = a.count_book - status_selected;
				if (remove_loop==0)	{
					a.data[status_selected] = null;
					}
				else{
					for (int i=0;i<remove_loop ;i++ ){
						a.data[status_selected] = a.data[status_selected+1];
						status_selected++;
						}
					}
				if (a.book_choice.getSelectedItem()==null){
					a.text_status.setText("null");
					a.var_book_name = "null";
					//a.text_book_name.setText(a.var_book_name);
					a.var_volume = "null";
					//a.text_volume.setText(a.var_volume);
					a.var_page_quantity = "null";
					//a.text_page_quantity.setText(a.var_page_quantity);
					a.var_book_path = "null";
					//a.text_book_path.setText(a.var_book_path);
					a.var_book_mark = "null";
					//a.text_book_mark.setText(a.var_book_mark);
					a.var_expire = "null";
					//a.text_expire.setText(a.var_expire);
					a.var_id_book = "null";
					//a.text_id_book.setText(a.var_id_book);

					a.countImage = 0;
					a.bufCount = 0;
					a.finishPage = false;
					a.number_of_page = 0;
					a.vol = 0;
					a.path = "x";
					a.bookMark = 0;
					String st1;
					for (int ix=1;ix<=a.number_of_page;ix++ ){
						st1 = "Goto Page :  "+ix;
						a.m_choice.addItem(st1);
						}
					a.add(a.m_choice);
					//add(m_buttonGP);

					a.m_gif = new Image[a.number_of_page];
					//Loading Image
					for (int iy=1 ; iy<= 3;iy++)	{
						a.strImage = "images/"+a.path+"/vol" + a.vol + "/" + iy + ".jpg";
						a.bufCount = iy-1;
						a.m_gif[a.bufCount] = a.getImage(a.getCodeBase(),a.strImage);
						}

					a.repaint();
					}
				else{
					int aa,b,c=a.book_choice.getSelectedIndex();
					aa = a.data[c].indexOf('+');
					a.var_book_name = a.data[c].substring(0,aa);
					//a.text_book_name.setText(a.var_book_name);
					b = a.data[c].indexOf('+', ++aa);
					a.var_volume = a.data[c].substring(aa,b);
					//a.text_volume.setText(a.var_volume);
					aa = a.data[c].indexOf('+', ++b);
					a.var_page_quantity = a.data[c].substring(b,aa);
					//a.text_page_quantity.setText(a.var_page_quantity);
					b = a.data[c].indexOf('+', ++aa);
					a.var_book_path = a.data[c].substring(aa,b);
					//a.text_book_path.setText(a.var_book_path);
					aa = a.data[c].indexOf('+', ++b);
					a.var_book_mark = a.data[c].substring(b,aa);
					//a.text_book_mark.setText(a.var_book_mark);
					b = a.data[c].indexOf('+', ++aa);
					a.var_expire = a.data[c].substring(aa,b);
					//a.text_expire.setText(a.var_expire);
					a.var_id_book = a.data[c].substring(++b);
					//a.text_id_book.setText(a.var_id_book);
					////////a.text_status.setText(c+"");
					a.countImage = 0;
					a.bufCount = 0;
					a.finishPage = false;
					a.number_of_page = Integer.parseInt(a.var_page_quantity);
					a.vol = Integer.parseInt(a.var_volume);
					a.path = a.var_book_path;
					a.bookMark = Integer.parseInt(a.var_book_mark);
					String st1;
					for (int ix=1;ix<=a.number_of_page;ix++ ){
						st1 = "Goto Page :  "+ix;
						a.m_choice.addItem(st1);
						}
					a.add(a.m_choice);
					//add(m_buttonGP);

					a.m_gif = new Image[a.number_of_page];
					//Loading Image
					for (int iy=1 ; iy<= 3;iy++)	{
						a.strImage = "images/"+a.path+"/vol" + a.vol + "/" + iy + ".jpg";
						a.bufCount = iy-1;
						a.m_gif[a.bufCount] = a.getImage(a.getCodeBase(),a.strImage);
						}

					a.repaint();
				}
			}
			else if (e.getActionCommand().equals("Next page")){
				//showStatus("Next page button");
				if (a.countImage < (a.number_of_page-1))
					a.countImage++;
				a.repaint();

				}
			else if (e.getActionCommand().equals("Previous page"))	{
				//showStatus("Previous page button");
				if (a.countImage > 0)
						a.countImage--;
				a.repaint();

				}
			else if (e.getActionCommand().equals("Book mark"))	{
				a.bookMark = a.countImage;
				//httpObject.setText(setMarkUsingHttpObject(bookMark));
				a.setMarkUsingHttpObject();

				a.showStatus("Book mark = " + a.bookMark);
				a.repaint();

				}
			else if (e.getActionCommand().equals("Goto mark"))	{
				a.countImage = a.bookMark;
				a.showStatus("Goto = " + a.bookMark + " page");

				int temp2 = a.countImage - a.bufCount;
				if (temp2 > 0)	{
					for (int i=1 ; i<= temp2;i++){
						a.bufCount++;
						a.strImage = "images/"+a.path+"/vol" + a.vol + "/" + (a.bufCount+1) + ".jpg";
						a.m_gif[a.bufCount] = a.getImage(a.getCodeBase(),a.strImage);
						}
					}
				if (a.countImage == (a.number_of_page-1)){
					a.finishPage = true;
					}
				a.repaint();
			}

		}
};

class MyItemListener implements ItemListener {
	Read ap;
	MyItemListener(Read ap) { this.ap = ap; }
	public void itemStateChanged(ItemEvent e){

		int a,b;
		String itemname = (String)e.getItem();
		if ((itemname.length() > 10)&&(itemname.substring(0,11).equals("Goto Page :")))
		{

				int temp1 = ap.m_choice.getSelectedIndex() - ap.bufCount;
					int y = ap.m_choice.getSelectedIndex();
    				if (temp1 > 0)
					{
						for (int i=1 ; i<= temp1;i++){
							ap.bufCount++;
							ap.strImage = "images/"+ap.path+"/vol" + ap.vol + "/" + (ap.bufCount+1) + ".jpg";
							ap.m_gif[ap.bufCount] = ap.getImage(ap.getCodeBase(),ap.strImage);
						}		
					}
					if (y == (ap.number_of_page-1))
					{
						ap.finishPage = true;
					}

					ap.countImage = y;
					ap.repaint();
			//}
			
		}
		else{
			//ap.text_name.setText(itemname);
			a = ap.data[ap.book_choice.getSelectedIndex()].indexOf('+');
			ap.var_book_name = ap.data[ap.book_choice.getSelectedIndex()].substring(0,a);
			//ap.text_book_name.setText(ap.var_book_name);

			b = ap.data[ap.book_choice.getSelectedIndex()].indexOf('+', ++a);
			ap.var_volume = ap.data[ap.book_choice.getSelectedIndex()].substring(a,b);
			//ap.text_volume.setText(ap.var_volume);

			a = ap.data[ap.book_choice.getSelectedIndex()].indexOf('+', ++b);
			ap.var_page_quantity = ap.data[ap.book_choice.getSelectedIndex()].substring(b,a);
			//ap.text_page_quantity.setText(ap.var_page_quantity);

			b = ap.data[ap.book_choice.getSelectedIndex()].indexOf('+', ++a);
			ap.var_book_path = ap.data[ap.book_choice.getSelectedIndex()].substring(a,b);
			//ap.text_book_path.setText(ap.var_book_path);

			a = ap.data[ap.book_choice.getSelectedIndex()].indexOf('+', ++b);
			ap.var_book_mark = ap.data[ap.book_choice.getSelectedIndex()].substring(b,a);
			//ap.text_book_mark.setText(ap.var_book_mark);

			b = ap.data[ap.book_choice.getSelectedIndex()].indexOf('+', ++a);
			ap.var_expire = ap.data[ap.book_choice.getSelectedIndex()].substring(a,b);
			//ap.text_expire.setText(ap.var_expire);

			ap.var_id_book = ap.data[ap.book_choice.getSelectedIndex()].substring(++b);
			//ap.text_id_book.setText(ap.var_id_book);	

			ap.countImage = 0;
			ap.bufCount = 0;
			ap.finishPage = false;

			ap.number_of_page = Integer.parseInt(ap.var_page_quantity);
			ap.vol = Integer.parseInt(ap.var_volume);
			ap.path = ap.var_book_path;
			ap.bookMark = Integer.parseInt(ap.var_book_mark);

			ap.m_choice.removeAll();
			if (!ap.var_expire.equals("expired"))
			{
				String st1;
				for (int ix=1;ix<=ap.number_of_page;ix++ ){
					st1 = "Goto Page :  "+ix;
					ap.m_choice.addItem(st1);
				}
				ap.add(ap.m_choice);
			//add(m_buttonGP);

				ap.m_gif = new Image[ap.number_of_page];
			//Loading Image
				for (int iy=1 ; iy<= 3;iy++)	{
					ap.strImage = "images/"+ap.path+"/vol" + ap.vol + "/" + iy + ".jpg";
					ap.bufCount = iy-1;
					ap.m_gif[ap.bufCount] = ap.getImage(ap.getCodeBase(),ap.strImage);
				}
				ap.text_status.setText("Expire on "+ap.var_expire);
			}else{
				ap.text_status.setText("Expired,please REMOVE");
			}
			

			ap.repaint();
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
