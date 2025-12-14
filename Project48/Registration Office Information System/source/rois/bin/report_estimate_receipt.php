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
?>

<table align="CENTER%" width="100%" cellspacing="15" border="0">
<tr>
         <td>
		 		<table width="100%" border="1" cellspacing="0" bordercolor="#000000">
        			<tr> 
          				<td bgcolor="#FF6600"> 
						  <div align="center"> 
						  	<p align="center" class="font1">รายการการประมาณการรายรับ ประจำปีงบประมาณ <? print $year ?></ p>
						</td>
        			</tr>
      			</table>
		 </td>
</tr>
<tr>
        <td>
		<table width="100%" border="0" cellspacing="1" class="font1">
        <tr> 
          <td width="43%">&nbsp; </td>
          <td  width="11%"> <div align="center">เงินงบประมาณ</div></td>
          <td width="11%"> <div align="center">เงินรายได้</div></td>
          <td width="11%"> <div align="center">รวมทั้งสิ้น</div></td>
          <? if(isset($mode)) { ?>
          	<td width="4%"></td>
          <? } ?>
        </tr>
      <?php  
		$str_money1 = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '41000' and year = '".$year."')";
		$ret_money1 = database_query($str_money1);
		$object_money1 = mysql_fetch_array($ret_money1); 
		if(mysql_num_rows($ret_money1) != 0){				
		?>
        <tr> 
          <td bgcolor="#FF8B3E"> <?php print $object_money1[1]; ?> </td>
          <td bgcolor="#FF8B3E"> 
		  	<p align="right"> 
			  <?php 
			  	$amount1 = sum("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '41000'") ;
			  	print $amount1;
			  ?> 
			</p>
		  </td>
          <td bgcolor="#FF8B3E"> <p align="right">  </p></td>
          <td bgcolor="#FF8B3E"> <p align="right"> <?php print $amount1; ?> </p></td>
          <? if(isset($mode)) { ?>
          <td bgcolor="#FF8B3E">
          	<? 
          		$t = "select id from estimate_receipt where year = '".$year."' and money_type_receipt_id = '41000'";
          		//print $t;
	    			print "<a href='process_edit_delete_list.php?mode=edit&table_name=estimate_receipt&id=".sum($t)."'>"; ?>
					<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
					</a>
				<? 
					print "<a href='process_edit_delete_list.php?mode=delete&table_name=estimate_receipt&year=".$year."&id=".sum($t)."'>"; ?>
					<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
					</a>
	    		</td>
	    		<? } ?>
          </td>
        </tr>
		<?php
		}
	    ?>  
		
		<?php 
		//////////////////////////// เงินงบประมาณที่รัฐบาลจัดสารรให้ /////////////////////////////////// 
		$str_money2 = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '42000' and year = '".$year."')";
		$ret_money2 = database_query($str_money2);
		$object_money2 = mysql_fetch_array($ret_money2); 
		if(mysql_num_rows($ret_money2) != 0){				
		?>
        <tr> 
          <td bgcolor="#FF8B3E"> <?php print $object_money2[1]; ?> </td>
          <td bgcolor="#FF8B3E"> 
		  	<p align="right"> 
			  <?php 
			  	$amount1 = sum("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'") ;
			  	print $amount1;
			  ?> 
			</p>
		  </td>
          <td bgcolor="#FF8B3E"> <p align="right">  </p></td>
          <td bgcolor="#FF8B3E"> <p align="right"> <?php print $amount1; ?> </p></td>
          <? if(isset($mode)) { ?>
          <td bgcolor="#FF8B3E">
          	<? 
          		$t = "select id from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'";
	    			print "<a href='form_edit_list_estimate_receipt.php?id=".sum($t)."'>"; ?>
					<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
					</a>
				<? 
					print "<a href='process_edit_delete_list.php?mode=delete&table_name=estimate_receipt&year=".$year."&id=".sum($t)."'>"; ?>
					<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
					</a>
	    		</td>
	    		<? } ?>
          </td>
        </tr>
		<?php
		}
	    ?>   	    
	    
	    <?php 
		//////////////////////////// เงินรายได้ /////////////////////////////////// 
		$str_money3 = "select * from money_type_receipt where id = any (select money_type_receipt_id from estimate_receipt where money_type_receipt_id = '43000' and year = '".$year."')";
		$ret_money3 = database_query($str_money3);
		$object_money3 = mysql_fetch_array($ret_money3); 
		if(mysql_num_rows($ret_money3) != 0){				
		?>
        <tr> 
          <td bgcolor="#FF8B3E"> <?php print $object_money3[1]; ?> </td>
          <td bgcolor="#FF8B3E"> </td>
          <td bgcolor="#FF8B3E"> 
		  	<p align="right"> 
			  <?php 
			  	$amount1 = sum("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'") ;
			  	print $amount1;
			  ?> 
			</p>
		  </td>          
          <td bgcolor="#FF8B3E"> <p align="right"> <?php print $amount1; ?> </p></td>
          <? if(isset($mode)) { ?>
          <td bgcolor="#FF8B3E">&nbsp;</td>
          <? } ?>
        </tr>
		<?php
		// type money3
		$str_money3_type = "select * from receipt_type where id = any (select receipt_type_id from receipt_sub where id = any (select receipt_sub_id from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'))";
		$ret_money3_type = database_query($str_money3_type);
		while($object_money3_type = mysql_fetch_array($ret_money3_type)) {
		?>
			<tr>
	    		<td bgcolor="#FFE3C1"> <?php print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_money3_type[1]; ?> </td>
	    		<td bgcolor="#FFE3C1"></td>
	    		<td bgcolor="#FFE3C1">
					<p align="right"> 
			  		<?php 
			  			$amount1 = sum("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any (select id from receipt_sub where receipt_type_id = '".$object_money3_type[0]."')") ;
			  			print $amount1;
			  		?> 
					</p>
				</td>
	    		<td bgcolor="#FFE3C1"><p align="right"><?php print $amount1; ?></p></td>
	    		<? if(isset($mode)) { ?>
	    		<td bgcolor="#FFE3C1">&nbsp;</td>
	    		<? } ?>
	    	</tr>
	    <?php
	    // sub money3
		$str_money3_sub = "select * from estimate_receipt where year = ".$year." and receipt_sub_id = any (select id from receipt_sub where receipt_type_id = '".$object_money3_type[0]."')";
		$ret_money3_sub = database_query($str_money3_sub);
		while($object_money3_sub = mysql_fetch_array($ret_money3_sub)) {
			$ret_temp = database_query("select * from receipt_sub where id = '".$object_money3_sub[3]."'");			
			$object_temp = mysql_fetch_array($ret_temp);
	    ?>
	    	<tr>
	    		<td bgcolor="#F2F2F2"> <?php print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $object_temp[1] . "&nbsp;&nbsp;" . $object_money3_sub[4];
				if($object_money3_sub[5] != '') {
					print "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(" . $object_money3_sub[5] . ")"; } ?> </td>
	    		<td bgcolor="#F2F2F2"></td>
	    		<td bgcolor="#F2F2F2">
					<p align="right"> 
			  		<?php 
			  			$amount1 = sum("select amount from estimate_receipt where receipt_sub_id = '".$object_money3_sub[3]."'") ;
			  			print $amount1;
			  		?> 
					</p>
				</td>
	    		<td bgcolor="#F2F2F2"><p align="right"><?php print $amount1; ?></p></td>
	    		<? if(isset($mode)) { ?>
	    		<td bgcolor="#F2F2F2">
	    			<? 
	    			print "<a href='form_edit_list_estimate_receipt.php?id=".$object_money3_sub[0]."'>"; ?>
					<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไข้ข้อมูล">
					</a>
				<? 
					print "<a href='process_edit_delete_list.php?mode=delete&table_name=estimate_receipt&year=".$year."&id=".$object_money3_sub[0]."'>"; ?>
					<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมููล">
					</a>
	    		</td>
	    		<? } ?>
	    	</tr>	    
		<?php
		} // end loop money3 sub		
		} // end loop money3 type
		} // end if
	    ?> 
	    
	    <tr>
	    	<td bgcolor="#F2F2F2">&nbsp;</td>
	    	<td bgcolor="#F2F2F2">&nbsp;</td>
	    	<td bgcolor="#F2F2F2">&nbsp;</td>
	    	<td bgcolor="#F2F2F2">&nbsp;</td>
	    	<? if(isset($mode)) { ?>
	    	<td bgcolor="#F2F2F2">&nbsp;</td>
	    	<? } ?>
	    </tr>
	    
	    <tr>
	    	<td bgcolor="#FF8B3E">รวมรายรับทั้งสิ้น</td>
	    	<td bgcolor="#FF8B3E">
				<p align="right">
				<?php
					$amount1 = sum("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '42000'") ;
			  		print $amount1;				
				?>
				</p>
			</td>
	    	<td bgcolor="#FF8B3E">
				<p align="right">
				<?php
					$amount2 = sum("select sum(amount) from estimate_receipt where year = '".$year."' and money_type_receipt_id = '43000'") ;
			  		print $amount2;				
				?>
				</p>
			</td>
	    	<td bgcolor="#FF8B3E"><p align="right"><?php print ($amount1 + $amount2) ?></p></td>
	    	<? if(isset($mode)) { ?>
	    	<td bgcolor="#FF8B3E"></td>
	    	<? } ?>
	    </tr>	    
	    
	    </table>
		</td>
</tr>
</table>

<?php
	end_head_html();
?>