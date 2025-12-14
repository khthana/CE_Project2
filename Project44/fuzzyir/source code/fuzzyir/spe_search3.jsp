<html>
<head>
<title> SPECIFIC SEARCH </title>
<Style>
a:link { Color:blue; TEXT-DECORATION: none }
a:visited { Color:blue; TEXT-DECORATION: none } 
a:hover { Color:red; TEXT-DECORATION: none }
a:active { TEXT-DECORATION: none }

</Style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF">
<%@ page language="java" errorPage="error.jsp"  import="java.sql.*,java.util.*"%> 
<%
	String author = new String();
	String pname = new String();
	String description = new String();
	//Vector vector_author = new Vector();
	author = request.getParameter("author");
	pname = request.getParameter("pname");
	description = request.getParameter("description");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="20%"><img src="pic/logo_min.jpg" width="163" height="101"></td>
    <td width="80%"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr bordercolor="#FFFFFF" bgcolor="#3333FF"> 
          <td nowrap> 
            <div align="center"><font color="#FFFF66">Spicific Search</font></div>
          </td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
<%
	Connection dbconn;
	String msgout = "";
      // Set up database connection
	try {// ÊèÇ¹µÔ´µèÍ¡Ñº°ÒÒ¹¢éÍÁÙÅ â´Â¡ÒÃãªé JDBC-ODBC
		String url = "jdbc:odbc:FUZZYIR";
		Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
		dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
		Statement statement = dbconn.createStatement();
		if(((pname!=null)&&(pname.length()>0))||((description!=null)&&(description.length()>0))||((author!=null)&&(author.length()>0))){
			String query = "Select * from PAPER ";
			if(((pname!=null)&&(pname.length()>0))||((description!=null)&&(description.length()>0))){
				query = query+"where ";
				if((pname!=null)&&(pname.length()>0)){
					query = query+"PName Like '%"+pname+"%' and ";
				}
				if((description!=null)&&(description.length()>0)){
					query = query+"Description Like '%"+description+"%' and ";
				}
				query=query.substring(0,query.length()-5);
			}
			ResultSet  resultset_show = statement.executeQuery(query);


			while(resultset_show.next()){ 
				String tmp_pnumber=resultset_show.getString("PNumber");
				String tmp_pname=resultset_show.getString("PName");
				String tmp_description=resultset_show.getString("Description");
				String tmp_location=resultset_show.getString("Location");
				if((author!=null)&&(author.length()>0)){
					Statement statement2= dbconn.createStatement();
					String sql_author="select AuthorName from AUTHOR where AuthorName Like '%"+author+"%' and PNumber='"+tmp_pnumber+"'";
					ResultSet  resultset_author = statement2.executeQuery(sql_author);
					if(resultset_author.next()){
						out.println(" "+tmp_pname+" Author : "+resultset_author.getString("AuthorName")+" ,");
						while(resultset_author.next()){
							out.println(resultset_author.getString("AuthorName")+" ,");
						}
					}
			
				}
	
				if((author==null)||(author.length()==0)){
					Statement statement2= dbconn.createStatement();
					String sql_author="select AuthorName from AUTHOR where PNumber='"+tmp_pnumber+"'";
					ResultSet  resultset_author = statement2.executeQuery(sql_author);
					if(resultset_author.next()){%>
						//out.println(" "+tmp_pname+" Author : "+resultset_author.getString("AuthorName")+" ,");
						<table 
						<%while(resultset_author.next()){
							out.println(resultset_author.getString("AuthorName")+" ,");
						}
					}
				}
			}	
		}
  
	dbconn.close();
	}
	catch ( ClassNotFoundException cnfex ) 
	{
            // ´Ñ¡¨Ñº¡Ã³ÕäÁèÊÒÁÒÃ¶àÃÕÂ¡ãªé§Ò¹¤ÅÒÊÊÓËÃÑºµÔ´µèÍ°Ò¹¢éÍÁÙÅä´é
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
	}
	catch ( SQLException sqlex ) 
	{// ´Ñ¡¨Ñº¡Ã³ê¤ÓÊÑè§ SQL ¼Ô´¾ÅÒ´
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(sqlex);
      }
      catch ( Exception excp ) 
      {    // ´Ñ¡¨Ñº¡Ã³ê·ÑèÇä»
            excp.printStackTrace();
            msgout = excp.toString() ;
      }
%>
</body>
</html>
