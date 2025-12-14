
import java.io.*;
import java.util.*;
import java.lang.*;
import java.awt.*;

import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.ErrorHandler;
import org.xml.sax.Locator;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;
import org.xml.sax.InputSource;

import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;

public class SAXParserDemo 
{
	public LinkedList mainwl = new LinkedList();
	public LinkedList mainfreql = new LinkedList();
	LinkedList ldic = null;
	FileReader dic = null;
	Connection con = null;
	FileOutputStream fout1 = null;  // for abstract
	FileOutputStream fout2 = null;  // for title
	FileReader fr = null;			// for description (*.xml)
	BufferedReader br = null;
	String uri = "";
	static String url = "";
	String category = "";
	String ready_title = "";
	String ready_abstract = "";
	File f_data = null;
	int limit = 20; // index term top 20
	CharArrayWriter cw_ti = null;
	CharArrayWriter cw_ab = null;
	CharArrayWriter cw_data = null;
	CharArrayReader cr_ti = null;
	CharArrayReader cr_ab = null;
	char[] buffer_ti;
	char[] buffer_ab;
	char[] buffer_data;
	char t_ok = '0';
	char a_ok = '0';
	char d_ok = '0';
	TextArea status_list;
	char filebit='0';
	
	public void performDemo(String uri,CharArrayWriter cw_ti,
								CharArrayWriter cw_ab)
	{
		ContentHandler contentHandler = new MyContentHandler(cw_ti,cw_ab);
		ErrorHandler errorHandler = new MyErrorHandler();        
        try 
		{
			XMLReader parser = 
            XMLReaderFactory.createXMLReader("org.apache.xerces.parsers.SAXParser");
            parser.setContentHandler(contentHandler);
            parser.setErrorHandler(errorHandler);                                 
            parser.parse(new InputSource(new FileReader(uri)));
			url = ((MyContentHandler)contentHandler).geturl();
			t_ok =((MyContentHandler)contentHandler).get_tbit();
			a_ok =((MyContentHandler)contentHandler).get_abit();
			d_ok =((MyContentHandler)contentHandler).get_dbit();
        } 
		catch (IOException e) 
		{
            System.out.println("Error reading URI: " + e.getMessage());
        } 
		catch (SAXException e) 
		{
            System.out.println("Error in parsing: " + e.getMessage());
        }
    }

//	--------------------------  MAIN -----------------------------------
	public static void main(String[] args) 
	{
		//SAXParserDemo sax = new SAXParserDemo(args);
	}

// --------------------------- CONSTRUCTOR -----------------------------
	SAXParserDemo(String[] args,TextArea status_list)
	{
		int tweight = 25;
		int aweight = 10;
		int dweight = 1;
        uri = args[0];			// uri = file name (*.xml)

        if (args.length != 1) 
		{
            System.out.println("Usage: java SAXParserDemo [XML URI]");
            System.exit(0);
        }
     		
		this.status_list=status_list;
		cw_ti = new CharArrayWriter();
		cw_ab = new CharArrayWriter();

		performDemo(uri,cw_ti,cw_ab); // xml parser 
		if ((t_ok == '1') && (a_ok == '1') && (d_ok == '1'))//check well form
		{
			buffer_ti = cw_ti.toCharArray();
			buffer_ab = cw_ab.toCharArray();
			prepare_detail(); // url,abstract,title
			register();  // register driver oracle
			check_file(); // check that have that file?
			if (filebit =='0')
			{
			read_data(); // get buffer_data
			index id = new index(con);
			dic();		 // dic linklist
			id.ai(buffer_ti,mainwl,mainfreql,tweight,ldic);
			id.ai(buffer_ab,mainwl,mainfreql,aweight,ldic);
			id.ai(buffer_data,mainwl,mainfreql,dweight,ldic);
			wordsort lsort = new wordsort();
			lsort.sort(mainwl,mainfreql);
			category = check_category();
			//prepare_detail();
			add_index2db();
			close();
			int i=0;
			while (i != mainwl.size())
			{	
				System.out.println(mainwl.get(i));
				System.out.println(mainfreql.get(i));
				i++;
			}
			System.out.println("category: "+category);
			status_list.append("CATEGORY : "+category+'\n');
			status_list.append("-------------------------"+'\n');
			}
			else
			{
				status_list.append("-- ALREADY FILE --"+'\n');
				System.out.println("already file");
			}
		}
		else 
		{
			status_list.append("NOT WELL FORM."+'\n');
			status_list.append("-------------------------"+'\n');
			System.out.println("NOT WELL FORM.");
		}
    }

//------------- CHECK FILE --------------------
	public void check_file()
	{
		String sqlState = "select no from tt_describe where title ='"+ready_title+"' and url='"+url+"'";	
		Statement stmt = null;
		ResultSet rs = null;
		boolean rc = true;
		try
		{
			stmt = con.createStatement();
		}
		catch (SQLException ex)
		{
			System.out.println("stmt error");
		}
		try
		{
			rs = stmt.executeQuery(sqlState);
		}
		catch (SQLException ex)
		{
			System.out.println("rs error");
		}
		try // check have that file?
		{
			if (rs.next())
			{
				filebit = '1';
			}
		}
		catch (SQLException ex)
		{
			System.out.println("*****rs.getstring error*****");
		}
		finally // close resultset & statement
		{						
			try
			{ 
				if (rs != null)
				{
					rs.close();
				}
	   			if (stmt != null)
	   			{
					stmt.close();
				}
			}
			catch (Exception ex)
			{
			}
		}

	}

//-------------- READ DESCRIPTION -----------------
	public void read_data()
	{
		try		// write description tag to data.txt
		{
			fr = new FileReader(uri);
			br = new BufferedReader(fr);
			try
			{
				cw_data = new CharArrayWriter();
				String line;
				int bit = 0;
				while ((line = br.readLine()) != null)
				{
					if (line.indexOf("</description>") != -1)
					{
						int index = line.indexOf("</description>");
						line = line.substring(0,index)+"\n";
						cw_data.write(line,0,line.length());
						bit = 0;
						break;
					}
					if ((line.indexOf("<description>") != -1) || 
						(bit == 1))
					{
						bit = 1;
						int index = line.indexOf("<description>");
						if (index != -1)
						{
							index = index+13;
							if (index == line.length())
							{
								continue;
							}
							if (line.length() > index)
							{
								line = line.substring(index,line.length());
							}
						}
						line = line+"\n";
						cw_data.write(line,0,line.length());
					}
				}
			}
			catch (IOException ex)
			{
			}
		}
		catch (FileNotFoundException fnfe)
		{
		}
		
		buffer_data = cw_data.toCharArray();
	}

//--------------------- PREPARE DETAIL FOR ADD TO DB ------------------
	public void prepare_detail()
	{
		ready_title = new String(buffer_ti);
		ready_abstract = new String(buffer_ab);
		// get ready_abstract only 100 char.
		if (ready_abstract.length() > 100)
		{
			ready_abstract = ready_abstract.substring(0,100);
		}
		// no abstract get from description
		/*else if (ready_abstract.compareTo("") == 0)
		{
			ready_abstract = new String(buffer_data,0,100);
		}*/
		if (url.startsWith("\n"))
		{
			url = url.substring(1,url.length());
		}
		if (url.endsWith("\n"))
		{
			url = url.substring(0,url.length()-1);
		}
		if (ready_title.startsWith("\n"))
		{
			ready_title = ready_title.substring(1,ready_title.length());
		}
		if (ready_title.endsWith("\n"))
		{
			ready_title = ready_title.substring(0,ready_title.length()-1);
		}
		if (ready_abstract.startsWith("\n"))
		{
			ready_abstract = ready_abstract.substring(1,ready_abstract.length());
		}
		if (ready_abstract.endsWith("\n"))
		{
			ready_abstract = ready_abstract.substring(0,ready_abstract.length()-1);
		}
	}

//----------------------- REGISTER DRIVER - CONNECT ORACLE ------------------
	public void register()
	{
		try
		{
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.184:1521:virtual","system", "manager");
		}
		catch (SQLException ex)
		{
			System.out.println("database access error occurs1"+ex.getMessage());
		}
	}

//----------------------- CLOSE CONNECTION  ------------------
	public void close()
	{
		if (con != null)
		{
			try
			{
				con.close(); 
			}
			catch (SQLException ex)
			{
			}
		}
	}

//------------------------- ADD_INDEX2DB ---------------------------
	public void add_index2db()
	{
		int max_id=0;
		String sqlState = "select max(no) from tt_index";	
		Statement stmt = null;
		ResultSet rs = null;
		boolean rc = true;
		try
		{
			stmt = con.createStatement();
		}
		catch (SQLException ex)
		{
			System.out.println("stmt error");
		}
		try
		{
			rs = stmt.executeQuery(sqlState);
		}
		catch (SQLException ex)
		{
			System.out.println("rs error");
		}
		try // get no. of paper -> max
		{
			while (rs.next())
			{
				max_id = rs.getInt(1);
			}
		}
		catch (SQLException ex)
		{
			System.out.println("*****rs.getstring error*****");
		}
		finally // close resultset & statement
		{						
			try
			{ 
				if (rs != null)
				{
					rs.close();
				}
	   			if (stmt != null)
	   			{
					stmt.close();
				}
			}
			catch (Exception ex)
			{
			}
		}
		max_id=max_id+1;			
		if (mainwl.size() <  20)
		{
			limit = mainwl.size();
		}
		// insert index to DB
		status_list.append(" INDEX :"+'\n');
		for (int i=0; i<limit; i++)
		{
			sqlState = "insert into tt_index values("+max_id+",'"+mainwl.get(i)+"')";	
			status_list.append("  "+(String)mainwl.get(i)+'\n');
			try
			{
				stmt = con.createStatement();
				rs=stmt.executeQuery(sqlState);
			}
			catch (SQLException ex)
			{
				System.out.println("stmt error -- can't insert index");
			}
		}
		// insert detail to DB
		url.trim();
		ready_title.trim();
		ready_abstract.trim();
		System.out.println("url :"+url);
		System.out.println("title :"+ready_title);
		System.out.println("abstract :"+ready_abstract);
		sqlState = "insert into tt_describe values("+max_id+",'"
			+ready_title+"','"+ready_abstract+"','"+url+"','"+category+"')";
		try
		{
			stmt = con.createStatement();
			rs=stmt.executeQuery(sqlState);
		}
		catch (SQLException ex)
		{
			System.out.println("stmt error - can't insert detail");
		}
	}

//------------------- CHECK CATEGORY ---------------------------------
	public String check_category()
	{
		int []group =  new int[10];
		final char AGENT =		'0';
		final char AI =			'1';
		final char DATABASE =   '2';
		//final char HARDWARE =   '3';
		final char INFOR =		'4';
		final char NETWORK =    '5';
		final char OS =			'6';
		final char PROGRAMMING ='7';
		final char SECURITY =	'8';
		final char SOFTENG =	'9';

		int j = 0;   // initial count group value
		while (j<10)
		{
			group[j]=0;
			j++;
		}

		if (mainwl.size() <  20)
		{
			limit = mainwl.size();
		}

		for (int i=0; i<limit; i++)
		{
			String sqlState = "select cate from category where word='" + mainwl.get(i) + "'";	
			Statement stmt = null;
		    ResultSet rs = null;
			char cat = ' ';
			boolean rc = true;
			try
			{
				stmt = con.createStatement();
			}
			catch (SQLException ex)
			{
				System.out.println("stmt error");
			}
			try
			{
				rs = stmt.executeQuery(sqlState);
			}
			catch (SQLException ex)
			{
				System.out.println("rs error");
			}
	
			try
			{
				while (rs.next())
				{
					cat = rs.getString(1).charAt(0);
					System.out.println("cat :"+cat);
					switch (cat)
					{
						case AGENT:group[0]=group[0]+Integer.parseInt((String)mainfreql.get(i));
						System.out.println(group[0]);
							break;
						case AI:group[1]=group[1]+Integer.parseInt((String)mainfreql.get(i));
							break;
						case DATABASE:group[2]=group[2]+Integer.parseInt((String)mainfreql.get(i));
							break;
						//case HARDWARE:group[3]=group[3]+Integer.parseInt((String)mainfreql.get(i));
						//	break;
						case INFOR:group[4]=group[4]+Integer.parseInt((String)mainfreql.get(i));
							break;
						case NETWORK:group[5]=group[5]+Integer.parseInt((String)mainfreql.get(i));
							break;
						case OS:group[6]=group[6]+Integer.parseInt((String)mainfreql.get(i));
							break;
						case PROGRAMMING:group[7]=group[7]+Integer.parseInt((String)mainfreql.get(i));
							break;
						case SECURITY:group[8]=group[8]+Integer.parseInt((String)mainfreql.get(i));
							break;
						case SOFTENG:group[9]=group[9]+Integer.parseInt((String)mainfreql.get(i));
							break;
					}
				}
			}
			catch (SQLException ex)
			{
				System.out.println("database access error occurs2");
			}

			finally 
			{						
				try
				{ 
					if (rs != null)
					{
						rs.close();
					}
	   				if (stmt != null)
	   				{
						stmt.close();
		   			}
				}
				catch (Exception ex)
				{
				}
			}
		}
		j=0;
		int group_no=-1;
		int max=group[0];
		while (j<10)
		{
			if (group[j]>max)
			{
				max = group[j];
				group_no=j;
			}
			j++;
		}
		if ((max != 0) && (group_no == -1))// check that agent category?
		{
			group_no=0;
		}
		System.out.println(max+"   "+group_no);
		String category="";
		switch (group_no)
		{
			case -1:category="others";
				break;
			case 0:category="agent";
				break;
			case 1:category="ai";
				break;
			case 2:category="database";
				break;
			//case 3:category="hardware";
			//	break;
			case 4:category="infor";
				break;
			case 5:category="network";
				break;
			case 6:category="os";
				break;
			case 7:category="programming";
				break;
			case 8:category="security";
				break;
			case 9:category="softeng";
				break;
		}
		return category;
	}

// ------------------------ dic linklisted ------------------------------
	public void dic()
	{
		try
		{
			dic = new FileReader("newvocab22.txt");
		}
		catch (FileNotFoundException eee)
		{
		}
		StreamTokenizer stdic = new StreamTokenizer(dic);
		ldic = new LinkedList();
		try
		{	
			while (stdic.nextToken() != StreamTokenizer.TT_EOF)
			{							
				switch(stdic.ttype)
				{
					case StreamTokenizer.TT_WORD : 
					{								
						ldic.add(stdic.sval);								
					}
				}
			}
		}
		catch (IOException e) 
		{
		}
	}
}


//****************************** CLASS MycontentHandler ****************************
class MyContentHandler implements ContentHandler 
{
	CharArrayWriter cw_ti;
	CharArrayWriter cw_ab;
    private Locator locator;
	char abit='0';
	char tbit='0';
	char dbit='0';
	char t_ok='0';
	char a_ok='0';
	char d_ok='0';
	char urlbit='0';
	String url="";
	public String data="";

	MyContentHandler(CharArrayWriter cw_ti,CharArrayWriter cw_ab)
	{
		this.cw_ti = cw_ti;
		this.cw_ab = cw_ab;
		this.url = url;
	}

	public void setDocumentLocator(Locator locator) 
	{
		this.locator = locator;
    }

	public void startDocument() throws SAXException 
	{
    }

    public void endDocument() throws SAXException 
	{
    }
    
	public void processingInstruction(String target, String data) throws SAXException 
	{
		System.out.println("PI: Target:" + target + " and Data:" + data);
    }
  
	public void startPrefixMapping(String prefix, String uri) 
	{
        System.out.println("Mapping starts for prefix " + prefix + " mapped to URI " + uri);
    }

    public void endPrefixMapping(String prefix) 
	{
        System.out.println("Mapping ends for prefix " + prefix);
    }
    
	public void startElement(String namespaceURI, String localName,String rawName, Attributes atts)
        throws SAXException 
	{
	   if(localName.startsWith("title"))
	   {
			tbit='1';
			t_ok='1';
	   }
	   if(localName.startsWith("abstract"))
       {      
			abit='1'; 
			a_ok='1';
	   }	
	   if(localName.startsWith("description"))
	   {
			dbit='1';
			d_ok='1';
	   }
	   if(localName.startsWith("url"))
	   {
			urlbit='1';
	   }
    }
 
    public void endElement(String namespaceURI, String localName,String rawName) 
        throws SAXException 
	{
	}

	public void characters(char[] ch, int start, int end) 
        throws SAXException 
	{
		if ( abit == '1')
		{
	        String s = new String(ch, start, end);
			this.cw_ab.write(s,0,s.length());
			abit='0';
		}

		if ( tbit == '1')
		{
			String s = new String(ch, start, end);
			this.cw_ti.write(s,0,s.length());
		  	tbit='0';
		}
		if (urlbit == '1')
		{
			String s = new String(ch, start, end);
			this.url = s;
			urlbit='0';
		}
    }

	public String geturl()
	{
		return url;
	}

	public char get_tbit()
	{
		return t_ok;
	}

	public char get_abit()
	{
		return a_ok;
	}

	public char get_dbit()
	{
		return d_ok;
	}

    public void ignorableWhitespace(char[] ch, int start, int end)
        throws SAXException 
	{
        String s = new String(ch, start, end);
        System.out.println("ignorableWhitespace: [" + s + "]");
    }

	public void skippedEntity(String name) throws SAXException 
	{
        System.out.println("Skipping entity " + name);
    }
}

//************************** CLASS MyErrorHandler ****************************
class MyErrorHandler implements ErrorHandler  
{
	//--------------------- WARNING --------------------------
	public void warning(SAXParseException exception)
        throws SAXException 
	{
        System.out.println("**Parsing Warning**\n" +
                           "  Line:    " + 
                              exception.getLineNumber() + "\n" +
                           "  URI:     " + 
                              exception.getSystemId() + "\n" +
                           "  Message: " + 
                              exception.getMessage());        
        throw new SAXException("Warning encountered");
    }

	//---------------------ERROR------------------------------
    public void error(SAXParseException exception)
        throws SAXException 
	{
        System.out.println("**Parsing Error**\n" +
                           "  Line:    " + 
                              exception.getLineNumber() + "\n" +
                           "  URI:     " + 
                              exception.getSystemId() + "\n" +
                           "  Message: " + 
                              exception.getMessage());
        throw new SAXException("Error encountered");
    }

	//------------------------FATALERROR------------------------
	public void fatalError(SAXParseException exception)
        throws SAXException 
	{
        System.out.println("**Parsing Fatal Error**\n" +
                           "  Line:    " + 
                              exception.getLineNumber() + "\n" +
                           "  URI:     " + 
                              exception.getSystemId() + "\n" +
                           "  Message: " + 
                              exception.getMessage());        
        throw new SAXException("Fatal Error encountered");        
    }
}


//*********************** Class index - start to Automatic Indexing **********************
class index
{
	LinkedList ll = new LinkedList();
	LinkedList wl = new LinkedList();
    LinkedList freql = new LinkedList();
	LinkedList ldic = new LinkedList();
	Connection con = null;

	index(Connection con)
	{
		this.con = con;
	}
		
	public void ai(char[] char_array,LinkedList mainwl,LinkedList mainfreql,int weight,LinkedList ldic) 
	{	
		FileReader fr=null;
		FileReader cut=null;
		this.ldic=ldic;
		separate(char_array);  // get ll - linkedlist
		cut_stop(cut);		 // get ll - linkedlist no stop word list
		stemming();          // method for stemming -> change to rootword ,connect with Oracle    
		wordlist findfreq = new wordlist();
		findfreq.frequency(ll,wl,freql,mainwl,mainfreql,weight);
		ll.clear();
		wl.clear();
		freql.clear();
	}
	
	public void separate(char[] char_array)
	{	
		CharArrayReader cr = new CharArrayReader(char_array);
		StreamTokenizer st = new StreamTokenizer(cr);
		String tempword = "";
		try
		{	
			st.ordinaryChar(39);
			st.ordinaryChar(34);
			st.ordinaryChar(46);
			while (st.nextToken() != StreamTokenizer.TT_EOF)
			{	
				switch(st.ttype)
				{
					case StreamTokenizer.TT_WORD : 
					{
						st.sval=st.sval.toLowerCase();
						tempword = st.sval;
						if ( (st.sval.charAt(st.sval.length()-1)==('-'))||(st.sval.charAt(st.sval.length()-1)==('­') ))
						{
							tempword = st.sval.substring(0,st.sval.length()-1);
							if (st.nextToken() != StreamTokenizer.TT_EOF)
							{
								if (st.ttype == StreamTokenizer.TT_EOL)
								{
									st.nextToken();				
								}
								tempword = tempword+st.sval;
							}
						}
						else 
						if ( (st.sval.charAt(st.sval.length()-1)==('.') ))
						{ 
							tempword = st.sval.substring(0,st.sval.length()-1);
						}
						ll.add(tempword);
						break;
					}
				//case StreamTokenizer.TT_NUMBER : {System.out.println("sdfs"); break;}
				}
			}			
		}
		catch (IOException e)
		{
		}
	}

	public void cut_stop(FileReader cut)
	{	
		try
		{
			 cut = new FileReader("stop.txt");
		}
		catch (FileNotFoundException eee)
		{
		}

		StreamTokenizer stt = new StreamTokenizer(cut);
		LinkedList lstop = new LinkedList();
		try
		{	
			while (stt.nextToken() != StreamTokenizer.TT_EOF)
			{							
				switch(stt.ttype)
				{
					case StreamTokenizer.TT_WORD : 
					{								
						lstop.add(stt.sval);								
						break;
					}
					//case StreamTokenizer.TT_NUMBER : {System.out.println("sdfs"); break;}
				}
			}
		}
		catch (IOException e) 
		{
		}

		int i=0;
		while (i != ll.size())
		{
			if (lstop.contains(ll.get(i)))
			{
				ll.remove(i);
			}
			else
				i++;
		}
	}

	public void stemming()
	{
		int i=0;
		char set = '0';
		String word="";
		String temp,temp1;
		String s1,s2,s3,s4,s5;
		String Str_Query;	


    	//------------------------------- rules for stemming ---------------------------------

		while (i != ll.size())
		{	
			word = ll.get(i).toString();

			// --------- check word that root word? -----------

			if ((ldic.contains(word)) || (word.indexOf("-") >= 0))
			{
				set = '1';
			}
			else
			{

			// ---------- get 1 last char ----------

			s1= word.substring(word.length()-1,word.length());
			temp = word.substring(0,word.length()-1);
			if ( ((s1.equals("s")) || (s1.equals("d")) || (s1.equals("n")) || (s1.equals("r")) || 
				  (s1.equals("y"))) && (ldic.contains(temp)) )
			{
				ll.set(i,temp);
				set = '1';
			}
			else

			// ---------- get 2 last chars ----------

			if ((word.length()-2) > 0)
			{
				s2 = word.substring(word.length()-2,word.length());
				temp = word.substring(0,word.length()-2);
				if ( ((s2.equals("ed")) || (s2.equals("en")) || (s2.equals("ly")) || (s2.equals("er")) 
					 || (s2.equals("es")) || (s2.equals("ey")) || (s2.equals("or")) || (s2.equals("ee")) 
					 || (s2.equals("rs")) || (s2.equals("al")) || (s2.equals("st")) || (s2.equals("an"))
					 || (s2.equals("ic")) ) 
					 && (ldic.contains(temp)) )
				{
					ll.set(i,temp);
					set = '1';
				}
				else
				{
					temp1 = temp.concat("e");
					if (((s2.equals("al")) || (s2.equals("ic")) || (s2.equals("or")) ) 
					&& (ldic.contains(temp1))) 
					{
						ll.set(i,temp1);
						set = '1';
					}
		 			else

				// ---------- get 3 last chars ----------

				if ((word.length()-3) > 0)
				{
					s3 = word.substring(word.length()-3,word.length());
					temp = word.substring(0,word.length()-3);
					if ( ((s3.equals("ing")) || (s3.equals("ion")) || (s3.equals("ful")) 
						|| (s3.equals("ble")) || (s3.equals("ian")) || (s3.equals("ist")) 
						|| (s3.equals("eer")) || (s3.equals("ous")) || (s3.equals("ish")) 
						|| (s3.equals("ism")) || (s3.equals("ary")) || (s3.equals("dom")) 
						|| (s3.equals("ure")) || (s3.equals("ate")) || (s3.equals("ive"))
						|| (s3.equals("ors")) || (s3.equals("ers")) || (s3.equals("ant"))
						|| (s3.equals("age")) || (s3.equals("led")) || (s3.equals("ted"))
						|| (s3.equals("ity")) || (s3.equals("est")) || (s3.equals("ent"))
						|| (s3.equals("ual")) || (s3.equals("ise")) || (s3.equals("ize"))
						|| (s3.equals("ity")) || (s3.equals("ier")) || (s3.equals("med"))
						|| (s3.equals("ial")) || (s3.equals("ged")) || (s3.equals("ics"))
						|| (s3.equals("ter")) || (s3.equals("ler")) || (s3.equals("ens"))
						|| (s3.equals("ger")) || (s3.equals("ted")) 
						|| (s3.equals("eds"))) 
						&& (ldic.contains(temp)) )
					{
						ll.set(i,temp);
						set = '1';
					}
					else
					{	
						temp1 = temp.concat("y");
						if (((s3.equals("ied")) || (s3.equals("ies")) || (s3.equals("ier"))
						|| (s3.equals("ist"))) 
						&& (ldic.contains(temp1))) 
						{
							ll.set(i,temp1);
							set = '1';
						}
						else 
						{
							temp1 = temp.concat("e");
							if ((s3.equals("ing") || (s3.equals("ion")) || (s3.equals("ive")) 
							|| (s3.equals("ist")) || (s3.equals("ise")) || (s3.equals("ity"))
							|| (s3.equals("ous")) || (s3.equals("ize")) || (s3.equals("ted")) 
							|| (s3.equals("ter")) || (s3.equals("ier")) || (s3.equals("ors"))) 
							 && (ldic.contains(temp1))) 
							{
								ll.set(i,temp1);
								set = '1';
							}
							else

							// ---------- get 4 last chars ----------

							if ((word.length()-4) > 0)
							{
								s4 = word.substring(word.length()-4,word.length());
								temp = word.substring(0,word.length()-4);
								if ( ((s4.equals("ness")) || (s4.equals("less")) || (s4.equals("ancy"))
								 || (s4.equals("ical")) || (s4.equals("ship")) || (s4.equals("ment")) 
								 || (s4.equals("tion")) || (s4.equals("ance")) || (s4.equals("lism")) 
								 || (s4.equals("ence")) || (s4.equals("sion")) || (s4.equals("able")) 
								 || (s4.equals("like")) || (s4.equals("ians")) || (s4.equals("ibly"))
								 || (s4.equals("ions")) || (s4.equals("ings")) || (s4.equals("edly"))
								 || (s4.equals("ting")) || (s4.equals("ency")) || (s4.equals("ably"))
								 || (s4.equals("uate")) || (s4.equals("ally")) || (s4.equals("ible"))
								 || (s4.equals("ated")) || (s4.equals("ming")) || (s4.equals("ling"))
								 || (s4.equals("ator")) || (s4.equals("ping")) || (s4.equals("ious"))
								 || (s4.equals("iest")) || (s4.equals("ging")) || (s4.equals("ized"))
                                 || (s4.equals("ives")) || (s4.equals("izes")) || (s4.equals("isms"))) 
								 && (ldic.contains(temp)) )
								{
									ll.set(i,temp);
									set = '1';
								}
								else
								{
									temp1 = temp.concat("e");
									if ((s4.equals("tion") || (s4.equals("ions")) || (s4.equals("ings"))
  									 || (s4.equals("ment")) || (s4.equals("ical")) || (s4.equals("able")) 
									 || (s4.equals("ably")) || (s4.equals("ance")) || (s4.equals("ious"))
									 || (s4.equals("iest")) || (s4.equals("ants")) || (s4.equals("ives"))) 
									 && (ldic.contains(temp1))) 
									{
										ll.set(i,temp1);
										set = '1';
									}
									else

									// ---------- get 5 last chars ----------

									if ((word.length()-5) > 0)
									{
										s5 = word.substring(word.length()-5,word.length());
										temp = word.substring(0,word.length()-5);
										if ( ((s5.equals("nally")) || (s5.equals("fully")) || 
										   (s5.equals("ingly")) || (s5.equals("ments")) || 
										   (s5.equals("tions")) || (s5.equals("ories")) || 
										   (s5.equals("ional")) || (s5.equals("ation")) || 
										   (s5.equals("tings")) || (s5.equals("ition")) || 
										   (s5.equals("ative")) || (s5.equals("atory")) ||
										   (s5.equals("ively")) || (s5.equals("ating")) || 
										   (s5.equals("eding")) || (s5.equals("ously")) ||
										   (s5.equals("ently")) ) 
										   && (ldic.contains(temp)) )
										{
											ll.set(i,temp);
											set = '1';
										}
										else
										{
											temp1 = temp.concat("e");
											if ((s5.equals("ingly") || (s5.equals("ation")) ||
											(s5.equals("ional")))
											&& (ldic.contains(temp1)))
											{
												ll.set(i,temp1);
												set = '1';
											}
										}
									}
								}
							}
						}
					}
				}
				}
			}
			}
			
			//----------- special word (change form) - connect oracle --------

			if (set != '1')
			{
				Str_Query = "select root from dic where child ='" + word + "'"; 
				root(Str_Query,i,ll);		
				System.out.println("--" + word );
			}
			set = '0';
			i++;
		}
	}

	public void root (String sqlState,int i,LinkedList ll)
	{
		boolean rc = true;
		Statement stmt = null;
	    ResultSet rs = null;
		String rootword="";
		  
		try
		{
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.184:1521:virtual","system", "manager");
			stmt = con.createStatement();
		}
		catch (SQLException ex)
		{
			System.out.println("database access error occurs3");
		}

		try
		{
			rs = stmt.executeQuery(sqlState);
		}
		catch (SQLException ex)
		{
			System.out.println("database access error occurs5");
		}
			
		try
		{
			while (rs.next())
			{
				rootword=rs.getString(1);
				ll.set(i,rootword);
			}
		}
		catch (SQLException ex)
		{
			System.out.println("database access error occurs4");
		}

		finally 
		{						
			try
			{ 
				if (rs != null)
				{
					rs.close();
				}
	   			if (stmt != null)
	   			{
					stmt.close();
	   			}
			}
			catch (Exception ex)
			{
			}
		}
		try
		{
			con.close(); 
		}
		catch (SQLException ex)
		{
		}
	}

}

//************************* find for final linkedlist (mainwl,mainfreql) ***********************
//****************** that mean include 3 linkedlist (abstract,title,description) ***************

class wordlist
{	
	String word;
	
	public void frequency(LinkedList ll,LinkedList wl,LinkedList freql,LinkedList mainwl,
						  LinkedList mainfreql,int weight)
	{	
		int i = 0,j = 0;
		int temp=0;
		int mainfreq=0;
		char bit = '0';
		String m="",n="",word="";
		String fnum="";

		wordlist wlob = new wordlist();
		while (i != ll.size())
		{
			word = ll.get(i).toString();
			wlob.keepwl(word,wl,freql);
			i++;
		}
		
		while (j != wl.size())
		{
			temp=getfreq(freql.get(j),weight);
			int x =0;
			x=mainwl.indexOf(wl.get(j));
			if (x== -1)
			{
				mainwl.add(wl.get(j));
				mainfreql.add((new Integer(temp)).toString());
			}
			else
			{
				mainfreq = getfreq(mainfreql.get(x),1);
				mainfreq = mainfreq+temp;
				mainfreql.set(x,(new Integer(mainfreq)).toString());
			}
			j++;
		}
	}

	public int getfreq(Object freqlgetj,int weight)
	{
		int temp=0;
		Integer fno;

		try
		{	
			fno = new Integer(freqlgetj.toString());
			temp = fno.parseInt(freqlgetj.toString());
			temp = temp*weight;
		}
		catch (NumberFormatException nfe)
		{
		}
		return temp;
	}

	public void keepwl(String word,LinkedList wl,LinkedList freql)
	{	
		int i = 0,j = 0;
		char bit = '0';
		String fnum="";
		Integer fno;
		this.word = word;
		
		while (i != wl.size())
		{	
			if ((word.startsWith(wl.get(i).toString())) && 
				(word.length() == wl.get(i).toString().length()))
			{
				try
				{	
					fno = new Integer(freql.get(i).toString());
					j = fno.parseInt(freql.get(i).toString());
					bit = '1';
					j++;
					freql.set(i,fnum.valueOf(j));
					break;
				}
				catch (NumberFormatException nfe)
				{
				}
			}
			else
			{
				i++;
			}
		}

		if (bit == '0')
		{
			wl.add(word);
			freql.add("1");
		}
		bit = '0';
	}
}

//****************************** sort number by order asc. *****************************

class wordsort
{
	public void sort(LinkedList wl,LinkedList freql)
	{
		int currentMax;
		int currentMaxindex;
		Integer num;
		Integer num1;
		String temps="";
		String wordMax;

		for (int i=freql.size()-1; i>=1; i-- )
		{
			try
			{
				num = new Integer(freql.get(i).toString());
				currentMax = num.parseInt(freql.get(i).toString());
				wordMax = wl.get(i).toString();
				currentMaxindex = i;
				for (int j=i-1; j>=0; j-- )
				{
					num1 = new Integer(freql.get(j).toString());
					if (currentMax > num1.parseInt(freql.get(j).toString()))
					{
						currentMax = num1.parseInt(freql.get(j).toString());
						wordMax = wl.get(j).toString();
						currentMaxindex = j;
					}
				}
				if (currentMaxindex != i)
				{
					freql.set(currentMaxindex,freql.get(i));
					wl.set(currentMaxindex,wl.get(i));
					freql.set(i,temps.valueOf(currentMax));
					wl.set(i,wordMax);
				}
			}
			catch (NumberFormatException nfe)
			{
			}
		}
	}
};

