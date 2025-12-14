<%@ page import =" javax.servlet.http.*,javax.mail.*,java.io.*,javax.mail.internet.*" contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");	
	}	
%>
<html>
<head>
<title>ระบบสารสนเทศฝ่ายวิจัยและประเมินผล</title>
<meta name="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/home.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
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
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" onLoad="MM_preloadImages('image/arrowanima.gif')">
<center>
  <table width="780" height="100%" border="0" cellpadding="0" cellspacing="0" background="image/background.gif">
    <tr>
      <td valign="top"> 
        <!-- Cover -->
		<br>
        <img src="image/band.gif" width="780" height="113" border="0"> 
        
  <center>
          <table width="780" border="0" cellspacing="0" cellpadding="0"><!-- menu row 1-->
            <tr> 
              <td height="33" colspan="13" valign="bottom">
				<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;Home</font></td>
    					<td width="110" align="right" valign="bottom"><a class="pathlink2" href="servlet/login?logout=logout">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
				</table>			
			  </td>
            </tr>
            <tr> 
              <td colspan="13" background="image/hordotshort.gif" height="1"></td>
            </tr>
            <tr> 
              <td height="21" colspan="14"></td>
            </tr>
            <tr> 
              <td width="34" rowspan="3"></td>
              <td background="image/longmenubar1.gif" height="40" colspan="5" width="339"></td>
              <td width="34"></td>
              <td background="image/longmenubar5.gif" colspan="5" height="38" width="339">
			  </td>
              <td width="34" rowspan="3"></td>
            </tr>
            <tr> 
              <td width="7"></td>
              <td width="11" background="image/linedotver.gif"></td>
              <td width="10" ></td>
              <td height="90" width="302" valign="top" background="image/longtmenubgtop.gif"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','image/arrowanima.gif',1)" class="menulink" href="addlecturer.jsp"><img src="image/arrow.gif" name="Image2" width="12" height="12" border="0">&nbsp;เพิ่มข้อมูลอาจารย์บัณฑิต </a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','image/arrowanima.gif',1)" class="menulink" href="lecturerinfo.jsp"><img src="image/arrow.gif" name="Image3" width="12" height="12" border="0">&nbsp;ดูข้อมูลอาจารย์บัณฑิต</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image41','','image/arrowanima.gif',1)" class="menulink" href="lecturer.jsp"><img src="image/arrow.gif" name="Image41" width="12" height="12" border="0">&nbsp;ทำเนียบอาจารย์บัณฑิต</a></td>
              <td width="9" ></td>
              <td></td>
              <td width="7"></td>
              <td width="11" valign="top" background="image/linedotver.gif" ></td>
              <td width="10" ></td>
              <td width="302" valign="top" background="image/longtmenubgtop.gif"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','image/arrowanima.gif',1)" class="menulink" href="addalumni.jsp"><img src="image/arrow.gif" name="Image15" width="12" height="12" border="0">&nbsp;บันทึกประวัติผู้สำเร็จการศึกษา</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','image/arrowanima.gif',1)" class="menulink" href="viewalumni.jsp"><img src="image/arrow.gif" name="Image16" width="12" height="12" border="0">&nbsp;ดูประวัติผู้ผู้สำเร็จการศึกษา</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','image/arrowanima.gif',1)" class="menulink" href="checkfinish.jsp"><img src="image/arrow.gif" name="Image17" width="12" height="12" border="0">&nbsp;อนุมัติจบการศึกษา</a> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image177','','image/arrowanima.gif',1)" class="menulink" href="alumni.jsp"><img src="image/arrow.gif" name="Image177" width="12" height="12" border="0">&nbsp;ทำเนียบผู้สำเร็จการศึกษา</a> 
				
              </td>
              <td width="9" ></td>
            </tr>
            <tr> 
              <td></td>
              <td valign="top" background="image/linedotver.gif"></td>
              <td></td>
              <td height="18" background="image/longmenubgbottom.gif" width="302"></td>
              <td ></td>
              <td></td>
              <td></td>
              <td valign="top" background="image/linedotver.gif"></td>
              <td></td>
              <td height="18" valign="top" background="image/longmenubgbottom.gif"></td>
              <td></td>
            </tr>
          </table>	<!-- End menu row 1 -->
		   <table width="780" border="0" cellspacing="0" cellpadding="0"> <!-- menu row 2 -->
            <tr> 
              <td height="10" colspan="13"></td>
            </tr>
            <tr> 
              <td width="34" rowspan="3"></td>
              <td background="image/longmenubar3.gif" height="40" colspan="5" width="339"></td>
              <td width="34"></td>
              <td background="image/longmenubar2.gif" colspan="5" height="38" width="339"></td>
              <td width="34" rowspan="3"></td>
            </tr>
            <tr> 
              <td width="7"></td>
              <td width="11" background="image/linedotver.gif"></td>
              <td width="10" ></td>
              <td height="90" width="302" valign="top" background="image/longtmenubgtop.gif"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','image/arrowanima.gif',1)" class="menulink" href="addscholarship.jsp"><img src="image/arrow.gif" name="Image8" width="12" height="12" border="0">&nbsp;เพิ่มรายชื่อทุนการศึกษา</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','image/arrowanima.gif',1)" class="menulink" href="viewscholarship.jsp"><img src="image/arrow.gif" name="Image9" width="12" height="12" border="0">&nbsp;ดูข้อมูลทุนการศึกษา</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','image/arrowanima.gif',1)" class="menulink" href="addscholar.jsp"><img src="image/arrow.gif" name="Image10" width="12" height="12" border="0">&nbsp;เพิ่มรายชื่อนักศึกษาที่ได้รับทุนการศึกษา</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','image/arrowanima.gif',1)" class="menulink" href="viewscholar.jsp"><img src="image/arrow.gif" name="Image11" width="12" height="12" border="0">&nbsp;ดูรายชื่อนักศึกษาที่ได้รับทุน</a><br>				
			  </td>
              <td width="9" ></td>
              <td></td>
              <td width="7"></td>
              <td width="11" valign="top" background="image/linedotver.gif" ></td>
              <td width="10" ></td>
              <td width="302" valign="top" background="image/longtmenubgtop.gif"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','image/arrowanima.gif',1)" class="menulink" href="addthesis.jsp"><img src="image/arrow.gif" name="Image5" width="12" height="12" border="0">&nbsp;เพิ่มหัวข้อวิทยานิพนธ์</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','image/arrowanima.gif',1)" class="menulink" href="viewthesis.jsp"><img src="image/arrow.gif" name="Image6" width="12" height="12" border="0">&nbsp;ดูหัวข้อวิทยานิพนธ์</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','image/arrowanima.gif',1)" class="menulink" href="changetopic.jsp"><img src="image/arrow.gif" name="Image7" width="12" height="12" border="0">&nbsp;เปลี่ยนหัวข้อวิทยานิพนธ์</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image71','','image/arrowanima.gif',1)" class="menulink" href="changesupervisor.jsp"><img src="image/arrow.gif" name="Image71" width="12" height="12" border="0">&nbsp;เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','image/arrowanima.gif',1)" class="menulink" href="addjoinsupervisor.jsp"><img src="image/arrow.gif" name="Image51" width="12" height="12" border="0">&nbsp;เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image61','','image/arrowanima.gif',1)" class="menulink" href="addexamthesis.jsp"><img src="image/arrow.gif" name="Image61" width="12" height="12" border="0">&nbsp;บันทึกผลการสอบวิทยานิพนธ์</a><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<a onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image511','','image/arrowanima.gif',1)" class="menulink" href="viewexamthesis.jsp"><img src="image/arrow.gif" name="Image511" width="12" height="12" border="0">&nbsp;ดูผลการสอบวิทยานิพนธ์</a><br>
               </td>
              <td width="9" ></td>
            </tr>
            <tr> 
              <td></td>
              <td valign="top" background="image/linedotver.gif"></td>
              <td></td>
              <td height="18" background="image/longmenubgbottom.gif" width="302"></td>
              <td ></td>
              <td></td>
              <td></td>
              <td valign="top" background="image/linedotver.gif"></td>
              <td></td>
              <td height="18" valign="top" background="image/longmenubgbottom.gif"></td>
              <td></td>
            </tr>
          </table>	<!-- End menu row 2 -->
		  <br>
		  <table width="780" border="0" cellspacing="0" cellpadding="0"> <!-- menu row 3 -->
           <tr> 
             <td height="1" colspan="13" background="image/hordotshort.gif"></td>
           </tr>
           <tr> 
             <td width="34" rowspan="3"></td>
            
            
             <td colspan="5" height="38" width="339"></td>	<!-- empty -->
             <td width="34" rowspan="3"></td>				<!-- empty -->
           </tr>
		   <tr> 
              <td width="7">
              </td>
              <td width="9" ></td>
              <td></td>
              <td width="7"></td>		<!-- empty -->
              <td width="11" valign="top"  ></td> <!-- empty -->
              <td width="10" ></td>					<!-- empty -->
              <td width="302" valign="top" ></td>	<!-- empty -->
              <td width="9" ></td>		<!-- empty -->
            </tr>
            <tr> 
              <td></td>
              <td valign="top"></td>
              <td></td>
              <td height="18" width="302"></td>
              <td ></td>
              <td></td>
              <td></td>
              <td valign="top" ></td> <!-- empty -->
              <td></td> <!-- empty -->
              <td height="18" valign="top" ></td><!-- empty -->
              <td></td>
            </tr>
		  </table>
		  <br><br> <!-- menu row 3 -->


  </center>
		</td>
		<!-- Cover -->
  </tr>
</table></center>
</body>
</html>
