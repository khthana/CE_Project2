<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean id="viewf" class="insert.add_fac" />
 	<jsp:setProperty name="viewf" property="fac" />
	<jsp:getProperty name="viewf" property="view" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function del() {
	document.form2.del.click();
}
</script>
</HEAD>
<BODY leftMargin=0 topMargin=0 off autocompleted marginwidth="0"  marginheight="0">
<table width="100%"  height="100%" border=0   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG">
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td colspan="2">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
  <tr valign="top">
    <td><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr>
    <td height="480"><table width="100%" border="0" >
<form name="form1" method="post" action="editfacre.jsp">
 <input name="fac" type="hidden" value="<%=viewf.getFac()%>">
  <tr>
    <td height="30" colspan="2">&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609; / &#3588;&#3603;&#3632; <a href="addfac.jsp">add</a> <a href="viewfac.jsp">view</a></td>
  </tr>
  <tr>
    <td height="356" colspan="2"><table width="80%" border="0">
      <tr>
        <td height="35" colspan="4">&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609; / &#3588;&#3603;&#3632;</td>
      </tr>
      <tr>
        <td width="172" height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
        <td width="285" height="35"><input name="tname" type="text" value="<%= viewf.getTname() %>" size="40" maxlength="50"></td>
        <td width="86" height="35">&#3594;&#3639;&#3656;&#3629;&#3618;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
        <td width="536" height="35"><input name="tabb" type="text" value="<%= viewf.getTabb() %>"size="17" maxlength="15"></td>
      </tr>
      <tr>
        <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
        <td height="35"><input name="ename" type="text" value="<%= viewf.getEname() %>"size="40" maxlength="50"></td>
        <td height="35">&#3594;&#3639;&#3656;&#3629;&#3618;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
        <td height="35"><input name="eabb" type="text" value="<%= viewf.getEabb() %>"size="17" maxlength="15"></td>
      </tr>
    </table>
	<table width="80%" border="0">
        <tr>
          <td height="35" colspan="2">&#3588;&#3603;&#3632;&#3610;&#3604;&#3637;</td>
          <td height="35" colspan="2">&#3609;&#3634;&#3618;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;</td>
          </tr>
        <tr>
          <td width="108" height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
          <td width="231" height="35"><input name="tdean" type="text" value="<%= viewf.getTdean() %>"size="30" maxlength="80"></td>
          <td width="108" height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
          <td width="232" height="35"><input name="tregis" type="text" value="<%= viewf.getTregis() %>"size="30" maxlength="80"></td>
        </tr>
        <tr>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td height="35"><input name="edean" type="text" value="<%= viewf.getEdean() %>"size="30" maxlength="80"></td>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td height="35"><input name="eregis" type="text" value="<%= viewf.getEregis() %>"size="30" maxlength="80"></td>
        </tr>
        <tr>
          <td height="35" colspan="4">&#3612;&#3641;&#3657;&#3648;&#3595;&#3655;&#3609;&#3607;&#3619;&#3634;&#3609;&#3626;&#3619;&#3636;&#3611;&#3607;&#3660;</td>
          </tr>
        <tr>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
          <td height="35"><input name="tauth" type="text" value="<%= viewf.getTauth() %>"size="30" maxlength="80"></td>
          <td height="35">&#3605;&#3635;&#3649;&#3627;&#3609;&#3656;&#3591;(&#3652;&#3607;&#3618;)</td>
          <td height="35"><input name="tauthrank" type="text" value="<%= viewf.getTauthrank() %>"size="30" maxlength="80"></td>
        </tr>
        <tr>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td height="35"><input name="eauth" type="text" size="30" value="<%= viewf.getEauth() %>"maxlength="80"></td>
          <td height="35">&#3605;&#3635;&#3649;&#3627;&#3609;&#3656;&#3591;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td><input name="eauthrank" type="text" size="30" value="<%= viewf.getEauthrank() %>"maxlength="80"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="30"  width="80%"><div align="right">
      <input type="submit" name="apply" value="apply" align="right">
      <input type="button" name="del2" value="delete" onClick="del()">
</div></td>
    <td >&nbsp;</td>
  </tr>
  </form>   
</table>
<form name="form2" method="post" action="delfacre.jsp">
 <input name="fac2" type="hidden" value="<%=viewf.getFac()%>">
 <div  style="{visibility:hidden;}"> 
 <input type="submit" name="del" >
 </div>
 </form>
	 </td>
  </tr>
</table>
	</td>
  </tr>
  <tr valign="bottom">
    <td height="10%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
