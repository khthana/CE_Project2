<?php

include('database.php');	

database_connect();

//set_time_limit(10);

require_once "include/class.writeexcel_workbook.inc.php";
require_once "include/class.writeexcel_worksheet.inc.php";

//$year = 2547;

$fname = tempnam("/tmp", "all_estimate_expense.xls");
$workbook = &new writeexcel_workbook($fname);

###################################################
# 
# Format
#
$main_head =& $workbook->addformat(array('font' => 'AngsanaNew' , 'align' => 'center', 'bold' => 1 , 'size' => 14));
$right_bold_10 = & $workbook->addformat(array('font' => 'AngsanaNew' , 'align' => 'right', 'bold' => 1 , 'size' => 10));
$center_bold_10  =& $workbook->addformat(array('font' => 'AngsanaNew' , 'align' => 'center' , 'bold' => 1 , 'size' => 10));
$left_bold_10 =& $workbook->addformat(array('font' => 'AngsanaNew' , 'bold' => 1 , 'size' => 10));
$normal_left_format = & $workbook->addformat(array('font' => 'AngsanaNew' , 'size' => 10));
$normal_right_format = & $workbook->addformat(array('font' => 'AngsanaNew' , 'size' => 10 , 'align' => 'right'));



######################################################################
#
# Demonstrate the named colors.
#

$worksheet1 =& $workbook->addworksheet('รายจ่ายจริง');

$worksheet1->set_column('A:A', 70);
$worksheet1->set_column('B:B', 20);
$worksheet1->set_column('C:C', 20);
$worksheet1->set_column('D:D', 20);


###################################################
#
# Title
#
$worksheet1->write('B1', "รายงานสรุปการประมาณการรายจ่าย ประจำปี ". $year, $main_head);
$worksheet1->write('B2', "สำนักทะเบียนและประมวลผล", $main_head);
$worksheet1->write('B4', "เงินงบประมาณ", $center_bold_10);
$worksheet1->write('C4', "เงินรายได้", $center_bold_10);
$worksheet1->write('D4', "รวมทั้งสิ้น", $center_bold_10);

//$worksheet1->write(4, 0, $object_money_gov["MONEY_TYPE_RECEIPT"], $left_bold_10);

$line_num = 5;



##################################################
#
# ด้าน
#
	$str_sector = "select * from sector where id = any".
														"(select sector_id from program where id = any".
															 "(select program_id from project where id = any".
													   			 "(select project_id from estimate_expense where year = '".$year."')))";
	$ret_sector = database_query($str_sector);
	while($object_sector = mysql_fetch_array($ret_sector)) {
	
			// print sector
			$worksheet1->write($line_num, 0, $object_sector["SECTOR"], $left_bold_10);
			
			// print money gov
			$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));				
			$worksheet1->write($line_num, 1, $amount_gov[0], $right_bold_10);
			
			// print money ins			
			$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));	
			$worksheet1->write($line_num, 2, $amount_ins[0], $right_bold_10);
			
			// print money all		
			$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $right_bold_10);
			
			$line_num++;
			
			
			
			#####################################################################
			#
			# แผนงาน
			#
			$str_program = "select * from program where id = any".
																	"(select program_id from project where id = any".
																			"(select project_id from estimate_expense where year = '".$year."'))".
																"and sector_id = '".$object_sector["ID"]."'";
			$ret_program = database_query($str_program);
			while($object_program = mysql_fetch_array($ret_program)) {
			
					// print program
					$worksheet1->write($line_num, 0, $object_program["PROGRAM"], $left_bold_10);
			
					// print money gov
					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));				
					$worksheet1->write($line_num, 1, $amount_gov[0], $right_bold_10);
			
					// print money ins			
					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));	
					$worksheet1->write($line_num, 2, $amount_ins[0], $right_bold_10);
			
					// print money all		
					$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $right_bold_10);
					
					$line_num++;
					
					
					##################################################################
					#
					# งาน
					#
					$str_project = "select * from project where id = any".
																				"(select project_id from estimate_expense where year = '".$year."')".
																		"and program_id = '".$object_program["ID"]."'";
					$ret_project = database_query($str_project);
					while($object_project = mysql_fetch_array($ret_project)) {
					
							// print project
							$worksheet1->write($line_num, 0, $object_project["PROJECT"], $left_bold_10);
			
							// print money gov
							$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
							$worksheet1->write($line_num, 1, $amount_gov[0], $right_bold_10);
			
							// print money ins			
							$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
							$worksheet1->write($line_num, 2, $amount_ins[0], $right_bold_10);
			
							// print money all		
							$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $right_bold_10);
							
							$line_num++;
							
							
							
							
							###################################################################
							#
							# กิจกรรม
							#
							$str_activity = "select * from activity where id = any".
																						"(select activity_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."')";
							$ret_activity = database_query($str_activity);
							while($object_activity = mysql_fetch_array($ret_activity)) {
							
								if($object_activity[0] != '00') {
							
									// print activity
									$worksheet1->write($line_num, 0, $object_activity["ACTIVITY"], $left_bold_10);
			
									// print money gov
									$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
									$worksheet1->write($line_num, 1, $amount_gov[0], $right_bold_10);
			
									// print money ins			
									$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
									$worksheet1->write($line_num, 2, $amount_ins[0], $right_bold_10);
					
									// print money all		
									$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $right_bold_10);
							
									$line_num++;
									
								} // end if of activity
							
							
									
									
									####################################################################
									#
									# กองทุน
									#
									$str_fund = "select * from fund where id = any".
																						"(select fund_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."')";
									$ret_fund = database_query($str_fund);
									while($object_fund = mysql_fetch_array($ret_fund)) {
									
											// print fund
											$worksheet1->write($line_num, 0, $object_fund["FUND"], $left_bold_10);
			
											// print money gov
											$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
											$worksheet1->write($line_num, 1, $amount_gov[0], $right_bold_10);
			
											// print money ins			
											$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
											$worksheet1->write($line_num, 2, $amount_ins[0], $right_bold_10);
						
											// print money all		
											$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $right_bold_10);
							
											$line_num++;
									
									
											
											#################################################################
											#
											# งบ
											#
											$str_account ="select * from account where id = any".
																										"(select account_id from expense_type where id = any".
																												"(select expense_type_id from expense_type_sub where id = any".
																														"(select expense_type_sub_id from expense_sub where id = any".
																																"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))))";
											$ret_account = database_query($str_account);
											while($object_account = mysql_fetch_array($ret_account)) {
											
													// print account
													$worksheet1->write($line_num, 0, "        " . $object_account["ACCOUNT"], $left_bold_10);
			
													// print money gov
													$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));				
													$worksheet1->write($line_num, 1, $amount_gov[0], $right_bold_10);
			
													// print money ins			
													$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));	
													$worksheet1->write($line_num, 2, $amount_ins[0], $right_bold_10);
						
													// print money all		
													$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $right_bold_10);
													
													$line_num++;
													
													
													
													
													################################################################
													#
													# ประเภทรายจ่าย
													#
													$str_expense_type ="select * from expense_type where id = any".
																														"(select expense_type_id from expense_type_sub where id = any".
																																"(select expense_type_sub_id from expense_sub where id = any".
																																		"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."')))".
																													" and account_id = '".$object_account["ID"]."'";
													$ret_expense_type = database_query($str_expense_type);
													while($object_expense_type = mysql_fetch_array($ret_expense_type)) {																			
															if($object_expense_type["ID"] != "00000" && $object_expense_type["ID"] != "00001" && $object_expense_type["ID"] != "00002") {
													
																	// print expense type
																	$worksheet1->write($line_num, 0, "             " . $object_expense_type["EXPENSE_TYPE"], $normal_left_format);
			
																	// print money gov
																	$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));				
																	$worksheet1->write($line_num, 1, $amount_gov[0], $normal_right_format);
				
																	// print money ins			
																	$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));	
																	$worksheet1->write($line_num, 2, $amount_ins[0], $normal_right_format);
						
																	// print money all		
																	$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $normal_right_format);
													
																	$line_num++;
																																										
															} // end if of expense type
															
															
															
															######################################################################
															#
															# ประเภทรายจ่ายย่อย
															#
															$str_expense_type_sub ="select * from expense_type_sub where id = any".
																																					"(select expense_type_sub_id from expense_sub where id = any".
																																							"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))".
																															" and expense_type_id = '".$object_expense_type["ID"]."'";
																	$ret_expense_type_sub = database_query($str_expense_type_sub);
																	while($object_expense_type_sub = mysql_fetch_array($ret_expense_type_sub)) {																				
																			if($object_expense_type_sub["ID"] != "00000" && $object_expense_type_sub["ID"] != "00001" && $object_expense_type_sub["ID"] != "00002" && $object_expense_type_sub["ID"] != "00003" && $object_expense_type_sub["ID"] != "00004" && $object_expense_type_sub["ID"] != "00005" && $object_expense_type_sub["ID"] != "00006") {
																
																					// print expense type sub
																					$worksheet1->write($line_num, 0, "                  " . $object_expense_type_sub["EXPENSE_TYPE_SUB"], $normal_left_format);
			
																					// print money gov
																					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));				
																					$worksheet1->write($line_num, 1, $amount_gov[0], $normal_right_format);
				
																					// print money ins			
																					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));	
																					$worksheet1->write($line_num, 2, $amount_ins[0], $normal_right_format);
						
																					// print money all		
																					$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $normal_right_format);
													
																					$line_num++;
																					
																			} // end if of expense type sub
																			
																			
																			
																			
																			#####################################################################
																			#
																			# หัวข้อรายจ่าย
																			#
																			$str_expense_sub ="select * from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and expense_sub_id = any".
																																		"(select id from expense_sub where expense_type_sub_id = any".
																																			 "(select id from expense_type_sub where expense_type_id = '".$object_expense_type["ID"]."')". 								  													
																																					"and expense_type_sub_id = '".$object_expense_type_sub["ID"]."') order by expense_sub_id";																																													
																			$ret_expense_sub = database_query($str_expense_sub);
																			while($object_expense_sub = mysql_fetch_array($ret_expense_sub)) {
																			
																				if( ($temp != $object_expense_sub["EXPENSE_SUB_ID"]) || ($object_account["ID"] == '51000') ) {
																					$object_es = mysql_fetch_array(database_query("select * from expense_sub where id = '".$object_expense_sub["EXPENSE_SUB_ID"]."'"));																										
																					// print expense type sub		
																					$worksheet1->write($line_num, 0, "                       " . $object_es["EXPENSE_SUB"] . "   " . $object_expense_sub["EXPAND"], $normal_left_format);
			
																							
																					// print money gov																										
																					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub["EXPENSE_SUB_ID"]."' and year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and money_type_id = '1'"));
 	       																		$worksheet1->write($line_num, 1, $amount_gov[0], $normal_right_format);
 	       																		
				
																					// print money ins																										
																					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub["EXPENSE_SUB_ID"]."' and year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and money_type_id = '2'"));
        																			$worksheet1->write($line_num, 2, $amount_ins[0], $normal_right_format);
        																			
						
																					// print money all		
																					$worksheet1->write($line_num, 3, $amount_gov[0] + $amount_ins[0], $normal_right_format);
													
																					$line_num++;
																							
																				} // end if of expense sub			
																				$temp = $object_expense_sub["EXPENSE_SUB_ID"];
																							
																			} // end while of expense sub																					
																			
															} // end while of ประเภทรายจ่ายย่อย
															
													} // end while of ประเภทรายจ่าย
											
											} // end while of งบ
											
											$line_num++;
									
									} // end while of กองทุน
							
							} // end while กิจกรรม
					
					} // end while of งาน
					
			} // end while of แผนงาน

	} // end while of ด้าน



##################################################
#
# Close
#
$workbook->close();


##################################################
#
# Header HTTP			 
#

header("Content-Type: application/x-msexcel; name=\"report_all_estimate_expense.xls\"");
header("Content-Disposition: inline; filename=\"report_all_estimate_expense.xls\"");
$fh=fopen($fname, "rb");
fpassthru($fh);
unlink($fname);

?>
