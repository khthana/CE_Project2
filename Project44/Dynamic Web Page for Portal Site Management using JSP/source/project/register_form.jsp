<HTML>
<HEAD>
<script language="javascript">
function isProper(string) {
   if (!string) return false;
   var iChars = "*|,\":<>[]{}!`\';()@&$#%~^-+=.? ";

   for (var i = 0; i < string.length; i++) {
      if (iChars.indexOf(string.charAt(i)) != -1)
         return false;
   }
   return true;
} 

function validateForm(form) 
{
   var BeginLetter="abcdefghijklmnopqrstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ"
  //-- Check the User name field, reject if blank.
  if (document.RegisterForm.name.value=="") {
    alert("Please fill in the User name field (begin with a letter, and use only letters (a-z), numbers (0-9), the underscore (_), and No Spaces!)");
    document.RegisterForm.name.focus();
    return(false);
  }
  else if ((isProper(document.RegisterForm.name.value) == false)||(BeginLetter.indexOf(document.RegisterForm.name.value.charAt(0)) <0))
  {
    alert("Please fill in the User name field (begin with a letter, and use only letters (a-z), numbers (0-9), the underscore (_), and No Spaces!)");
    document.RegisterForm.name.focus();
    return(false);
  }

  //-- Check the Password field, reject if blank.
  if (document.RegisterForm.passwd.value=="") {
    alert("Please fill in the Password field(6 charactors only!)");
    document.RegisterForm.passwd.focus();
	return(false);
  }
  else if ((document.RegisterForm.passwd.value.length<6)||(isProper(document.RegisterForm.passwd.value) == false))
  {
    alert("Please fill in the Password field(6 charactors only!)");
    document.RegisterForm.passwd.focus();
	return(false);
  }

  //-- Check the Confirm Password field, reject if blank.
  if (document.RegisterForm.pwdrepeat.value=="") {
    alert("Please fill in the Confirm Password field(6 charactors only!)");
    document.RegisterForm.pwdrepeat.focus();
	return(false);
  }
  else if ((document.RegisterForm.pwdrepeat.value.length<6)||(isProper(document.RegisterForm.pwdrepeat.value) == false))
  {
    alert("Please fill in the Confirm Password field(6 charactors only!)");
    document.RegisterForm.pwdrepeat.focus();
	return(false);
  }

  //-- Reject eMail address if it doesn't contain an @ character.
  var foundAt = document.RegisterForm.email.value.indexOf("@",0);
  if (foundAt < 1) {
    alert ("Incorrect E-mail address field!");
    document.RegisterForm.email.focus();
	return(false);
  }
  else if (document.RegisterForm.email.value.length -
 document.RegisterForm.email.value.indexOf("@") < 4) 
 {
    alert ("Incorrect E-mail address field!");
    document.RegisterForm.email.focus();
	return(false);
  }

  //-- Check the Project Name field, reject if blank.
  if (document.RegisterForm.project.value=="") {
    alert("Please fill in the Your Project Name field!");
    document.RegisterForm.project.focus();
	return(false);
  }

//-- check password and comfirm password is equal
  else if (document.RegisterForm.passwd.value!=document.RegisterForm.pwdrepeat.value)
  {
	alert("Please check your password in Password and Confirm Password fields again");
	document.RegisterForm.passwd.focus();
	return(false);
  }
	return(true);
}
</script>
</HEAD>
<BODY>
<%@ page import="oracle.portal.provider.v1.*,oracle.portal.provider.v1.http.*" session="false" %>
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
Register New User... You should be a computer engineering student in KMIT'L<BR>
Please fill form (all fields are required)...<BR><BR>
<FORM name="RegisterForm" ACTION="<%= HttpPortletRendererUtil.htmlFormActionLink(request,PortletRendererUtil.PAGE_LINK) %>" METHOD="POST" onsubmit="return validateForm(this);">
<%= HttpPortletRendererUtil.htmlFormHiddenFields(request,PortletRendererUtil.PAGE_LINK) %>
<TABLE >
<TR>
<TD align="RIGHT">
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>	User name :
</FONT>
</TD>
<TD><input type="TEXT" name="name" size="30" Maxsize="30">
</TD>
<TD rowspan="2">
<FONT Class="PortletText3">
MUST begin with a letter, and use only letters (a-z), numbers (0-9), the underscore (_), and No Spaces.
</FONT>
</TD>
</TR>
<TR>
<TR>
</TR>
</TR>
<TR>
<TD align="RIGHT">
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Password :
</FONT>
</TD>
<TD>
	<input type="password" name="passwd" size="30" maxlength="6">
</TD>
<TD rowspan="2">
<FONT Class="PortletText3">
MUST be six (6) characters long, may contain numbers (0-9) and upper and lowercase letters (A-Z, a-z), but no spaces. 
</FONT>
</TD>
</TR>
<TR>
</TR>
<TR>
<TD align="RIGHT">
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Confirm Password :
</FONT>
</TD>
<TD>
	<input type="password" name="pwdrepeat" size="30" maxlength="6">
</TD>
</TR>
<TR>
<TD align="RIGHT">
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	E-mail :
</FONT>
</TD>
<TD>
	<input type="TEXT" name="email" size="30" Maxsize="30">
</TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD align="RIGHT">
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Your Project Name :
</FONT>
</TD>
<TD>
	<input type="TEXT" name="project" size="70" Maxsize="80">
</TD>
</TR>
<TR>
<TD align="RIGHT">
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Your Project Year :
</FONT>
</TD>
<TD>
	<SELECT name="ProjectYear">
	<OPTION value="2535">2535</OPTION>
	<OPTION value="2536">2536</OPTION>
	<OPTION value="2537">2537</OPTION>
	<OPTION value="2538">2538</OPTION>
	<OPTION value="2539">2539</OPTION>
	<OPTION value="2540">2540</OPTION>
	<OPTION value="2541">2541</OPTION>
	<OPTION value="2542">2542</OPTION>
	<OPTION value="2543">2543</OPTION>
	<OPTION value="2544">2544</OPTION>
	<OPTION value="2545">2545</OPTION>
	<OPTION value="2546">2546</OPTION>
	</SELECT>
</TD>
</TR>
</TABLE>
<CENTER><input type="SUBMIT" name="submit" value="Register"></CENTER>
</FORM>
<BR>
<CENTER>
You can receive information about this portal site via your e-mail address.
</CENTER>
</FONT>
</BODY>
</HTML>