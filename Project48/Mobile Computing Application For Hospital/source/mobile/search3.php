<?
		include("database.php");
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		check_session();
		header_admin("สืบค้นประวัติการรักษา");

		$dbname = "hospital";	
		$tblname = "tbltreathistory";	
		mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
		$sql_search = "select * from $tblname,tbldoctor,tblpatientbasicdata where $type like '%$search%' and tbldoctor.DoctorID=$tblname.DoctorID and tblpatientbasicdata.PatientID=$tblname.PatientID order by ListID";	
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
			if (empty($page))
			{
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

			$sql = "select * from $tblname order by ListID ASC limit $goto,$pagesize";
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
	
	<TABLE cellSpacing=0 cellPadding=2 width="100%" border=1>
	<TBODY>
		<TR bgColor=#CCCCCC>
			<TD align=middle width="7%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ลำดับ</B></FONT></TD>
			<TD align=middle width="10%"><font face = "MS Sans Serif" color="#000000" size="1"><B>รหัสผู้ป่วย</B></FONT></TD>
			<TD align=middle width="20%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ชื่อผู้ป่วย</B></FONT></TD>
			<TD align=middle width="20%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ชื่อเเพทย์</B></FONT></TD>
			<TD align=middle width="8%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ห้อง</B></FONT></TD>
			<TD align=middle width="8%"><font face = "MS Sans Serif" color="#000000" size="1"><B>เตียง</B></FONT></TD>
			<TD align=middle width="12%"><font face = "MS Sans Serif" color="#000000" size="1"><B>เข้ารับการรักษา</B></FONT></TD>
			<TD align=middle width="12%"><font face = "MS Sans Serif" color="#000000" size="1"><B>ออก </B></FONT></TD>
		</TR>

<?	

// พิมพ์ส่วนหัวตาราง
$swap="#cce9fd";

for ($i=0;$i < $num_rows_search;$i++)
	{
		
							$result = mysql_fetch_array($db_query_search);
							@$list = $result[ListID];
							@$p_id = $result[PatientID];
							@$p_name = $result[Name];
							@$d_name = $result[DoctorName];
							@$room = $result[RoomNo];
							@$bed = $result[Bed];
							@$date_admis = $result[DateAdmission];
							@$date_ex = $result[DateExit];
							

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
    <TD align=left width="7%"><font face = "MS Sans Serif" color="#000000" size="1">$list</font></TD>
    <TD align=left width="10%"><font face = "MS Sans Serif" color="#000000" size="1">$p_id</FONT></TD>
    <TD align=left width="20%"><font face = "MS Sans Serif" color="#000000" size="1">$p_name</FONT></TD>
    <TD align=left width="20%"><font face = "MS Sans Serif" color="#000000" size="1">$d_name</FONT></TD>
    <TD align=left width="8%"><font face = "MS Sans Serif" color="#000000" size="1">$room</FONT></TD>
    <TD align=left width="8%"><font face = "MS Sans Serif" color="#000000" size="1">$bed</FONT></TD>
    <TD align=left width="12%"><font face = "MS Sans Serif" color="#000000" size="1">$date_admis</FONT></TD>
    <TD align=left width="12%"><font face = "MS Sans Serif" color="#000000" size="1">$date_ex</FONT></TD>

EOT;
	}

//end While

echo "<tr bgcolor=\"#CCCCCC\"><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"> แสดงผลการค้นหาข้อมูลที่มีคำว่า [<font face = \"MS Sans Serif\" color=\"#000000\" size=\"2\">".$search."</font><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\">] </font>";
echo "&nbsp;&nbsp;&nbsp;&nbsp;<font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"> ค้นพบ </font><font face = \"MS Sans Serif\" color=\"#000000\" size=\"2\"><b>". $i."</b></font><font face = \"MS Sans Serif\" color=\"#0000FF\" size=\"2\"> เรกคอร์ด</font>";
echo "&nbsp;&nbsp;&nbsp;&nbsp;<A Href="."form_search3.php".">กลับไปค้นหาใหม่ </A></tr><br>";

mysql_close();	// ปิดการเชื่อมต่อ

?> 
</center></TD></TR></TBODY></TABLE><br><br>
<? 
	require_once("footer.php"); 
?>

