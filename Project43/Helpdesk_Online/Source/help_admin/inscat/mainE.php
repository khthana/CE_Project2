<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
	include('dbconnect.inc');

		if ($Submit)

		{

			$sql3 = "select CatName from CATEGORY where CatName='$CatName' and CatID <> '$CatID'";

			$result = mysql_db_query($dbname,$sql3);

			$nrow = mysql_numrows($result);

			if ($nrow!=0)

			{

			header ("Location: initE.php?flag=1");  

			exit;					

			}

			if ($PName != 'Main')

			{

				$sql3 = "select CatID from CATEGORY where CatName='$PName'";

				$result = mysql_db_query($dbname,$sql3);

				$nrow = mysql_numrows($result);

				if ($nrow==0)

				{

				header ("Location: initE.php?flag=1");  

				exit;					

				}

				$PID = mysql_fetch_array($result);

			}else

			{

				$PID[0] = 0;

			}

			$sql2 = "update CATEGORY set CatName='$CatName' , ParentID= '$PID[0]' where CatID = '$CatID'";

			$result = mysql_db_query($dbname,$sql2);			

			header ("Location: initE.php?flag=0");  

			exit;					

		}else

		{

			$sql1 = "select CatID,CatName,ParentID from CATEGORY where CatID=$EID";

			$result = mysql_db_query($dbname,$sql1);

			$editarry = mysql_fetch_array($result);

			$parentid = $editarry["ParentID"];

			if ($parentid != '0')

			{

				$sql1 = "select CatName  from CATEGORY where CatID=$parentid";

				$result1 = mysql_db_query($dbname,$sql1);

				$parry = mysql_fetch_array($result1);

				$parentname = $parry['CatName'];;

			}else

			{

				$parentname = "Main";

			}

?>

<html>

<head>

<title>Un title page</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

<style type="text/css">

<!--

body {  margin: 0px  0px; padding: 0px  0px}

a:link { color: #005CA2; text-decoration: none}

a:visited { color: #005CA2; text-decoration: none}

a:active { color: #0099FF; text-decoration: underline}

a:hover { color: #0099FF; text-decoration: underline}

-->

</style>

</head>



<body bgcolor="#FFFFCC">

<div align="center">

  <p>&nbsp;</p>

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">แก้ไข 

    Category</font></p>

  <form method="post" action="mainE.php" name="E_cat">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr> 

        <td width="50%"> 

          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF">Parent 

            Category : </font></div>

        </td>

        <td width="50%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

          <input type="text" name="PName" maxlength="40" value="<?echo $parentname;?>">

        </td>

      </tr>

      <tr> 

        <td width="50%"> 

          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF"> 

            Category Name: </font></div>

        </td>

        <td width="50%">

          &nbsp;&nbsp;&nbsp&nbsp;&nbsp; 

          <input type="text" name="CatName" maxlength="40" value="<?echo $editarry['CatName'];?>">

         </td>

      </tr>

      <tr>

        <td width="50%">&nbsp;</td>

        <td width="50%">

          <input type="hidden" name="parentid" value="<?echo $parentid;?>">

          <input type="hidden" name="CatID" value="<?echo $EID;?>">

        </td>

      </tr>

      <tr> 

        <td width="50%"> 

          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF"> 

            <input type="reset" name="Reset" value="Reset">

            </font></div>

        </td>

        <td width="50%"> 

          <div align="left">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="Submit">

          </div>

        </td>

      </tr>

    </table>

  </form>

  <p>&nbsp;</p>

  <table width="50%" border="0" cellspacing="0" cellpadding="0">

    <tr>

      <td width="7%" height="28">&nbsp;</td>

      <td width="19%" height="28"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><i>หมายเหตุ</i></b></font> 

      </td>

      <td width="67%" height="28"> 

        <p>&nbsp;</p>

      </td>

      <td width="7%" height="28">&nbsp;</td>

    </tr>

    <tr>

      <td width="7%">&nbsp;</td>

      <td width="19%">&nbsp;</td>

      <td width="67%"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2">- 

        ชื่อ category เป็น case sensitive</font></td>

      <td width="7%">&nbsp;</td>

    </tr>

    <tr>

      <td width="7%">&nbsp;</td>

      <td width="19%">&nbsp;</td>

      <td width="67%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF3399">- 

        ถ้าต้องการแก้ให้ category ที่เลือก ไปอยู่เป็น main category ให้ใส่ Parent 

        Name = Main</font></td>

      <td width="7%">&nbsp;</td>

    </tr>

  </table>

  <p>&nbsp; </p>

  </div>

</body>

</html>

<?	

		} // end else $submit

?>

