<%@ page contentType="text/html; charset=window-874" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=window-874">
<script language="javascript">
function preadd(val, valplus) {
	blank = "";
	if( valplus.value != blank ) {
		for( i=0; i<val.length; i++) {
			if ( val[i].value == valplus.value ) return;
		}
		val.length=val.length+1;
		val[val.length -1].text=valplus.value;
		val[val.length- 1].value=valplus.value;
		valplus.value = blank;
		valplus.text = blank;
	}
}
function predel(val, valdel) {
	blank = "";
	if( valdel.value != blank ) {
		for( i=0; i<val.length; i++) {
			if ( val[i].value == valdel.value ) {
				for( j = i; j<val.length - 1; j++) {
					val[j].value = val[j+1].value;
					val[j].text = val[j+1].value;					
				}
				val[val.length-1].value = blank;
				val[val.length-1].text = blank;					
				valdel.value = blank;
				valdel.text = blank;
				val.length = (val.length - 1);
				return;
			}
		}
	}
}
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
</script>
</head>

<body>
<table width="702" border="0">
  <tr>
    <td height="48" colspan="2" bgcolor="#99FF99">&#3648;&#3614;&#3636;&#3656;&#3617;&#3619;&#3634;&#3618;&#3623;&#3636;&#3594;&#3634;  <a href="editsub.jsp">edit</a> <a href="delete.jsp">delete</a></td>
  </tr>
  <tr><form name="form1" method="post" action="">
    <td width="242" height="542" bgcolor="#CCFFCC"><p>&#3619;&#3627;&#3633;&#3626;&#3623;&#3636;&#3594;&#3634;</p>
      <p>
        <input name="textfield" type="text" size="16" maxlength="8" onKeyPress="nochar()">
</p>
      <p>&#3594;&#3639;&#3656;&#3629;&#3623;&#3636;&#3594;&#3634;&#3616;&#3634;&#3625;&#3634;&#3652;&#3607;&#3618;</p>
      <p>
        <input name="textfield2" type="text" size="30" maxlength="100">
      </p>
      <p>&#3594;&#3639;&#3656;&#3629;&#3623;&#3636;&#3594;&#3634;&#3616;&#3634;&#3625;&#3634;&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;</p>
      <p>
        <input name="textfield3" type="text" size="30" maxlength="100">
</p>
      <p>&#3588;&#3603;&#3632;</p>
      <p>
        <select name="select">
          <option>&#3588;&#3603;&#3632;&#3623;&#3636;&#3604;&#3623;&#3632;</option>
          <option>&#3588;&#3603;&#3632;&#3623;&#3636;&#3607;&#3618;&#3634;</option>
          </select>
</p>
      <p>&#3627;&#3609;&#3656;&#3623;&#3618;&#3585;&#3636;&#3592;:
        <input name="textfield4" type="text" size="3" maxlength="2" onKeyPress="nochar()">
&#3607;&#3620;&#3625;&#3600;&#3637;:
<input name="textfield5" type="text" size="3" maxlength="2" onKeyPress="nochar()">
&#3611;&#3599;&#3636;&#3610;&#3633;&#3605;&#3636;:
<input name="textfield6" type="text" size="3" maxlength="2" onKeyPress="nochar()">
</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>      </td>
    <td width="450" bgcolor="#CCFFCC"><p>&#3619;&#3632;&#3604;&#3633;&#3610;
        <label>
        </label>
      </p>
      <p>
          <label>
  <input type="radio" name="?????" value="1">
&#3652;&#3617;&#3656;&#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;
          </label>
          <br>
          <label>
          <input type="radio" name="?????" value="2"> 
        &#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;&#3623;&#3636;&#3607;&#3618;&#3634;&#3609;&#3636;&#3614;&#3609;&#3608;&#3660;
          </label>
          <br>
          <label>
          <input type="radio" name="?????" value="3"> 
        &#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;&#3611;&#3619;&#3632;&#3617;&#3623;&#3621;&#3588;&#3623;&#3634;&#3617;&#3619;&#3641;&#3657;</label>
          <br>
          <label>
          <input type="radio" name="?????" value="4"> 
        &#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;&#3616;&#3634;&#3625;&#3634;&#3605;&#3656;&#3634;&#3591;&#3611;&#3619;&#3632;&#3648;&#3607;&#3624;
          </label>
          <br>
        </p>      
      <p>          
        <select name="pre" size="4" multiple >
          <option value="0">วิชาบังคับก่อน</option>
        </select>
        <input type="text" name="tmp">          
        <input type="button" name="button" value="add"onClick="preadd(document.form1.pre,document.form1.tmp)">
          <input type="button" name="button2" value="del" onClick="predel(document.form1.pre,document.form1.tmp)">
</p>
      <p>&#3616;&#3634;&#3588;&#3605;&#3657;&#3609; 
        <input type="checkbox" name="checkbox" value="checkbox">
      </p>
      <p>&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610; &#3623;&#3633;&#3609; : &#3648;&#3604;&#3639;&#3629;&#3609; : &#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609; : &#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604; </p>
      <p>1. &#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588; 
        <input name="textfield42" type="text" size="3" maxlength="2" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="3" maxlength="2" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="5" maxlength="5" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="5" maxlength="5" onKeyPress="nochar()">
      </p>
      <p>2. &#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588; 
        <input name="textfield42" type="text" size="3" maxlength="2" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="3" maxlength="2" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="5" maxlength="5" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="5" maxlength="5" onKeyPress="nochar()">
      </p>
      <p>3. &#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;  
        <input name="textfield42" type="text" size="3" maxlength="2" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="3" maxlength="2" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="5" maxlength="5" onKeyPress="nochar()">
		<input name="textfield42" type="text" size="5" maxlength="5" onKeyPress="nochar()">
      </p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
	</form>
  </tr>
  <tr>
    <td height="109" colspan="2" bgcolor="#CCFFCC">&nbsp;</td>
  </tr>
  <tr>
    <td height="37" colspan="2">&nbsp;</td>
  </tr>
</table>
</body>
</html>
