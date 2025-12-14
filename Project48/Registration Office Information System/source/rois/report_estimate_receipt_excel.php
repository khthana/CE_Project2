<?php

include('database.php');	

database_connect();

//set_time_limit(10);

require_once "include/class.writeexcel_workbook.inc.php";
require_once "include/class.writeexcel_worksheet.inc.php";

//$year = 2547;

$fname = tempnam("/tmp", "estimate_receipt.xls");
$workbook = &new writeexcel_workbook($fname);

###################################################
# 
# Format
#
$main_head =& $workbook->addformat(array('font' => 'AngsanaNew' , 'align' => 'center', 'bold' => 1 , 'size' => 14));
$right_bold_10 = & $workbook->addformat(array('font' => 'AngsanaNew' , 'align' => 'right', 'bold' => 1 , 'size' => 10));
$center_bold_10  =& $workbook->addformat(array('font' => 'AngsanaNew' , 'align' => 'center' , 'bold' => 1 , 'size' => 10));
$left_bold_10 =& $workbook->addformat(array('font' => 'AngsanaNew' , 'bold' => 1 , 'size' => 10));
$normal_format = & $workbook->addformat(array('font' => 'AngsanaNew' , 'size' => 10));



######################################################################
#
# Demonstrate the named colors.
#

$worksheet1 =& $workbook->addworksheet('รายจ่ายจริง');

$worksheet1->set_column('A:A', 50);
$worksheet1->set_column('B:B', 20);
$worksheet1->set_column('C:C', 20);
$worksheet1->set_column('D:D', 20);
$worksheet1->set_column('E:E', 20);


###################################################
#
# Title
#
$worksheet1->write('B1', "รายงานประมาณการรายรับ ประจำปี". $year, $main_head);
$worksheet1->write('B3', "เงินงบประมาณ", $center_bold_10);
$worksheet1->write('C3', "เงินรายได้", $center_bold_10);
$worksheet1->write('D3', "รวมทั้งสิ้น", $center_bold_10);



##################################################
#
# เงินงบประมาณที่รัฐบาลจัดให้
#
$str_money_gov = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '42000' and year = '".$year."')";
	$ret_money_gov = database_query($str_money_gov);
	if(mysql_num_rows($ret_money_gov) != 0) {
			$object_money_gov = mysql_fetch_array($ret_money_gov);	
			$object_money_gov_txt = mysql_fetch_array(database_query("select * from estimate_receipt where money_type_receipt_id = '42000' and year = '".$year."' "));
			$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
			
			$worksheet1->write(4, 0, $object_money_gov["MONEY_TYPE_RECEIPT"], $left_bold_10);
			$worksheet1->write(4, 1, $amount_gov[0], $right_bold_10);
			$worksheet1->write(4, 3, $amount_gov[0], $right_bold_10);
	} // end if of เงินงบประมาณทีี่่รัฐบาลจัดให้			
			
			
			
			
###########################################################
#
# เงินรายได้สถาบัน
#
$str_money_ins = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '43000' and year = '".$year."')";
	$ret_money_ins = database_query($str_money_ins);
	if(mysql_num_rows($ret_money_gov) != 0) {
			$object_money_ins = mysql_fetch_array($ret_money_ins);
			
			$worksheet1->write(5,0, $object_money_ins["MONEY_TYPE_RECEIPT"], $left_bold_10);
			
			$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
			$worksheet1->write(5,2, $amount_ins[0], $right_bold_10);
			$worksheet1->write(5,3, $amount_ins[0], $right_bold_10);
	
} // end if of เงินรายได้สถาบัน	


$count = 6;
		
						
						
						############################################################
						#
						# Receipt Type
						#
						$str_receipt_type = "select * from receipt_type where id = any".
          		 													"(select receipt_type_id from receipt_sub where id = any".
          		 														 "(select receipt_sub_id from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'))";
         			$ret_receipt_type = database_query($str_receipt_type);												           		 		
         			while($object_receipt_type = mysql_fetch_array($ret_receipt_type)) {
						
								// print เงินรายได้สถาบัน
								$worksheet1->write($count,0,"           " . $object_receipt_type["RECEIPT_TYPE"], $normal_format);
	
								// print money ins
								$amount_receipt_type = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any ".
																																										"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' )"));
								$worksheet1->write($count,2,$amount_receipt_type[0], $normal_format);		
	
								// print money all
								$worksheet1->write($count,3,$amount_receipt_type[0], $normal_format);
										
								$count++;
								
								
								
								##########################################################
								#
								# Receipt Sub
								#
								$str_receipt_temp = "select * from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any ".
          		 																	"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' ) order by receipt_sub_id";
          					$ret_receipt_temp = database_query($str_receipt_temp);
          					while($object_receipt_temp = mysql_fetch_array($ret_receipt_temp)) {          		 						
          							$object_receipt_sub = mysql_fetch_array(database_query("select * from receipt_sub where id = '".$object_receipt_temp["RECEIPT_SUB_ID"]."' "));
										
										// print เงินรายได้สถาบัน
										if($object_receipt_temp["EXPAND2"] != "")
											$t = "(" . $object_receipt_temp["EXPAND2"] . ")";
										$worksheet1->write($count,0,"                " . $object_receipt_sub["RECEIPT_SUB"] . "  " . $object_receipt_temp["EXPAND1"] . "  " . $t, $normal_format);										
	
										// print money ins										
										$worksheet1->write($count,2,$object_receipt_temp["AMOUNT"], $normal_format);
	
										// print money all
										$worksheet1->write($count,3,$object_receipt_temp["AMOUNT"], $normal_format);																
										
										$t = "";
										
										$count++;										
									
								} // end while of Receipt Sub
																						
						} // end while of Receipt Type				
	
	
	
#####################################################
#
# รวมทั้งสิ้น
#					
	$count++;
   $worksheet1->write($count,0,"รวมรายรับทั้งสิ้น", $left_bold_10);
         				
   // print money ins							
	$amount_all_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
	$worksheet1->write($count,1,$amount_all_gov[0], $right_bold_10);	
         				
   // print money ins						
	$amount_all_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
	$worksheet1->write($count,2,$amount_all_ins[0], $right_bold_10);
	
	// print money all
	$worksheet1->write($count,3,$amount_all_gov[0] + $amount_all_ins[0], $right_bold_10);
			


##################################################
#
# Close
#
$workbook->close();


##################################################
#
# Header HTTP			 
#

header("Content-Type: application/x-msexcel; name=\"report_estimate_receipt.xls\"");
header("Content-Disposition: inline; filename=\"report_estimate_receipt.xls\"");
$fh=fopen($fname, "rb");
fpassthru($fh);
unlink($fname);

?>
