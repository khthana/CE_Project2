<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" -->
      <table width="780" border="0" cellspacing="10" cellpadding="0">
        <tr> 
          <td><form method=post action="RePw.php" name="ReForm" >
              <hr>
              <table width="180" cellspacing="1" border="0" bordercolor="#000000" bgcolor="#000000" height="80" cellpadding="1" align="center">
                <tr> 
                  <td bgcolor="#66BBFF" class="header"><div align="center"><strong>กรอก 
                      username</strong></div></td>
                </tr>
                <td bgcolor="#FFFFFF" class="header"><div align="center"> 
                    <table width="100%" border="0">
                      <!-- bordercolor="#FFFFFF" bgcolor="#FFFFFF">-->
                      <tr> 
                        <td class="text" > <div align="center"> 
                            <input name="User" type="text" id="User" size="15">
                          </div></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#FFFFFF" bordercolor="#FFFFFF"><div align="center"> 
                           <input  value="ok" type="image"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','./Picture/enter1.gif',1)" img src="./Picture/enter.gif" name="Image1" width="45" height="16" border="0" onClick="return check()">
                          </div></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#FFFFFF" bordercolor="#FFFFFF"> <div align="center"></div></td>
                      </tr>
                    </table>
                  </div></td>
                </tr>
              </table>
                        
              <hr>
              <div align="center" class="normal">กรอก username เพื่อตอบคำถามของท่านที่ได้ตั้งไว้ตอนลงทะเบียนเป็นสมาชิก</div>
            </form>
            </td>
        </tr>
      </table>
      <!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
<script language="JavaScript">
	function check(){
		if(document.ReForm.User.value ==''){
			alert('กรุณากรอก username ก่อน');
			document.ReForm.User.focus();
			return false;
		 }
	}
	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}
	
	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}
	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	 if(!x && d.getElementById) x=d.getElementById(n) ; return x;
	}
	
	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}

</script>