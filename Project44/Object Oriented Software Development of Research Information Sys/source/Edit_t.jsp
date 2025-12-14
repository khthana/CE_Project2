<html>
<head>
<title>Edit_t</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
<%@  page session="true"  %>
<%@  include file ="checksessionT.inc" %>
<%
		String tid = request.getParameter("tid");
		String tcode= request.getParameter("tcode");
		String tnamet= request.getParameter("tnamet");
		String tsurt= request.getParameter("tsurt");
		String acadt= request.getParameter("acadt");
		String oldadd= request.getParameter("oldadd");
		String oldstate = request.getParameter("oldstate");
		String oldcountry= request.getParameter("oldcountry");
		String oldtel=request.getParameter("oldtel");
		String oldemail= request.getParameter("oldemail");
		String oldzip= request.getParameter("oldzip");
		String oldfax= request.getParameter("oldfax");
		String oldurl =request.getParameter("oldurl");

%>
</head>

<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
  <form name="editteacher" action="Tedit.jsp" >
    <tr> 
      <td bgcolor="#FFCC66"> 
          <div align="center"><font size="4"><b><font size="6" color="#0000FF" face="Cordia New, CordiaUPC">แก้ไขข้อมูลส่วนตัว</font></b> 
            </font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="4%" height="42">&nbsp;</td>
              <td width="96%" height="42"><font face="Cordia New, CordiaUPC" size="4" color="#000000"></font></td>
            </tr>
            <tr> 
              <td width="4%" height="42"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%" height="42"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=acadt%><%=tnamet%></font></td>
                    <td width="74%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tsurt%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font> 
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ที่อยู่</font></td>
                    <td width="86%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="hidden" name="tid" value="<%=tid%>">
                      <input type="text" name="add" size="80">
                      <input type="hidden" name="oldadd" value="<%=oldadd%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">จังหวัด</font></td>
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="state" size="20">
                      <input type="hidden" name="oldstate" value="<%=oldstate%>">
                      </font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประเทศ</font></td>
                    <td width="50%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="country" size="20">
                      <input type="hidden" name="oldcountry" value="<%=oldcountry%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%" height="38"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสไปรษณีย์</font></td>
                    <td width="86%" height="38"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="zip" size="20">
                      <input type="hidden" name="oldzip" value="<%=oldzip%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">เบอร์โทรศัพท์</font></td>
                    <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="tel" size="20">
                      <input type="hidden" name="oldtel" value="<%=oldtel%>">
                      </font></td>
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อีเมล์</font></td>
                    <td width="44%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="email" size="30">
                      <input type="hidden" name="oldemail" value="<%=oldemail%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">FAX</font></td>
                    <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="fax" size="20">
                      <input type="hidden" name="oldfax" value="<%=oldfax%>">
                      </font></td>
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">URL</font></td>
                    <td width="44%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="url" size="30">
                      <input type="hidden" name="oldurl" value="<%=oldurl%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font> 
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok22" value="submit">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
	</form>
  </table>
</div>

</body>
</html>
