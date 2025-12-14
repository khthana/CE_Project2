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
<p><font size="4"><b><font face="Arial, Helvetica, sans-serif" size="7"><i><font color="#FF0000">Column</font></i> 
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
	if ($action == "create") {
		$sql = "select max(col_id) from col";
		$SQLresult = mysql_db_query($dbName,$sql);
		$row = mysql_fetch_array($SQLresult);
		$col_id = $row[0]+1;
		if ($imageFile == "none")
			$image = "";
		else
			$image = "$col_id.gif";
		$templet = "";
		if ($templetFile == "none") {
			$doCopy = 0;
			$sql = "select template from col where col_id = $parent_col_id";
			$SQLresult2 = mysql_db_query($dbName,$sql);
			$row2 = mysql_fetch_array($SQLresult2);
			if (!$row2[$template])
				$templet = $row2[template];
		}
		else {
			$doCopy = 1;
			$templet = "$col_id.php";
		}
		if ($col_name == "")		
			echo "<font color=\"#FF0000\">CREATE COLUMN FAILE ; Please insert column name !</font>";
		else if ($image && !copy($imageFile,"/www/htdocs/magazine/document/image/$col_id.gif")) {
			echo "<font color=\"#FF0000\">CREATE COLUMN FAILE ; Can not copy image \"$imageFile\".</font><br>";
		}
		else if (($doCopy && !copy($templetFile,"/www/htdocs/magazine/document/template/$col_id.php")) || !$templet) {
			echo "<font color=\"#FF0000\">CREATE COLUMN FAILE ; Can not copy template \"$templetFile\".</font><br>";
		}
		else {
			$sql = "insert into col(col_name,parent_col_id,image,template) values 
					  (\"$col_name\",$parent_col_id,\"$image\",\"$templet\")";
			$SQLresult = mysql_db_query($dbName,$sql);
			if ($SQLresult) {
				$dir = "../article/$col_name";
				if (!mkdir($dir,0777))
					echo "<font color=\"#FF0000\">CREATE DIRECTORY FAILE.</font><br>";
				else if (!chmod($dir, 0777))
					echo "<font color=\"#FF0000\">SET CHMOD FAILE.</font><br>";
				echo "<font color=\"#00FF00\">CREATE COLUMN COMPLETE.</font>";
			}
			else
				echo "<font color=\"#FF0000\">CREATE COLUMN FAILE ; Can not create column !</font>";
		}
	}
	else if ($action == "edit") {
		$sql = "select * from col where col_id=$col_id";
		$SQLresult = mysql_db_query($dbName,$sql);
      $num = mysql_numrows($SQLresult);
	   if ($num) {
			$row = mysql_fetch_array($SQLresult);
			if ($col_name) {
				$col_name = "col_name=\"$col_name\"";
				$comma = ",";
				$doEdit= "true";
			}
			else
				$col_name = "";
			if ($parent_col_id != $col_id) {
				$parent_col_id = " $comma parent_col_id=$parent_col_id";
				$comma = ",";
				$doEdit= "true";
			}
			else
				$parent_col_id = "";
			if ($imageFile!="none") {
				if ($row[$image])
					unlink("/www/htdocs/magazine/document/image/$row[$image]");
				copy($imageFile,"/www/htdocs/magazine/document/image/$col_id.gif");
				$image = " $comma image=\"$col_id.gif\"";
				$doEdit= "true";
			}
			if ($templetFile!="none") {
				if ($row[$template] && ($row[$template]=="$col_id.php"))
					unlink("/www/htdocs/magazine/document/template/$row[$template]");
				copy($templetFile,"/www/htdocs/magazine/document/template/$col_id.php");
				$template = " $comma template=\"$col_id.php\"";
				$doEdit= "true";
			}
			if ($doEdit) {
				$sql = "update col set $col_name $parent_col_id $image $template where col_id=$col_id";
				if (mysql_db_query($dbName,$sql))
					echo "<font color=\"#00FF00\">EDIT COLUMN COMPLETE.</font>";
				else
					echo "<font color=\"#FF0000\">EDIT COLUMN FAILE !</font>";
			}
			else
				echo "<font color=\"#FF0000\">Not input value!</font>";
		}
		else
			echo "<font color=\"#FF0000\">Choose ID Column !</font>";
	}
	else if ($action == "delete") {
		$sql = "select * from col where col_id=$col_id";
		$SQLresult = mysql_db_query($dbName,$sql);
      $num = mysql_numrows($SQLresult);
	   if ($num) {
			$row = mysql_fetch_array($SQLresult);
			if ($row[image]=="")
				$doDeleteImage = 0;
			else
				$doDeleteImage = 1;
			if ($row[template]=="$col_id.php")
				$doDeleteTem = 1;
			else
				$doDeleteTem = 0;
			$sql = "delete from col where col_id=$col_id";
			if ($doDeleteImage && !unlink("/www/htdocs/magazine/document/image/$col_id.gif"))
				echo "<font color=\"#FF0000\">Can not delete image \"/www/htdocs/magazine/document/image/$col_id.gif\".</font><br>";		
			if ($doDeleteTem && !unlink("/www/htdocs/magazine/document/template/$col_id.php"))
				echo "<font color=\"#FF0000\">Can not delete template \"/www/htdocs/magazine/document/template/$col_id.php\".</font><br>";
			if (!rmdir("../article/$row[col_name]"))
				echo "<font color=\"#FF0000\">Can not delete template \"/www/htdocs/magazine/document/template/$col_id.php\".</font><br>";
			if (mysql_db_query($dbName,$sql)) {
				echo "<font color=\"#00FF00\">DELETE COLUMN COMPLETE.</font>";
			}
		}
		else
			echo "<font color=\"#FF0000\">DELETE COLUMN FAILE.</font>";
	}
?>
            </b>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="26%" valign="top" height="459" align="center">
      <form enctype="multipart/form-data" method="post" action="columnAdmin.php?action=create">
        <table width="230" border="1" cellspacing="0" cellpadding="3">
          <tr> 
            <td height="8" bgcolor="#CCFFFF"><b><font size="3">Create column</font></b></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Parent of column : 
              </font> <b> 
              <?
	echo "<select name=\"parent_col_id\">";
	echo "<option value=\"0\" selected> - </option>";
	$sql = "select * from col order by col_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "<option value=\"$row[col_id]\">$row[col_id]</option>";
		}
	}
	echo "</select>";
?>
              </b></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Column name : </font><br>
              <input type="text" name="col_name">
            </td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Location of image's 
              column :</font> <font size="2"> 
              <input type="file" name="imageFile" size="20" enctype="multipart/form-data">
              </font></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Templet file :<br>
              <input type="file" name="templetFile" size="20" enctype="multipart/form-data">
              </font></td>
          </tr>
          <tr> 
            <td height="24" bgcolor="#F6F6F6" align="right"> 
              <input type="submit" name="addColumn" value="Add column">
              <input type="reset" name="Submit3" value="Reset">
            </td>
          </tr>
        </table>
      </form>
      <form name="form1" method="post" action="columnAdmin.php?action=delete">
        <table width="230" border="1" cellspacing="0" cellpadding="3">
          <tr> 
            <td height="17" bgcolor="#CCFFFF"><b>Delete column ID =</b> 
              <?
	echo "<select name=\"col_id\">";
	echo "<option value=\"0\" selected> - </option>";	
	$sql = "select * from col order by col_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			$sql = "select * from col where parent_col_id = $row[col_id]";
			$SQLresult2 = mysql_db_query($dbName,$sql);
			$num2 = mysql_numrows($SQLresult2);
			if (!$num2) {
				$sql = "select col_id from article where col_id = $row[col_id]";
				$SQLresult3 = mysql_db_query($dbName,$sql);
				$num3 = mysql_numrows($SQLresult3);
				if (!$num3) {
					echo "<option value=\"$row[col_id]\">$row[col_id]</option>";
				}
			}
		}
	}
	echo "</select>";
?>
            </td>
          </tr>
          <tr> 
            <td height="17" bgcolor="#F6F6F6" align="right"> 
              <input type="submit" name="deleteColumn" value="Delete column">
              <input type="reset" name="Submit2" value="Reset">
            </td>
          </tr>
        </table>
      </form>
      <form enctype="multipart/form-data" method="post" action="columnAdmin.php?action=edit">
        <table width="230" border="1" cellspacing="0" cellpadding="3">
          <tr> 
            <td height="8" bgcolor="#CCFFFF"><b>Edit column ID = 
              <?
	echo "<select name=\"col_id\">";
	echo "<option value=\"0\" selected> - </option>";	
	$sql = "select * from col order by col_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "<option value=\"$row[col_id]\">$row[col_id]</option>";
		}
	}
	echo "</select>";
?>
              </b></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Parent of column :</font> 
              <b> 
              <?
	echo "<select name=\"parent_col_id\">";
	echo "<option value=\"0\" selected> - </option>";
	$sql = "select * from col order by col_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "<option value=\"$row[col_id]\">$row[col_id]</option>";
		}
	}
	echo "</select>";
?>
              </b></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Column name : </font><br>
              <input type="text" name="col_name">
            </td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Location of image's 
              column :</font> <font size="2"> 
              <input type="file" name="imageFile" size="20" enctype="multipart/form-data">
              </font></td>
          </tr>
          <tr> 
            <td height="2" bgcolor="#F6F6F6"><font size="2">Templet file :<br>
              <input type="file" name="templetFile" size="20" enctype="multipart/form-data">
              </font></td>
          </tr>
          <tr> 
            <td height="24" bgcolor="#F6F6F6" align="right"> 
              <input type="submit" name="editColumn" value="Edit column">
              <input type="reset" name="Submit" value="Reset">
            </td>
          </tr>
        </table>
      </form>
    </td>
    <td width="74%" valign="top" height="459" align="center">
      <?// show column table
	$sql = "select * from col order by col_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
		echo "<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
				  <tr bgcolor=\"#CCFFFF\" align=\"center\"> 
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Column ID</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Column name</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Parent column</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Image</b></font></td>
					 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\"><b>Template</b></font></td>
				  </tr>
		";
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "
				<tr align=\"center\"> 
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[col_id]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[col_name]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[parent_col_id]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[image]&nbsp;</font></td>
				 <td><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$row[template]&nbsp;</font></td>
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
