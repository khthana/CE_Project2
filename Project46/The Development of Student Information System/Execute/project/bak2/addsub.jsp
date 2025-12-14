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
			if ( val[i].value == valplus.value ) return 1;
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
function secadd(vsec, vsecplus, vstd, vstdplus) {
	blank="";
	if ( (vsecplus.value != blank) && (vstdplus.value != blank) ) {
		//for( i=0; i<vsec.length; i++) {
			//if ( vsec[i].value == vsecplus.value ) return;
		//}
		if (preadd(vsec, vsecplus) != 1) {
			vstd.length=vstd.length+1;
			vstd[vstd.length -1].text=vstdplus.value;
			vstd[vstd.length- 1].value=vstdplus.value;
			vstdplus.value = blank;
			vstdplus.text = blank;
		}
	}
}
function secdel(vsec, vstd, vsecdel) {
	blank="";
	if( vsecdel.value == blank ) {return;}
	for( i=0; i<vsec.length; i++) {
		if ( vsec[i].value == vsecdel.value ) {
			for( j = i; j<vsec.length - 1; j++) {
				vsec[j].value = vsec[j+1].value;
				vsec[j].text = vsec[j+1].value;
				vstd[j].value = vstd[j+1].value;
				vstd[j].text = vstd[j+1].value;
			}
			vsec[vsec.length-1].value = blank;
			vsec[vsec.length-1].text = blank;					
			vstd[vstd.length-1].value = blank;
			vstd[vstd.length-1].text = blank;					
			vsecdel.value = blank;
			vsecdel.text = blank;
			vsec.length = (vsec.length - 1);
			vstd.length = (vstd.length - 1);
			return;
		}
	}
}
function active1(obj) {
	if (obj.term1.checked == true) {
		//alert("test1");
		obj.tday1_1.disabled=false; obj.tmon1_1.disabled=false; obj.tstart1_1.disabled=false; obj.tend1_1.disabled=false;
		obj.tday1_2.disabled=false; obj.tmon1_2.disabled=false; obj.tstart1_2.disabled=false; obj.tend1_2.disabled=false;
		obj.tday1_3.disabled=false; obj.tmon1_3.disabled=false; obj.tstart1_3.disabled=false; obj.tend1_3.disabled=false;
	}
	else{
		alert("test2");
		obj.tday1_1.disabled=true; obj.tmon1_1.disabled=true; obj.tstart1_1.disabled=true; obj.tend1_1.disabled=true;
		obj.tday1_2.disabled=true; obj.tmon1_2.disabled=true; obj.tstart1_2.disabled=true; obj.tend1_2.disabled=true;
		obj.tday1_3.disabled=true; obj.tmon1_3.disabled=true; obj.tstart1_3.disabled=true; obj.tend1_3.disabled=true;
	}
}
function active2(obj) {
	if (obj.term2.checked == true) {
		//alert("test1");
		obj.tday2_1.disabled=false; obj.tmon2_1.disabled=false; obj.tstart2_1.disabled=false; obj.tend2_1.disabled=false;
		obj.tday2_2.disabled=false; obj.tmon2_2.disabled=false; obj.tstart2_2.disabled=false; obj.tend2_2.disabled=false;
		obj.tday2_3.disabled=false; obj.tmon2_3.disabled=false; obj.tstart2_3.disabled=false; obj.tend2_3.disabled=false;
	}
	else{
		//alert("test2");
		obj.tday2_1.disabled=true; obj.tmon2_1.disabled=true; obj.tstart2_1.disabled=true; obj.tend2_1.disabled=true;
		obj.tday2_2.disabled=true; obj.tmon2_2.disabled=true; obj.tstart2_2.disabled=true; obj.tend2_2.disabled=true;
		obj.tday2_3.disabled=true; obj.tmon2_3.disabled=true; obj.tstart2_3.disabled=true; obj.tend2_3.disabled=true;
	}
}
function active3(obj) {
	if (obj.term3.checked == true) {
		//alert("test1");
		obj.tday3_1.disabled=false; obj.tmon3_1.disabled=false; obj.tstart3_1.disabled=false; obj.tend3_1.disabled=false;
		obj.tday3_2.disabled=false; obj.tmon3_2.disabled=false; obj.tstart3_2.disabled=false; obj.tend3_2.disabled=false;
		obj.tday3_3.disabled=false; obj.tmon3_3.disabled=false; obj.tstart3_3.disabled=false; obj.tend3_3.disabled=false;
	}
	else{
		alert("test2");
		obj.tday3_1.disabled=true; obj.tmon3_1.disabled=true; obj.tstart3_1.disabled=true; obj.tend3_1.disabled=true;
		obj.tday3_2.disabled=true; obj.tmon3_2.disabled=true; obj.tstart3_2.disabled=true; obj.tend3_2.disabled=true;
		obj.tday3_3.disabled=true; obj.tmon3_3.disabled=true; obj.tstart3_3.disabled=true; obj.tend3_3.disabled=true;
	}
}

function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
</script>

</head>

<body>
<form name="form1" method="post" action="">
<table width="702" border="0">
  <tr>
    <td height="55" bgcolor="#99FF99">&#3619;&#3634;&#3618;&#3623;&#3636;&#3594;&#3634; <a href="editsub.jsp">edit</a> <a href="delete.jsp">delete</a></td>
  </tr>
  <tr>
    <td height="623" bgcolor="#CCFFCC">
	
	  <table width="695" border="0">
        <tr>
          <td width="95">&#3619;&#3627;&#3633;&#3626;&#3623;&#3636;&#3594;&#3634;</td>
          <td width="241"><input type="text" name="secid"></td>
          <td width="124">&nbsp;</td>
          <td width="217">&nbsp;</td>
        </tr>
        <tr>
          <td>&#3594;&#3639;&#3656;&#3629;&#3623;&#3636;&#3594;&#3634;(&#3652;&#3607;&#3618;)</td>
          <td><input type="text" name="tname"></td>
          <td>&#3594;&#3639;&#3656;&#3629;&#3623;&#3636;&#3594;&#3634;(&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;)</td>
          <td><input type="text" name="ename"></td>
        </tr>
        <tr>
          <td>&#3588;&#3603;&#3632;</td>
          <td><select name="fac">
          </select></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
	</table>
	<table>
        <tr>
          <td width="96">&#3619;&#3632;&#3604;&#3633;&#3610;</td>
          <td width="238" rowspan="4"><p>
            <label>
            <input type="radio" name="level" value="1">
</label>
            &#3652;&#3617;&#3656;&#3648;&#3585;&#3655;&#3610;&#3588;&#3656;&#3634;&#3626;&#3629;&#3610;<br>
            <label>
            <input type="radio" name="level" value="12">
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
          </p></td>
          <td width="129" rowspan="2" valign="top">&#3623;&#3636;&#3594;&#3634;&#3610;&#3633;&#3591;&#3588;&#3633;&#3610;&#3585;&#3656;&#3629;&#3609;</td>
          <td width="213" rowspan="3">
            <select name="pre" size="4">
                <option>&#3623;&#3636;&#3594;&#3634;&#3610;&#3633;&#3591;&#3588;&#3633;&#3610;&#3585;&#3656;&#3629;&#3609;</option>
            </select>
    	  </td>
        </tr>
        <tr>
          <td height="37">&nbsp;</td>
          </tr>
        <tr>
          <td height="39">&nbsp;</td>
          <td><input type="button" name="add" value="add" onClick="preadd(document.form1.pre,document.form1.tmp)"></td>
          </tr>
        <tr>
          <td height="28">&nbsp;</td>
          <td><input type="button" name="delete" value="delete" onClick="predel(document.form1.pre,document.form1.tmp)"></td>
          <td width="213"><input type="text" name="tmp"></td>
        </tr>
      </table>
    	
	  <table width="698" border="0">
        <tr>
          <td height="28" colspan="5"><input type="checkbox" name="term1" value="y" onClick="active1(document.form1)"> 
            &#3648;&#3607;&#3629;&#3617;&#3605;&#3657;&#3609;</td>
          <td colspan="2">&nbsp;</td>
          </tr>
        <tr>
          <td width="80" height="28">&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610;</td>
          <td width="48">&#3623;&#3633;&#3609;</td>
          <td width="48">&#3648;&#3604;&#3639;&#3629;&#3609;</td>
          <td width="55">&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;</td>
          <td width="56">&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;</td>
          <td width="87" rowspan="2"valign="top">&#3585;&#3621;&#3640;&#3656;&#3617;&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</td>
          <td width="294" rowspan="3">
              <select name="sec1" size="4"valign="top">
                <option>&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</option>
              </select>
			  <select name="maxstd1" size="4"valign="top">
              	<option>&#3609;&#3633;&#3585;&#3624;&#3638;&#3585;&#3625;&#3634;&#3648;&#3611;&#3636;&#3604;&#3619;&#3633;&#3610;</option>
              </select>		  </td>
          </tr>
        <tr>
          <td height="30">&#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588;</td>
          <td><input name="tday1_1" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon1_1" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart1_1" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend1_1" type="text" size="3" maxlength="5"disabled></td>
          </tr>
        <tr>
          <td height="27">&#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588;</td>
          <td><input name="tday1_2" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon1_2" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart1_2" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend1_2" type="text" size="3" maxlength="5"disabled></td>
          <td><input type="button" name="Submit" value="add" onClick="secadd(document.form1.sec1,document.form1.tmp1_1,document.form1.maxstd1,document.form1.tmp1_2)"></td>
          </tr>
        <tr>
          <td height="27">&#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;</td>
          <td><input name="tday1_3" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon1_3" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart1_3" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend1_3" type="text" size="3" maxlength="5"disabled></td>
          <td><input type="button" name="Submit2" value="delete" onClick="secdel(document.form1.sec1,document.form1.maxstd1,document.form1.tmp1_1)"></td>
          <td><input name="tmp1_1" type="text" size="5" maxlength="2" onKeyPress="nochar()">
            <input name="tmp1_2" type="text" size="8" maxlength="3"onKeyPress="nochar()"></td>
          </tr>
        <tr>
          <td height="31" colspan="5"><input type="checkbox" name="term2" value="y"onClick="active2(document.form1)">
            &#3648;&#3607;&#3629;&#3617;&#3611;&#3621;&#3634;&#3618;</td>
          <td colspan="2">&nbsp;</td>
          </tr>
        <tr>
          <td height="27">&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610;</td>
          <td>&#3623;&#3633;&#3609;</td>
          <td>&#3648;&#3604;&#3639;&#3629;&#3609;</td>
          <td>&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;</td>
          <td>&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;</td>
          <td rowspan="2"valign="top">&#3585;&#3621;&#3640;&#3656;&#3617;&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</td>
          <td rowspan="3"><select name="sec2" size="4"valign="top">
            <option>&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</option>
          </select>
            <select name="maxstd2" size="4"valign="top">
              <option>&#3609;&#3633;&#3585;&#3624;&#3638;&#3585;&#3625;&#3634;&#3648;&#3611;&#3636;&#3604;&#3619;&#3633;&#3610;</option>
            </select></td>
          </tr>
        <tr>
          <td height="32">&#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588;</td>
          <td><input name="tday2_1" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon2_1" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart2_1" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend2_1" type="text" size="3" maxlength="5"disabled></td>
        </tr>
        <tr>
          <td height="27">&#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588;</td>
          <td><input name="tday2_2" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon2_2" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart2_2" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend2_2" type="text" size="3" maxlength="5"disabled></td>
          <td><input type="button" name="Submit3" value="add"onClick="secadd(document.form1.sec2,document.form1.tmp2_1,document.form1.maxstd2,document.form1.tmp2_2)"></td>
        </tr>
        <tr>
          <td height="28">&#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;</td>
          <td><input name="tday2_3" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon2_3" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart2_3" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend2_3" type="text" size="3" maxlength="5"disabled></td>
          <td><input type="button" name="Submit4" value="delete" onClick="secdel(document.form1.sec2,document.form1.maxstd2,document.form1.tmp2_1)"></td>
          <td><input name="tmp2_1" type="text" size="5" maxlength="2"onKeyPress="nochar()">
            <input name="tmp2_2" type="text" size="8" maxlength="3"onKeyPress="nochar()"></td>
          </tr>
        <tr>
          <td height="28" colspan="5"><input type="checkbox" name="term3" value="y"onClick="active3(document.form1)">
            &#3648;&#3607;&#3629;&#3617;&#3620;&#3604;&#3641;&#3619;&#3657;&#3629;&#3609;</td>
          <td colspan="2">&nbsp;</td>
          </tr>
        <tr>
          <td height="31">&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3626;&#3629;&#3610;</td>
          <td>&#3623;&#3633;&#3609;</td>
          <td>&#3648;&#3604;&#3639;&#3629;&#3609;</td>
          <td>&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;</td>
          <td>&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;</td>
          <td rowspan="2"valign="top">&#3585;&#3621;&#3640;&#3656;&#3617;&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</td>
          <td rowspan="3"><select name="sec3" size="4"valign="top">
            <option>&#3648;&#3595;&#3655;&#3585;&#3594;&#3633;&#3656;&#3609;</option>
          </select>
            <select name="maxstd3" size="4"valign="top">
              <option>&#3609;&#3633;&#3585;&#3624;&#3638;&#3585;&#3625;&#3634;&#3648;&#3611;&#3636;&#3604;&#3619;&#3633;&#3610;</option>
            </select></td>
          </tr>
        <tr>
          <td height="30">&#3585;&#3621;&#3634;&#3591;&#3616;&#3634;&#3588;</td>
          <td><input name="tday3_1" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon3_1" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart3_1" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend3_1" type="text" size="3" maxlength="5"disabled></td>
        </tr>
        <tr>
          <td height="29">&#3611;&#3621;&#3634;&#3618;&#3616;&#3634;&#3588;</td>
          <td><input name="tday3_2" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon3_2" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart3_2" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend3_2" type="text" size="3" maxlength="5"disabled></td>
          <td><input type="button" name="Submit5" value="add"onclick="secadd(document.form1.sec3,document.form1.tmp3_1,document.form1.maxstd3,document.form1.tmp3_2)"></td>
          </tr>
        <tr>
          <td height="28">&#3648;&#3614;&#3636;&#3656;&#3617;&#3648;&#3605;&#3636;&#3617;</td>
          <td><input name="tday3_3" type="text" size="1" maxlength="2" disabled></td>
          <td><input name="tmon3_3" type="text" size="1"maxlength="2" disabled></td>
          <td><input name="tstart3_3" type="text" size="3" maxlength="5"disabled></td>
          <td><input name="tend3_3" type="text" size="3" maxlength="5"disabled></td>
          <td><input type="button" name="Submit6" value="delete" onClick="secdel(document.form1.sec3,document.form1.maxstd3,document.form1.tmp3_1)"></td>
          <td><input name="tmp3_1" type="text" size="5" maxlength="2"onKeyPress="nochar()">
            <input name="tmp3_2" type="text" size="8" maxlength="3"onKeyPress="nochar()"></td>
          </tr>
      </table>
	 </td>
  </tr>
  <tr>
    <td height="109" bgcolor="#CCFFCC">&nbsp;</td>
  </tr>
  <tr>
    <td height="37">&nbsp;</td>
  </tr>
</table>
</form>   
</body>
</html>
