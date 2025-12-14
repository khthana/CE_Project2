<?	session_start();
	$user_type = "W";
	session_unregister("user_type");
	session_register("user_type");
	$user_action = "edit";
	session_unregister("user_action");
	session_register("user_action");
   include("checkauth.inc");
   $hostname = "localhost";
   $username = "magazine";
   $password = "magazine";
   $dbName = "magazine";
   mysql_connect($hostname,$username,$password) or die("can not connect!");
	if ($id_col == "")
	$id_col = "0";	//***
?>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<!-- #BeginEditable "doctitle" --> 
<title>Magazine Online</title>
<!-- #EndEditable --> 

</head>

<body bgcolor="#FFFFFF">
<table border="0" cellPadding="0" cellSpacing="0" width="750" align="center">
  <tbody> 
  <tr height="18">
      
    <td colSpan="2" height="11"><SPACER height="18" width="18" type="block"> </td>
      <td align="left" rowSpan="2" vAlign="bottom" width="208"></td>
    </tr>
    <tr height="52">
      
          <td align="left" height="52" vAlign="bottom" width="209"><font face="Arial" size="1"><img src="../../../document/image/documentm.gif" width="250" height="52"></font></td>
      <td align="middle" height="52" vAlign="bottom" width="333">      
      <form  name="searchEdit" method="post" action="../../search/searchBasic.php">
        <font size="1"> 
        <table border="0" cellPadding="0" cellSpacing="0">
            <tbody>
              <tr>
                
                              <td><img src="../../../document/image/search_article.gif" width="108" height="17"></td>
                <td>
              <input name="keyword" size="15">
            </td>
                
                              <td width="23"><input type=image width="29" height="23" src="../../../document/image/go.gif" name="go"></td>
              </tr>
              <tr height="6">
                
            <td colSpan="3" height="6"> 
              <p align="right"><SPACER height="6" width="6" 
type="block"><font face="Arial" size="1"> Search Articles for edit</font> 
            </td>
              </tr>
            </tbody>
          </table>
          </font></form>
        </td>
    </tr>
    <tr height="1">
      
    <td align="right" bgColor="#333399" colSpan="3" height="2" vAlign="top"><img alt src="" width="206" height="1"></td>
    </tr>
  </tbody>
</table>
<!-- End Top Navigation -->
<!-- Begin Main Table -->
<table width="751" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
          <td width="120" align="left" valign="top" height="704"><!-- Begin Left Navigation --> 
               <table border="0" cellPadding="0" cellSpacing="0" width="748">
        <tbody> 
        <tr>
            
          <td vAlign="top" width="120" height="630"> 
            <table border="0" cellPadding="0" cellSpacing="0" width="120">
              <!-- PA Navigator in page--> <tbody> 
              <tr> 
                                        <td colspan="2"><img src="../../../document/image/w_content.gif" width="120" height="22"></td>
              </tr>
              <tr> 
                <td colspan="2"></td>
              </tr>
              
 <?
 ////////////show column
	$sql = "select * from col where parent_col_id = $id_col order by col_name";
	$SQLresult = mysql_db_query($dbName,$sql);
		$num = mysql_numrows($SQLresult);
	if ($num) {
      for ($i=1;$i<=$num;$i++) {
  	      $row = mysql_fetch_array($SQLresult);
   //		echo "<font color=\"#FFFFFF\" size=\"2\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\"><a href=\"../../reader.php?id_col=$row[col_id]\">$row[col_name]</a></font><br>";
		echo "<tr bgcolor=\"#FFFFFF\">"; 

                    echo " <td width=\"21\" align=\"center\"><img src=\"../../../document/image/icon_column.gif\" width=\"12\" height=\"12\"></td>";
                    echo " <td width=\"106\" height=\"20\"><a href=\"../../reader.php?id_col=$row[col_id]\"><font color = #FF0000>$row[col_name]</font></a></td>";
		echo "</tr>";
	      }
	}
?>
              <tr> 
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="2"></td>
              </tr>
              <tr> 
                <td colspan="2"></td>
              </tr>
              <!-- PA Calendar--> 
              <tr> 
                <td colspan="2"></td>
              </tr>
              </tbody> 
            </table>
              <!-- End Left Navigation -->
            </td>
            
          <td align="left" vAlign="top" width="699" height="630"><!-- #BeginEditable "form" --> 
                              <table width="100%" cellspacing="0" cellpadding="0" height="377">
                                   <tr> 
                                        <td colspan="3"><img src="../../../document/image/form_edit.gif" width="398" height="56"></td>
                                   </tr>
                                   <tr> 
                                        <td valign="top" align="left" bgcolor="#FFFFFF" width="72"><img src="../../../document/image/form_left3.gif" width="72" height="250"></td>
                                        <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF" height="496" width="331"> 
                                             <table width="330" border="0" cellspacing="0" cellpadding="10" bgcolor="#FFFFCE">
                                                  <tr> 
                                                       <td><font color="#FF3333" size="2" face="MS Sans Serif, Microsoft Sans Serif">บทความที่ท่านสามารถแก้ไข้ได้ 
                                                            </font> </td>
                                                  </tr>
                                                  <tr> 
                                                       <td height="83"> 
                                                            <p>
<?session_start();
	include ('connect.inc');
	if ($action=="search") {
		echo $searchResult;
	}
	else {
	//====================SELECT article for edit =========================== 
		$str_sql= "select * from article";
		if (strpos(" $user_types","A") == 0)
			$str_sql = "$str_sql where mem_id = '$user_id'";
		$str_sql="$str_sql order by last_update desc";
		$result_article = mysql_db_query (magazine,$str_sql,$id_link);
		$nf=mysql_num_rows($result_article);
		echo "<ul>";
		for ($num_art=1;(($num_art<=$nf)and($num_art<=10));$num_art++) {
			$row = mysql_fetch_array($result_article);
			$art_id = $row[0];
			$art_name = $row[1];
			$location = $row[2];
			$abstract = $row[3];
			$last_update = $row[5];

//=====swap date		

			$pos=strpos ($last_update,"-");
			$year = substr ($last_update,0,$pos);    // returns "bcdef"
			$last_update = substr ($last_update,$pos+1);	

			$pos=strpos ($last_update,"-");
			$month = substr ($last_update,0,$pos);    // returns "bcdef"
			$last_update = substr ($last_update,$pos+1);	 
		
			$date = $last_update;
		
			$last_update = $date."/".$month."/".$year;

		// =========== SHOW  article for edit ===========================
			echo "<font color =\"#000000\"size=\"1\" face=\"MS Sans Serif, Microsoft Sans Serif\"> \n";
			echo "<li>$art_name \n";
			echo "<font color = \"#00cccc\"> ";
			echo "&nbsp &nbsp[ $last_update ] </li><br>\n";
			echo "</font>";
			$location = "/www/htdocs/magazine/".$location;
			include ('dir.inc');
			echo "</font> \n";
		}
		echo "</ul>";
	}
?> </p>
                                                            <p>&nbsp;</p>
                                                       </td>
                                                  </tr>
                    
                                                  <tr> 
                                                       <td>
                                                            <hr size="1" noshade>
                                                       </td>
                                                  </tr>
                                             </table>
                                        </td>
                                   </tr>
                                   <tr> 
                                        <td colspan="3" height="5">&nbsp;</td>
                                   </tr>
                              </table>
                              <div align="left"><!-- End Content --> </div>
                              <!-- #EndEditable --></td>
            
          <td align="left" bgColor="#333399" vAlign="bottom" width="10" height="630">&nbsp;</td>
            
          <td align="left" vAlign="top" width="1" height="630">&nbsp; 
          <td align="left" bgColor="#333399" vAlign="bottom" width="1" height="630"><img alt="line" height="40" src="" width="1"></td>
            
          <td align="left" vAlign="top" width="207" height="630"> 
            <table border="0" cellPadding="0" cellSpacing="0">
              <tbody> 
              <tr height="22"> 
                                        <td colSpan="2" height="22"><img src="../../../document/image/writer_tool.gif" width="206" height="22"></td>
              </tr>
              <tr> 
                <td align="left" vAlign="top" width="15" height="141"><SPACER height="15" width="15" 
type="block"> </td>
                <form action="http://papower.state.pa.us/PAPower/Default.asp" id="form1" method="post" name="form1">
                  <td align="left" vAlign="top" width="191" height="141"> 
                                                  <p><img src="../../../document/image/pen.gif" width="100" height="80"></p>
                                                  <p><a href="../../../document/onweb/onweb.php"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">Create 
                                                       article on web</font></a></p>
                                                  <p><a href="../../../document/upload/upload.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Create 
                                                       article by upload file</font></a></p>
                                                  <p><a href="../../../document/edit_article/delete.php"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">Delete 
                                                       your artilce</font></a></p>
                                                  <p><a href="../../../document/edit_article/page_edit.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Edit 
                                                       your article</font></a></p>
                    <table border="0" cellpadding="0" cellspacing="0" width="192">
                      <tbody> 
                      <tr> 
                        <td></td>
                        <td></td>
                        <td width="23"></td>
                      </tr>
                      </tbody> 
                    </table>
                    <p>&nbsp; </p>
                  </td>
                </form>
              </tr>
              <tr height="22"> 
                                        <td colSpan="2" height="22"><img src="../../../document/image/read_article.gif" width="206" height="22"></td>
              </tr>
              <tr> 
                <td><img alt="line" height="40" src="" width="1"></td>
                                        <td width="191" valign="top"><font face="geneva,veranda,arial" size="1"><font face="geneva,veranda,arial" size="1"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><a href="../../../reader.php">read 
                                             article</a></font></font><font face="geneva,veranda,arial" size="1"><font size="2"><br>
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="../../calendar/welcome.php">calendar</a> 
                                             </font><br>
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="../../calendar/member/edit_profile.html">member</a></font></font></font><font face="geneva,veranda,arial" size="1"><font size="2"><br>
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="../../search.php">advance 
                                             search</a></font><br>
                  </font></font> </font></td>
              </tr>
              <tr> 
                <td colSpan="2">&nbsp;</td>
              </tr>
              </tbody> 
            </table>
            </td>
            <!-- End Right Nav -->
          </tr>
        </tbody>
      </table>
      <!-- Begin Footer -->
      <table border="0" cellPadding="0" cellSpacing="0" width="750">
        <tbody>
          <tr height="1">
            <td align="right" bgColor="#333399" height="1" vAlign="top"><img alt="line" src="" width="206" height="1"></td>
          </tr>
          <tr>
            
          <td align="middle" height="2"> 
            <table border="0" cellPadding="0" cellSpacing="0" width="695">
                <tbody>
                  <tr>
                    
                <td bgColor="#ffffff" width="693" height="2"> 
                                             <p align="center"><font size="1" face="Arial">King Mongkut's Institute of Technology Landkrabang Department of Computer Engineering
					     </font></p>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>

          </tr>
        </tbody>
      </table>
      
</table>

</body>

</html>

