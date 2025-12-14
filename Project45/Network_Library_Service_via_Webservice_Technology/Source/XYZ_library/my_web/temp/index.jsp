<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html><head><title>Wellcome to Main Library</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body>
<%	
	String id=new String();
	String library=new String();
	String name=new String();
	String passwd=new String();
	int i=0;
	Cookie cookies[];
	Cookie cookie;
	cookies=request.getCookies();
	if(cookies!=null)
	{
		for (i=0;i<cookies.length;i++)
		{
			cookie=cookies[i];
			if ("id".equals(cookie.getName())) {id=cookie.getValue();}
			if ("library".equals(cookie.getName())) {library=cookie.getValue();}
			if ("name".equals(cookie.getName())) {name=cookie.getValue();}
		}
		
	}
%>
<table width="100%" border="0">
  <tr> 
    <td colspan="2"><div align="center"><font size="+3">A 's Main Library </font></div></td>
  </tr>
  <tr> 
    <td width="30%" ><form name="form1" method="post" action="page_one11.jsp">
	<table width="100%" border="0">
        <tr> 
          <td>username</td>
          <td>
              <input name="username" type="text" id="username" size="25" maxlength="20">
            </td>
        </tr>
        <tr> 
          <td>password</td>
          <td>
              <input name="password" type="password" id="password" size="25" maxlength="20">
            </td>
        </tr>
        <tr> 
          <td colspan="2">
              <div align="center"> 
                <label>@Library</label>
                  <select name="library">
                  <option value="ABC library">ABC</option>
                  <option value="XYZ library">XYZ</option>
                </select>
              
                <p>
                  <input type="submit" name="Submit" value="Submit">
                </p>
              </div>
            </td>
        </tr>
      </table>
      
      <p>&nbsp;</p></form>
      <form name="form3" method="post" action="">
        <table width="100%" border="0">
          <tr> 
            <td><div align="center">Register for a new member</div></td>
          </tr>
          <tr> 
            <td> <div align="center"> 
                <input name="registry2" type="submit" id="registry3" value="go">
              </div></td>
          </tr>
        </table>
      </form>
      <p>&nbsp;</p></td>
    <td width="70%"><table width="100%" border="0">
        <tr>
          <td width="81%">&nbsp;</td>
          <td width="19%"><form name="form2" method="post" action="find.jsp">
              <input name="search" type="submit" id="search" value="ค้นหาสื่อสารนิเทศ">
            </form></td>
        </tr>
        <tr>
          <td><form name="form4" method="post" action="">
              <input name="imageField" type="image" src="Center.jpg" width="329" height="264" border="0">
            </form></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>

	
  </tr>
</table>

</body>
</html>
