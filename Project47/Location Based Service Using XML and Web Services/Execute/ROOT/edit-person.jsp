<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=TIS-620" %>

<%
	if ((String)session.getAttribute("user") == null) {
		response.sendRedirect("signup.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Web Map Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#F8F8F8" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/biz_03.gif">
      <tr>
        <td><table width="795" border="0" cellpadding="0" cellspacing="0">
          <tr valign="top">
            <td width="519"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top"><a href="index.htm"><img src="images/biz_01.gif" width="519" height="93" border="0"></a></td>
              </tr>
              <tr>
                <td valign="top"><img src="images/biz_12.gif" width="519" height="19"></td>
              </tr>
            </table></td>
            <td width="276"><table width="276" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="276"><img src="images/biz_02.gif" width="276" height="42"></td>
              </tr>
              <tr>
                <td><table width="276" border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top">
                      <td width="54"><a href="#"><img src="images/sbut_home.gif" alt="Home" width="54" height="51" border="0"></a></td>
                      <td width="10"><img src="images/biz_05.gif" width="10" height="51"></td>
                      <td width="54"><a href="#"><img src="images/sbut_search.gif" alt="Site Search" width="54" height="51" border="0"></a></td>
                      <td width="10"><img src="images/biz_07.gif" width="10" height="51"></td>
                      <td width="54"><a href="#"><img src="images/sbut_contact.gif" alt="Contact us" width="54" height="51" border="0"></a></td>
                      <td width="10"><img src="images/biz_09.gif" width="10" height="51"></td>
                      <td width="54"><a href="#"><img src="images/sbut_faq.gif" alt="Faq" width="54" height="51" border="0"></a></td>
                      <td width="30"><img src="images/biz_11.gif" width="30" height="51"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td><img src="images/biz_13.gif" width="276" height="19"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/biz_20.gif">
      <tr>
        <td valign="top"><table width="775" border="0" cellpadding="0" cellspacing="0">
          <tr valign="top">
            <td width="363"><img src="images/biz_14.gif" width="352" height="46"></td>
            <td width="63"><div align="center"><font color="#FFFFFF" size="4">Search</font></div></td>
            <td width="159"><form name="form1" method="post" action="">
              <input type="text" name="textfield">
            </form></td>
            <td width="110"><form name="form2" method="post" action="">
              <select name="select">
                <option>Bank</option>
                <option>Hospital</option>
                <option>Mall</option>
                <option>Police Station</option>
                <option>Restaurant</option>
              </select>
            </form></td>
            <td width="68"><form name="form3" method="post" action="">
              <input type="submit" name="Submit" value="Search!">
            </form></td>
            <td width="12">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="1024" border="0" cellpadding="0" cellspacing="0">
      <tr valign="top">
        <td width="143"><table width="154" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="154"><a href="main.jsp"><img src="images/button_01.gif" width="154" height="35" border="0"></a></td>
          </tr>
          <tr>
            <td><a href="search-place.jsp"><img src="images/button_02.gif" width="154" height="30" border="0"></a></td>
          </tr>
          <tr>
            <td><a href="add-place.jsp"><img src="images/button_03.gif" width="154" height="30" border="0"></a></td>
          </tr>
          <tr>
            <td><a href="edit-place.jsp"><img src="images/button_04.gif" width="154" height="30" border="0"></a></td>
          </tr>
          <tr>
            <td><a href="search-person.jsp"><img src="images/button_05.gif" width="154" height="30" border="0"></a></td>
          </tr>
          <tr>
            <td><a href="add-person.jsp"><img src="images/button_06.gif" width="154" height="30" border="0"></a></td>
          </tr>
          <tr>
            <td><a href="edit-person.jsp"><img src="images/button_07.gif" width="154" height="30" border="0"></a></td>
          </tr>
        </table>
        <table width="154" height="191" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="151" height="191" valign="top">&nbsp;</td>
              <td width="3"><img src="images/biz_30.gif" width="3" height="191"></td>
            </tr>
          </table></td>
        <td width="881"><table width="884" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="628" height="21">&nbsp;</td>
          </tr>
          <tr>
                <td valign="top"><blockquote>
                  <p><font color="#0000CC" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>::Edit Person:: </strong></font></p>
                  <p>Choose the person you want to edit by entering your person's information below. </p>
                  <blockquote>
					<form method="post" action="edit-person2.jsp">
                    <table width="399" border="0">
                      <tr>
                        <td width="64">Person_ID</td>
                        <td><input name="id" type="text" size="10" maxlength="10"></td>
                      </tr>
                      <tr>
                        <td>Person_Name</td>
                        <td><input name="name" type="text" size="50" maxlength="50"></td>
                      </tr>
                      <tr>
                        <td>Person_Surname</td>
                        <td><input name="surname" type="text" size="50" maxlength="50"></td>
                      </tr>
                      <tr>
                        <td><input name="submit" type="submit" value="Submit"></td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
					</form>
                    <hr align="left" width="70%">
                    <p>&nbsp;                    </p>
                  </blockquote>
                </blockquote></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/biz_33.gif">
      <tr>
        <td><img src="images/biz_32.gif" width="795" height="41" border="0" usemap="#navbar"></td>
      </tr>
    </table></td>
  </tr>
</table>
<map name="navbar">
<area shape="rect" coords="10,15,41,28" href="#" alt="Home">
<area shape="rect" coords="48,15,82,27" href="#" alt="About">
<area shape="rect" coords="91,16,139,26" href="#" alt="Services">
<area shape="rect" coords="149,15,192,27" href="#" alt="Contact">
<area shape="rect" coords="201,16,247,26" href="#" alt="Support">
</map>
</body>
</html>		