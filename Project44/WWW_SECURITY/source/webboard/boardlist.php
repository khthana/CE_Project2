<?
include("db.php");
include ("interface.inc.php");

if(!isset($HTTP_GET_VARS["type"]))  // ถ้าไม่มีหมวดของเวบบอร์ดพ่วงมาให้กำหนดไว้เป็นบอร์ดบุคคลภายนอก
{
	$type=1;
}
else
{
	$type=$HTTP_GET_VARS["type"];  // ถ้ามีหมวดพ่วงมา แต่ไม่อยู่ในที่กำหนดไว้ ก็กำหนดเป็นบอร์ดของบุคคลภายนอก
	if (($type!=0) and ($type!=1)) { $type=1; }
	if ($type==0 ) { include "accesscontrol.php"; } // ถ้าหมวดที่เลือกมาเป็น staff ก็เช็ค login ทันที
	//ถึงขั้นนี้จะมีแต่ type=0 and 1 only
}
logo_noleftmenu("ISAG Webboard --> Display Topic");
curve_open();
$PHP_SELF=$HTTP_SERVER_VARS["PHP_SELF"];
$screen=$HTTP_GET_VARS["screen"];       
$rows_per_page = 15;

$sql = "select  Title from board_ques where type='$type' "; 
$result = mysql_query($sql);
$total_records = mysql_num_rows($result);
$pages = ceil($total_records / $rows_per_page);
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		

if (!isset($screen))   $screen = 1;  //ถ้ามีการกำหนดหน้าเป็นอย่างอื่น คือพิมพ์ลงไปเองก็จะแจ้ง Not found
if($screen <1 or $screen > $pages)  print "<center><b><br>Sorry. Not found</b></center>";
else
{
		$start = ($screen-1) * $rows_per_page;


		$query = "select ID,Title,Name,Email,date_format(Lastpost,'%e %b %Y') AS nowdate,date_format(Lastpost,'%H:%i') AS nowtime,Lastname,View,Ans,type  from board_ques where type='$type' order by  ID DESC LIMIT $start, $rows_per_page";
		$result = mysql_query($query);		
		if ($result)   
		{	
			
			print "<center><table border=0 cellpadding=0 cellspacing=1 width=98%>";
			print "<tr><td colspan=5 ID=w2><B><font size=3>&nbsp;ISAG -->> ";

			if ($type==0) print " Staff Webboard";
			if ($type==1) print " General Webboard ";
				
			print "</font></B> (จำนวนกระทู้ทั้งหมด <B>$total_records</B>)</td><td ID=w2 align=right><a href='addnew.php?type=".$type." '><B><CENTER>New Topic</CENTER> </B></a></td></tr>";
			print "<tr><td colspan=6><br>";

						print "<b><U>Page</U> </b>";
					if ($screen > 1) print "<a href='$PHP_SELF?screen=".($screen - 1)."&type=".$type." '> << </a>";
					for ($i = 1; $i <= $pages; $i++) 
					{
						if($i==$screen) echo " <B>[$i]</B> ";		
						else print "<a href='$PHP_SELF?screen=".$i."&type=".$type." '> $i </a>";
					}
					if ($screen < $pages ) print "<a href='$PHP_SELF?screen=".($screen + 1)."&type=".$type." '> >> </a>";

			print "</td></tr>";
			if($type==0)  print "<tr ID=table3b>"; //----------------- สลับสีระหว่าง General กับ Staff
			else print "<tr ID=table3>";

							print "<td colspan=2><CENTER><b>Thread</b></CENTER></td>
						   <td><CENTER><b>Starter</b></CENTER></td>
						   <td><CENTER><b>&nbsp;Replies&nbsp;</b></CENTER></td>
						   <td><CENTER><b>Views</b></CENTER></td>
						   <td><CENTER><b>Last Post</b></CENTER></td></tr>";
			while ($row=mysql_fetch_array($result))
			{
				$ID			=$row['ID'];
				$Title		=stripslashes($row['Title']);
				$Name		=stripslashes($row['Name']);
				$nowdate	=$row['nowdate'];
				$nowtime	=$row['nowtime'];
				$Email = stripslashes($row['Email']);
				$Lastname   =$row['Lastname'];
				$View		=$row['View'];
				$Ans		=$row['Ans'];  //DEDEED		

				$Title = wordwrap( $Title, 51, "\n",1);

				 print "
				<tr ID=w1>
					<td ID=w2 width=3%><img src='new.gif'></td> 
					<td width=47%>&nbsp;<img src='bullet.gif' border=0>&nbsp;<a href='view.php?ID=$ID' target='_$Title'>$Title</a></td>
					<td ID=w2 width=15%>&nbsp; <a href='mailto:$Email'>$Name</a></td>
					<td width=7%><CENTER>$Ans</CENTER></td>
					<td ID=w2 width=8%><CENTER>$View</CENTER></td>
					<td width=20%>&nbsp;<font face='MS Sans Serif' size='2'>$nowdate, ($nowtime) <br>&nbsp; by <B><font color='#56426C' >$Lastname</font></B></font></td></tr>
				";							
			}
			if ($type==0) print "<tr ID=table3b><td colspan=6 align=right><font color=white>&nbsp;</font></td></tr>";
			else print "<tr ID=table3><td colspan=6 align=right><font color=white>&nbsp;</font></td></tr>";
			print "<tr><td colspan=6 align=right>&nbsp;";					
					print "<b><U>Page</U> </b>";
					if ($screen > 1) print "<a href='$PHP_SELF?screen=".($screen - 1)."&type=".$type." '> << </a>";
					for ($i = 1; $i <= $pages; $i++) 
					{
						if($i==$screen) echo " <B>[$i]</B> ";		
						else print "<a href='$PHP_SELF?screen=".$i."&type=".$type." '> $i </a>";
					}
					if ($screen < $pages ) print "<a href='$PHP_SELF?screen=".($screen + 1)."&type=".$type." '> >> </a>";
			print "</td></tr>";

		print "<p></table>";
		}
		else { echo "No data";}
?></center>
<?
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
empty_3();
?>
