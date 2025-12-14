<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body>
<jsp:include page="popup.jsp" flush="false"></jsp:include>
<form name="form1" method="post" action="addfacre.jsp">
<table width="702" border="0" >
  <tr>
    <td height="30" bgcolor="#99FF99">&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609; / &#3588;&#3603;&#3632; <a href="viewfac.jsp">view</a></td>
  </tr>
  <tr>
    <td height="356" bgcolor="#CCFFCC"><table width="697" border="0">
      <tr>
        <td height="35" colspan="4">&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609; / &#3588;&#3603;&#3632; </td>
      </tr>
      <tr>
        <td width="108" height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
        <td width="275" height="35"><input name="tname" type="text" size="40" maxlength="50"></td>
        <td width="108" height="35">&#3594;&#3639;&#3656;&#3629;&#3618;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
        <td width="188" height="35"><input name="tabb" type="text" size="17" maxlength="15"></td>
      </tr>
      <tr>
        <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
        <td height="35"><input name="ename" type="text" size="40" maxlength="50"></td>
        <td height="35">&#3594;&#3639;&#3656;&#3629;&#3618;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
        <td height="35"><input name="eabb" type="text" size="17" maxlength="15"></td>
      </tr>
    </table>
	<table width="697" border="0">
        <tr>
          <td height="35" colspan="2">&#3588;&#3603;&#3632;&#3610;&#3604;&#3637;</td>
          <td height="35" colspan="2">&#3609;&#3634;&#3618;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;</td>
          </tr>
        <tr>
          <td width="108" height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
          <td width="231" height="35"><input name="tdean" type="text" size="30" maxlength="80"></td>
          <td width="108" height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
          <td width="232" height="35"><input name="tregis" type="text" size="30" maxlength="80"></td>
        </tr>
        <tr>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td height="35"><input name="edean" type="text" size="30" maxlength="80"></td>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td height="35"><input name="eregis" type="text" size="30" maxlength="80"></td>
        </tr>
        <tr>
          <td height="35" colspan="4">&#3612;&#3641;&#3657;&#3648;&#3595;&#3655;&#3609;&#3607;&#3619;&#3634;&#3609;&#3626;&#3619;&#3636;&#3611;&#3607;&#3660;</td>
          </tr>
        <tr>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3652;&#3607;&#3618;)</td>
          <td height="35"><input name="tauth" type="text" size="30" maxlength="80"></td>
          <td height="35">&#3605;&#3635;&#3649;&#3627;&#3609;&#3656;&#3591;(&#3652;&#3607;&#3618;)</td>
          <td height="35"><input name="tauthrank" type="text" size="30" maxlength="80"></td>
        </tr>
        <tr>
          <td height="35">&#3594;&#3639;&#3656;&#3629;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td height="35"><input name="eauth" type="text" size="30" maxlength="80"></td>
          <td height="35">&#3605;&#3635;&#3649;&#3627;&#3609;&#3656;&#3591;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td><input name="eauthrank" type="text" size="30" maxlength="80"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#CCFFCC" ><div align="right">
      <input type="submit" name="apply" value="add" align="right">
    </div></td>
  </tr>
</table>
</form>   
</body>
</html>
