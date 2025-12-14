<html>
<head>
<title>MODIFY PAPER</title>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<body bgcolor="#FFFFFF" background="pic/background.jpg">
<%@ page language="java" errorPage="error.jsp"  import="java.sql.*,java.util.*"%> 
<%@ page contentType = "text/html;charset=MS874" %> 
<%
	String choose = new String();
	choose = request.getParameter("choose");
	String pname = new String();
	String author = new String();
	String description = new String();
	String index_old = new String();
	
	Connection dbconn;
	String msgout = "";
	// Set up database connection
	try 
	{     // ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
	    String url = "jdbc:odbc:FUZZYIR";
	    Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
	    dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
	    Statement statement = dbconn.createStatement();

	    String query = new String();
	    query = "Select * from PAPER where PNumber='"+choose+"'";
	      ResultSet  resultset = statement.executeQuery(query);
	      while(resultset.next()){
			pname = resultset.getString("PName");
			description = resultset.getString("Description");
			index_old = resultset.getString("IndexRef");
	      }
	
		//out.println("pname : "+pname);
		//out.println("description : "+description);
		//out.println("index old : "+index_old);

		query = "Select AuthorName from Author where PNumber='"+choose+"'";
		resultset = statement.executeQuery(query);
		while(resultset.next()){
			author = author+resultset.getString("AuthorName")+" ,";
		}
		//out.println(author);
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10%"><img src="pic/logo_min.jpg" width="108" height="61"></td>
          <td width="90%">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#3333FF"> 
                <td>
                  <div align="center"><font color="#FFFF33" size="-1"><b>MODIFY 
                    PAPER ID : <%out.println(choose);%></b></font></div>
                </td>
              </tr>
            </table>
          </td>
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
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="6%">&nbsp;</td>
          <td width="89%">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#009999"> 
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%" bgcolor="#99FFFF"><form action="chkupdate.jsp" method="post" ENCTYPE="multipart/form-data">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="22%"><font size="-1"><b>modify 
                                      Paper</b></font></td>
                                    <td colspan="2">&nbsp;</td>
                                  </tr>
                                  <tr> 
                                    <td width="22%"> 
                                      <div align="right"><font size="-1">Title 
                                        : </font></div>
                                    </td>
                                    <td colspan="2"> 
                                      <input type="text" name="pname" size="50" value=<%="'"+pname+"'"%>>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="22%"> 
                                      <div align="right"><font size="-1">Author 
                                        : </font></div>
                                    </td>
                                    <td colspan="2"> 
                                      <input type="text" name="author" size="30" value=<%="'"+author+"'"%>>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="22%" valign="top"> 
                                      <div align="right"><font size="-1">Abstract 
                                        : </font></div>
                                    </td>
                                    <td colspan="2"> 
                                      <textarea name="description" cols="60" rows="5"><%=description%></textarea>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="22%"> 
                                      <div align="right"><font size="-1">Uplad 
                                        New file : </font></div>
                                    </td>
                                    <td colspan="2"> 
                                      <input type="file" name="pdf_file" size="30">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="22%" valign="top"> 
                                      <div align="right"><font size="-1">Index 
                                        Terms : </font></div>
                                    </td>
                                    <td colspan="2"> 
                                    
				      <textarea name="index_new" cols="60" rows="5"><%=index_old%></textarea>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="22%">&nbsp;</td>
                                    <td width="45%"> 
                                      <input type="radio" name="choose_com" value="update" checked>
                                      <font size="-2">Update</font> </td>
                                    <td width="33%">&nbsp;</td>
                                  </tr>
                                  <tr> 
                                    <td width="22%">&nbsp;</td>
                                    <td width="45%"> 
                                      <div align="left"> 
                                    
					<input type="radio" name="choose_com" value="delete"><input type="hidden" name="choose" value=<%="'"+choose+"'"%>>
					<input type="hidden" name = "index_old" value=<%="'"+index_old+"'"%>>
                                        <font size="-2">Delete</font></div>
                                    </td>
                                    <td width="33%"> 
                                      <input type="submit" name="Submit" value="Modify">
                                    </td>
                                  </tr>
                                </table>
                              </form>
                            </td>
                            <td width="2%">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td width="5%">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
<%dbconn.close();
	
 
      }
      catch ( ClassNotFoundException cnfex ) 
      {
            // ดักจับกรณีไม่สามารถเรียกใช้งานคลาสสำหรับติดต่อฐานข้อมูลได้
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
      }
      catch ( SQLException sqlex ) 
      {    // ดักจับกรณ๊คำสั่ง SQL ผิดพลาด
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(sqlex);
      }
      catch ( Exception excp ) 
      {    // ดักจับกรณ๊ทั่วไป
            excp.printStackTrace();
            msgout = excp.toString() ;
      }
%>
</body>
</html>
