<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import="var.VarDB" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<style type="text/css" >
	DIV.DMenu {
	visibility:hidden; position:absolute;
	}
</style>
<script language="javascript" src="js/sub.js"></script>
<script language="javascript" >
function showd(d) {
	dm1.style.visibility="hidden"; dm1.style.position="absolute";
	dm2.style.visibility="hidden"; dm2.style.position="absolute";
	dm3.style.visibility="hidden"; dm3.style.position="absolute";
	d.style.visibility="visible"; d.style.position="static";
}
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
function adds(p) {
	win2=window.open(p,'fullscreen','toolbar=0,location=0,directories=0,resizeable=0,width=640,height=480') ;
}
function edits() {
}
</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0"  onLoad="showd(dm1)">
<table width="100%"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
    <td colspan="2" ><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top">
  	<td colspan="2">
	<form name="form1" method="post" action="addsubre.jsp">
	 <table  border="0">
	 	<tr>
			<td colspan="4">
			รายวิชา <a href="editsub.jsp">edit</a> | <a href="delete.jsp">delete</a>
			</td>
		</tr>
        <tr>
          <td width="100">&#3619;&#3627;&#3633;&#3626;&#3623;&#3636;&#3594;&#3634;</td>
          <td width="250"><input type="text" name="subid" onKeyPress="nochar()"></td>
          <td width="100">&nbsp;</td>
          <td width="250">&nbsp;</td>
        </tr>
        <tr>
          <td>&#3594;&#3639;&#3656;&#3629;&#3623;&#3636;&#3594;&#3634;(&#3652;&#3607;&#3618;)</td>
          <td><input type="text" name="tname"></td>
          <td>&#3594;&#3639;&#3656;&#3629;&#3623;&#3636;&#3594;&#3634;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td><input type="text" name="ename"></td>
        </tr>
        <tr>
          <td>&#3588;&#3603;&#3632;</td>
          <td>
		<select name="facid">
		<%
		String str; int id;
		VarDB v = new VarDB();
		try {
			Class.forName(v.JDBCNAME).newInstance();
		}
		catch (Exception ex) {
			out.println("not complete");
		}
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select  FACID,TNAME from faculty;";
			Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				id = rs.getInt("FACID");
				out.print("<option value=\""+ id+"\">"+str+"</option>" + "\n");
			}
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>
      </select>		  
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
	</table>
	<table >
        <tr>
          <td width="100">&#3619;&#3632;&#3604;&#3633;&#3610;</td>
          <td width="250" rowspan="3" valign="top" align="left">
           <label>
            <input type="radio" name="level" value="1" checked>
            </label>
            &#3652;&#3617;&#3656;&#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;<br>
            <label>
            <input type="radio" name="level" value="2">
  &#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;&#3623;&#3636;&#3607;&#3618;&#3634;&#3609;&#3636;&#3614;&#3609;&#3608;&#3660;</label>
            <br>
            <label>
            <input type="radio" name="level" value="3">
  &#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;&#3611;&#3619;&#3632;&#3617;&#3623;&#3621;&#3588;&#3623;&#3634;&#3617;&#3619;&#3641;&#3657;</label>
            <br>
            <label>
            <input type="radio" name="level" value="4">
  &#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;&#3616;&#3634;&#3625;&#3634;&#3605;&#3656;&#3634;&#3591;&#3611;&#3619;&#3632;&#3648;&#3607;&#3624;</label>
            <br>
          </td>
          <td width="100" rowspan="2" valign="top">&#3623;&#3636;&#3594;&#3634;&#3610;&#3633;&#3591;&#3588;&#3633;&#3610;&#3585;&#3656;&#3629;&#3609;</td>
          <td width="250" rowspan="3" valign="top">
            <select name="psub" size="6">
                <option>วิชาบังคับก่อน</option>
            </select>
			<input type="hidden" name="psubid"  value=""><input type="hidden" name="psubid"  value="">
			<input type="hidden" name="psubid"  value=""><input type="hidden" name="psubid"  value="">
			<input type="hidden" name="psubid"  value=""><input type="hidden" name="psubid"  value="">
			<input type="hidden" name="psubid"  value=""><input type="hidden" name="psubid"  value="">
			<input type="hidden" name="psubid"  value=""><input type="hidden" name="psubid"  value="">
		</td>
        </tr>
        <tr>
          <td height="37">&nbsp;</td>
          </tr>
        <tr>
          <td height="39">&nbsp;</td>
          <td><input type="button" name="add" value="add" onClick="preadd(document.form1.psubid,document.form1.psub,document.form1.tmp)"></td>
          </tr>
        <tr>
          <td height="28" colspan="2">
		  
		  ทฤษฏี 
		    <input name="lecture" type="text" onKeyPress="nochar()" value="0" size="5" maxlength="2"> 
		    :
		  ปฏิบัติ <input name="lab" type="text" onKeyPress="nochar()" value="0" size="5" maxlength="2">		  </td>
          <td><input type="button" name="delete" value="delete" onClick="predel(document.form1.psubid,document.form1.psub,document.form1.tmp)"></td>
          <td width="250"><input type="text" name="tmp" onKeyPress="nochar()"></td>
        </tr>
		<tr>
			<td colspan="4">
				<input type="checkbox" name="term1" value="1" onClick="active2(document.form1)"><a href="javascript:void(0)" onClick="showd(dm1)">ภาคต้น</a>
				<input type="checkbox" name="term2" value="1" onClick="active2(document.form1)"><a href="javascript:void(0)" onClick="showd(dm2)">ภาคปลาย</a>
				<input type="checkbox" name="term3" value="1" onClick="active2(document.form1)"><a href="javascript:void(0)" onClick="showd(dm3)">ภาคฤดูร้อน</a>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<div  class="DMenu" id="dm1">  <table width="100%" border="0">
        <tr>
          <td width="98" height="28">&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610;</td>
          <td width="40">&#3623;&#3633;&#3609;</td>
          <td width="40">&#3648;&#3604;&#3639;&#3629;&#3609;</td>
          <td width="50">&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;</td>
          <td width="115">&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;</td>
          <td width="98"valign="top">&#3585;&#3621;&#3640;&#3656;&#3617;&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</td>
          <td width="82" rowspan="3" valign="top">
              <select name="sec1" size="4"valign="top">
                <option>&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</option>
              </select>
			  <input name="s1"  type="hidden" value=""> <input name="s1"  type="hidden" value=""> <input name="s1"  type="hidden" value="">
			  <input name="s1"  type="hidden" value=""> <input name="s1"  type="hidden" value=""> <input name="s1"  type="hidden" value="">
			  <input name="m1"  type="hidden" value=""> <input name="m1"  type="hidden" value=""> <input name="m1"  type="hidden" value="">
			  <input name="m1"  type="hidden" value=""> <input name="m1"  type="hidden" value=""> <input name="m1"  type="hidden" value="">
			  <input type="hidden" name="note11" value=""><input type="hidden" name="note11" value=""><input type="hidden" name="note11" value=""><input type="hidden" name="note11" value=""><input type="hidden" name="note11" value=""><input type="hidden" name="note11" value="">	
			  <input type="hidden" name="note21" value=""><input type="hidden" name="note21" value=""><input type="hidden" name="note21" value=""><input type="hidden" name="note21" value=""><input type="hidden" name="note21" value=""><input type="hidden" name="note21" value="">
			</td>
          <td width="163" rowspan="3" valign="top"><select name="maxstd1" size="4"valign="top">
            <option>&#3609;&#3633;&#3585;&#3624;&#3638;&#3585;&#3625;&#3634;&#3648;&#3611;&#3636;&#3604;&#3619;&#3633;&#3610;</option>
          </select></td>
        </tr>
        <tr>
          <td height="30">&#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588;</td>
          <td><input name="tday1_1" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon1_1" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart1_1" type="text" size="4" maxlength="5"></td>
          <td><input name="tend1_1" type="text" size="4" maxlength="5"></td>
          <td width="98"valign="top"><input type="button" name="Submit3" value="add" onClick="adds('addsec1.jsp')"></td>
        </tr>
        <tr>
          <td height="27">&#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588;</td>
          <td><input name="tday1_2" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon1_2" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart1_2" type="text" size="4" maxlength="5"></td>
          <td><input name="tend1_2" type="text" size="4" maxlength="5"></td>
          <td><input type="button" name="edit1" value="edit" onClick="edits"></td>
          </tr>
        <tr>
          <td height="27">&#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;</td>
          <td><input name="tday1_3" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon1_3" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart1_3" type="text" size="4" maxlength="5"></td>
          <td><input name="tend1_3" type="text" size="4" maxlength="5"></td>
          <td><input type="button" name="Submit2" value="delete" onClick="secdel(document.form1.sec1,document.form1.maxstd1,document.form1.tmp1_1)"></td>
          <td><input name="tmp1_1" type="text" size="5" maxlength="2" onKeyPress="nochar()">            </td>
          <td>&nbsp;</td>
        </tr>
		</table>
				</div>
		<div class="DMenu" id="dm2"><table width="100%" border="0">
        <tr>
          <td width="98" height="28">&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610;</td>
          <td width="40">&#3623;&#3633;&#3609;</td>
          <td width="40">&#3648;&#3604;&#3639;&#3629;&#3609;</td>
          <td width="50">&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;</td>
          <td width="115">&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;</td>
          <td width="98"valign="top">&#3585;&#3621;&#3640;&#3656;&#3617;&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</td>
          <td width="82" rowspan="3" valign="top">
              <select name="sec2" size="4"valign="top">
                <option>&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</option>
              </select>			  </td>
          <td width="163" rowspan="3" valign="top"><select name="maxstd2" size="4"valign="top">
            <option>&#3609;&#3633;&#3585;&#3624;&#3638;&#3585;&#3625;&#3634;&#3648;&#3611;&#3636;&#3604;&#3619;&#3633;&#3610;</option>
          </select></td>
        </tr>
        <tr>
          <td height="30">&#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588;</td>
          <td><input name="tday2_1" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon2_1" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart2_1" type="text" size="4" maxlength="5"></td>
          <td><input name="tend2_1" type="text" size="4" maxlength="5"></td>
          <td width="98"valign="top"><input type="button" name="Submit4" value="add" onClick="adds('addsec2.jsp')"></td>
        </tr>
        <tr>
          <td height="27">&#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588;</td>
          <td><input name="tday2_2" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon2_2" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart2_2" type="text" size="4" maxlength="5"></td>
          <td><input name="tend2_2" type="text" size="4" maxlength="5"></td>
          <td><input type="button" name="edit2" value="edit" onClick="edits"></td>
          </tr>
        <tr>
          <td height="27">&#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;</td>
          <td><input name="tday2_3" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon2_3" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart2_3" type="text" size="4" maxlength="5"></td>
          <td><input name="tend2_3" type="text" size="4" maxlength="5"></td>
          <td><input type="button" name="Submit2" value="delete" onClick="secdel(document.form1.sec2,document.form1.maxstd2,document.form1.tmp2_1)"></td>
          <td><input name="tmp2_1" type="text" size="5" maxlength="2" onKeyPress="nochar()">            </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
		</table>
		</div>
		<div class="DMenu" id="dm3"><table width="100%" border="0">
        <tr>
          <td width="98" height="28">&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610;</td>
          <td width="40">&#3623;&#3633;&#3609;</td>
          <td width="40">&#3648;&#3604;&#3639;&#3629;&#3609;</td>
          <td width="50">&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;</td>
          <td width="115">&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;</td>
          <td width="98"valign="top">&#3585;&#3621;&#3640;&#3656;&#3617;&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</td>
          <td width="82" rowspan="3" valign="top">   <select name="sec3" size="4"valign="top">
            <option>&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</option>
          </select></td>
          <td width="163" rowspan="3" valign="top"><select name="maxstd3" size="4"valign="top">
            <option>&#3609;&#3633;&#3585;&#3624;&#3638;&#3585;&#3625;&#3634;&#3648;&#3611;&#3636;&#3604;&#3619;&#3633;&#3610;</option>
          </select></td>
        </tr>
        <tr>
          <td height="30">&#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588;</td>
          <td><input name="tday3_1" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon3_1" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart3_1" type="text" size="4" maxlength="5"></td>
          <td><input name="tend3_1" type="text" size="4" maxlength="5"></td>
          <td width="98"valign="top"><input type="button" name="Submit5" value="add" onClick="adds('addsec3.jsp')"></td>
        </tr>
        <tr>
          <td height="27">&#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588;</td>
          <td><input name="tday3_2" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon3_2" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart3_2" type="text" size="4" maxlength="5"></td>
          <td><input name="tend3_2" type="text" size="4" maxlength="5"></td>
          <td><input type="button" name="edit3" value="edit" onClick="edits"></td>
          </tr>
        <tr>
          <td height="27">&#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;</td>
          <td><input name="tday3_3" type="text" size="2" maxlength="2" ></td>
          <td><input name="tmon3_3" type="text" size="2"maxlength="2" ></td>
          <td><input name="tstart3_3" type="text" size="4" maxlength="5"></td>
          <td><input name="tend3_3" type="text" size="4" maxlength="5"></td>
          <td><input type="button" name="Submit2" value="delete" onClick="secdel(document.form1.sec3,document.form1.maxstd3,document.form1.tmp3_1)"></td>
          <td><input name="tmp3_1" type="text" size="5" maxlength="2" onKeyPress="nochar()">            </td>
          <td>&nbsp;</td>
        </tr>
		</table>
	
		<input type="hidden" name="note12" value="">	<input type="hidden" name="note12" value="">	<input type="hidden" name="note12" value="">	<input type="hidden" name="note12" value="">	<input type="hidden" name="note12" value="">	<input type="hidden" name="note12" value="">	
		<input type="hidden" name="note22" value="">	<input type="hidden" name="note22" value="">	<input type="hidden" name="note22" value="">	<input type="hidden" name="note22" value="">	<input type="hidden" name="note22" value="">	<input type="hidden" name="note22" value="">	
		<input type="hidden" name="note13" value=""><input type="hidden" name="note13" value=""><input type="hidden" name="note13" value=""><input type="hidden" name="note13" value=""><input type="hidden" name="note13" value=""><input type="hidden" name="note13" value="">
		<input type="hidden" name="note23" value=""><input type="hidden" name="note23" value=""><input type="hidden" name="note23" value=""><input type="hidden" name="note23" value=""><input type="hidden" name="note23" value=""><input type="hidden" name="note23" value="">
		</div>
			</td>
		</tr>		
		<tr align="right">
			<td colspan="4"><input type="submit" name="Submit" value="apply"></td>
		</tr>
      </table>
	   </form>   
	</td>
  </tr>
  <tr valign="bottom">
    <td height="5%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
