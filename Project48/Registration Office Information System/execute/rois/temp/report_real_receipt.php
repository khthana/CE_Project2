<?php
	include('function.php');
	include('database.php');
	
	head_html("รายงานรายรับจริง");
	database_connect();
	
	function sum($str) {      
 		$ret_amount = database_query($str);
 		$object_amount = mysql_fetch_array($ret_amount);
 		return $object_amount[0];
	}
	
	check_offier_money();
	
?>

<table align="CENTER%" width="100%" cellspacing="15" border="0">
<?
	if(!isset($mode)) {
?>
<tr>
			<td>
					<? print "<a href='report_real_receipt_pdf.php?year=".$year."' target='_blank'>"; ?>
					<img src="picture/pdf.gif" width="16" height="16" border="0" alt=""></a>
					<? print "<a href='report_real_receipt_excel.php?year=".$year."' target='_blank'>"; ?>
					<img src="picture/excel.gif" width="16" height="16" border="0" alt=""></a>
			</td>
</tr>
<?
	}
?>
<tr>
         <td>
		 		<table width="100%" border="1" cellspacing="0" bordercolor="#000000">
        			<tr> 
          				<td bgcolor="#FF6600"> 
						  <div align="center"> 
						  	<p align="center" class="font1">รายการรายรับจริง ประจำปี <? print $year ?></ p>
						</td>
        			</tr>
      			</table>
		 </td>
</tr>
<tr>
      <td>
		<table width="100%" border="0" cellspacing="1" class="font1">
        	<tr> 
        	  	<td width="51%"></td>
        	  	<td width="11%" align="center"><b>เงินงบประมาณ</b></td>
        	  	<td width="11%" align="center"><b>เงินรายได้</b></td>
        	  	<td width="11%" align="center"><b>รวมทั้งสิ้น</b></td>
				<td width="12%" align="center"><b>อ้างอิง</b></td>
				<? if(isset($mode)) { ?>
				<td width="4%">&nbsp;</td>						
				<? } ?>
        	</tr>
        	
        	
        	
        	<!-- *********************************** เงินงบประมาณที่รัฐบาลจัดให้ ************************************************** -->
        	
        	<?
        			$str_money_gov = "select * from money_type_receipt where id = any (select money_type_receipt_id from real_receipt where money_type_receipt_id = '42000' and year = '".$year."')";
					$ret_money_gov = database_query($str_money_gov);
					if(mysql_num_rows($ret_money_gov) != 0) {
						$object_money_gov = mysql_fetch_array($ret_money_gov);		
						$object_money_gov_txt = mysql_fetch_array(database_query("select * from real_receipt where money_type_receipt_id = '42000' and year = '".$year."' "));				
        	?>
        			<tr>
        				<!-- column 1 -->
        				<td bgcolor="#FFC184"><? print "<b>" . $object_money_gov["MONEY_TYPE_RECEIPT"] . "</b>"; ?></td>
        				<!-- column 2 -->
        				<td  align="right" bgcolor="#FFC184">
        					<?
        							$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
									print "<b>" . number_format($amount_gov[0]) . "</b>";
        					?>
        				</td>
        				<!-- column 3 -->
        				<td bgcolor="#FFC184"></td>
        				<!-- column 4 -->
        				<td  align="right" bgcolor="#FFC184"><? print "<b>" . number_format($amount_gov[0]) . "</b>"; ?></td>
        				<td  align="center" bgcolor="#FFC184"><? print $object_money_gov_txt["REF_DOCUMENT"]; ?></td>
        				<? if(isset($mode)) { ?>
        				<!-- column 5 -->
        	  			<td width="4%" bgcolor="#FFC184">
        	  					<? 
	    									print "<a href='form_edit_list_real_receipt.php?id=".$object_money_gov_txt["ID"]."'>"; 
	    						?>
											<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
											</a>
								<? 
											print "<a href='process_edit_delete_list.php?mode=delete&table_name=real_receipt&year=".$year."&id=".$object_money_gov_txt["ID"]."'>"; 
								?>
											<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
											</a>
        	  			</td>        	  		
          			<? } ?>
          		</tr>
        	<?
        			} // end if of money_gov        			
        	?>
        	
        	
        	
        	<!-- *********************************** เงินรายได้สถาบัน ************************************************** -->
        	<?
        			$str_money_ins = "select * from money_type_receipt where id = any (select money_type_receipt_id from real_receipt where money_type_receipt_id = '43000' and year = '".$year."')";
					//print $str_money_ins;
					$ret_money_ins = database_query($str_money_ins);
					if(mysql_num_rows($ret_money_ins) != 0) {
						$object_money_ins = mysql_fetch_array($ret_money_ins);						
        	?>
        			<tr>
        	        	<!-- column 1 -->
        				<td bgcolor="#FFC184"><? print "<b>" . $object_money_ins["MONEY_TYPE_RECEIPT"] . "</b>"; ?></td>
        				<!-- column 2 -->
        				<td bgcolor="#FFC184"></td>
        				<!-- column 3 -->
        				<td  align="right" bgcolor="#FFC184">
        					<?
        							$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
									print "<b>" . number_format($amount_ins[0]) . "</b>";
        					?>
        				</td>
        				<!-- column 4 -->
        				<td  align="right" bgcolor="#FFC184"><? print "<b>" . number_format($amount_ins[0]) . "</b>"; ?></td>
        				<td bgcolor="#FFC184"></td>
        				<? if(isset($mode)) { ?>
        				<!-- column 5 -->
        	  			<td width="4%" bgcolor="#FFC184"></td>
          			<? } ?>
          		</tr>  
          		
          		
          		
          		
          		<!-- ************************************ ประจำเดือน ***************************************************** -->
          		<?
          				$str_receipt_month = "select * from real_receipt group by date order by date";
          				$ret_receipt_month = database_query($str_receipt_month);
          				while($object_receipt_month = mysql_fetch_array($ret_receipt_month)) {
          						$m = 0;
          						$chk = 1;
          						$i = 0;
          						while($chk) {
          								$s = $object_receipt_month["DATE"];
          								if($object_receipt_month["DATE"] != "") {
          										if($s[$i] != '/')
          												$m += $s[$i];
          										else
          												$chk = 0;
          										$i++;
          								}
          								else {
          										$chk = 0;
          								}
          						}
          						
          						$month = array(1=>"มกราคม",2=>"กุมภาพันธ์",3=>"มีนาคม",4=>"เมษายน",5=>"พฤษภาคม",6=>"มิถุนายน",7=>"กรกฏาคม",8=>"สิงหาคม",9=>"กันยายน",10=>"ตุลาคม",11=>"พฤศจิกายน",12=>"ธันวาคม",);

									if($object_receipt_month["DATE"] != "") {
          		?>
          		
          							<tr>
          								<td bgcolor="#FFD5AA"><? print "<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ประจำเดือน " . $month[$m]. "</b>"; ?></td>
          								<td bgcolor="#FFD5AA"></td>
          								<td bgcolor="#FFD5AA"  align="right">
          								<?
          										$amount_receipt_month = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and date = '".$object_receipt_month["DATE"]."' "));
													print "<b>" . number_format($amount_receipt_month[0]) . "</b>";
          								?>
          								</td>
          								<td bgcolor="#FFD5AA"  align="right"><? print "<b>" . number_format($amount_receipt_month[0]) . "</b>"; ?></td>
          								<td bgcolor="#FFD5AA"></td>
          								<? if(isset($mode)) { ?>
        									<!-- column 5 -->
        	  								<td bgcolor="#FFD5AA"></td>
          								<? } ?>
          							</tr>
          		
          		
          		
          		 				<!-- *********************************** เงินรายได้สถาบันส่วน Receipt Type ************************************************** -->     	
          		 
          		 				<?
          		 						$str_receipt_type = "select * from receipt_type where id = any".
          		 													"(select receipt_type_id from receipt_sub where id = any".
          		 														 "(select receipt_sub_id from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and date = '".$object_receipt_month["DATE"]."'))";
          		 						$ret_receipt_type = database_query($str_receipt_type);												           		 		
          		 						while($object_receipt_type = mysql_fetch_array($ret_receipt_type)) {
          		 				?>
          		 								<tr>
          		 										<!-- column 1 -->
          		 										<td bgcolor="#FFE3C1"> <? print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_receipt_type["RECEIPT_TYPE"]; ?> </td>
          		 										<!-- column 2 -->
          		 										<td bgcolor="#FFE3C1"></td>
          		 										<!-- column 3 -->
          		 										<td  align="right" bgcolor="#FFE3C1">
          		 										<?
          		 													$amount_receipt_type = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and date = '".$object_receipt_month["DATE"]."' and receipt_sub_id = any ".
																																										"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' )"));
																		print "<b>" . number_format($amount_receipt_type[0]) . "</b>";
          		 										?>
          		 										</td>
          		 										<!-- column 4 -->
          		 										<td  align="right" bgcolor="#FFE3C1"> <? print "<b>" . number_format($amount_receipt_type[0]) . "</b>"; ?> </td>
          		 										<td  bgcolor="#FFE3C1"></td>
          		 										<? if(isset($mode)) { ?>
        													<!-- column 5 -->
        	  												<td width="4%" bgcolor="#FFE3C1"></td>
          												<? } ?>
          		 								</tr>
          		 				
          		 				
          		 								<!-- *********************************** เงินรายได้สถาบันส่วน Receipt Sub ******************************************* -->          		 				
          		 								<?
          		 											$str_receipt_temp = "select * from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any ".
          		 																	"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' ) and date = '".$object_receipt_month["DATE"]."' order by receipt_sub_id";
          		 											$ret_receipt_temp = database_query($str_receipt_temp);
          		 											while($object_receipt_temp = mysql_fetch_array($ret_receipt_temp)) {          		 						
          		 														$object_receipt_sub = mysql_fetch_array(database_query("select * from receipt_sub where id = '".$object_receipt_temp["RECEIPT_SUB_ID"]."' "));
          		 								?>
          		 													<tr>
          		 															<!-- column 1 -->
          		 															<td bgcolor="#F2F2F2"> 
          		 															<?
          		 																 	print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_receipt_sub["RECEIPT_SUB"]; 
          		 														 			print "&nbsp;&nbsp;" . $object_receipt_temp["EXPAND1"];
          		 														 			if($object_receipt_temp["EXPAND2"] != "") {
          		 														 					print "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( " . $object_receipt_temp["EXPAND2"] . " )";
          		 														 			}
          		 															?> 
          		 															</td>
          		 															<!-- column 2 -->
          		 															<td bgcolor="#F2F2F2"></td>
          		 															<!-- column 3 -->
          		 															<td  align="right" bgcolor="#F2F2F2">
          		 															<?          		 												
																						print number_format($object_receipt_temp["AMOUNT"]);
          		 															?>
          		 															</td>
          		 															<!-- column 4 -->
          		 															<td  align="right" bgcolor="#F2F2F2"> <? print number_format($object_receipt_temp["AMOUNT"]); ?> </td>
          		 															<td  align="center" bgcolor="#F2F2F2"><? print $object_receipt_temp["REF_DOCUMENT"]; ?></td>
          		 															<? if(isset($mode)) { ?>
        																		<!-- column 5 -->
        	  																	<td bgcolor="#F2F2F2">
        	  																			<? 
	    																						print "<a href='form_edit_list_real_receipt.php?id=".$object_receipt_temp["ID"]."'>"; 
	    																				?>
																								<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
																								</a>
																						<? 
																								print "<a href='process_edit_delete_list.php?mode=delete&table_name=real_receipt&year=".$year."&id=".$object_receipt_temp["ID"]."'>"; 
																						?>
																								<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
																								</a>
        	  																	</td>
          																	<? } ?>
          		 													</tr>        		 				
          		 								<?
          		 										} // end of while receipt_sub
          		 								?>
          		 				<?
          		 							} // end of while receipt type
          		 				?>
        				<?
        								} // end if of month
        						} // end of month
        			} // end if of money ins
        	?>
     
        			<!--  ******************************** รวมรายรับทั้งสิ้น ****************************************** -->
        			<tr>
	    				<td>&nbsp;</td>
	    				<td></td>
	    				<td></td>
	    				<td></td>
	    				<td></td>
	    				<? if(isset($mode)) { ?>
	    				<td></td>
	    				<? } ?>
	    			</tr>
	    			
	    			
	    			<tr>
	    				<td bgcolor="#C1C1FF"><b>รวมรายรับทั้งสิ้น</b></td>
	    				<td bgcolor="#C1C1FF"  align="right">
	    					<?
	    							$amount_all_gov = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
									if($amount_all_gov[0] > 0)
									print "<b>" . number_format($amount_all_gov[0]) . "</b>";
	    					?>
	    				</td>
	    				<td bgcolor="#C1C1FF"  align="right">
	    					<?
	    							$amount_all_ins = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
									if($amount_all_ins[0] > 0)
									print "<b>" . number_format($amount_all_ins[0]) . "</b>";
	    					?>
	    				</td>
	    				<td bgcolor="#C1C1FF"  align="right">
	    					<?
	    							print "<b>" . number_format(($amount_all_gov[0] + $amount_all_ins[0])) . "</b>";
	    					?>
	    				</td>
	    				<td bgcolor="#C1C1FF"></td>
	    				<? if(isset($mode)) { ?>
	    				<td bgcolor="#C1C1FF"></td>
	    				<? } ?>
	    			</tr>
        	
      </table>    
      </td>   
</tr>
</table>

<?php
	end_head_html();
?>