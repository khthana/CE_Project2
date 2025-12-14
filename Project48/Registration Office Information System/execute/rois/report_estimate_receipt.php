<?php
	include('function.php');
	include('database.php');
	
	head_html("รายงานการประมาณการรายรับ");
	database_connect();
	
	function sum($str) {      
 		$ret_amount = database_query($str);
 		$object_amount = mysql_fetch_array($ret_amount);
 		return $object_amount[0];
	}	
	
	check_offier_program();
	
?>

<link rel="stylesheet" href="css/style.css" type="text/css" />

<table align="CENTER%" width="100%" cellspacing="15" border="0">
<?
	if(!isset($mode)) {
?>
<tr>
			<td>
					<? print "<a href='report_estimate_receipt_pdf.php?year=".$year."' target='_blank'>"; ?>
					<img src="picture/pdf.gif" width="16" height="16" border="0" alt="รายงาน PDF"></a>
					<? print "<a href='report_estimate_receipt_excel.php?year=".$year."' target='_blank'>"; ?>
					<img src="picture/excel.gif" width="16" height="16" border="0" alt="รายงาน Excel"></a>
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
						  	<p align="center" class="headTable">รายการการประมาณการรายรับ ประจำปีงบประมาณ <? print $year ?></ p>
						</td>
        			</tr>
      			</table>
		 </td>
</tr>
<tr>
      <td>
		<table width="100%" border="0" cellspacing="1" class="font1">
        	<tr> 
        	  	<td width="43%"></td>
        	  	<td width="11%" align="center" class="normalFont"><b>เงินงบประมาณ</b></td>
        	  	<td width="11%" align="center" class="normalFont"><b>เงินรายได้</b></td>
        	  	<td width="11%" align="center" class="normalFont"><b>รวมทั้งสิ้น</b></td>
        	  	<? if(isset($mode)) { ?>
        	  		<td width="4%"></td>
          	<? } ?>
        	</tr>
        	
        	
        	
        	<!-- *********************************** เงินงบประมาณที่รัฐบาลจัดให้ ************************************************** -->
        	
        	<?
        			$str_money_gov = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '42000' and year = '".$year."')";
					$ret_money_gov = database_query($str_money_gov);
					if(mysql_num_rows($ret_money_gov) != 0) {
						$object_money_gov = mysql_fetch_array($ret_money_gov);			
						$object_money_gov_txt = mysql_fetch_array(database_query("select * from estimate_receipt where money_type_receipt_id = '42000' and year = '".$year."' "));				
        	?>
        			<tr>
        				<!-- column 1 -->
        				<td bgcolor="#FFC184" class="normalFont"><? print "<b>" . $object_money_gov["MONEY_TYPE_RECEIPT"] . "</b>"; ?></td>
        				<!-- column 2 -->
        				<td  align="right" bgcolor="#FFC184" class="normalFont">
        					<?
        							$amount_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
									print "<b>" . number_format($amount_gov[0]) . "</b>";
        					?>
        				</td>
        				<!-- column 3 -->
        				<td bgcolor="#FFC184"></td>
        				<!-- column 4 -->
        				<td  align="right" bgcolor="#FFC184" class="normalFont"><? print "<b>" . number_format($amount_gov[0]) . "</b>"; ?></td>
        				<? if(isset($mode)) { ?>
        				<!-- column 5 -->
        	  			<td width="4%" bgcolor="#FFC184">
        	  					<? 
	    									print "<a href='form_edit_list_estimate_receipt.php?id=".$object_money_gov_txt["ID"]."'>"; 
	    						?>
											<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
											</a>
								<? 
											print "<a href='process_edit_delete_list.php?mode=delete&table_name=estimate_receipt&year=".$year."&id=".$object_money_gov_txt["ID"]."'>"; 
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
        			$str_money_ins = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '43000' and year = '".$year."')";
					$ret_money_ins = database_query($str_money_ins);
					if(mysql_num_rows($ret_money_gov) != 0) {
						$object_money_ins = mysql_fetch_array($ret_money_ins);						
        	?>
        			<tr>
        	        	<!-- column 1 -->
        				<td bgcolor="#FFC184" class="normalFont"><? print "<b>" . $object_money_ins["MONEY_TYPE_RECEIPT"] . "</b>"; ?></td>
        				<!-- column 2 -->
        				<td bgcolor="#FFC184" class="normalFont"></td>
        				<!-- column 3 -->
        				<td  align="right" bgcolor="#FFC184" class="normalFont">
        					<?
        							$amount_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
									print "<b>" . number_format($amount_ins[0]) . "</b>";
        					?>
        				</td>
        				<!-- column 4 -->
        				<td  align="right" bgcolor="#FFC184" class="normalFont"><? print "<b>" . number_format($amount_ins[0]) . "</b>"; ?></td>
        				<? if(isset($mode)) { ?>
        				<!-- column 5 -->
        	  			<td width="4%" bgcolor="#FFC184"></td>
          			<? } ?>
          		</tr>  
          		
          		
          		
          		 <!-- *********************************** เงินรายได้สถาบันส่วน Receipt Type ************************************************** -->     	
          		 
          		 <?
          		 		$str_receipt_type = "select * from receipt_type where id = any".
          		 													"(select receipt_type_id from receipt_sub where id = any".
          		 														 "(select receipt_sub_id from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'))";
          		 		$ret_receipt_type = database_query($str_receipt_type);												           		 		
          		 		while($object_receipt_type = mysql_fetch_array($ret_receipt_type)) {
          		 ?>
          		 				<tr>
          		 					<!-- column 1 -->
          		 					<td bgcolor="#FFE3C1" class="normalFont"> <? print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_receipt_type["RECEIPT_TYPE"]; ?> </td>
          		 					<!-- column 2 -->
          		 					<td bgcolor="#FFE3C1" class="normalFont"></td>
          		 					<!-- column 3 -->
          		 					<td  align="right" bgcolor="#FFE3C1" class="normalFont">
          		 						<?
          		 							$amount_receipt_type = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any ".
																																										"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' )"));
												print "<b>" . number_format($amount_receipt_type[0]) . "</b>";
          		 						?>
          		 					</td>
          		 					<!-- column 4 -->
          		 					<td  align="right" bgcolor="#FFE3C1" class="normalFont"> <? print "<b>" . number_format($amount_receipt_type[0]) . "</b>"; ?> </td>
          		 					<? if(isset($mode)) { ?>
        								<!-- column 5 -->
        	  							<td width="4%" bgcolor="#FFE3C1"></td>
          							<? } ?>
          		 				</tr>
          		 				
          		 				
          		 				<!-- *********************************** เงินรายได้สถาบันส่วน Receipt Sub ************************************************** -->
          		 				
          		 				<?
          		 						$str_receipt_temp = "select * from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any ".
          		 																	"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' ) order by receipt_sub_id";
          		 						$ret_receipt_temp = database_query($str_receipt_temp);
          		 						while($object_receipt_temp = mysql_fetch_array($ret_receipt_temp)) {          		 						
          		 								$object_receipt_sub = mysql_fetch_array(database_query("select * from receipt_sub where id = '".$object_receipt_temp["RECEIPT_SUB_ID"]."' "));
          		 				?>
          		 								<tr>
          		 										<!-- column 1 -->
          		 										<td bgcolor="#F2F2F2" class="normalFont"> 
          		 												<?
          		 														 print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_receipt_sub["RECEIPT_SUB"]; 
          		 														 print "&nbsp;&nbsp;" . $object_receipt_temp["EXPAND1"];
          		 														 if($object_receipt_temp["EXPAND2"] != "") {
          		 														 	print "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( " . $object_receipt_temp["EXPAND2"] . " )";
          		 														 }
          		 												?> 
          		 										</td>
          		 										<!-- column 2 -->
          		 										<td bgcolor="#F2F2F2" class="normalFont"></td>
          		 										<!-- column 3 -->
          		 										<td  align="right" bgcolor="#F2F2F2" class="normalFont">
          		 											<?          		 												
																	print number_format($object_receipt_temp["AMOUNT"]);
          		 											?>
          		 										</td>
          		 										<!-- column 4 -->
          		 										<td  align="right" bgcolor="#F2F2F2" class="normalFont"> <? print number_format($object_receipt_temp["AMOUNT"]); ?> </td>
          		 										<? if(isset($mode)) { ?>
        													<!-- column 5 -->
        	  												<td bgcolor="#F2F2F2">
        	  														<? 
	    																	print "<a href='form_edit_list_estimate_receipt.php?id=".$object_receipt_temp["ID"]."'>"; 
	    															?>
																			<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
																			</a>
																	<? 
																			print "<a href='process_edit_delete_list.php?mode=delete&table_name=estimate_receipt&year=".$year."&id=".$object_receipt_temp["ID"]."'>"; 
																	?>
																			<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
																			</a>
          												<? } ?>
          		 								</tr>        		 				
          		 				<?
          		 						} // end of while receipt_sub
          		 				?>
          		 <?
          		 		} // end of while receipt type
          		 ?>
        	<?
        			} // end if of money ins
        	?>
     
        			<!--  ******************************** รวมรายรับทั้งสิ้น ****************************************** -->
        			<tr>
	    				<td>&nbsp;</td>
	    				<td></td>
	    				<td></td>
	    				<td></td>
	    				<? if(isset($mode)) { ?>
	    				<td></td>
	    				<? } ?>
	    			</tr>
	    			
	    			
	    			<tr>
	    				<td bgcolor="#C1C1FF" class="normalFont"><b>รวมรายรับทั้งสิ้น</b></td>
	    				<td bgcolor="#C1C1FF"  align="right" class="normalFont">
	    					<?
	    							$amount_all_gov = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
									print "<b>" . number_format($amount_all_gov[0]) . "</b>";
	    					?>
	    				</td>
	    				<td bgcolor="#C1C1FF"  align="right" class="normalFont">
	    					<?
	    							$amount_all_ins = mysql_fetch_array(database_query("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
									print "<b>" . number_format($amount_all_ins[0]) . "</b>";
	    					?>
	    				</td>
	    				<td bgcolor="#C1C1FF"  align="right" class="normalFont">
	    					<?
	    							print "<b>" . number_format(($amount_all_gov[0] + $amount_all_ins[0])) . "</b>";
	    					?>
	    				</td>
	    				<? if(isset($mode)) { ?>	    				
	    							<td bgcolor="#C1C1FF"></td>
	    				</td>
	    				<? } ?>
	    			</tr>
        	
      </table>    
      </td>   
</tr>
</table>

<?php
	end_head_html();
?>