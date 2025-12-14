<?php
	include("function.php");
	include("database.php");
	
	head_html("แก้ไข ลบ ข้อมูล");
	database_connect();
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if($mode == "edit") {
		//******************** real expense **********************
		if($select == "real_expense") {
			$date = $day . "/" . $month . "/" . $dyear;
			$str = "UPDATE `real_expense` SET `YEAR` = '".$year."',`MONEY_TYPE_ID` = '".$money_type."',`SIDE_ID` = '".$side."', `PROJECT_ID`= '".$project."' ,`ACTIVITY_ID` = '".$activity."',`ACTIVITY_SUB_ID` = '".$activity_sub."',`FUND_ID` = '".$fund."',`EXPENSE_SUB_ID` = '".$expense_sub."',`EXPAND` = '".$expand."',`DATE` = '".$date."',`AMOUNT` = '".$amount."',`REF_DOCUMENT` = '".$ref."',`DESCRIPTION` = '".$description."' WHERE `ID` =".$id."";			
			//print $str;
			if(database_query($str)) 
				message_box("","แก้ไขรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_real_expense.php?mode=edit&year=".$year."&side=".$side."");
			else
				message_box("","มีข้อผิดพลาดในการลบรายการนี้ กรุณากลับไปตรวจสอบใหม่","่javascript:history.back()");
		}
		//******************** estimate expense **********************
		else if($select == "estimate_expense") {
			$str = "UPDATE `estimate_expense` SET `YEAR` = '".$year."',`MONEY_TYPE_ID` = '".$money_type."',`SIDE_ID` = '".$side."',`PROJECT_ID` = '".$project."',`ACTIVITY_ID` = '".$activity."',`FUND_ID` = '".$fund."',`EXPENSE_SUB_ID` = '".$expense_sub."',`EXPAND` = '".$expand."',`AMOUNT` = '".$amount."',`DESCRIPTION` = '".$description."' WHERE `ID` = ".$id."";
			if(database_query($str)) 
				message_box("","แก้ไขรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_estimate_expense.php?mode=edit&year=".$year."&side=".$side."");
			else
				message_box("","มีข้อผิดพลาดในการลบรายการนี้ กรุณากลับไปตรวจสอบใหม่","่javascript:history.back()");
		}
		//******************** estimate receipt **********************
		else if($select == "estimate_receipt") {
			$str;
			if($money_type_receipt == "42000") {
				$str = "update `estimate_receipt` SET `YEAR` = '".$year."',`MONEY_TYPE_RECEIPT_ID` = '".$money_type_receipt."',`RECEIPT_SUB_ID` = NULL ,`AMOUNT` = '".$amount."' ,`DESCRIPTION` = '".$description."' WHERE `ID` = ".$id."";
			}
			else if($money_type_receipt == "43000") {
				$str = "update `estimate_receipt` SET `YEAR` = '".$year."',`MONEY_TYPE_RECEIPT_ID` = '".$money_type_receipt."',`RECEIPT_SUB_ID` = '".$receipt_sub."',`EXPAND1` = '".$expand1."',`EXPAND2` = '".$expand2."',`AMOUNT` = '".$amount."' , `DESCRIPTION` = '".$description."' WHERE `ID` = ".$id."";
			}
			if(database_query($str))
				message_box("","แก้ไขรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_estimate_receipt.php?mode=edit&year=".$year."");			
			else
				message_box("","มีข้อผิดพลาดในการลบรายการนี้ กรุณากลับไปตรวจสอบใหม่","่javascript:history.back()");
		}
		//******************* real receipt ***********************
		else if($select == "real_receipt") {			
			$str;
			if($money_type_receipt == "42000") {
				$str = "update `real_receipt` SET `YEAR` = '".$year."',`MONEY_TYPE_RECEIPT_ID` = '".$money_type_receipt."',`RECEIPT_SUB_ID` = NULL ,`AMOUNT` = '".$amount."' ,`REF_DOCUMENT` = '".$ref."' ,`DESCRIPTION` = '".$description."' WHERE `ID` = ".$id."";
			}
			else if($money_type_receipt == "43000") {
				$date = $month . "/" . $dyear;
				$str = "update `real_receipt` SET `YEAR` = '".$year."',`MONEY_TYPE_RECEIPT_ID` = '".$money_type_receipt."',`RECEIPT_SUB_ID` = '".$receipt_sub."',`EXPAND1` = '".$expand1."',`EXPAND2` = '".$expand2."' ,`DATE` = '".$date."' ,`AMOUNT` = '".$amount."' ,`REF_DOCUMENT` = '".$ref."' ,`DESCRIPTION` = '".$description."' WHERE `ID` = ".$id."";
			}
			if(database_query($str))
				message_box("","แก้ไขรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_real_receipt.php?mode=edit&year=".$year."");			
			else
				message_box("","มีข้อผิดพลาดในการลบรายการนี้ กรุณากลับไปตรวจสอบใหม่","่javascript:history.back()");
		}
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////
	else if($mode == "delete") {
		$str = "delete from ".$table_name." where id = ".$id."";
		if(database_query($str)) {
			if($table_name == "estimate_expense")
				message_box("","ลบรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_estimate_expense.php?mode=edit&year=".$year."&side=".$side."");			
			else if($table_name == "estimate_receipt")
				message_box("","ลบรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_estimate_receipt.php?mode=edit&year=".$year."");			
			else if($table_name == "real_expense")
				message_box("","ลบรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_real_expense.php?mode=edit&year=".$year."&side=".$side."");			
			else if($table_name == "real_receipt")
				message_box("","ลบรายการนี้ในฐานข้อมูลเรียบร้อยแล้ว","report_real_receipt.php?mode=edit&year=".$year."");	
		}
		else {
			message_box("","มีข้อผิดพลาดในการลบรายการนี้ กรุณากลับไปตรวจสอบใหม่","่javascript:history.back()");
		}
	}
	
	end_head_html();
?>