<?	session_start();
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

<title>Template 7</title>


</head>

<body bgcolor="#FFFFFF">
<center>
<table border="0" cellPadding="0" cellSpacing="0" width="750">
  <tbody>
    <tr height="18">
      
    <td colSpan="2" height="11"><SPACER height="18" width="18" type="block"> </td>
      <td align="left" rowSpan="2" vAlign="bottom" width="208"></td>
    </tr>
    <tr height="52">
      
          <td align="left" height="52" vAlign="bottom" width="209"><font face="Arial" size="1"><img src="../../../document/image/documentm.gif" width="250" height="52"></font></td>
      <td align="middle" height="52" vAlign="bottom" width="333">
        <form action="" id="Shalltech" method="/cgi-bin/formmail.pl" name="">
          <font size="1">
    <!--      <table border="0" cellPadding="0" cellSpacing="0">
            <tbody>
              <tr>
                
                              <td><img src="../../../document/image/search_article.gif" width="108" height="17"></td>
                <td><input name="Shalltech" size="15"></td>
                
                              <td width="23"><img src="../../../document/image/go.gif" width="29" height="23"></td>
              </tr>
              <tr height="6">
                
            <td colSpan="3" height="6"> 
              <p align="right"><SPACER height="6" width="6" 
type="block"><font face="Arial" size="1"> Search Articles for writer</font> 
            </td>
              </tr>
            </tbody>
          </table>
    -->      </font></form>
        </td>
    </tr>
    <tr height="1">
      
    <td align="right" bgColor="#333399" colSpan="3" height="2" vAlign="top"><img alt src="" width="206" height="1"></td>
    </tr>
  </tbody>
</table>

<!-- Begin Main Table -->
<table width="751" border="0" cellspacing="0" cellpadding="0">
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
            <table width="350" cellspacing="0" cellpadding="0" height="377">
              <tr> 
                                        <td colspan="3"><img src="../../../document/image/form_up.gif" width="398" height="56"></td>
              </tr>
              <tr> 
                                        <td width="11%" valign="top" align="left" height="496" bgcolor="#FFFFFF"><img src="../image/form_left3.gif" width="72"></td>
                                        <td colspan="2" align="left" valign="top" bgcolor="#FFFFCC" height="496" width="89%"> 
                                             <!-- #############################--> 
                                             <form enctype="multipart/form-data" action="../../../document/edit_article/edit_table.php" method="post" >

		                                  <table width="90%" cellspacing="0" cellpadding="0" bgcolor="#FFFFCC">
                                                       <tr> 
                                                            <td width="74%" height="40"> 
                                                                 <font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#FF6666"><font color="#0000FF">ชื่อบทความ</font></font></td>
                                                            <td width="26%" height="40"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff">คัมลัมน์</font></td>
                                                       </tr>
                                                       <tr> 
                                  
							    <td width="74%">
<? // =============== article name 
include('connect.inc'); 
$str_sql = "	select	*
		from	article
		where	art_id = $art_id ";
	
$result = mysql_db_query (magazine,$str_sql,$id_link);
$row=mysql_fetch_array($result);
$art_name=$row[art_name];

$col_id = $row[col_id];

 echo "  <input type=\"text\" name=\"art_name\" size=\"35\" value = \"$art_name\" > \n";
?> </td>
                                                           
<td width="26%">
<?
//////// column name////////////

echo "	<select name=\"col_name\" size=\"1\" > ";

//======================================================================================
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
		$column=mysql_fetch_array($result);
		$column_id =$column[0];
		$column_name = $column[1];
		if ( $col_id == $column_id) 
			echo "<option selected>$column_name</option> \n";
		else
			echo "<option>$column_name</option> \n";
	}	
                        
echo "	</select> "; 
?> </td>
                                                       </tr>
                                                       <tr> 
                                                            <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff"> 
                                                                 </font></td>
                                                       </tr>
                                                       <tr> 
                                                            <td colspan="2" height="25"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000ff">Abstract</font></td>
                                                       </tr>
                                                       <tr> 
                                                            <td colspan="2"><?
// ////// Abstract ///////////////////////////////////////////////////////

echo "      <textarea name=\"abstract\" cols=\"50\" rows=\"3\">$row[abstract]</textarea> \n";
?> </td>
                                                       </tr>
                                                       <tr> 

<!--/////////////////////////////////Data/////////////////////////////// -->
                                                      <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff"> Data
                                                                 </font></td>
                                                       </tr>
							<tr>
							    <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff">
								
<?
echo " <textarea name=\"data\" cols=\"50\" rows=\"8\">";

//=============== data article============

$location = $row[location];
$source = "/www/htdocs/magazine/".$location."$file_name";

$fp=fopen ("$source","r");
while ($data=fgets($fp,2048)) 
	{ 		
	echo "$data";
	}
fclose($fp);
//========================================

echo " </textarea> \n";
?>
							</td>
						      </tr>


                                                       <tr> 						    
     
                                                       </tr>
                                                       <tr> 
<td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000ff">key word </font></td>
                                                       </tr>                                                       <td colspan="2">

<?

// ////// Key word //////////////////////////////////////////////////////
// select key word 

$str_sql = "
		select 	key_word
		from	have_key
		where	art_id = $art_id ";

$result = mysql_db_query(magazine,$str_sql,$id_link);
$num_row = mysql_num_rows($result);

for ($old_key = 0 ;$old_key < $num_row; $old_key++) {
	$key = mysql_fetch_array($result);
	$oldkey = $old_key+1;
echo " <input type=\"text\" name=\"key$oldkey\" size=\"15\" value = \"$key[key_word]\"> \n";
}

for ($new_key=$old_key ; $new_key < $old_key+5 ; $new_key++) {
	$newkey = $new_key+1;
echo "	<input type=\"text\" name = \"key$newkey\" size = \"15\" value = \"\"> \n";
}
 ?> </td>
                                                       </tr>
                                                       <tr align="left"> 
                                                            <td colspan="2">
                                                                 <p> 
<?
//====================SELECT POLL =========================== 
	$str_sql= "	select  * 
			from   	poll
			where	art_id = '$art_id'
			";
	$result_poll = mysql_db_query (magazine,$str_sql,$id_link);
	$nf=mysql_num_rows($result_poll);

	for ($poll = 1; $poll <= $nf; $poll++){
		
		$row=mysql_fetch_array($result_poll);
		$poll_id       = $row[0];
		$poll_question = $row[1];
		
		echo "<table bgcolor = \"#cccccc\" width=\"150\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">  \n";
		
		echo "<tr> \n";
		echo " <td colspan=\"0\" align=\"left\"> \n";
		
		echo "<input type=\"checkbox\" name=\"del_poll$poll\" value= \"delete\"> ลบ ";

		echo "<input type = \"text\" name= \"poll$poll\" value = \"$poll_question\" size = \"50\">\n ";
		echo "<input type = \"hidden\" name = \"poll_id$poll\" value = \"$poll_id\" ><br>\n";
		
		echo "  </td> \n";
		echo "</tr> \n";
//==========================SELECT CHOICE ===========================
		$str_sql= "	select  * 
				from   	choice
				where	poll_id = '$poll_id'
				";
		$result_choice = mysql_db_query (magazine,$str_sql,$id_link);
		$num_choice = mysql_num_rows($result_choice);
		echo "<tr> \n";
		echo " <td colspan=\"0\" align=\"left\"> \n";
		echo "<ul>";
		for ($number_choice = 1; $number_choice <= $num_choice; $number_choice++)
		{
			$row=mysql_fetch_array($result_choice);
			$choice_id = $row[0];
			$choice = $row[1];
                                                                       
			echo " <li><input type=\"text\" name=\"choice$poll$number_choice\" value=\"$choice\" size = \"30\"></li>\n";
			echo " <input type = \"hidden\" name = \"choice_id$poll$number_choice\" value=\"$choice_id\"> \n";
		}
			echo "</ul>";
		echo "  </td> \n";
		echo "</tr> \n";
		echo "</table> \n";
		echo " <input type = hidden name = \"num_choice$poll\" value = \"$num_choice\" > \n";

		}
		echo " <a href=\"addvote.php?art_id=$art_id\"><font size=\"1\" face=\"MS Sans Serif, Microsoft Sans Serif\" color=\"#FF0000\">Add more poll>></font></a> \n";

?>

                           </p>
			  
                                                                 </td>
                                                       </tr>
							<tr align="left"> 
                                                            <td colspan="2">


<?
//====================SELECT question =========================== 
	$str_sql= "	select  * 
			from   	opinion
			where	art_id = '$art_id'
			";
	$result_question = mysql_db_query (magazine,$str_sql,$id_link);
	$nf=mysql_num_rows($result_question);

	for ($num_question = 1; $num_question <= $nf; $num_question++){

		$row=mysql_fetch_array($result_question);
		$op_id = $row[0];
		$op_question = $row[1];
		echo "<input type=\"checkbox\" name=\"del_question$num_question\" value= \"delete\"> ลบ ";
		echo "<input type = text name = \"question$num_question\" value = \"$op_question\" size = 60> \n ";
		echo "<input type = hidden name = \"op_id$num_question\" value = \"$op_id\">\n";	
	}
	echo "<input type = hidden  name =  \"num_question\" value = \"$nf\"> \n";
//================================================================	
echo " <a href=\"addquestion.php?art_id=$art_id\"><font size=\"1\" face=\"MS Sans Serif, Microsoft Sans Serif\" color=\"#FF0000\">Add more question >></font></a> <br> \n";
echo " <a href=\"show_relate.php?art_id=$art_id\"><font size=\"1\" face=\"MS Sans Serif, Microsoft Sans Serif\" color=\"#FF0000\">Edit Related Article >></font></a> \n";
?>					
					

							</tr>
							</td>


                                                       <tr> 
                                                            <td colspan="2" align="center"> 
                                                                 <?
echo "	<input type =\"hidden\" name = \"num_poll\" value = \"$poll\">"; 
echo "  <input type=\"hidden\" name = \"art_id\" value= \"$art_id\"> ";	
echo "  <input type=\"hidden\" name = \"new_key\" value = \"$new_key\">";
echo "  <input type=\"hidden\" name = \"source\" value = \"$source\"> ";
?><br>
                    <input type="submit" name="submit" value="Submit">
                    <input type="reset" name="reset" value="Reset">
                                                            </td>
                                                       </tr>
                                                  </table>
		  </form>
                </td>
              </tr>
              <tr> 
                                        <td colspan="3" height="5">&nbsp; </td>
              </tr>
            </table>
            <div align="left"> </div>
          </td>
            
          <td align="left" bgColor="#333399" vAlign="bottom" width="10" height="630">&nbsp;</td>
            
          <td align="left" vAlign="top" width="1" height="630">&nbsp; </td> 
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
                                                  <p><img src="../../../document/image/pen.gif" width="100" height="100"></p>
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
                                             <font face="MS Sans Serif, Microsoft Sans Serif"><a href="x">help</a></font> 
                                             </font></font><font face="geneva,veranda,arial" size="1"></font><font face="geneva,veranda,arial" size="1"></font><font size="2"></font> 
                                             </font></td>
              </tr>
              <tr> 
                <td colSpan="2">&nbsp;</td>
              </tr>
              </tbody> 
            </table>
            </td>
         
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


</center>
</body>

</html>
