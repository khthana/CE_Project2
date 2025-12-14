<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="search.library.com.*" %>

<% //ประกาศ service
	Search_all_Impl proxy = new Search_all_Impl(); 
	Search_allSoap soapProxy = proxy.getsearch_allSoap(); 
	//ประกาศตัวแปร
	String title;
	String author;
	String library;
	int book_record;
	BookList[] books=null;
	String a=new String(request.getParameter("key").getBytes("iso-8859-1"), "tis-620");
	String search_from = request.getParameter("search_from");
	String library_name = request.getParameter("library");
	int t=Integer.parseInt(request.getParameter("start"));
	int c=Integer.parseInt(request.getParameter("c"));  
	int number=c+10;  //  จำนวนในแต่่ละหน้า
	int count=0;
	int i=t;
	try{	
			String detail1 = "ชื่อเรื่อง";
			String detail2 = "ชื่อผู้แต่ง";
			if(search_from.equals("author"))	{ books=soapProxy.searchBookByAuthor(a);  detail1="ชื่อผู้แต่ง"; detail2="ชื่อเรื่อง";	System.out.println("Author");}
			if(search_from.equals("title"))		{ books=soapProxy.searchBookByTitle(a);  		System.out.println("Title");}
			if(search_from.equals("call_num"))	{ books=soapProxy.searchBookByCall_num(a); 	System.out.println("Call Number");}
			if(search_from.equals("words"))		{ books=soapProxy.selectBookByWord(a); 		System.out.println("Word");}
			if(search_from.equals("subject")) 	{ books=soapProxy.searchBookBySubject(a);		System.out.println("Subject");}
			
	System.out.println("**********************************************");
		for (i=t; i<books.length-1; i++){
			library = books[i].getLibrary();
			if (library.equalsIgnoreCase(library_name)||library_name.equalsIgnoreCase("all")){
				count++;	
			}
		}
		
 %>
<html>
<head>
<title>ผลลัพธ์การค้นหา</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body >
	
<table width="100%" border="0">
  <tr> 
    <td> </td>
    <td colspan="7" >&nbsp;</td>
  </tr>
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="147" height="34">
        <param name="movie" value="button2.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button2.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="147" height="34" ></embed> 
      </object></td>
                <td height="50" colspan="2" >&nbsp;</td>
    <td width="15%" >&nbsp;</td>
    <td width="4%" >&nbsp;</td>
    <td width="4%">&nbsp;</td>
    <td width="4%" >&nbsp;</td>
    <td width="31%" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="15%" rowspan="2" align="center"> <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td height="22" colspan="7"><strong><font size="+1">ผลการสืบค้น</font></strong></td>
  </tr>
  <tr> 
    <td width="8%" height="233" colspan="1">&nbsp;</td>
    <td colspan="6"><table width="80%" border="1">
        <tr> 
          <td colspan="5"><form name="form1" method="post" action="abc_search2.jsp">
              <table width="100%" border="0">
                <tr> 
                  <td>&nbsp;</td>
                  <td><select name="search_from">
                      <option value="author">ชื่อผู้แต่ง</option>
                      <option value="title">ชื่อเรื่อง</option>
                      <option value="subject">หัวเรื่อง</option>
                      <option value="words">คำสำคัญ</option>
                      <option value="call_on">เลขเรียกหนังสือ</option>
                    </select></td>
                  <input name="library" type="hidden" value="<%=library_name%>">
                  <input name="start" type="hidden" value="0">
                  <input name="c" type="hidden" value="1">
                  <td><input name="key" type="text" size="40"></td>
                  <td><input type="submit" name="Submit" value="Search"></td>
                </tr>
              </table>
            </form></td>
        </tr>
        <%/*	
		try{	
			String detail1 = "ชื่อเรื่อง";
			String detail2 = "ชื่อผู้แต่ง";
			if(search_from.equals("author"))	{ books=soapProxy.searchBookByAuthor(a);  detail1="ชื่อผู้แต่ง"; detail2="ชื่อเรื่อง";		System.out.println("Author");}
			if(search_from.equals("title"))		{ books=soapProxy.searchBookByTitle(a);  		System.out.println("Title");}
			if(search_from.equals("call_num"))	{ books=soapProxy.searchBookByCall_num(a); 	System.out.println("Call Number");}
			if(search_from.equals("words"))		{ books=soapProxy.selectBookByWord(a); 		System.out.println("Word");}
			if(search_from.equals("subject")) 	{ books=soapProxy.searchBookBySubject(a);		System.out.println("Subject");}
			
	*/%>
        <tr> 
          <td colspan="4" bgcolor="#FFFFFF"><center>
              <%
						if (count>0){
							if (count>10) out.println("ผลลัพธ์ที่ "+c+" - "+(c+9)+" จาก "+count+" เล่ม");
							else out.println("ผลลัพธ์ที่ "+c+" - "+(c+count-1)+" จาก "+(c+count-1)+" เล่ม");
						} else out.println("ไม่พบคำที่ค้นหา");
					%>
            </center></td>
        </tr>
        <tr> 
          <td width="4%" bgcolor="#009966"><div align="center"><font color="#FFFFFF" size="-2"><strong>ลำดับ</strong></font></div></td>
          <td width="38%" bgcolor="#009966"><div align="center"><font color="#FFFFFF" size="-2"><strong><%=detail1%></strong></font></div></td>
          <td width="38%" bgcolor="#009966"><div align="center"><font color="#FFFFFF" size="-2"><strong><%=detail2%></strong></font></div></td>
          <td width="20%" bgcolor="#009966"><div align="center"><font color="#FFFFFF" size="-2"><strong>ห้องสมุด</strong></font></div></td>
        </tr>
        <!-- เริ่มแสดงรายการหนังสือที่ค้นหาได้ -->
        <tr> 
          <%	
					while (t<books.length-1&&c<number){ 
				title = books[t].getTitle();
				author = books[t].getAuthor();
				library = books[t].getLibrary();
				book_record= books[t].getBookRecord();
				System.out.println(title+", "+author+", "+library);
				if (library.equalsIgnoreCase(library_name)||library_name.equalsIgnoreCase("all")){
	   %>
          <td><div align="right"><%=c+". "%></div></td>
          <%	
	  		if(search_from.equals("author")){
	  %>
          <td><a href="abc_search_resualt.jsp?book_record=<%=book_record%>&library=<%=library%> " name="search_resualt1" ><%=author%></a></td>
          <td> <%="  "+title%> </td>
          <%;}else{
	  %>
          <td><a href="abc_search_resualt.jsp?book_record=<%=book_record%>&library=<%=library%> " name="search_resualt1" ><%=" "+title%></a></td>
          <td> <%="  "+author%> </td>
          <% ;}
	  %>
          <td><div align="center"><%=library%></div></td>
        </tr>
        <%
				c++;
				}
				t++;
			}// ของ while
		}catch(Exception e){
			//System.out.println("***************");
			System.out.println(e);
			//System.out.println("***************");
			//System.out.println(t);
			//System.out.println("***************");
			//System.out.println(c);
			//System.out.println("***************");
			//System.out.println(i);
			//System.out.println(books.length);
		} 
	%>
        <!-- สินสุดตารางแสดงรายการหนังสือที่ได้จากการค้นหา -->
      </table>
      <table width="80%" border="0">
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td><div align="center"> </div></td>
          <td> <div align="center"> 
              <% if (t-count-10>=0){%>
              <a href="abc_search2.jsp?key=<%=a%>&start=<%=t-count-10%>&search_from=<%=search_from%>&library=<%=library_name%>&c=<%=c-t%>">ย้อนกลับ</a> 
              <%}else{%>
              <font color="#999999">ย้อนกลับ</font> 
              <%}%>
            </div></td>
          <td><div align="center"> </div></td>
          <td> <div align="center"> 
              <% //out.print(c+", "+count+", "+t+", "+i);
					if (count>10){%>
              <a href="abc_search2.jsp?key=<%=a%>&start=<%=t%>&search_from=<%=search_from%>&library=<%=library_name%>&c=<%=c%>">ถัดไป</a> 
              <%}else{%>
              <font color="#999999">ถัดไป</font> 
              <%}%>
            </div></td>
          <td><div align="center"> </div></td>
        </tr>
      </table>
      <table width="80%" border="0">
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><form name="form2" method="post" action="">
            </form></td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>

</body>

</html>
