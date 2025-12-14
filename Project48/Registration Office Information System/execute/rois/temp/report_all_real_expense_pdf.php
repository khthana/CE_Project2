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
	$pdf->Cell(0,0,'รายงานรายจ่ายจริง ประจำปี ' . $year,0,1,'C');
	$pdf->Ln(7);
	$pdf->Cell(0,0,'สำนักทะเบียนและประมวลผล',0,1,'C');
	$pdf->Ln(7);
	
	$pdf->SetFont('AngsanaNew','B',14);	
	$pdf->Cell(80,6,"",0,0,'C');
	$pdf->Cell(25,6,"เงินงบประมาณ",0,0,'C');	
	$pdf->Cell(25,6,"เงินรายได้",0,0,'C');
	$pdf->Cell(25,6,"รวมทั้งสิ้น",0,0,'C');	
	$pdf->Cell(20,6,"วันที่",0,0,'C');	
	$pdf->Cell(20,6,"อ้างอิง",0,0,'C');	
	
	$pdf->Ln();

		
	// **************************************** print sector **************************************
	$str_sector = "select * from sector where id = any".
														"(select sector_id from program where id = any".
															 "(select program_id from project where id = any".
													   			 "(select project_id from real_expense where year = '".$year."')))";
	$ret_sector = database_query($str_sector);
	while($object_sector = mysql_fetch_array($ret_sector)) {
	
			// print sector
			$pdf->SetFont('AngsanaNew','B',14);	
			$pdf->Cell(80,6,$object_sector["SECTOR"],0,0,'L');
			
			// print money gov
			$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));		
			if($amount_gov[0] > 0)
				$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
			else
				$pdf->Cell(25,6,'',0,0,'R');
			
			// print money ins			
			$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));	
			if($amount_ins[0] > 0)
				$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
			else
				$pdf->Cell(25,6,'',0,0,'R');
			
			// print money all		
			$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
			$pdf->Ln();
			
			
			
			// **************************************** print program **************************************
			$str_program = "select * from program where id = any".
																	"(select program_id from project where id = any".
																			"(select project_id from real_expense where year = '".$year."'))".
																"and sector_id = '".$object_sector["ID"]."'";
			$ret_program = database_query($str_program);
			while($object_program = mysql_fetch_array($ret_program)) {
			
					// print program
					$pdf->SetFont('AngsanaNew','B',14);	
					$pdf->Cell(80,6,$object_program["PROGRAM"],0,0,'L');
			
					// print money gov
					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));			
					if($amount_gov[0] > 0)
						$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
					else
						$pdf->Cell(25,6,'',0,0,'R');
					
			
					// print money ins			
					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));
					if($amount_ins[0] > 0)
						$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
					else
						$pdf->Cell(25,6,'',0,0,'R');
			
					// print money all		
					$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
					$pdf->Ln();
					
					
					
					
					// **************************************** print project **************************************
					$str_project = "select * from project where id = any".
																				"(select project_id from real_expense where year = '".$year."')".
																		"and program_id = '".$object_program["ID"]."'";
					$ret_project = database_query($str_project);
					while($object_project = mysql_fetch_array($ret_project)) {
					
							// print project
							$pdf->SetFont('AngsanaNew','B',14);	
							$pdf->Cell(80,6,$object_project["PROJECT"],0,0,'L');
			
							// print money gov
							$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));			
							if($amount_gov[0] > 0)
								$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
							else
								$pdf->Cell(25,6,'',0,0,'R');
			
							// print money ins			
							$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
							if($amount_ins[0] > 0)
								$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
							else
								$pdf->Cell(25,6,'',0,0,'R');
			
							// print money all		
							$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
							$pdf->Ln();
							
							
							
							// **************************************** print activity **************************************
							$str_activity = "select * from activity where id = any".
																						"(select activity_id from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."')";
							$ret_activity = database_query($str_activity);
							while($object_activity = mysql_fetch_array($ret_activity)) {
							
									if($object_activity[0] != '00') {
							
									// print activity
									$pdf->SetFont('AngsanaNew','B',14);	
									$pdf->Cell(80,6,$object_activity["ACTIVITY"],0,0,'L');
			
									// print money gov
									$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));				
									if($amount_gov[0] > 0)
										$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
									else
										$pdf->Cell(25,6,'',0,0,'R');
			
									// print money ins			
									$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
									if($amount_ins[0] > 0)
										$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
									else
										$pdf->Cell(25,6,'',0,0,'R');
					
									// print money all		
									$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
									$pdf->Ln();
									
									} // end if of activity
									
									
									
									// ***************************************** print activity sub ********************************
									$str_activity_sub = "select * from activity_sub where id = any".
																								"(select activity_sub_id from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."')";
									$ret_activity_sub = database_query($str_activity_sub);
									while($object_activity_sub = mysql_fetch_array($ret_activity_sub)) {
											if($object_activity_sub[0] != '00') {
									
													// print activity
													$pdf->SetFont('AngsanaNew','B',14);	
													$pdf->Cell(80,6,$object_activity_sub["ACTIVITY_SUB"],0,0,'L');
			
													// print money gov
													$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and activity_sub_id = '".$object_activity_sub["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));					
													if($amount_gov[0] > 0)
														$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
													else
														$pdf->Cell(25,6,'',0,0,'R');
			
													// print money ins			
													$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and activity_sub_id = '".$object_activity_sub["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
													if($amount_ins[0] > 0)
														$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
													else
														$pdf->Cell(25,6,'',0,0,'R');
					
													// print money all		
													$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
													$pdf->Ln();	
									
											} // end if of activity sub
											
											
									
									// **************************************** print fund **************************************
									$str_fund = "select * from fund where id = any".
																						"(select fund_id from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."')";
									$ret_fund = database_query($str_fund);
									while($object_fund = mysql_fetch_array($ret_fund)) {
									
											// print fund
											$pdf->SetFont('AngsanaNew','B',14);	
											$pdf->Cell(80,6,$object_fund["FUND"],0,0,'L');
			
											// print money gov
											$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));		
											if($amount_gov[0] > 0)
												$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
											else
												$pdf->Cell(25,6,'',0,0,'R');
			
											// print money ins			
											$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));		
											if($amount_ins[0] > 0)
												$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
											else
												$pdf->Cell(25,6,'',0,0,'R');
						
											// print money all		
											$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
											$pdf->Ln();
											
											
											
											
											// **************************************** print account **************************************
											$str_account ="select * from account where id = any".
																										"(select account_id from expense_type where id = any".
																												"(select expense_type_id from expense_type_sub where id = any".
																														"(select expense_type_sub_id from expense_sub where id = any".
																																"(select expense_sub_id from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))))";
											//print $str_account;
											$ret_account = database_query($str_account);
											while($object_account = mysql_fetch_array($ret_account)) {
											
													// print account
													$pdf->SetFont('AngsanaNew','B',14);	
													$pdf->Cell(80,6,$object_account["ACCOUNT"],0,0,'L');
			
													// print money gov
													$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));				
													if($amount_gov[0] > 0)
														$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
													else
														$pdf->Cell(25,6,'',0,0,'R');
			
													// print money ins			
													$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));	
													if($amount_ins[0] > 0)
														$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
													else
														$pdf->Cell(25,6,'',0,0,'R');
						
													// print money all		
													$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
													$pdf->Ln();
													
													
													
													
													// **************************************** print expense type **************************************
													$str_expense_type ="select * from expense_type where id = any".
																														"(select expense_type_id from expense_type_sub where id = any".
																																"(select expense_type_sub_id from expense_sub where id = any".
																																		"(select expense_sub_id from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."')))".
																													" and account_id = '".$object_account["ID"]."'";
													$ret_expense_type = database_query($str_expense_type);
													while($object_expense_type = mysql_fetch_array($ret_expense_type)) {
																			
															if($object_expense_type["ID"] != "00000" && $object_expense_type["ID"] != "00001" && $object_expense_type["ID"] != "00002") {
													
																	// print expense type
																	$pdf->SetFont('AngsanaNew','',14);
																	$pdf->Cell(80,6,"      " . $object_expense_type["EXPENSE_TYPE"],0,0,'L');
			
																	// print money gov
																	$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));	
																	if($amount_gov[0] > 0)
																		$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
																	else
																		$pdf->Cell(25,6,'',0,0,'R');
				
																	// print money ins			
																	$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));
																	if($amount_ins[0] > 0)
																		$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
																	else
																		$pdf->Cell(25,6,'',0,0,'R');
						
																	// print money all		
																	$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
																	$pdf->Ln();
															
															} // end if of expense type
																
																

																	// **************************************** print expense type sub **************************************
																	$str_expense_type_sub ="select * from expense_type_sub where id = any".
																																				"(select expense_type_sub_id from expense_sub where id = any".
																																						"(select expense_sub_id from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))".
																															" and expense_type_id = '".$object_expense_type["ID"]."'";
																	$ret_expense_type_sub = database_query($str_expense_type_sub);
																	while($object_expense_type_sub = mysql_fetch_array($ret_expense_type_sub)) {
																					
																			if($object_expense_type_sub["ID"] != "00000" && $object_expense_type_sub["ID"] != "00001" && $object_expense_type_sub["ID"] != "00002" && $object_expense_type_sub["ID"] != "00003" && $object_expense_type_sub["ID"] != "00004" && $object_expense_type_sub["ID"] != "00005" && $object_expense_type_sub["ID"] != "00006") {
																
																					// print expense type sub
																					$pdf->SetFont('AngsanaNew','',14);
																					$pdf->Cell(80,6,"          " . $object_expense_type_sub["EXPENSE_TYPE_SUB"],0,0,'L');
			
																					// print money gov
																					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));	
																					if($amount_gov[0] > 0)
																							$pdf->Cell(25,6,number_format($amount_gov[0]),0,0,'R');
																					else
																							$pdf->Cell(25,6,'',0,0,'R');
				
																					// print money ins			
																					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));	
																					if($amount_ins[0] > 0)
																							$pdf->Cell(25,6,number_format($amount_ins[0]),0,0,'R');
																					else
																							$pdf->Cell(25,6,'',0,0,'R');
						
																					// print money all		
																					$pdf->Cell(25,6,number_format($amount_gov[0] + $amount_ins[0]),0,0,'R');
																					$pdf->Ln();
																					
																			} // end if of expense type sub
																					
																					
																					
																			// **************************************** print expense sub **************************************
																			$str_expense_sub ="select * from real_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and expense_sub_id = any".
																																		"(select id from expense_sub where expense_type_sub_id = any".
																																			 "(select id from expense_type_sub where expense_type_id = '".$object_expense_type["ID"]."')". 								  													
																																					"and expense_type_sub_id = '".$object_expense_type_sub["ID"]."') order by date";																																													
																			$ret_expense_sub = database_query($str_expense_sub);
																			while($object_expense_sub = mysql_fetch_array($ret_expense_sub)) {
																			
																					$object_es = mysql_fetch_array(database_query("select * from expense_sub where id = '".$object_expense_sub["EXPENSE_SUB_ID"]."'"));		
																							
																					// print expense type sub		
																					$pdf->SetFont('AngsanaNew','',14);																					
																					$pdf->Cell(80,6,"             " . $object_es["EXPENSE_SUB"] . "  " . $object_expense_sub["EXPAND"],0,0,'L');
			
																							
																					// print money gov																										
																					$int;
        																			if($object_expense_sub["MONEY_TYPE_ID"] == "1") {
																							$pdf->Cell(25,6,$object_expense_sub["AMOUNT"],0,0,'R');
 	       																				$int = $object_expense_sub["AMOUNT"];
 	   																			}
 	   																			else
																							$pdf->Cell(25,6,'',0,0,'R');
				
																					// print money ins																										
																					if($object_expense_sub["MONEY_TYPE_ID"] == "2") {
																							$pdf->Cell(25,6,$object_expense_sub["AMOUNT"],0,0,'R');
        																					$int = $object_expense_sub["AMOUNT"];
        																			}
        																			else
																							$pdf->Cell(25,6,'',0,0,'R');
						
																					// print money all		
																					$pdf->Cell(25,6,number_format($int),0,0,'R');																							
																					
																					// print date
																					$pdf->Cell(20,6,$object_expense_sub["DATE"],0,0,'C');
																					
																					// print ref
																					$pdf->Cell(20,6,$object_expense_sub["REF_DOCUMENT"],0,0,'C');
																					
																					$pdf->Ln();																							
																							
																			} // end while of expense sub																			
																	} // end while of expense type sub																																								
													} // end while of expense type
													//$pdf->Ln(5);
											} // end while of account
											$pdf->Ln(3);
									} // end while of fund
									//$pdf->Ln(5);
									}// end while of activity sub
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



