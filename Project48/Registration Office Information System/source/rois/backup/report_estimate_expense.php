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
?>

<table align="CENTER%" width="100%" cellspacing="15" border="0">
<tr>
         <td>
		 		<table width="100%" border="1" cellspacing="0" bordercolor="#000000">
        			<tr> 
          				<td bgcolor="#FF6600"> 
						  <div align="center"> 
						  	<p class="font1">รายงานการประมาณการรายจ่าย ประจำปีงบประมาณ <?php print $year ?> <br>สำนัทะเบียนและประมวลผล</p>
						  </div>
						</td>
        			</tr>
      			</table>
		 </td>
</tr>
<tr>
         <td>
		 		<table width="100%" border="0" cellspacing="1" class="font1">
        			<tr> 
          				<td width="46%"> 
							&nbsp;
						</td>
          				<td width="20%"> 
							&nbsp; 
						</td>
          				<td  width="12%">  
							<div align="center">เงินงบประมาณ</div>	  
						</td>
          				<td width="11%"> 
							<div align="center">เงินรายได้</div>
						</td>
          				<td width="11%"> 
							<div align="center">รวมทั้งสิ้น</div>
						</td>
        			</tr>
        			<tr>
        				<td bgcolor="#FF8B3E">
    						<?php 
								$str_side = "select side from side where id = '".$side."'";
								$ret_side = database_query($str_side);
								$object_side = mysql_fetch_array($ret_side);
								print $object_side[0];
							?>
	       				</td>
        				<td bgcolor="#FF8B3E">
        					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    			<tr> 
                      				<td width="63%">รหัสบัญชี</td>
                      				<td width="37%"><?php print $side; ?></td>
                    			</tr>
                  			</table>
        				</td>        				
        				<td bgcolor="#FF8B3E">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where side_id = '".$side."' and year = '".$year."' and money_type_id = '1'");
        						print $amount1;
        					?>
							</p>
        				</td>
        				<td bgcolor="#FF8B3E">
							<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where side_id = '".$side."' and year = '".$year."' and money_type_id = '2'");
        						print $amount2;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FF8B3E">
        					<p align="right">
        					<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php 
					// sector					
					$str_sector = "select * from sector where id = any".
											"(select sector_id from program where id = any".
												 "(select program_id from project where id = any".
													    "(select project_id from estimate_expense where side_id = '".$side."' and year = '".$year."'))) ";
					$ret_sector = database_query($str_sector);
					while($object_sector = mysql_fetch_array($ret_sector)) {
					?>
        			<tr>
        				<td bgcolor="#FF8B00"> 	
							<?php print $object_sector[1]; ?>
	       				</td>
        				<td bgcolor="#FF8B00">
        					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    			<tr> 
                      				<td width="63%">รหัสบัญชี</td>
                      				<td width="37%"><?php print $object_sector[0]; ?></td>
                    			</tr>
                  			</table>
        				</td>        				
        				<td bgcolor="#FF8B00">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."')) and side_id = '".$side."' and year = '".$year."' and money_type_id = '1'");
        						print $amount1;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FF8B00">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."')) and side_id = '".$side."' and year = '".$year."' and money_type_id = '2'");
        						print $amount2;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FF8B00">
        					<p align="right">
        					<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php
        			// program					
					$str_program = "(select * from program where id = any".
												"(select program_id from project where id = any".
													  "(select project_id from estimate_expense where side_id = '".$side."' and year = '".$year."' ) and sector_id = '".$object_sector[0]."')) ";
					$ret_program = database_query($str_program);
					while($object_program = mysql_fetch_array($ret_program)) {
					?>
        			<tr>
        				<td bgcolor="#FF9F2B">
        					<?php print $object_program[1]; ?>
        				</td>
        				<td bgcolor="#FF9F2B">
        					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    			<tr> 
                      				<td width="63%">รหัสบัญชี</td>
                      				<td width="37%"><?php print $object_program[0]; ?></td>
                    			</tr>
                  			</table>
        				</td>
        				<td bgcolor="#FF9F2B">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."')) and side_id = '".$side."' and year = '".$year."' and money_type_id = '1'");
        						print $amount1;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FF9F2B">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."')) and side_id = '".$side."' and year = '".$year."' and money_type_id = '2'");
        						print $amount2;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FF9F2B">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php
        			// project					
					$str_project = "select * from project where id = any".
											"(select project_id from estimate_expense where side_id = '".$side."' and year = '".$year."') and program_id = '".$object_program[0]."' ";
					$ret_project = database_query($str_project); 
					while($object_project = mysql_fetch_array($ret_project)) {
					?>
        			<tr>
        				<td bgcolor="#FFB559">
        					<?php print $object_project[1]; ?>
        				</td>
        				<td bgcolor="#FFB559">
        					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    			<tr> 
                      				<td width="63%">รหัสบัญชี</td>
                      				<td width="37%"><?php print $object_project[0]; ?></td>
                    			</tr>
                  			</table>
        				</td>
        				<td bgcolor="#FFB559">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."') and id = '".$object_project[0]."') and side_id = '".$side."' and year = '".$year."' and money_type_id = '1'");
        						print $amount1;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FFB559">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."') and id = '".$object_project[0]."') and side_id = '".$side."' and year = '".$year."' and money_type_id = '2'");
        						print $amount2;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FFB559">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?
        			// activity					
					$str_activity = "select * from activity where id = any".
											"(select activity_id from estimate_expense where side_id = '".$side."' and year = '".$year."' and project_id = '".$object_project[0]."')";
					$ret_activity = database_query($str_activity); 
					while($object_activity = mysql_fetch_array($ret_activity)) {
					  if($object_activity[0] != '00') {
					?>
        			<tr>
        				<td bgcolor="#FFC782">
        					<?php print $object_activity[1]; ?>
        				</td>
        				<td bgcolor="#FFC782">
        					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    			<tr> 
                      				<td width="63%">รหัสบัญชี</td>
                      				<td width="37%"><?php print $object_activity[0]; ?></td>
                    			</tr>
                  			</table>
        				</td>
        				<td bgcolor="#FFC782">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."') and id = '".$object_project[0]."') and side_id = '".$side."' and year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity[0]."'");
        						print $amount1;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FFC782">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."') and id = '".$object_project[0]."') and side_id = '".$side."' and year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity[0]."'");
        						print $amount2;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FFC782">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php
        			}
        			// fund					
					$str_fund = "select * from fund where id = any".
											"(select fund_id from estimate_expense where side_id = '".$side."' and year = '".$year."' and activity_id = '".$object_activity[0]."')";
					$ret_fund = database_query($str_fund);
					while($object_fund = mysql_fetch_array($ret_fund)) {
					?>
        			<tr>
        				<td bgcolor="#FFE3C1">
        					<?php print $object_fund[1]; ?>
        				</td>
        				<td bgcolor="#FFE3C1">
        					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    			<tr> 
                      				<td width="63%">รหัสบัญชี</td>
                      				<td width="37%"><?php print $object_fund[0]; ?></td>
                    			</tr>
                  			</table>
        				</td>
        				<td bgcolor="#FFE3C1">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."') and id = '".$object_project[0]."') and side_id = '".$side."' and year = '".$year."' and money_type_id = '1' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."'");
        						print $amount1;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FFE3C1">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where project_id = any (select id from project where program_id = any (select id from program where sector_id = '".$object_sector[0]."' and id = '".$object_program[0]."') and id = '".$object_project[0]."') and side_id = '".$side."' and year = '".$year."' and money_type_id = '2' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."'");
        						print $amount2;
        					?>
        					</p>
        				</td>
        				<td bgcolor="#FFE3C1">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php
        			//account					
					$str_account = "select * from account where id = any".
											"(select account_id from expense_type where id = any".
												"(select expense_type_id from expense_sub where id = any".
													"(select expense_sub_id from estimate_expense where side_id = '".$side."' and year = '".$year."' and fund_id = '".$object_fund[0]."')))";
					$ret_account = database_query($str_account);
					while($object_account = mysql_fetch_array($ret_account)) {
					?>
        			<tr>
        				<td bgcolor="#D8D8D8">
        					<?php "&nbsp;&nbsp;&nbsp;&nbsp;" . print $object_account[1]; ?>
        				</td>
        				<td bgcolor="#D8D8D8">        					
        				</td>
        				<td bgcolor="#D8D8D8">  
							<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where expense_sub_id = any (select id from expense_sub where expense_type_id = any (select id from expense_type where account_id = '".$object_account[0]."')) and side_id = '".$side."' and project_id = '".$object_project[0]."' and fund_id = '".$object_fund[0]."' and year = '".$year."' and money_type_id = '1'");
        						print $amount1;        						
        					?>
        					</p>      					
        				</td>
        				<td bgcolor="#D8D8D8">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where expense_sub_id = any (select id from expense_sub where expense_type_id = any (select id from expense_type where account_id = '".$object_account[0]."')) and side_id = '".$side."' and project_id = '".$object_project[0]."' and fund_id = '".$object_fund[0]."' and year = '".$year."' and money_type_id = '2'");
        						print $amount2;        					
        					?>
        					</p>
        				</td>
        				<td bgcolor="#D8D8D8">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php
        			// expense type					
					$str_expense_type = "select * from expense_type where id = any".
											"(select expense_type_id from expense_sub where id = any".
												"(select expense_sub_id from estimate_expense where side_id = '".$side."' and year = '".$year."')) and account_id = '".$object_account[0]."'";
					$ret_expense_type = database_query($str_expense_type);					
					while($object_expense_type = mysql_fetch_array($ret_expense_type)) {
						$ret_temp = database_query("select * from estimate_expense where expense_sub_id = any".
										"(select id from expense_sub where expense_type_id ='".$object_expense_type[0]."') and side_id = '".$side."' and fund_id = '".$object_fund[0]."'");
						if(mysql_num_rows($ret_temp)) {
						  if($object_expense_type[0] != '55100') {
					?>
        			<tr>
        				<td bgcolor="#E6E6E6">
        					<?php print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_expense_type[1]; ?>
        				</td>
        				<td bgcolor="#E6E6E6">
        				</td>
        				<td bgcolor="#E6E6E6">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where expense_sub_id = any (select id from expense_sub where expense_type_id = '".$object_expense_type[0]."') and side_id = '".$side."' and year = '".$year."' and project_id = '".$object_project[0]."' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."' and money_type_id = '1'");
        						print $amount1;        						
        					?>
        					</p>
        				</td>
        				<td bgcolor="#E6E6E6">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where expense_sub_id = any (select id from expense_sub where expense_type_id = '".$object_expense_type[0]."') and side_id = '".$side."' and year = '".$year."' and project_id = '".$object_project[0]."' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."' and money_type_id = '2'");
        						print $amount2;        						
        					?>
        					</p>
        				</td>
        				<td bgcolor="#E6E6E6">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php
        			}
        			// expense sub
        			$temp;        			
					$str_expense_sub = "select expense_sub_id , expand from estimate_expense where side_id = '".$side."' and year = '".$year."' and project_id = '".$object_project[0]."' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."' and expense_sub_id = any "."(select id from expense_sub where expense_type_id = '".$object_expense_type[0]."') order by expense_sub_id";
					$ret_expense_sub = database_query($str_expense_sub);
					while($object_expense_sub = mysql_fetch_array($ret_expense_sub)) {
						$d = "select * from expense_sub where id = '".$object_expense_sub[0]."'";
						$ret_a = database_query($d);
						$object_ar = mysql_fetch_array($ret_a);
						if($temp != $object_ar[0]) {
					?>
        			<tr>
        				<td bgcolor="#F2F2F2">
        					<?php 
								print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_ar[1] . "&nbsp;&nbsp;" . $object_expense_sub[1];  
							?>
        				</td>        				
        				<td bgcolor="#F2F2F2">
        					<?php
        					if($object_account[0] == '51000') {
        					?>
        						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1">
                    				<tr> 
                      					<td width="20%"><?php print sum("select count(*) from estimate_expense where side_id = '".$side."' and year = '".$year."' and money_type_id = '2' and project_id = '".$object_project[0]."' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."' and expense_sub_id = '".$object_expense_sub[0]."'") ?></td>
                      					<td width="80%">อัตรา</td>
                    				</tr>
                  				</table>
                  			<?php
                  			}
                  			?>
        				</td>
        				<td bgcolor="#F2F2F2">
        					<p align="right">
        					<?php
        						$amount1 = sum("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub[0]."' and side_id = '".$side."' and year = '".$year."' and project_id = '".$object_project[0]."' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."' and money_type_id = '1'");
        						print $amount1;        						
        					?>
        					</p>
        				</td>
        				<td bgcolor="#F2F2F2">
        					<p align="right">
        					<?php
        						$amount2 = sum("select sum(amount) from estimate_expense where expense_sub_id = '".$object_expense_sub[0]."' and side_id = '".$side."' and year = '".$year."' and project_id = '".$object_project[0]."' and activity_id = '".$object_activity[0]."' and fund_id = '".$object_fund[0]."' and money_type_id = '2'");
        						print $amount2;        						
        					?>
        					</p>
        				</td>
        				<td bgcolor="#F2F2F2">
        					<p align="right">
							<?php
        						print ($amount1 + $amount2);
        					?>
							</p>
        				</td>
        			</tr>
        			<?php 
        			} // end if expense sub
        			$temp = $object_ar[0];
        			} // end expense sub
        			$temp = 0;
        			} // end if
        			} // end expense type
        			} // end account
        			?>
        			<tr>
        				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
        			</tr>
        			<?php
        			} // end fund 
					} // end activity 
					} // end project 
        			} // end program
					} // end side 
					?>
      			</table>
		 </td>
</tr>
</table>

<?php
	end_head_html();
?>