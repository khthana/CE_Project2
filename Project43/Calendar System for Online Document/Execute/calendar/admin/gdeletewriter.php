<?
include("checkauth.inc");
include('thaidate.inc');
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$sql="select * from admin where mem_id=$user_id";
$result=mysql_db_query($db,$sql);
$row=mysql_num_rows($result);
if($row==0&&$user_type<>'A') header("Location:../welcome.php");

if($lastpage=='gdeletewriter')
{
foreach($checkbox as $id)
{
	$sql="delete from writer where mem_id=$id";
$result=mysql_db_query($db,$sql);
}
header("Location:./adminpage.php");
}
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<!-- saved from url=(0062)http://olala05.ce.kmitl.ac.th/magazines/testphp/tempwhite.html -->

<HTML><HEAD><TITLE>Calendar</TITLE>

<style type="text/css">



<!--



body {  margin: 0px  0px; padding: 0px  0px}



a:link { color: #ccffcc; text-decoration: none}



a:visited { color: #CCFFCC; text-decoration: none}



a:active { color: #CCFFCC; text-decoration: underline}



a:hover { color: #CCFFCC; text-decoration: underline}



-->



</style>

<META http-equiv=Content-Type content="text/html; charset=Windows-874">

<SCRIPT language=JavaScript>

<!--

function MM_swapImgRestore() { //v3.0

  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;

}



function MM_preloadImages() { //v3.0

  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();

    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)

    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}

}



function MM_findObj(n, d) { //v3.0

  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {

    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];

  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;

}



function MM_swapImage() { //v3.0

  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)

   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}

}

//-->

</SCRIPT>



<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>

<BODY bgColor=#ffffff 

onload="MM_preloadImages('file:///E|/project/magazine/redpoint.gif','file:///E|/project/magazine/carblue.gif','file:///E|/project/magazine/sendpink.gif','file:///E|/project/magazine/detailblue.gif','file:///E|/project/magazine/logoutorg.gif','file:///E|/project/magazine/docyellow.gif','file:///E|/project/magazine/addresspink.gif','../images/homered.gif','../images/docyellow.gif','../images/carblue.gif','../images/messagegreen.gif','../images/addresspink.gif','../images/detailblue.gif','../images/logoutorg.gif')" link="#666666">
                  
<form method="post" action="./gdeletewriter.php">
  <TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

      <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
        <a href="../welcome.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','../images/homered.gif',1)"><IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1></a><a href="../../reader.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','../images/carblue.gif',1)"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2></a><a href="../message/readmessage.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../images/messagegreen.gif',1)"><IMG 

      height=33 src="../images/message.gif" width=90 border=0 

      name=Image4></a><a href="../address/addressbook.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','../images/addresspink.gif',1)"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><a href="../member/edit_profile.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','../images/detailblue.gif',1)"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5></a><a href="../member/logout.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','../images/logoutorg.gif',1)"><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></a></TD>

  </TR>

  <TR> 

    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=464 width="100%" border=0>
        <TBODY> 
        <TR align="left" bgcolor="#FFFFFF"> 
          <TD vAlign=top width="163" height="497"> 
            <table width="160" border="0" cellpadding="0" cellspacing="0" align="center" height="200">
              <tr align="left" valign="top"> 
                <td nowrap colspan="2" height="18"> 
                  <div align="center"><img src="../images/head_table.gif" width="180" height="20"></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" bgcolor="#FFFFFF" height="185"> 
                  <div align="center"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="193" valign="top"> 
                          <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="170">
                            <tr> 
                              <td height="191" valign="top"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3" height="116">
                                  <tr> 
                                    <td height="21" align="center" valign="middle"><font face="MS Sans Serif"></font></td>
                                  </tr>
                                  <tr> 
                                    <td height="26" align="center" valign="middle"> 
                                      <table width="100%" border="1">
                                        <tr> 
                                          <td align="center"><a href="./adminpage.php"><font size="2"><font size="2"><font face="MS Sans Serif" color="666666"><b>รายชื่อผู้เขียน</b></font></font></font></a></td>
                                        </tr>
                                        <tr> 
                                          <td align="center"><font size="2"><a href="./addwriter.php"><font face="MS Sans Serif" color="666666"><b>เพิ่มชื่อผู้เขียน</b></font></a></font></td>
                                        </tr>
                                        <tr>
                                          <td align="center"><font size="2"><a href="./editwriter.php"><font face="MS Sans Serif" color="666666"><b>แก้ไขข้อมูลผู้เขียน</b></font></a></font></td>
                                        </tr>
                                        <tr> 
                                          <td align="center">
                                              <div align="center"><font size="2"><font size="2"><a href="./deletewriter.php"><font face="MS Sans Serif" color="666666"><b><font color="#FF6600">ลบชื่อผู้เขียน</font></b></font></a> 
                                                </font></font></div>
                                            </td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="180" height="18"></b></font></div>
                </td>
              </tr>
            </table>
          </TD>
          <TD vAlign=top width="727" height="497">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#0000cc"> 
                <td> 
                  <div align="center"><font color="#333333"><b><font size="3" color="#FFFFFF">ลบรายชื่อผู้เขียน</font></b></font></div>
                </td>
              </tr>
              <tr>
                <td> 

                    <table width="100%" border="1">
                      <tr bgcolor="#3366FF" align="center"> 
                        <td width="35%"><font size="2"><b><font color="#FFFFFF" face="MS Sans Serif">ชื่อผู้ใช้</font></b></font></td>
                        <td width="40%"><font size="2"><b><font color="#FFFFFF" face="MS Sans Serif">ชื่อ-นามสกุล</font></b></font></td>
                        <td width="20%" valign="middle"><font color="#FFFFFF" face="MS Sans Serif" size="2"><b>ชื่อเล่น</b></font></td>
                      </tr>
                      <font face="MS Sans Serif" size="2"> 
<?
foreach($checkbox as $id)
{
$sql2="select t1.mem_id, t1.mem_username,t1.mem_fname,t1.mem_lname,t1.mem_nickname from member t1, writer t2 where t1.mem_id=t2.mem_id && t1.mem_id=$id ";
$result2=mysql_db_query($db,$sql2);
$data2=mysql_fetch_array($result2);
echo '<tr align="center">';
echo '<td width="35%"><font color="#910000" size="1" face="MS Sans Serif"><b>'.$data2[1].'</b></font></td>';
echo '<td width="40%"><font color="#000000" size="1" face="MS Sans Serif"><b>'.$data2[2].' '.$data2[3].'&nbsp;</b></font></a></td>';
echo '<td width="20%"><b><font face="MS Sans Serif" size="1">'.$data2[4].'&nbsp;</font></b></td>';
echo '<input type="hidden" name="checkbox['.$id.']" value="'.$id.'">';
echo'                      </tr>';
}
				?> </font> 
                    </table>
                </td>
              </tr>
<tr align="center" valign="middle">
<td >
<table width="100%">
<tr align="center">
<font color="#000000" size="2" face="MS Sans Serif">
                        <div align="center"> คุณต้องการลบรายชื่อผู้เขียนจำนวน <?echo sizeof($checkbox)?> 
                          คน 
                        </div>
</font>
</tr>
<tr align="center">
 <div align="center">
<input type="submit" name="" value="ยืนยันการลบชื่อผู้เขียนบทความ">
</div>
</tr>

</table>
</td>
</tr>
            </table>
              <input type="hidden" name="lastpage" value="gdeletewriter">
            </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>
                  </form>
</BODY>
<?$lastpage='';?>
</HTML>