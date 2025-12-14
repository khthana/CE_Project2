<?php
	
	////////////////// head function ///////////////////
	//
	//
	function head_html($title) {
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> <?php print $title ?> </title>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
</head>

<body>
<?php
	}
	
	////////////////// end head function ///////////////////
	//
	//
	function end_head_html() {
?>
</body>
</html>
<?php
	}
	
	///////////////////// print list box for year function /////////////////
	//
	//
	function year_list_box() {
		$year = 2547;
      print "<select name='year'>";
		for($i=0;$i<20;$i++)
      print"     <option value='" . ($year + $i) . "'>". ($year + $i) . "</option>\n";
      print "</select>";
	}
	
	//////////////////// print list box follow name variable //////////////////
	//
	//
	function list_box($name,$result_query) {
		print "<select name='" . $name . "'>";
	//	print "<option>----- เลือกรายการ -----</option>";
		while($object = mysql_fetch_array($result_query))
       		print "     <option value='" . $object[0] . "'>". $object[1] . "</option>\n";     
		print "</select>";
	}
	
	
	function list_box2($name,$result_query) {
		print "<select name='" . $name . "'>";
	//	print "<option>----- เลือกรายการ -----</option>";
		while($object = mysql_fetch_array($result_query))
       		print "     <option value='" . $object[0] . "'>". $object[1] . "</option>\n";
       print "     <option value='00000'>ทุกฝ่าย</option>\n";
		print "</select>";
	}
	
	/////////////////// print list box date ///////////////////
	//
	//
	function list_box_date() {
		$month = array(1=>"มกราคม",2=>"กุมภาพันธ์",3=>"มีนาคม",4=>"เมษายน",5=>"พฤษภาคม",6=>"มิถุนายน",7=>"กรกฏาคม",8=>"สิงหาคม",9=>"กันยายน",10=>"ตุลาคม",11=>"พฤศจิกายน",12=>"ธันวาคม",);
		print "<select name='day'>";
		for($i=1;$i<32;$i++)
        	print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
        print "</select>";
		print "/";
		print "<select name='month'>";
		for($i=1;$i<13;$i++)
        	print"     <option value='" . ($i) . "'>". $month[$i] . "</option>\n";
        print "</select>";
		print "/";
		print "<select name='dyear'>";
		for($i=2547;$i<2568;$i++)
        	print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
      print "</select>";
	}
	
	
	/////////////////// print list box month ///////////////////
	//
	//
	function list_box_month() {
		$month = array(1=>"มกราคม",2=>"กุมภาพันธ์",3=>"มีนาคม",4=>"เมษายน",5=>"พฤษภาคม",6=>"มิถุนายน",7=>"กรกฏาคม",8=>"สิงหาคม",9=>"กันยายน",10=>"ตุลาคม",11=>"พฤศจิกายน",12=>"ธันวาคม",);	
		print "<select name='month'>";
		for($i=1;$i<13;$i++)
        	print"     <option value='" . ($i) . "'>". $month[$i] . "</option>\n";
        print "</select>";
		print "/";
		print "<select name='dyear'>";
		for($i=2547;$i<2568;$i++)
        	print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
      print "</select>";
	}
	
	
	///////////////////// generate table data basic for 3 filed ///////////////////////////
	//
	//
	function gen_table_3_filed($table_name,$str_title,$count_start,$count_limit) {
		//print "select * from ".$table_name." limit ".$count_start." , ".$count_limit."";
		$db = database_query("select * from ".$table_name." order by id limit ".$count_start." , ".$count_limit."");
?>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center"><?php print "แสดงข้อมูล" . $str_title; ?></p></td>
                                        </tr>
                                </table>
                        </td>
                </tr>
                <tr>
                			<td>                					   					
										<table width="30%" border="0" cellspacing="1" cellpadding="0">
												<tr>
														<td  width="15%">
																<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#EC4D00">
																		<tr>
																				<td bgcolor="#FFAE88"  align="center">
																					<? print "<a href='form_add_data_basic.php?select=".$table_name."'><img src='picture/news_general.gif' width='16' height='16' border='0' alt=''> เพิ่มรายการใหม่</a>"; ?>
																				</td>
																		</tr>
																</table>
														</td>
														<td  width="15%">
																<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#EC4D00">
																		<tr>
																				<td bgcolor="#FFAE88"  align="center">
																					<? print "<a href='form_search.php?select=".$table_name."'><img src='picture/forum_search.gif' width='16' height='16' border='0' alt=''> ค้นหา</a>"; ?>
																				</td>
																		</tr>
																</table>
														</td>
												</tr>
										</table>
                			</td>
                </tr>
                <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">                                       
                                        <tr>
                                                <td>                                                        
																	<table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
																			<td width="10%">																				
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 0); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="40%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 1); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="40%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 2); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="10%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">OPERATE</p></td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<?php																		
																		$isRow = true;
																		$color;
																		while($rows = mysql_fetch_array($db)) {
																			if($isRow) {
																				$color = "#F3F3F3";
																				$isRow = false;
																			}
																			else {
																				$color = "#FAFAFA";
																				$isRow = true;
																			}
																		?>
																		<tr>
																			<td bgcolor=<? print $color; ?>><p  align="center"><?php print $rows[0]; ?></p></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows[1]; ?></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows[2]; ?></td>
																			<td bgcolor=<? print $color; ?>>
																				<?php print "<a href='form_edit_data_basic.php?select=".$table_name."&id=".$rows[0]."'>"; ?>
																					<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไขข้อมูลนี้้"> 
																				</a>
																				<?php print "<a href='process_edit_delete_data_basic.php?mode=delete&table_name=".$table_name."&id=".$rows[0]."'>"; ?>
																					<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมูลนี้">
																				</a>
																			</td>
																		</tr>
																		<?php
																		}
																		//check row limit value
																		$new_pre_start = $count_start - 20;
																		$new_next_start = $count_start + 20;
																		if($new_pre_start < 0) {
																			$new_pre_start = 0;
																		}
																		$new_row_next = mysql_num_rows(database_query("select * from ".$table_name.""));
																		if($new_next_start > $new_row_next) {
																			$new_next_start = $count_start;
																		}
																		?>
																		<tr>
																			<td  align="left"><? print "<a href='show_data_basic.php?select=".$table_name."&row_start=".$new_pre_start."&row_limit=20'>หน้าก่อน</a>"; ?></td>																			
																			<td></td>
																			<td></td>
																			<td  align="right">
																				<? print "<a href='show_data_basic.php?select=".$table_name."&row_start=".$new_next_start."&row_limit=20'>หน้าต่อไป</a>"; ?>
																			</td>
																		</tr>
																	</table>
                                                </td>
                                        </tr>
                                </table>
                        </td>
                </tr>
        </table>
<?php
	}
	
	
	///////////////////// generate table data basic for 4 filed ///////////////////////////
	//
	//
	function gen_table_4_filed($table_name,$str_title,$count_start,$count_limit) {
		//print "select * from ".$table_name." limit ".$count_start." , ".$count_limit."";
		$db = database_query("select * from ".$table_name." order by id limit ".$count_start." , ".$count_limit."");
?>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center"><?php print "แสดงข้อมูล" . $str_title; ?></p></td>
                                        </tr>
                                </table>
                        </td>
                </tr>
                 <tr>
                			<td>
                					<table width="30%" border="0" cellspacing="1" cellpadding="0">
												<tr>
														<td  width="15%">
																<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#EC4D00">
																		<tr>
																				<td bgcolor="#FFAE88"  align="center">
																					<? print "<a href='form_add_data_basic.php?select=".$table_name."'><img src='picture/news_general.gif' width='16' height='16' border='0' alt=''> เพิ่มรายการใหม่</a>"; ?>
																				</td>
																		</tr>
																</table>
														</td>
														<td  width="15%">
																<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#EC4D00">
																		<tr>
																				<td bgcolor="#FFAE88"  align="center">
																					<? print "<a href='form_search.php?select=".$table_name."'><img src='picture/forum_search.gif' width='16' height='16' border='0' alt=''> ค้นหา</a>"; ?>
																				</td>
																		</tr>
																</table>
														</td>
												</tr>
										</table>
                			</td>
                </tr>
                <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">                                       
                                        <tr>
                                                <td>                                                        
																	<table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
																			<td width="10%">																				
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 0); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="35%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 1); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="15%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 2); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="30%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center"><?php print mysql_field_name($db, 3); ?></p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="10%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">OPERATE</p></td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<?php																		
																		$isRow = true;
																		$color;
																		while($rows = mysql_fetch_array($db)) {
																			if($isRow) {
																				$color = "#F3F3F3";
																				$isRow = false;
																			}
																			else {
																				$color = "#FAFAFA";
																				$isRow = true;
																			}
																		?>
																		<tr>
																			<td bgcolor=<? print $color; ?>><p  align="center"><?php print $rows[0]; ?></p></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows[1]; ?></td>
																			<td bgcolor=<? print $color; ?>><p  align="center"><?php print $rows[2]; ?></p></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows[3]; ?></td>
																			<td bgcolor=<? print $color; ?>>
																				<?php print "<a href='form_edit_data_basic.php?select=".$table_name."&id=".$rows[0]."'>"; ?>
																					<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไขข้อมูลนี้้"> 
																				</a>
																				<?php print "<a href='process_edit_delete_data_basic.php?mode=delete&table_name=".$table_name."&id=".$rows[0]."'>"; ?>
																					<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมูลนี้">
																				</a>
																			</td>
																		</tr>
																		<?php
																		}
																		//check row limit value
																		$new_pre_start = $count_start - 20;
																		$new_next_start = $count_start + 20;
																		if($new_pre_start < 0) {
																			$new_pre_start = 0;
																		}
																		$new_row_next = mysql_num_rows(database_query("select * from ".$table_name.""));
																		if($new_next_start > $new_row_next) {
																			$new_next_start = $count_start;
																		}
																		?>
																		<tr>
																			<td  align="left"><? print "<a href='show_data_basic.php?select=".$table_name."&row_start=".$new_pre_start."&row_limit=20'>หน้าก่อน</a>"; ?></td>																			
																			<td></td>
																			<td></td>
																			<td></td>
																			<td  align="right">
																				<? print "<a href='show_data_basic.php?select=".$table_name."&row_start=".$new_next_start."&row_limit=20'>หน้าต่อไป</a>"; ?>
																			</td>
																		</tr>
																	</table>
                                                </td>
                                        </tr>
                                </table>
                        </td>
                </tr>
        </table>
<?php
	}
	
	////////////////////// message box ////////////////////////////
	//
	//
	function message_box($title,$str_body,$cont) {
?>
	
		<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
			<tr>
				<td>
					 <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
                   <tr>
                       <td>&nbsp;<? print $title; ?></td>
                   </tr>
                </table>
				</td>
			</tr>
			<tr>
				<td>					
					<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#F3F3F3">
						<tr>
							<td  align="center"><? print $str_body; ?></td>
						</tr>
						<tr>
							<td  align="center"><? print "<a href='".$cont."'>"; ?>กลับหน้าเดิม</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

<?php
	}
	
	
	////////////////////////////// edit year box //////////////////////////////////////
	//
	//
	function edit_year_box($value) {
		$year = 2547;
      print "<select name='year'>";
		for($i=0;$i<20;$i++) {
			if(($year + $i) == $value)	 {
				print"     <option value='" . ($year + $i) . "' selected>". ($year + $i) . "</option>\n";
			}
			else {
	      	print"     <option value='" . ($year + $i) . "'>". ($year + $i) . "</option>\n";
	      }
	   }
      print "</select>";
	}
	
	
	//////////////////// edit_list_box //////////////////
	//
	//
	function edit_list_box($name,$result_query,$value) {
		print "<select name='" . $name . "'>";
		while($object = mysql_fetch_array($result_query)) {
			if($object[0] == $value)
       		print "     <option value='" . $object[0] . "' selected>". $object[1] . "</option>\n";
			else
				print "     <option value='" . $object[0] . "'>". $object[1] . "</option>\n";
      }
		print "</select>";
	}
	
	
	
	//////////////////// edit date box /////////////////
	//
	//
	function edit_date_box($time) {
		$day;
		$month;
		$year;
		$temp;
		$l = 0;
		for($i=0;$i<strlen($time);$i++) {
			if($time{$i} == '/') {
				if($l == 0)
					$day = $temp;
				else if($l == 1) {
					$month = $temp;
					$temp = "";
					for($ii=$i+1;$ii<strlen($time);$ii++) {
						$temp = $temp . $time{$ii};
						$i = strlen($time) + 1;						
					}
					$year = $temp;
				}
				$l++;
				$temp = "";
			}
			else
				$temp = $temp . $time{$i};
		}
		//print " " . $day . " " . $month . " " . $year;
		$months = array(1=>"มกราคม",2=>"กุมภาพันธ์",3=>"มีนาคม",4=>"เมษายน",5=>"พฤษภาคม",6=>"มิถุนายน",7=>"กรกฏาคม",8=>"สิงหาคม",9=>"กันยายน",10=>"ตุลาคม",11=>"พฤศจิกายน",12=>"ธันวาคม",);
		print "<select name='day'>";
		for($i=1;$i<32;$i++) {
			if($i == $day)
				print"     <option value='" . ($i) . "' selected>". ($i) . "</option>\n";
			else
	        	print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
      }
      print "</select>";
		print "/";
		print "<select name='month'>";
		for($i=1;$i<13;$i++) {
			if($i == $month)
				print"     <option value='" . ($i) . "' selected>". $months[$i] . "</option>\n";
			else
        		print"     <option value='" . ($i) . "'>". $months[$i] . "</option>\n";
      }
      print "</select>";
		print "/";
		print "<select name='dyear'>";
		for($i=2547;$i<2568;$i++) {
			if($i == $year)
	        	print"     <option value='" . ($i) . "' selected>". ($i) . "</option>\n";
	      else
        		print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
      }
      print "</select>";
	}
	
	
	
	
	
	
	//////////////////// edit month box /////////////////
	//
	//
	function edit_month_box($time) {
		$day;
		$month;
		$year;
		$temp = "";
		$l = 0;
		for($i=0;$i<strlen($time);$i++) {
			if($time{$i} == '/') {
				if($l == 0) {
					$month = $temp;
					$temp = "";
					for($ii=$i+1;$ii<strlen($time);$ii++) {
						$temp = $temp . $time{$ii};
						$i = strlen($time) + 1;						
					}
					$year = $temp;
				}
				$l++;
				$temp = "";
				break;
			}
			else
				$temp = $temp . $time{$i};
		}
		//print " " . $day . " " . $month . " " . $year;
		$months = array(1=>"มกราคม",2=>"กุมภาพันธ์",3=>"มีนาคม",4=>"เมษายน",5=>"พฤษภาคม",6=>"มิถุนายน",7=>"กรกฏาคม",8=>"สิงหาคม",9=>"กันยายน",10=>"ตุลาคม",11=>"พฤศจิกายน",12=>"ธันวาคม",);
		print "<select name='month'>";
		for($i=1;$i<13;$i++) {
			if($i == $month)
				print"     <option value='" . ($i) . "' selected>". $months[$i] . "</option>\n";
			else
        		print"     <option value='" . ($i) . "'>". $months[$i] . "</option>\n";
      }
      print "</select>";
		print "/";
		print "<select name='dyear'>";
		for($i=2547;$i<2568;$i++) {
			if($i == $year)
	        	print"     <option value='" . ($i) . "' selected>". ($i) . "</option>\n";
	      else
        		print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
      }
      print "</select>";
	}
	
	
	
	
	
	
	/////////////////////////////////// log in function ///////////////////////////////
	//
	//
	function login($user,$pass) {
		$str = "select * from user_profile where user_name = '".$user."' and password = '".$pass."'";				
		$ret = database_query($str);
		$row = mysql_fetch_array($ret);
		//print $ret["STATUS"];
		if(mysql_num_rows($ret) != 0) {
			session_register("login");
			if($row["STATUS"] == '0')
				session_register("status");
		}
		else {
			message_box("","User name หรือ Password ผิด ไม่สามารถล็อกอินได้","javascript:history.back()");
			exit;
		}
	}
	
	
	
	///////////////////////////////// check session //////////////////////////////////
	//
	//
	function check_session() {	
		session_start();	
		if (!session_is_registered("login")) {
			message_box("","คุณยังไม่ได้ล๊อกอินเข้าระบบ","index.php");
			exit;
		}
	}
	
	
	
	/////////////////////////////// check permit ///////////////////////////////////
	//
	//
	function check_permit() {
		session_start();	
		if (!session_is_registered("status")) {
			message_box("","คุณไม่มีสิทธิ์ในการใช้งานส่วนนี้","javascript:history.back()");
			exit;
		}
	}

//================================================================================

function select_cat($key)
{
$conn=connect_db("hospital");
if(!$conn)
	echo "เกิดความผิดพลาดไม่สามารถติดต่อกับฐานข้อมูลได้";
$sql="select * from categories where CatID='$key' ";
$result = mysql_query($sql);
if(!$result)
	return 0;
else 
	return $result;
}

function select_book($DoctorID)
{
$conn=connect_db("hospital");
if(!$conn)
	echo "เกิดความผิดพลาดไม่สามารถติดต่อกับฐานข้อมูลได้";
$sql="select * from tbldoctor where DoctorID='$DoctorID' ";
$result = mysql_query($sql);
if(!$result)
	return 0;
else 
	return $result;
}

//=================================================================================
/*ฟังก์ชันเพิ่มบุคลากรใหม่*/
function insert_person($DoctorID,$DoctorName,$Address,$Username,$Password,$CatID,$Picture,$MobilePhone,$Phone,$Email)
{
$con=connect_db("hospital");
if(!$con)
	{
		return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
		exit;
	}
$sql = "select * from tbldoctor where DoctorID='$DoctorID'";
$result = mysql_query($sql);
if(!$result)
	return "กรุณาตรวจคิวรี อีกครั้ง <br>";
if(mysql_num_rows($result)>0)
	return "ชื่อของผู้ใช้ซ้ำกับในฐานข้อมูล <br>";
$result = mysql_query("insert into tbldoctor values ('$DoctorID','$DoctorName','$Address','$Username','$Password','$CatID','$Picture','$MobilePhone','$Phone','$Email')");
if(!$result)
	return("ไม่สามารถเพิ่มบุคลากรใหม่ได้");
else
	return true;
}

//=================================================================================

/*ฟังก์ชันลบรายการหนังสือ*/
function delete_book($DoctorID)
{
$con=connect_db("hospital");
if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$result = mysql_query("delete from tbldoctor where DoctorID='$DoctorID'");
if(!$result)
	return("ไม่สามารถลบรายการหนังสือได้");
else
	return true;
}

//=================================================================================

/*ฟังก์ชันการแก้ไขรายละเอียดหนังสือ*/
function edit_book($oldDoctorID,$DoctorID,$DoctorName,$Address,$Username,$Password,$CatID,$Picture,$MobilePhone,$Phone,$Email)
{
$con=connect_db("hospital");

if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$sql="update tbldoctor set DoctorID='$DoctorID' ,DoctorName='$DoctorName',Address='$Address',Username='$Username' , Password = '$Password' , CatID='$CatID' , Picture='$Picture' ,MobilePhone='$MobilePhone',Phone='$Phone',Email='$Email' where DoctorID='$oldDoctorID' ";
$result = mysql_query($sql);
if(!$result)
	return("ไม่สามารถเพิ่มรายการหนังสือได้");
else
	return true;
}

//=================================================================================

function insert_cat($CatName)
{
$con=connect_db("hospital");
if(!$con)
	{
		return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
		exit;
	}
$result = mysql_query("insert into categories(CatName) values ('$CatName')");
if(!$result)
	return("ไม่สามารถเพิ่มรายการหมวดหมู่ได้");
else
	return true;
}

//=================================================================================

//แก้ไขหมวดหมู่หนังสือ
function edit_cat($CatID,$CatName)
{
$con=connect_db("hospital");

if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$sql="update categories set  CatName='$CatName' where CatID = $CatID ";
$result = mysql_query($sql);
if(!$result)
	return("ไม่สามารถเพิ่มรายการหนังสือได้");
else
	return true;
}

//=================================================================================

function delete_cat($CatID)
{
$con=connect_db("hospital");
if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$result = mysql_query("delete from categories where CatID='$CatID'");
if(!$result)
	return("ไม่สามารถลบรายการหมวดหมู่ได้");
else
	return true;
}

//=================================================================================

/*ฟังก์ชันสำหรับนำข้อมูลในฐานข้อมูลเก็บไว้ในอะเรย์*/
function db_to_array($result)
{
	$result_array=array();
	for($count=0;$row=@mysql_fetch_array($result);$count++)
		$result_array[$count]=$row;
	return $result_array;
}

//=============================================================================

function get_book_details($DoctorID)
{
  if (!$DoctorID || $DoctorID=="")
     return false;
$con=connect_db("hospital");
   $query = "select * from tbldoctor where DoctorID='$DoctorID'";
   $result = mysql_query($query);
   if (!$result)
     return false;
   $result = mysql_fetch_array($result);
   return $result;
}

//=================================================================================

function register($Username,$Password,$answer,$Email)
{
$con=connect_db("hospital");
if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$sql = "select * from users where Username='$Username'";
$result = mysql_query($sql);
if(!$result)
	return "กรุณาตรวจคิวรี อีกครั้ง <br>";
if(mysql_num_rows($result)>0)
	return "ชื่อของผู้ใช้ซ้ำกับในฐานข้อมูล <br>";
$result = mysql_query("insert into users values ('$Username','$Password','$Answer','$Email')");
if(!$result)
	return("ไม่สามารถลงทะเบียนได้");
else
   return true;
}

//=========================================================================
function show_data($tablename)
{
$conn = connect_db("hospital");
if(!$conn)
echo "เกิดความผิดพลาดไม่สามารถติดต่อกับฐานข้อมูลได้";
$sql = "select * from $tablename";
$result = mysql_query($sql);
if(!$result)
	return 0;
else
 return $result;
}
?>




