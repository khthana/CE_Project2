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
	System.out.println("**********************************************");
	//System.out.println("library_name = "+library_name);
 %>
<html>
<head>
<title>ผลลัพธ์การค้นหา</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body background="BG for page1copy.jpg">
	
<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="5%" height="50" >&nbsp;</td>
    <td width="15%" >&nbsp;</td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button22.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button22.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button18.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button18.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button21.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button21.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button23.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button23.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
  </tr>
  <tr> 
    <td width="30%" rowspan="2" align="center"><table rules="none" bgcolor="#99CCFF"  bordercolor="#FFCC99" width="85%" border="2">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td height="233" colspan="1">&nbsp;</td>
    <td colspan="5"><table width="97%" border="1">
        <tr> 
          <td colspan="4"><form name="form1" method="post" action="">
              <table width="100%" border="0">
                <tr> 
                  <td>&nbsp;</td>
                  <td><select name="select2">
                      <option value="author">ชื่อผู้แต่ง</option>
                      <option value="title">ชื่อเรื่อง</option>
                      <option value="subject">หัวเรื่อง</option>
                      <option value="words">คำสำคัญ</option>
                      <option value="call_on">เลขเรียกหนังสือ</option>
                    </select></td>
                  <td><input name="textfield" type="text" size="40"></td>
                  <td><input type="submit" name="Submit" value="Search"></td>
                </tr>
              </table>
            </form></td>
        </tr>
        <tr> 
          <td width="8%" bgcolor="#3399FF"><div align="center"><font color="#FFFFFF" size="-2"><strong>Num</strong></font></div></td>
          <td width="63%" bgcolor="#3399FF"><div align="center"><font color="#FFFFFF" size="-2"><strong>Detail</strong></font></div></td>
          <td width="11%" bgcolor="#3399FF"><div align="center"><font color="#FFFFFF" size="-2"><strong>years</strong></font></div></td>
          <td width="18%" bgcolor="#3399FF"><div align="center"><font color="#FFFFFF" size="-2"><strong>entries found</strong></font></div></td>
        </tr>
	<!-- เริ่มแสดงรายการหนังสือที่ค้นหาได้ -->
	<%	
			
			//System.out.println(a);
		try{
			if(search_from.equals("author"))	{ books=soapProxy.searchBookByAuthor(a); 		System.out.println("Author");}
			if(search_from.equals("title"))		{ books=soapProxy.searchBookByTitle(a); 		System.out.println("Title");}
			if(search_from.equals("call_num"))	{ books=soapProxy.searchBookByCall_num(a); 	System.out.println("Call Number");}
			if(search_from.equals("words"))		{ books=soapProxy.selectBookByWord(a); 		System.out.println("Word");}
			if(search_from.equals("subject")) 	{ books=soapProxy.searchBookBySubject(a);		System.out.println("Subject");}
			while (t<books.length-1&&c<number){  // length ต้องลบหนึ่งเพราะการ return ผิดพลาด
				title = books[t].getTitle();
				author = books[t].getAuthor();
				library = books[t].getLibrary();
				book_record= books[t].getBookRecord();
				System.out.println(title+", "+author+", "+library);
				//System.out.println("library = "+library);
				if (library.equalsIgnoreCase(library_name)||library_name.equalsIgnoreCase("all")){
	%>
	<tr> 
          			<td><%=c%></td>
          			<td><a href="search_resualt1.jsp?book_record=<%=book_record%>&library=<%=library%> " name="search_resualt1" ><%=title%></a>    <%="/  "+author%>
				</td>
          			<td>&nbsp;</td>
          			<td>&nbsp;</td>
        		</tr>
	<%
				c++;
				}
				t++;
			}// ของ while
		}catch(Exception e){
			System.out.println(e);
			System.out.println(t);
			System.out.println(c);
			System.out.println(books.length);
		} 
	%><!-- สินสุดตารางแสดงรายการหนังสือที่ได้จากการค้นหา -->
        
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="97%" border="0">
        <tr> 
          <td><div align="center"> 
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="50" height="37">
                <param name="movie" value="button28.swf">
                <param name="quality" value="high">
                <embed src="button28.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="50" height="37" ></embed> 
              </object>
            </div></td>
          <td><div align="center">
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="50" height="37">
                <param name="movie" value="button25.swf">
                <param name="quality" value="high">
                <embed src="button25.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="50" height="37" ></embed> 
              </object>
            </div></td>
          <td><div align="center">
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                <param name="movie" value="button29.swf">
                <param name="quality" value="high">
                <param name="base" value=".">
                <embed src="button29.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
              </object>
            </div></td>
          <td><div align="center"> <a href="search_resualtxxx.jsp?key=<%=a%>&start=<%=t%>&search_from=<%=search_from%>&library=<%=library_name%>&c=<%=c%>">หน้าต่อไป</a></div></td>
          <td><div align="center">
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="50" height="37">
                <param name="movie" value="button27.swf">
                <param name="quality" value="high">
                <embed src="button27.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="50" height="37" ></embed> 
              </object>
            </div></td>
        </tr>
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>

</body>

</html>
