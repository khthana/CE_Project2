<?
   $hostname = "localhost";
   $username = "magazine";
   $password = "magazine";
   $dbName = "magazine";
   mysql_connect($hostname,$username,$password) or die("can not connect!");
?>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font size="4"><b><font face="Arial, Helvetica, sans-serif" size="7"><i><font color="#FF0000">Article</font></i> 
  management</font></b></font> </p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#330099" align="center">
      <p align="center"><a href="../index.php"><b><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" color="#FFFFFF">Home</font></b></a></p>
    </td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr> 
    <td width="26%" valign="top" height="20" align="center">
      <table width="230" border="1" cellspacing="0" cellpadding="3">
        <tr> 
          <td bgcolor="#FFFFCC" width="25%" align="center"><b><font size="3" color="#000000">Message 
            &gt;</font></b></td>
        </tr>
      </table>
    </td>
    <td width="74%" valign="middle" height="20" align="center">
      <table width="100%" border="1" cellspacing="0" cellpadding="3">
        <tr> 
          <td width="25%" bgcolor="#FFFFCC" align="center"><b> 
<?
	if ($action == "approved") {
		echo "Approved success.";
	}
	else if ($action == "not approved") {
		echo "Not approved success.";	
	}
?>
            </b>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="26%" valign="top" height="229" align="center"> 
      <form enctype="multipart/form-data" method="post" action="columnAdmin.php?action=create">
        <table width="230" border="1" cellspacing="0" cellpadding="3">
          <tr> 
            <td height="8" bgcolor="#CCFFFF"><b><font size="3">List new article</font></b></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6">
              <?
	$sql = "select art_id,art_name,abstract,location,last_update,num_reader,p1.col_id,template from article p1,col p2 where p1.col_id=p2.col_id and art_status='N' order by art_name";
	$SQLresult = mysql_db_query($dbName,$sql);
	if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   	if ($num) {
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);			
			echo "<font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$i. <a href=\"../document/template/$row[template]?template=$row[template]&location=$row[location]&name=index.html&article_id=$row[art_id]&id_col=$row[col_id]\">$row[art_name]</a></front><br>";
		}
	}
?>
              &nbsp;</td>
          </tr>
        </table>
      </form>
      
    </td>
    <td width="74%" valign="top" height="229" align="center"> 
      <?// show column table
	$sql = "select * from article order by art_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
		echo "<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
				  <tr bgcolor=\"#CCFFFF\" align=\"center\"> 
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Article ID</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Name</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Date write</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Last update</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Member ID</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Number</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Status</b></font></td>
				  </tr>
		";
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "
				<tr align=\"center\"> 
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[art_id]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[art_name]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[date_write]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[last_update]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[mem_id]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[num_reader]&nbsp;</font></td>				 
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[art_status]&nbsp;</font></td>
				</tr>
			";
		}
		echo "</table>";
	}	
?>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
