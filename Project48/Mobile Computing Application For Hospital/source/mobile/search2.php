<?
		include("database.php");
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		check_session();
		check_permit();
		header_admin("สืบค้นข้อมูลผู้ป่วย");

		$dbname = "hospital";	
		$tblname = "tblpatientbasicdata";	
		mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
		$sql_search = "select * from $tblname where $type like '%$search%' order by PatientID,FName";	
		$db_query_search = mysql_db_query($dbname, $sql_search);
		$num_rows_search = mysql_num_rows($db_query_search);
		$num_fields = mysql_num_fields($db_query_search);
?>
	<TABLE cellSpacing="0"cellPadding="0" width="100%" align="center" >
	<TR>
		<TD><font face = "MS Sans Serif" color="#000000" size="2"></font>&nbsp; <BR>
      
	  <TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" border="0">
        <TBODY>
        <TR>
 <? 

		
			$pagesize = 20;
			$status_admin="";
			$status1 = "../image/icon_pin.gif ";
			if (empty($page)){
				$page=1;
			}   

		$q_sql = "select * from $tblname where $type like '%$search%'  order by  PatientID";
			$q_db_query = mysql_db_query ($dbname, $q_sql);
			$num_rows = mysql_num_rows($q_db_query);
			$rt = $num_rows%$pagesize;	// หาจำนวนหน้าทั้งหมด

			if($rt!=0) 
				{ 
					$totalpage = floor($num_rows/$pagesize)+1; 
				}
			else 
				{
					$totalpage = floor($num_rows/$pagesize); 
				}

			$goto = ($page-1)*$pagesize;	// หาหน้าที่จะกระโดดไป

			$sql = "select * from $tblname order by PatientID ASC limit $goto,$pagesize";
			$db_query = mysql_db_query ($dbname, $sql);
				if (!$db_query)
					{ 
						echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
						exit;
					}
				else	 
					{
						$nums_rows = mysql_num_rows($db_query);	 
					}

?>
		</TR>
		</TBODY>
	</TABLE><br><br>
	
	<TABLE  cellSpacing=0 cellPadding=2 width="100%" border=1>
	<TBODY>
		<TR bgColor=#CCCCCC>
			<TD align=middle width="7%"><font face = "MS Sans Serif" color="#000000" size="1"><B>รหัส</B></FONT></TD>
			<TD align=middle width="10%"><font face = "MS Sans Serif" color="#000000" size="1"><B>IDCard</B></FONT></TD>
			<TD align=middle width="15%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ชื่อ</B></FONT></TD>
			<TD align=middle width="7%"><font face = "MS Sans Serif" color="#000000" size="1"><B>กรุ๊ปเลือด</B></FONT></TD>
			<TD align=middle width="8%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ส่วนสูง</B></FONT></TD>
			<TD align=middle width="15%"><font face = "MS Sans Serif" color="#000000" size="1"><B>น้ำหนัก </B></FONT></TD>
			<TD align=middle width="13%"><font face = "MS Sans Serif" color="#000000" size="1"><B>อาชีพ</B></FONT></TD>
			<TD align=middle width="13%"><font face = "MS Sans Serif" color="#000000" size="1"><B>เบอร์มือถือ</B></FONT></TD>
			<TD align=middle width="4%"><font face = "MS Sans Serif" color="#000000" size="1"><B>เบอร์บ้าน</B></FONT></TD>
		</TR>

<?	

// พิมพ์ส่วนหัวตาราง
$swap="#cce9fd";
for ($i=0;$i < $num_rows_search;$i++)
	{
		
							$result = mysql_fetch_array($db_query_search);
							@$p_id = $result[PatientID];
							@$id_card = $result[IDCard];
							@$name = $result[Name];
							@$bg = $result[BloodGroup];
							@$h = $result[Height];
							@$w = $result[Weight];
							@$o = $result[Occupation];
							@$mp = $result[Mobile_Phone];
							@$p = $result[Phone];

if(($total_borrow >= 1)&&($total_borrow <=5))
							{
							$status = "<img src =\"image/icon_new.gif \" border =\"0\">";
							}
							else if($total_borrow >= 1){
							$status = " <IMG  src =\"image/icon_reply.gif\" border =\"0\">";
						}
					else{
							$status = "<img src =\"image/icon_pin.gif \" border =\"0\">";
							
							}
	
print <<<EOT
<TR bgColor="99FFFF">
    <TD align=left width="7%"><font face = "MS Sans Serif" color="#000000" size="1">$p_id </font></TD>
    <TD align=left width="10%"><font face = "MS Sans Serif" color="#000000" size="1">$id_card</font></TD>
    <TD align=left width="15%"><font face = "MS Sans Serif" color="#000000" size="1">$name</FONT></TD>
    <TD align=left width="7%"><font face = "MS Sans Serif" color="#000000" size="1">$bg</FONT></TD>
    <TD align=left width="8%"><font face = "MS Sans Serif" color="#000000" size="1">$h</FONT></TD>
    <TD align=left width="15%"><font face = "MS Sans Serif" color="#000000" size="1">$w</FONT></TD>
	<TD align=left width="13%"><font face = "MS Sans Serif" color="#000000" size="1">$o</FONT></TD>
	<TD align=left width="13%"><font face = "MS Sans Serif" color="#000000" size="1">$mp</FONT></TD>
	<TD align=left width="10%"><font face = "MS Sans Serif" color="#000000" size="1">$p</FONT></TD></TR>

EOT;
	}

//end While

echo "<tr bgcolor=\"#CCCCCC\"><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"> แสดงผลการค้นหาข้อมูลที่มีคำว่า [<font face = \"MS Sans Serif\" color=\"#000000\" size=\"2\">".$search."</font><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\">] </font>";
echo "&nbsp;&nbsp;&nbsp;&nbsp;<font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"> ค้นพบ </font><font face = \"MS Sans Serif\" color=\"#000000\" size=\"2\"><b>". $i."</b></font><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"> เรกคอร์ด</font>";
echo "&nbsp;&nbsp;&nbsp;&nbsp;<A Href="."form_search2.php".">กลับไปค้นหาใหม่ </A></tr><br>";

mysql_close();	// ปิดการเชื่อมต่อ

?> 
</center></TD></TR></TBODY></TABLE><br><br>
<? 
	require_once("footer.php"); 
?>

