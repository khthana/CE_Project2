<?php

	require('thaipdfclass.php');
	include('database.php');	
	
	//$year = 2547;
	//$side = "08010";	
	
	database_connect();
	$pdf=new ThaiPDF();
	$pdf->SetThaiFont();
	$pdf->AddPage();
	
	$pdf->SetFont('AngsanaNew','B',16);
	$pdf->SetTextColor(0,0,0);
	$pdf->Ln(7);
	$pdf->Cell(0,0,'รายงานสรุปรวมการประมาณการรายจ่าย ประจำปีงบประมาณ ' . $year,0,1,'C');
	$pdf->Ln(7);
	$pdf->Cell(0,0,'สำนักทะเบียนและประมวลผล',0,1,'C');
	$pdf->Ln(7);
	
	$pdf->SetFont('AngsanaNew','B',14);	
	$pdf->SetX(180);
	$pdf->Cell(0,0,"รวมทั้งสิ้น",0,1,'C');
	$pdf->SetX(140);
	$pdf->Cell(0,0,"เงินรายได้",0,1,'C');
	$pdf->SetX(90);
	$pdf->Cell(0,0,"เงินงบประมาณ",0,1,'C');	
	$pdf->Ln(7);

		
	// **************************************** print sector **************************************
	$str_sector = "select * from sector where id = any".
														"(select sector_id from program where id = any".
															 "(select program_id from project where id = any".
													   			 "(select project_id from estimate_expense where year = '".$year."')))";
	$ret_sector = database_query($str_sector);
	while($object_sector = mysql_fetch_array($ret_sector)) {
	
			// print sector
			$pdf->SetFont('AngsanaNew','B',14);	
			$pdf->Cell(0,0,$object_sector["SECTOR"],0,1,'L');
			
			// print money gov
			$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));				
			$pdf->SetX(150);
			if($amount_gov[0] > 0)
			$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
			// print money ins			
			$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));	
			$pdf->SetX(170);
			if($amount_ins[0] > 0)
			$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
			
			// print money all		
			$pdf->SetX(190);
			$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
			$pdf->Ln(7);
			
			
			
			// **************************************** print program **************************************
			$str_program = "select * from program where id = any".
																	"(select program_id from project where id = any".
																			"(select project_id from estimate_expense where year = '".$year."'))".
																"and sector_id = '".$object_sector["ID"]."'";
			$ret_program = database_query($str_program);
			while($object_program = mysql_fetch_array($ret_program)) {
			
					// print program
					$pdf->SetFont('AngsanaNew','B',14);	
					$pdf->Cell(0,0,$object_program["PROGRAM"],0,1,'L');
			
					// print money gov
					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));				
					$pdf->SetX(150);
					if($amount_gov[0] > 0)
					$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
					// print money ins			
					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));	
					$pdf->SetX(170);
					if($amount_ins[0] > 0)
					$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
			
					// print money all		
					$pdf->SetX(190);
					$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
					$pdf->Ln(7);
					
					
					// **************************************** print project **************************************
					$str_project = "select * from project where id = any".
																				"(select project_id from estimate_expense where year = '".$year."')".
																		"and program_id = '".$object_program["ID"]."'";
					$ret_project = database_query($str_project);
					while($object_project = mysql_fetch_array($ret_project)) {
					
							// print project
							$pdf->SetFont('AngsanaNew','B',14);	
							$pdf->Cell(0,0,$object_project["PROJECT"],0,1,'L');
			
							// print money gov
							$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
							$pdf->SetX(150);
							if($amount_gov[0] > 0)
							$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
							// print money ins			
							$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
							$pdf->SetX(170);
							if($amount_ins[0] > 0)
							$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
			
							// print money all		
							$pdf->SetX(190);
							$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
							$pdf->Ln(7);
							
							
							
							// **************************************** print activity **************************************
							$str_activity = "select * from activity where id = any".
																						"(select activity_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."')";
							$ret_activity = database_query($str_activity);
							while($object_activity = mysql_fetch_array($ret_activity)) {
							
									if($object_activity[0] != '00') {
							
									// print activity
									$pdf->SetFont('AngsanaNew','B',14);	
									$pdf->Cell(0,0,$object_activity["ACTIVITY"],0,1,'L');
			
									// print money gov
									$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
									$pdf->SetX(150);
									if($amount_gov[0] > 0)
									$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
									// print money ins			
									$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
									$pdf->SetX(170);
									if($amount_ins[0] > 0)
									$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
					
									// print money all		
									$pdf->SetX(190);
									$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
									$pdf->Ln(7);
									
									} // end if of activity
									
									
									// **************************************** print fund **************************************
									$str_fund = "select * from fund where id = any".
																						"(select fund_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."')";
									$ret_fund = database_query($str_fund);
									while($object_fund = mysql_fetch_array($ret_fund)) {
									
											// print fund
											$pdf->SetFont('AngsanaNew','B',14);	
											$pdf->Cell(0,0,$object_fund["FUND"],0,1,'L');
			
											// print money gov
											$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
											$pdf->SetX(150);
											if($amount_gov[0] > 0)
											$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
											// print money ins			
											$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
											$pdf->SetX(170);
											if($amount_ins[0] > 0)
											$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
						
											// print money all		
											$pdf->SetX(190);
											$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
											$pdf->Ln(7);
											
											
											
											
											// **************************************** print account **************************************
											$str_account ="select * from account where id = any".
																										"(select account_id from expense_type where id = any".
																												"(select expense_type_id from expense_type_sub where id = any".
																														"(select expense_type_sub_id from expense_sub where id = any".
																																"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))))";
											$ret_account = database_query($str_account);
											while($object_account = mysql_fetch_array($ret_account)) {
											
													// print account
													$pdf->SetFont('AngsanaNew','B',14);	
													$pdf->SetX(15);
													$pdf->Cell(0,0,$object_account["ACCOUNT"],0,1,'L');
			
													// print money gov
													$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));				
													$pdf->SetX(150);
													if($amount_gov[0] > 0)
													$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
													// print money ins			
													$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));	
													$pdf->SetX(170);
													if($amount_ins[0] > 0)
													$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
						
													// print money all		
													$pdf->SetX(190);
													$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
													$pdf->Ln(7);
													
													
													
													
													// **************************************** print expense type **************************************
													$str_expense_type ="select * from expense_type where id = any".
																														"(select expense_type_id from expense_type_sub where id = any".
																																"(select expense_type_sub_id from expense_sub where id = any".
																																		"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."')))".
																													" and account_id = '".$object_account["ID"]."'";
													$ret_expense_type = database_query($str_expense_type);
													while($object_expense_type = mysql_fetch_array($ret_expense_type)) {																			
															if($object_expense_type["ID"] != "00000" && $object_expense_type["ID"] != "00001" && $object_expense_type["ID"] != "00002") {
													
																	// print expense type
																	$pdf->SetFont('AngsanaNew','',14);
																	$pdf->SetX(20);
																	$pdf->Cell(0,0,$object_expense_type["EXPENSE_TYPE"],0,1,'L');
			
																	// print money gov
																	$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));				
																	$pdf->SetX(150);
																	if($amount_gov[0] > 0)
																	$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
				
																	// print money ins			
																	$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));	
																	$pdf->SetX(170);
																	if($amount_ins[0] > 0)
																	$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
						
																	// print money all		
																	$pdf->SetX(190);
																	$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
																	$pdf->Ln(7);
															
															} // end if of expense type
																

																	// **************************************** print expense type sub **************************************
																	$str_expense_type_sub ="select * from expense_type_sub where id = any".
																																					"(select expense_type_sub_id from expense_sub where id = any".
																																							"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))".
																															" and expense_type_id = '".$object_expense_type["ID"]."'";
																	$ret_expense_type_sub = database_query($str_expense_type_sub);
																	while($object_expense_type_sub = mysql_fetch_array($ret_expense_type_sub)) {																				
																			if($object_expense_type_sub["ID"] != "00000" && $object_expense_type_sub["ID"] != "00001" && $object_expense_type_sub["ID"] != "00002" && $object_expense_type_sub["ID"] != "00003" && $object_expense_type_sub["ID"] != "00004" && $object_expense_type_sub["ID"] != "00005" && $object_expense_type_sub["ID"] != "00006") {
																
																					// print expense type sub
																					$pdf->SetFont('AngsanaNew','',14);
																					$pdf->SetX(25);
																					$pdf->Cell(0,0,$object_expense_type_sub["EXPENSE_TYPE_SUB"],0,1,'L');
			
																					// print money gov
																					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));				
																					$pdf->SetX(150);
																					if($amount_gov[0] > 0)
																					$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
				
																					// print money ins			
																					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));	
																					$pdf->SetX(170);
																					if($amount_ins[0] > 0)
																					$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
						
																					// print money all		
																					$pdf->SetX(190);
																					$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');
																					$pdf->Ln(7);
																					
																			} // end if of expense type sub
																					
																					
																			// **************************************** print expense sub **************************************
																			$str_expense_sub ="select * from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and expense_sub_id = any".
																																		"(select id from expense_sub where expense_type_sub_id = any".
																																			 "(select id from expense_type_sub where expense_type_id = '".$object_expense_type["ID"]."')". 								  													
																																					"and expense_type_sub_id = '".$object_expense_type_sub["ID"]."') order by expense_sub_id";																																													
																			$ret_expense_sub = database_query($str_expense_sub);
																			while($object_expense_sub = mysql_fetch_array($ret_expense_sub)) {
																			
																				if( ($temp != $object_expense_sub["EXPENSE_SUB_ID"]) || ($object_account["ID"] == '51000') ) {
																				
																					$object_es = mysql_fetch_array(database_query("select * from expense_sub where id = '".$object_expense_sub["EXPENSE_SUB_ID"]."'"));																										
																					// print expense type sub		
																					$pdf->SetFont('AngsanaNew','',14);																					
																					$pdf->SetX(30);
																					$pdf->Cell(0,0,$object_es["EXPENSE_SUB"] . "  " . $object_expense_sub["EXPAND"],0,1,'L');
			
																							
																					// print money gov																										
																					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub["EXPENSE_SUB_ID"]."' and year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and money_type_id = '1'"));
																					$pdf->SetX(150);
																					if($amount_gov[0] > 0)
																					$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
				
																					// print money ins																										
																					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub["EXPENSE_SUB_ID"]."' and year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and money_type_id = '2'"));
																					$pdf->SetX(170);
																					if($amount_ins[0] > 0)
																					$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
						
																					// print money all		
																					$pdf->SetX(190);
																					$pdf->Cell(10,0,number_format($amount_gov[0] + $amount_ins[0]),0,1,'R');																							
																					$pdf->Ln(7);
																							
																				} // end if of expense sub
																				$temp = $object_expense_sub["EXPENSE_SUB_ID"];			
																			} // end while of expense sub																			
																	} // end while of expense type sub																																								
													} // end while of expense type
													//$pdf->Ln(5);
											} // end while of account
											$pdf->Ln(3);
									} // end while of fund
									//$pdf->Ln(5);
							} // end while of activity
							//$pdf->Ln(5);
					} // end while of project
					//$pdf->Ln(5);
			} // end while of program
			//$pdf->Ln(5);
	} // end while of secter
	//$pdf->Ln(5);
	
	$pdf->Output();
?>



