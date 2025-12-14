<?session_start();
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

<title>Document Manegement System</title>


</head>

<body bgcolor="#FFFFFF">
<table border="0" cellPadding="0" cellSpacing="0" width="750" align="center">
  <tbody> 
  <tr height="18">
      
    <td colSpan="2" height="11"><SPACER height="18" width="18" type="block"> </td>
      <td align="left" rowSpan="2" vAlign="bottom" width="208"></td>
    </tr>
    <tr height="52">
      
          <td align="left" height="52" vAlign="bottom" width="209"><font face="Arial" size="1"><img src="../image/documentm.gif" width="250" height="52"></font></td>
      <td align="middle" height="52" vAlign="bottom" width="333">
        <form action="" id="Shalltech" method="/cgi-bin/formmail.pl" name="">
          <font size="1">
      <!--   <table border="0" cellPadding="0" cellSpacing="0">
            <tbody>
              <tr>
                
                              <td><img src="../image/search_article.gif" width="108" height="17"></td>
                <td><input name="Shalltech" size="15"></td>
                
                              <td width="23"><img src="../image/go.gif" width="29" height="23"></td>
              </tr>
              <tr height="6">
                
            <td colSpan="3" height="6"> 
                                   <p align="right"><SPACER height="6" width="6" 
type="block"><font face="Arial" size="1"> Search Articles for Reading</font> 
                              </td>
              </tr>
            </tbody>
          </table>
      -->    </font></form>
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
                                        <td colspan="2"><img src="../image/w_content.gif" width="120" height="22"></td>
              </tr>
 <?
 ////////////show column////////////////////////////////////////////////////
	$sql =  "	select		* 
			from		col 
			where		parent_col_id = $id_col 
			order by	col_name";

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
/////////////////////////////////////////////////////////////////////////////
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
            
                         <td align="left" vAlign="top" width="580" height="630"><!-- #BeginEditable "form" --> 
                              <table width="350" cellspacing="0" cellpadding="0" height="377">
              <tr> 
                                        <td colspan="3"><img src="../image/form_top.gif" width="398" height="56"></td>
              </tr>
              <tr> 
                                        <td width="22%" valign="top" align="left" height="483" bgcolor="#FFFFCE"><img src="../image/form_left.gif" width="72" height="515"></td>
                                        <td colspan="2" align="left" valign="top" bgcolor="#FFFFCC" height="483"> 
                                             <form method="post" action="onweb_relate.php">
                                                  <table width="90%" cellspacing="0" cellpadding="0">
                    <tr> 
                                                       <td width="74%" height="40"> 
                                                            <p><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#FF6666"><font color="#0000FF">ชื่อบทความ</font></font></p>
                                                            </td>
                      <td width="26%"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff">คัมลัมน์</font></td>
                    </tr>
                    <tr> 
                      <td width="74%"> 
                                                                 <input type="text" name="art_name" size="35">
                      </td>
                      <td width="26%"> 
                        <select name="col_name" size="1">
<?
//======================================================================================
include ('connect.inc');

        $str_sql = "
			select		write_col.col_id,col.col_name,write_col.mem_id
			from		col,write_col
			where		write_col.col_id=col.col_id
				and	write_col.mem_id = $user_id
		   ";

		$str_sql2 = " 
			select *
			from	col ";
    if (strpos(" $user_types","A") == 0)  
		$result = mysql_db_query (magazine,$str_sql,$id_link);
	else
		$result = mysql_db_query (magazine,$str_sql2,$id_link);
	$nf=mysql_num_rows($result);
	
	for($line=1; $line<=$nf; $line++) {
		$row=mysql_fetch_array($result);
		$col_name = $row[1];
		echo "<option>$col_name</option> \n";
	}	
               
			
?>			
			</select>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff">ข้อมูลในบทความ</font></td>
                    </tr>
                    <tr> 
                                                            <td colspan="2" height="131"> 
                                                                 <textarea name="data_article" cols="50" rows="8"></textarea>
                        </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000ff">Abstract</font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"> 
                                                                 <textarea name="abstract" cols="50" rows="3"></textarea>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff">key 
                        word </font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"> 
                        <input type="text" name="key1" size="10">
                        <input type="text" name="key2" size="10">
                        <input type="text" name="key3" size="10">
                        <input type="text" name="key4" size="10">
                        <input type="text" name="key5" size="10">
                        <input type="text" name="key6" size="10">
                        <input type="text" name="key7" size="10">
                        <input type="text" name="key8" size="10">
                        <input type="text" name="key9" size="10">
                        <input type="text" name="key10" size="10">
                      </td>
                    </tr>
                    <tr> 
                      <td width="74%"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000ff">จำนวน 
                        Vote</font><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000"> 
                        </font></td>
                      <td width="26%"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000ff">จำนวน 
                        Question</font></td>
                    </tr>
                    <tr> 
                                                            <td width="74%" height="13"> 
                                                                 <input type="text" name="num_poll" size="5">
                      </td>
                                                            <td width="26%" height="13"> 
                                                                 <input type="text" name="num_question" size="5">
                      </td>
                    </tr>
                    <tr align="center"> 
                      <td colspan="2"> 
                        <input type="submit" name="submit" value="Submit">
                        <input type="reset" name="reset" value="Reset">
                      </td>
                    </tr>
                  </table>
	            </form>
                </td>
              </tr>
              <tr> 
                                        <td colspan="3" height="5"><img src="../image/form_bottom.gif" width="398" height="56"></td>
              </tr>
            </table>
            <div align="left"><!-- End Content --> </div>
            <!-- #EndEditable --></td>
            
                         <td align="left" bgColor="#333399" vAlign="bottom" width="119" height="630">&nbsp;</td>
            
          <td align="left" vAlign="top" width="1" height="630">&nbsp; 
          <td align="left" bgColor="#333399" vAlign="bottom" width="1" height="630"><img alt="line" height="40" src="" width="1"></td>
            
          <td align="left" vAlign="top" width="207" height="630"> 
            <table border="0" cellPadding="0" cellSpacing="0">
              <tbody> 
              <tr height="22"> 
                                        <td colSpan="2" height="22"><img src="../image/writer_tool.gif" width="206" height="22"></td>
              </tr>
              <tr> 
                <td align="left" vAlign="top" width="15" height="141"><SPACER height="15" width="15" 
type="block"> </td>
                <form action="http://papower.state.pa.us/PAPower/Default.asp" id="form1" method="post" name="form1">
                  <td align="left" vAlign="top" width="191" height="141"> 
                                                  <p><img src="../image/pen.gif" width="100" height="80"></p>
                                                  <p><a href="../../../document/onweb/onweb.php"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">Create 
                                                       article on web</font></a></p>
                                                  <p><a href="../../../document/upload/upload.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Create 
                                                       article by upload file</font></a></p>
                                                  <p><a href="../../../document/edit_article/delete.php"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">Delete 
                                                       your artilce</font></a></p>
                                                  <p><a href="../../../document/edit_article/page_edit.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Edit 
                                                       you article</font></a></p>
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
                                        <td colSpan="2" height="22"><img src="../image/read_article.gif" width="206" height="22"></td>
              </tr>
              <tr> 
                <td><img alt="line" height="40" src="" width="1"></td>
                                        <td width="191" valign="top"><font face="geneva,veranda,arial" size="1"><br>
                                             <a href="health.php"><font face="geneva,veranda,arial" size="1"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"></font></font></a><font face="geneva,veranda,arial" size="1"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><a href="../../../reader.php">read 
                                             article</a></font></font><font face="geneva,veranda,arial" size="1"><font size="2"><br>
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="../../calendar/welcome.php">calendar</a> 
                                             </font><br>
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="../../calendar/member/edit_profile.html">member</a></font></font></font><font face="geneva,veranda,arial" size="1"><font size="2"><br>
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="../../search.php">advance 
                                             search</a></font><br>
                  </font></font><font size="2"><br>
                                             </font><br>
                                             </font></td>
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


