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
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" --><br>
      <table width="780" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="190" valign="top"><table width="100%" border="0" cellspacing="8" cellpadding="0">
              <tr> 
                <td valign="top"><form name="search" method="post" action="FrmSearch.php" >
                    <TABLE cellSpacing=0 cellPadding=0 width=180 border=0>
                      <TBODY>
                        <TR> 
                          <TD vAlign=top align=left><img src="/Picture/cn_login1.gif"></TD>
                          <TD vAlign=top bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=0 width=168 border=0>
                              <TBODY>
                                <TR> 
                                  <TD bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                                <TR> 
                                  <TD bgColor=#dedede><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                          <TD vAlign=top align=right><img src="/Picture/cn_login2.gif" width="6" height="6"></TD>
                        </TR>
                        <TR> 
                          <TD colSpan=3> <TABLE cellSpacing=0 cellPadding=0 width=180 border=0>
                              <TBODY>
                                <TR> 
                                  <TD width=1 height="72" bgColor=#909090><img src="/Picture/dot.gif"  height="1" width="1"></TD>
                                  <TD width=5 bgColor=#dedede><img src="/Picture/dot.gif"  height="8" width="8"></TD>
                                  <TD bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=1 width="100%" 
border=0 class="text">
                                      <TBODY>
                                        <TR> 
                                          <TD align=center  class="text"><select name="select">
                                              <option value="default">choose one</option>
                                              <option value="CourseName">ชื่อวิชา</option>
                                              <option value="Teacher">ชื่ออาจารย์</option>
                                              <option value="Faculty">ชื่อคณะ</option>
                                              <option value="Department">ชื่อสาขา</option>
                                            </select>
                                            <font color="#FF0000">หัวข้อค้นหา</font></TD>
                                        </TR>
                                        <TR> 
                                          <TD align=center><input  size=22 name= SearchName value="" >
                                           </TD>
                                        </TR>
                                        <TR> 
                                          <TD  align=right><input type="hidden" name="hidden" value="work">
                                             <input  value="ok" type="image"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','./Picture/search1.gif',1)" img src="./Picture/search.gif" name="Image2" width="45" height="16" border="0" >
                                            &nbsp; </TD>
                                        </TR>
                                        <TR> 
                                          <TD  align="left"  class="text"> </TD>
                                        </TR>
                                      </TBODY>
                                    </TABLE></TD>
                                  <TD width=5 bgColor=#dedede><img src="/Picture/dot.gif"  height="9" width="8"></TD>
                                  <TD width=1 bgColor=#909090><img src="/Picture/dot.gif"  height="2" width="1"></TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                        </TR>
                        <TR> 
                          <TD vAlign=bottom align=left><img src="/Picture/cn_login3.gif" width="6" height="6"></TD>
                          <TD vAlign=bottom bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=0 width=168 border=0>
                              <TBODY>
                                <TR> 
                                  <TD bgColor=#dedede><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                                <TR> 
                                  <TD bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                          <TD vAlign=bottom align=right><img src="/Picture/cn_login4.gif" width="6" height="6"></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                  </form></td>
              </tr>
            </table></td>
          <td width="584" valign="top"><?php 
				require('./libraries/grab_globals.lib.php'); 
		  		if($hidden == "work" ){
		   			include("./Search.php");		
					search ($SearchName,$select);
					echo "<br>";
				}
				include("./SearchUse.php");
			?>
			</td>
        </tr>
      </table>
      <!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
<script language="JavaScript">
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