<?php
	include('function.php');
	include('database.php');
	
	head_html("รายงานการประมาณการรายจ่าย");
	database_connect();
	
	function sum($str) {		
 		$ret = database_query($str);
 		$object_amount = mysql_fetch_array($ret);
 		return $object_amount[0];
	}
	
	function new_line() {
?>
		<tr> 
				<td>&nbsp;</td>
				<td></td>
				<td></td>
				<td></td>
				<? if(isset($mode)) { ?>
				<td></td>
				<? } ?>
		</tr>        								
<?
	}
?>

<table align="CENTER%" width="100%" cellspacing="15" border="0">
<tr>
			<td>
					<? print "<a href='report_all_estimate_expense_pdf.php?year=".$year."' target='_blank'>"; ?>
					<img src="picture/pdf.gif" width="16" height="16" border="0" alt=""></a>
					<? print "<a href='report_all_estimate_expense_excel.php?year=".$year."' target='_blank'>"; ?>
					<img src="picture/excel.gif" width="16" height="16" border="0" alt=""></a>
			</td>
</tr>
<tr>
         <td>
		 		<table width="100%" border="1" cellspacing="0" bordercolor="#000000">
        			<tr> 
          				<td bgcolor="#FF6600"> 
						  <div align="center"> 
						  	<p class="font1">รายงานสรุปรวมการประมาณการรายจ่าย ประจำปีงบประมาณ <?php print $year ?> <br>สำนัทะเบียนและประมวลผล</p>
						  </div>
						</td>
        			</tr>
      			</table>
		 </td>
</tr>
<tr>
         <td>
         	<!-- **********************************  Label ****************************************  -->
		 		<table width="100%" border="0" cellspacing="1" class="font1">		 			
        			
        			<tr> 
          			<td width="64%"> 
							&nbsp;
						</td>
          			<td  width="12%">  
							<div align="center"><b>เงินงบประมาณ</b></div>	  
						</td>
          			<td width="12%"> 
							<div align="center"><b>เงินรายได้</b></div>
						</td>
          			<td width="12%"> 
							<div align="center"><b>รวมทั้งสิ้น</b></div>
						</td>						
        			</tr>
        			
        			
        			
        			
        			
        			<!-- ******************************************** Sector ******************************************** -->
					<?
						$str_sector = "select * from sector where id = any".
														"(select sector_id from program where id = any".
															 "(select program_id from project where id = any".
													   			 "(select project_id from estimate_expense where year = '".$year."')))";
						$ret_sector = database_query($str_sector);
						while($object_sector = mysql_fetch_array($ret_sector)) {
					?>        			
        			       			        			
        					<tr>
        						<!-- column1 -->
        						<td bgcolor="#FF8B00">
        							<?         								
        								print "<b>" . $object_sector["SECTOR"] . "</b>";
        							?>
        						</td>
        						<!-- column3 -->
        						<td  align="right" bgcolor="#FF8B00">
        							<?
        								$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));	
										if($amount_gov[0] > 0)	
												print "<b>" . number_format($amount_gov[0]) . "</b>";
        							?>
        						</td>
        						<!-- column4 -->
        						<td  align="right" bgcolor="#FF8B00">
        							<?
        								$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."'))"));	
										if($amount_ins[0] > 0)	
												print "<b>" . number_format($amount_ins[0]) . "</b>";
        							?>
        						</td>
        						<!-- column5 -->
        						<td bgcolor="#FF8B00"  align="right">
        							<?
        								print "<b>" . number_format(($amount_gov[0] + $amount_ins[0])) . "</b>";
        							?>
        						</td>
        						<!-- column6 -->
        						<? if(isset($mode)) { ?>
        						<td bgcolor="#FF8B00"></td>
        						<? } ?>
        					</tr>
        					
        					
        					<!-- ******************************************** Program ******************************************** -->
							<?
								$str_program = "select * from program where id = any".
																	"(select program_id from project where id = any".
																			"(select project_id from estimate_expense where year = '".$year."'))".
																 "and sector_id = '".$object_sector["ID"]."'";
								$ret_program = database_query($str_program);
								while($object_program = mysql_fetch_array($ret_program)) {
							?>        			
        					       			        			
        							<tr>
        								<!-- column1 -->
        								<td bgcolor="#FF9F2B">
        									<?         								
        										print "<b>" . $object_program["PROGRAM"] . "</b>";
        									?>
        								</td>
        								<!-- column3 -->
        								<td bgcolor="#FF9F2B"  align="right">
        									<?
        										$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));	
												if($amount_gov[0] > 0)	
														print "<b>" . number_format($amount_gov[0]) . "</b>";
        									?>
        								</td>
        								<!-- column4 -->
        								<td bgcolor="#FF9F2B"  align="right">
        									<?
        										$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																				"(select id from project where program_id = any".
																																						"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."'))"));
												if($amount_ins[0] > 0)	
														print "<b>" . number_format($amount_ins[0]) . "</b>";
        									?>
        								</td>
        								<!-- column5 -->
        								<td bgcolor="#FF9F2B"  align="right">
        									<?
        										print "<b>" . number_format(($amount_gov[0] + $amount_ins[0])) . "</b>";
        									?>
        								</td>
        								<!-- column6 -->
        								<? if(isset($mode)) { ?>
        								<td bgcolor="#FF9F2B"></td>
        								<? } ?>
        							</tr>
        							
        							        							
        							
        							<!-- ******************************************** Project ******************************************** -->
									<?
										$str_project = "select * from project where id = any".
																				"(select project_id from estimate_expense where year = '".$year."')".
																		"and program_id = '".$object_program["ID"]."'";
										$ret_project = database_query($str_project);
										while($object_project = mysql_fetch_array($ret_project)) {
									?>        			
        						       			        			
        									<tr>
        										<!-- column1 -->
        										<td bgcolor="#FFB559">
        											<?         								
        												print "<b>" . $object_project["PROJECT"] . "</b>";
        											?>
        										</td>
        										<!-- column3 -->
        										<td bgcolor="#FFB559"  align="right">
        											<?
        												$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
														if($amount_gov[0] > 0)	
																print "<b>" . number_format($amount_gov[0]) . "</b>";
        											?>
        										</td>
        										<!-- column4 -->
        										<td bgcolor="#FFB559"  align="right">
        											<?
        												$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
														if($amount_ins[0] > 0)	
																print "<b>" . number_format($amount_ins[0]) . "</b>";
        											?>
        										</td>
        										<!-- column5 -->
        										<td bgcolor="#FF9F2B"  align="right">
        											<?
        												print "<b>" . number_format(($amount_gov[0] + $amount_ins[0])) . "</b>";
        											?>
        										</td>
        										<!-- column6 -->
        										<? if(isset($mode)) { ?>
        										<td bgcolor="#FFB559"></td>
        										<? } ?>
        									</tr>
        										
        										
        										
        										
        										
        										<!-- ******************************************** Activity ******************************************** -->
												<?
													$str_activity = "select * from activity where id = any".
																						"(select activity_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."')";
													$ret_activity = database_query($str_activity);
													while($object_activity = mysql_fetch_array($ret_activity)) {
												?>        			
        						       			        			
        												<tr>
        													<!-- column1 -->
        													<td bgcolor="#FFC782">
        													<?         								
        														print "<b>" . $object_activity["ACTIVITY"] . "</b>";
        													?>
        													</td>
        													<!-- column3 -->
        													<td bgcolor="#FFC782"  align="right">
        														<?
        															$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
																	if($amount_gov[0] > 0)	
																			print "<b>" . number_format($amount_gov[0]) . "</b>";
        														?>
        													</td>
        													<!-- column4 -->
        													<td bgcolor="#FFC782"  align="right">
        														<?
        															$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
																	if($amount_ins[0] > 0)	
																			print "<b>" . number_format($amount_ins[0]) . "</b>";
        														?>
        													</td>
        													<!-- column5 -->
        													<td bgcolor="#FFC782"  align="right">
        														<?
        															print "<b>" . number_format(($amount_gov[0] + $amount_ins[0])) . "</b>";
        														?>
        													</td>
        													<!-- column6 -->
        													<? if(isset($mode)) { ?>
        													<td bgcolor="#FFC782"></td>
        													<? } ?>
        												</tr>
        												
        												
        												
        												
        												<!-- ******************************************** Fund ******************************************** -->
														<?
															$str_fund = "select * from fund where id = any".
																						"(select fund_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."')";
															$ret_fund = database_query($str_fund);
															while($object_fund = mysql_fetch_array($ret_fund)) {
														?>        			
        						       			        			
        														<tr>
        															<!-- column1 -->
        															<td bgcolor="#FFE3C1">
        															<?         								
        																print "<b>" . $object_fund["FUND"] . "</b>";
        															?>
        															</td>
        															<!-- column3 -->
        															<td bgcolor="#FFE3C1"  align="right">
        																<?
        																	$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
																			if($amount_gov[0] > 0)	
																					print "<b>" . number_format($amount_gov[0]) . "</b>";
        																?>
        															</td>
        															<!-- column4 -->
        															<td bgcolor="#FFE3C1"  align="right">
        																<?
        																	$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."')"));	
																			if($amount_ins[0] > 0)	
																					print "<b>" . number_format($amount_ins[0]) . "</b>";
        																?>
        															</td>
        															<!-- column5 -->
        															<td bgcolor="#FFE3C1"  align="right">
        																<?
        																	print "<b>" . number_format(($amount_gov[0] + $amount_ins[0])) . "</b>";
        																?>
        															</td>
        															<!-- column6 -->
        															<? if(isset($mode)) { ?>
        															<td bgcolor="#FFE3C1"></td>
        															<? } ?>
        														</tr>
        														
        														
        														
        														
        														<!-- ******************************************** Account ******************************************** -->
																<?
																	$str_account ="select * from account where id = any".
																										"(select account_id from expense_type where id = any".
																												"(select expense_type_id from expense_type_sub where id = any".
																														"(select expense_type_sub_id from expense_sub where id = any".
																																"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))))";
																	$ret_account = database_query($str_account);
																	while($object_account = mysql_fetch_array($ret_account)) {
																?>        			
        						       			        			
        																<tr>
        																	<!-- column1 -->
        																	<td bgcolor="#D8D8D8">
        																	<?         								
        																		print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . "<b>" . $object_account["ACCOUNT"] . "</b>";
        																	?>
        																	</td>
        																	<!-- column3 -->
        																	<td bgcolor="#D8D8D8"  align="right">
        																		<?
        																			$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."'  and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));	
																					if($amount_gov[0] > 0)	
																							print "<b>" . number_format($amount_gov[0]) . "</b>";
        																		?>
        																	</td>
        																	<!-- column4 -->
        																	<td bgcolor="#D8D8D8"  align="right">
        																		<?
        																			$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."'  and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."')))"));	
																					if($amount_ins[0] > 0)	
																						print "<b>" . number_format($amount_ins[0]) . "</b>";
        																		?>
        																	</td>
        																	<!-- column5 -->
        																	<td bgcolor="#D8D8D8"  align="right">
        																		<?
        																			print "<b>" . number_format(($amount_gov[0] + $amount_ins[0])) . "</b>";
        																		?>
        																	</td>
        																	<!-- column6 -->
        																	<? if(isset($mode)) { ?>
        																	<td bgcolor="#D8D8D8"></td>
        																	<? } ?>
        																</tr>
        																
        																
        																
        																
        																
        																
        																<!-- ******************************************** Expense Type ****************************************** -->
																		<?
																			$str_expense_type ="select * from expense_type where id = any".
																														"(select expense_type_id from expense_type_sub where id = any".
																																"(select expense_type_sub_id from expense_sub where id = any".
																																		"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."')))".
																													" and account_id = '".$object_account["ID"]."'";
																			$ret_expense_type = database_query($str_expense_type);
																			while($object_expense_type = mysql_fetch_array($ret_expense_type)) {
																			
																				if($object_expense_type["ID"] != "00000" && $object_expense_type["ID"] != "00001" && $object_expense_type["ID"] != "00002") {
																		?>        			
        						       			        			
        																		<tr>
        																			<!-- column1 -->
        																			<td bgcolor="#E6E6E6">
        																			<?         								
        																				print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_expense_type["EXPENSE_TYPE"];
        																			?>
        																			</td>
        																			<!-- column3 -->
        																			<td bgcolor="#E6E6E6"  align="right">
        																				<?
        																					$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));	
																							if($amount_gov[0] > 0)	
																									print number_format($amount_gov[0]);
        																				?>
        																			</td>
        																			<!-- column4 -->
        																			<td bgcolor="#E6E6E6"  align="right">
        																				<?
        																					$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."')))"));	
																							if($amount_ins[0] > 0)	
																								print number_format($amount_ins[0]);
        																				?>
        																			</td>
        																			<!-- column5 -->
        																			<td bgcolor="#E6E6E6"  align="right">
        																				<?
        																					print number_format(($amount_gov[0] + $amount_ins[0]));
        																				?>
        																			</td>
        																			<!-- column6 -->
        																			<? if(isset($mode)) { ?>
        																			<td bgcolor="#E6E6E6"></td>
        																			<? } ?>
        																		</tr>
        																<? 
        																} // end if of expense type 
        																?>
        																
        																
        																
        																		
        																		<!-- *************************************** Expense Type Sub *************************************** -->
																				<?
																					$str_expense_type_sub ="select * from expense_type_sub where id = any".
																																				"(select expense_type_sub_id from expense_sub where id = any".
																																						"(select expense_sub_id from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."'))".
																															" and expense_type_id = '".$object_expense_type["ID"]."'";
																					$ret_expense_type_sub = database_query($str_expense_type_sub);
																					while($object_expense_type_sub = mysql_fetch_array($ret_expense_type_sub)) {
																					
																					if($object_expense_type_sub["ID"] != "00000" && $object_expense_type_sub["ID"] != "00001" && $object_expense_type_sub["ID"] != "00002" && $object_expense_type_sub["ID"] != "00003" && $object_expense_type_sub["ID"] != "00004" && $object_expense_type_sub["ID"] != "00005" && $object_expense_type_sub["ID"] != "00006") {
																				?>        			
        						       			        			
        																				<tr>
        																					<!-- column1 -->
        																					<td bgcolor="#E6E6E0">
        																					<?         								
        																						print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_expense_type_sub["EXPENSE_TYPE_SUB"];
        																					?>
        																					</td>
        																					<!-- column3 -->
        																					<td bgcolor="#E6E6E0"  align="right">
        																						<?
        																							$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));
																									if($amount_gov[0] > 0)	
																											print number_format($amount_gov[0]);
        																						?>
        																					</td>
        																					<!-- column4 -->
        																					<td bgcolor="#E6E6E0"  align="right">
        																						<?
        																							$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_expense where year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and project_id = any". 
																																								"(select id from project where program_id = any".
																																										"(select id from program where sector_id = '".$object_sector["ID"]."' and id = '".$object_program["ID"]."') and id = '".$object_project["ID"]."') and expense_sub_id = any".
																																												"(select id from expense_sub where expense_type_sub_id = any".
																																													"(select id from expense_type_sub where expense_type_id = any".
																																														"(select id from expense_type where account_id = '".$object_account["ID"]."'  and id = '".$object_expense_type["ID"]."') and id = '".$object_expense_type_sub["ID"]."'))"));	
																									if($amount_ins[0] > 0)	
																									print number_format($amount_ins[0]);
        																						?>
        																					</td>
        																					<!-- column5 -->
        																					<td bgcolor="#E6E6E0"  align="right">
        																						<?
        																							print number_format(($amount_gov[0] + $amount_ins[0]));
        																						?>
        																					</td>
        																					<!-- column6 -->
        																					<? if(isset($mode)) { ?>
        																					<td bgcolor="#E6E6E0"></td>
        																					<? } ?>
        																				</tr>
        																		<?
        																			} // end if of expense type sub
        																		?>	
        																		
        																				
        																				
        																				
        																				
        																				
        																				<!-- ************************************ Expense Sub ****************************************** -->
																						<?
																							$str_expense_sub ="select * from estimate_expense where year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and expense_sub_id = any".
																																		"(select id from expense_sub where expense_type_sub_id = any".
																																			 "(select id from expense_type_sub where expense_type_id = '".$object_expense_type["ID"]."')". 								  													
																																					"and expense_type_sub_id = '".$object_expense_type_sub["ID"]."') order by expense_sub_id";																																													
																							$ret_expense_sub = database_query($str_expense_sub);
																							$temp;
																							while($object_expense_sub = mysql_fetch_array($ret_expense_sub)) {
																								
																								if( ($temp != $object_expense_sub["EXPENSE_SUB_ID"]) || ($object_account["ID"] == '51000') ) {
																						?>        			
        						       			        			
        																						<tr>
        																							<!-- column1 -->
        																							<td bgcolor="#F2F2F2">
        																							<?         	
        																								$object_es = mysql_fetch_array(database_query("select * from expense_sub where id = '".$object_expense_sub["EXPENSE_SUB_ID"]."'"));							
        																								print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_es["EXPENSE_SUB"] . "&nbsp;&nbsp;&nbsp;&nbsp;" . $object_expense_sub["EXPAND"];
        																							?>
        																							</td>
        																							<!-- column3 -->
        																							<td bgcolor="#F2F2F2"  align="right">
        																								<?
        																									$amount_gov = sum("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub["EXPENSE_SUB_ID"]."' and year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and money_type_id = '1'");
																											if($amount_gov > 0)
																											print number_format($amount_gov);
        																								?>
        																							</td>
        																							<!-- column4 -->
        																							<td bgcolor="#F2F2F2"  align="right">
        																								<?
        																									$amount_ins = sum("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub["EXPENSE_SUB_ID"]."' and year = '".$year."' and project_id = '".$object_project["ID"]."' and activity_id = '".$object_activity["ID"]."' and fund_id = '".$object_fund["ID"]."' and money_type_id = '2'");
																											if($amount_ins > 0)
        																									print number_format($amount_ins);  
        																								?>
        																							</td>
        																							<!-- column5 -->
        																							<td bgcolor="#F2F2F2"  align="right">
        																								<?
        																									print number_format($amount_gov + $amount_ins);
        																								?>
        																							</td>
        																							<!-- column6 -->
        																							<? if(isset($mode)) { ?>
        																							<td bgcolor="#F2F2F2">
        																									<? 
	    																											print "<a href='form_edit_list_estimate_expense.php?id=".$object_expense_sub["ID"]."'>"; 
	    																									?>
																													<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
																													</a>
																											<? 
																													print "<a href='process_edit_delete_list.php?mode=delete&table_name=estimate_expense&year=".$year."&side=".$side."&id=".$object_expense_sub["ID"]."'>"; 
																											?>
																													<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
																													</a>
        																							</td>
        																							<? } ?>
        																						</tr>        																        																        																        			       		
        			<?
        																						}// end if of expense sub
        																						$temp = $object_expense_sub["EXPENSE_SUB_ID"];
        																					} // end while of expense sub
        																			} // end while of expense type sub
        																	} // end while of expense type
        															} // end while of account        															
        															new_line();
        													} // end while of fund
        											} // end while of activity
        									} // end while of project
        							} // end while of program
        					} // end while of sector
        			?>
        		</table>        			
        	</td>
</tr>
</table>

<?php
	end_head_html();
?>