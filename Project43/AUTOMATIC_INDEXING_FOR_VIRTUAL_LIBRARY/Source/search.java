
import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
import	java.lang.*;
import  java.net.URL;
import  java.net.MalformedURLException;

public class search extends HttpServlet
{
	LinkedList ldic = null;
	public void doGet (HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException
	{	
		Connection con = null;
		Statement stmt = null;
		ResultSet rs= null;
		ResultSet brs = null;

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		String keyword = req.getParameter("KEYWORD").toLowerCase().trim(); // stem keyword to skey
		String type = req.getParameter ("button");

		try
		{
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
		catch (java.sql.SQLException ko){ out.println("register error");}
		try
		{
			con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.184:1521:virtual","system", "manager");

			stmt = con.createStatement();
			StringTokenizer  key = new StringTokenizer (keyword);
			String state = "";
			String kum = "";
			String show = "";
			String show1 = "";
			String from = "";
			String where = "";
			kum = key.nextToken();
			
			if (type.compareTo("and") == 0)
			{
				state = "t1.ind ='"+stemming(kum,out)+"'";
				from = "tt_index t1";
				where = "t1.no =";
				int j = 2;
				while (key.hasMoreTokens())
				{
					state = state +" and t"+ j + ".ind = '" +stemming(key.nextToken(),out) + "'";
					from = from +", tt_index t"+j ;
					where = where +"t"+j+".no and t1.no =";
					j++;
				}
				from = from +", tt_describe t"+j ;
				where = where + "t"+j+".no";
			}
			else
			{
				state = "ind ='"+stemming(kum,out)+"'";
				from = "tt_index t1, tt_describe t2";
				where = "t1.no = t2.no ";
				while (key.hasMoreTokens())
				{
					state = state +" or " + "ind = '" +stemming(key.nextToken(),out) + "'";
				}
			}
			if (type.compareTo("and") == 0)
			{
				show = keyword;
			}
			else
			{
				StringTokenizer token = new StringTokenizer (keyword);
				show = token.nextToken();
				while (token.hasMoreTokens())
				{
					show1 = show1+ " or "+token.nextToken();
				}
				show = show+show1;
			}
			
			String test = "SELECT title, max(abstract), max(url), max(cate) FROM "+from+" where  "+where+" and ("+state +")  group by title" ;	
//			out.println(keyword);
//			out.println(test);
			rs = stmt.executeQuery(test);								
			
			out.println("<HTML><HEAD><TITLE>::<SEARCH RESULT>::</TITLE><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
			out.println("<style><!-- A:link, A:visited { text-decoration: underline; color: #ffffff}  A:hover { text-decoration: underline;  color :  #ccffff} // --> </style></head>");
			out.println("<BODY bgcolor=\"#FFFFFF\" background=\"http://161.246.5.184/back3.gif\">");
			out.println("<div align=\"center\"><img src=\"http://161.246.5.184/search.gif\" width=\"564\" height=\"94\">");
			out.println("<hr> ");
			out.println("<div align =\"left\"><font size=\"+1\" face=\"Courier New, Courier, mono\" color=\"#FFFFFF\"><B>");
	
			if (rs.next() == false) // cannot  find in DB so find bt in thesaurus
			{
			//------FIND IN THESAURUS-------	
			
				StringTokenizer  key1 = new StringTokenizer (keyword);
				
				String state1 = "";
				String kum1 = "";
				kum1 = key1.nextToken();
				//state1 = "'"+stemming(kum1,out)+"'";
				state1 = "'"+kum1+"'"; 
				while (key1.hasMoreTokens())
				{
					state1 = state1 +" "+ type+" " + "nt = '" +stemming(key1.nextToken(),out) + "'";
				}

//****************************************************************************
				String c_or = "SELECT bt FROM thesaurus where nt =" + state1;
				if (type.compareTo("and") == 0)
				{				
					rs = stmt.executeQuery("SELECT bt FROM thesaurus where nt = '"+ keyword+"'");
//					out.println("SELECT bt FROM thesaurus where nt = '"+ keyword+"'");
				}
				else // select or
				{
					rs = stmt.executeQuery(c_or);
//					out.println(c_or);
				}
	
				if (rs.next() == false) // cannot find bt
				{									
					out.println("<LI> NO DOCUMENT BECAUSE CANNOT FIND BROADER TERM");
				}
				else // find bt in db
				{		 
					Vector broaderlist = new Vector();
					broaderlist.add(rs.getString(1));
					while (rs.next())
					{
//						out.println("put word in broaderlist");
						broaderlist.add(rs.getString(1));
					}

					String b="";
					String showb ="";
					String showb2 ="";
					String oh ="";
					String bfrom ="";
					String bwhere = "";
					Enumeration benum = broaderlist.elements();
					
					while (benum.hasMoreElements())
					{
//						out.println("*********in loop bnum********");
						String broader = (String) benum.nextElement();
//						out.println(broader);
						showb = broader;
						StringTokenizer bt = new StringTokenizer(broader);
						b = "t1.ind ='"+bt.nextToken()+"'";
//						out.println(b);
						bfrom = "tt_index t1";
						bwhere = "t1.no =";
						int k = 2;					

						while (bt.hasMoreTokens())
						{
//							out.println("====in loop cut broader===");
							b = b + "and t"+ k+".ind = '" +bt.nextToken()+"'";
							bfrom = bfrom +", tt_index t"+k;
							bwhere = bwhere +"t"+k+".no and t1.no =";
							k++;
						}					
						bfrom = bfrom+", tt_describe t"+k;
						bwhere = bwhere +"t"+k+".no ";
						brs = stmt.executeQuery("SELECT title, max(abstract), max(url), max(cate) FROM "+bfrom+" where  "+bwhere+" and ("+b +") group by title" );
//						out.println("from "+bfrom+" where  "+bwhere+"and "+b);

						if (brs.next() == false) // cannot find bt in DB
						{
							out.println("<LI> NO DOC BECAUSE CANNOT FIND BROADER TERM IN DATABASE");
						}
						else
						{	
							out.println ("<BR><font face=\"Courier New, Courier, mono\" color=\"#ffffFF\" size=\"+2\"><b>Couldn't find \""+ show +"\" in Database so find \""+ showb +"\" instead !!! </b></font></td><br>");
							out.println ("<table width=\"74%\" border=\"0\">");
							out.println ("<br><tr>");
							out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>TITLE    :<font color=\"#FFFFFF\"></font></b></font></td>");
							out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ brs.getString("title") +"</font></b></font></td>");
							out.println ("</tr>");
							out.println ("<tr>");
							out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>CATEGORY :<font color=\"#FFFFFF\"></font></b></font></td>");
							out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ brs.getString("max(cate)") +"</font></b></font></td>");
							out.println ("</tr>");
							out.println ("<tr>");
							out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>ABSTRACT :<font color=\"#FFFFFF\"></font></b></font></td>");
							out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ brs.getString("max(abstract)") +"</font></b></font></td>");
							out.println ("</tr>");
							out.println ("<tr>");
							out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>URL      :<font color=\"#FFFFFF\"></font></b></font></td>");
							out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\"> <A HREF = \"http://161.246.5.184/webapps/servlet/show1?URL="+ brs.getString("max(url)")+"\">"+brs.getString("max(url)")+"</A></font></b></font></td>");
							out.println ("</tr>");
							out.println ("</table><BR><br><hr>");
						
							while (brs.next())  //other bt in db
							{
							
								out.println ("<table width=\"74%\" border=\"0\">");
								out.println ("<br><tr>");
								out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>TITLE    :<font color=\"#FFFFFF\"></font></b></font></td>");
								out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ brs.getString("title") +"</font></b></font></td>");
								out.println ("</tr>");
								out.println ("<tr>");
								out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>CATEGORY :<font color=\"#FFFFFF\"></font></b></font></td>");
								out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ brs.getString("max(cate)") +"</font></b></font></td>");
								out.println ("</tr>");
								out.println ("<tr>");
								out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>ABSTRACT :<font color=\"#FFFFFF\"></font></b></font></td>");
								out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ brs.getString("max(abstract)") +"</font></b></font></td>");
								out.println ("</tr>");
								out.println ("<tr>");
								out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>URL      :<font color=\"#FFFFFF\"></font></b></font></td>");
								out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\"> <A HREF = \"http://161.246.5.184/webapps/servlet/show1?URL="+ brs.getString("max(url)")+"\">"+brs.getString("max(url)")+"</A></font></b></font></td>");
								out.println ("</tr>");
								out.println ("</table><BR><br><hr>");
							}
						}
					}
				}
			} 
		
			else  // can find in DB
			{					
				out.println ("<BR><font face=\"Courier New, Courier, mono\" color=\"#ffffFF\" size=\"+2\"><b>Result for keyword = \""+ show +"\" </b></font></td><br>");
				out.println ("<table width=\"74%\" border=\"0\">");
				out.println ("<br><tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>TITLE    :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("title") +"</font></b></font></td>");
				out.println ("</tr>");
				out.println ("<tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>CATEGORY :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("max(cate)") +"</font></b></font></td>");
				out.println ("</tr>");
				out.println ("<tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>ABSTRACT :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("max(abstract)") +"</font></b></font></td>");
				out.println ("</tr>");
				out.println ("<tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>URL      :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\"> <A HREF = \"http://161.246.5.184/webapps/servlet/show1?URL="+ rs.getString("max(url)")+"\">"+rs.getString("max(url)")+"</A></font></b></font></td>");
				out.println ("</tr>");
				out.println ("</table><BR><br><hr>");
						
				
				while (rs.next())
				{					
					out.println ("<table width=\"74%\" border=\"0\">");
					out.println ("<br><tr>");
					out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>TITLE    :<font color=\"#FFFFFF\"></font></b></font></td>");
					out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("title") +"</font></b></font></td>");
					out.println ("</tr>");
					out.println ("<tr>");
					out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>CATEGORY :<font color=\"#FFFFFF\"></font></b></font></td>");
					out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("max(cate)") +"</font></b></font></td>");
					out.println ("</tr>");
					out.println ("<tr>");
					out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>ABSTRACT :<font color=\"#FFFFFF\"></font></b></font></td>");
					out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("max(abstract)") +"</font></b></font></td>");
					out.println ("</tr>");
					out.println ("<tr>");
					out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>URL      :<font color=\"#FFFFFF\"></font></b></font></td>");
					out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\"> <A HREF = \"http://161.246.5.184/webapps/servlet/show1?URL="+ rs.getString("max(url)")+"\">"+rs.getString("max(url)")+"</A></font></b></font></td>");
					out.println ("</tr>");
					out.println ("</table><BR><br><hr>");
						
				}
			}
			out.println("</div></div></BODY></HTML>");
		}
		catch (Exception exx)
		{
			out.println("Couldn't load DB driver : " + exx.getMessage());
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
				if (con != null)
				{
					con.close();
				}
			}
			catch ( SQLException ignored) {}
		}
	}
	
	public String stemming(String keyword,PrintWriter out)
	{
		char set = '0';
		String word=new String(keyword);
		String temp,temp1;
		String s1,s2,s3,s4,s5;
		String Str_Query;
		
		dic(out);

    	//------------------------------- rules for stemming ---------------------------------

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
				word = temp;
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
					word = temp;
					set = '1';
				}
				else
				{
					temp1 = temp.concat("e");
					if (((s2.equals("al")) || (s2.equals("ic")) || (s2.equals("or")) ) 
					&& (ldic.contains(temp1))) 
					{						
						word = temp1;
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
						word = temp;
						set = '1';
					}
					else
					{	
						temp1 = temp.concat("y");
						if (((s3.equals("ied")) || (s3.equals("ies")) || (s3.equals("ier"))
						|| (s3.equals("ist"))) 
						&& (ldic.contains(temp1))) 
						{						
							word = temp1;
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
								word = temp1;
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
									word = temp;
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
										word = temp1;
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
											word = temp;
											set = '1';
										}
										else
										{
											temp1 = temp.concat("e");
											if ((s5.equals("ingly") || (s5.equals("ation")) ||
											(s5.equals("ional")))
											&& (ldic.contains(temp1)))
											{
												word = temp1;
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
				root(Str_Query,word);		
				System.out.println("--" + word );
			}
			set = '0';
			return word;
	}

	public void dic(PrintWriter out)
	{
		URL url = null;
		BufferedReader buffer_dic = null;
		try
		{
			url = new URL ("http://161.246.5.184/newvocab22.txt"); 
		}
		catch(MalformedURLException e)
		{
			out.println("cannot new URL");
			System.out.println("cannot new URL");
		}
		try
		{
			buffer_dic = new BufferedReader (new InputStreamReader(url.openStream()));
		}
		catch(IOException ex)
		{
			out.println("cannot new dic");
			System.out.println("cannot new dic");
		}
	
		StreamTokenizer stdic;
		stdic = new StreamTokenizer(buffer_dic);
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

	public void root (String sqlState,String word)
	{
		boolean rc = true;
		Statement stmt = null;
	    ResultSet rs = null;
		String rootword="";
		Connection con = null; 

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
				//System.out.println("root:"+ rootword);
				word = rootword;
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
	}

}