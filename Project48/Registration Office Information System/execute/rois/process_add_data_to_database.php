<?php

	include('function.php');
	include('database.php');
	
	database_connect();

	function estimate_receipt_the_estimate($year,$amount,$description) {
			$str = "INSERT INTO `estimate_receipt` ( `ID` , `YEAR` , `MONEY_TYPE_RECEIPT_ID` , `RECEIPT_SUB_ID` , `AMOUNT` , `DESCRIPTION` ) VALUES ('', '".$year."', '42000', NULL , '".$amount."', '".$description."');";
			//print $str;			
			$ret = database_query($str);
			//database_close($ret);
			if($ret) {
				message_box("","เพิ่มข้อมูลลงในฐานข้อมูลเรียนร้อยแล้ว หากต้องการเพิ่มข้อมูลที่มีโครงสร้างเหมือนเดิม คลิ๊กด้านล่างเพื่อกลับหน้าเดิม","javascript:history.back()");
			}
			else {
				message_box("","มีข้อผิดพลาดขึ้นในการจัดเก็บกรุณาตรวมสอบข้อมูลใหม่","javascript:history.back()");
			}
	}

	function estimate_receipt_money($year,$receipt_sub,$expand1,$expand2,$amount,$description) {
			$str = "INSERT INTO `estimate_receipt` ( `ID` , `YEAR` , `MONEY_TYPE_RECEIPT_ID` , `RECEIPT_SUB_ID` , `EXPAND1` , `EXPAND2` , `AMOUNT` , `DESCRIPTION` ) VALUES ('', '".$year."', '43000', '".$receipt_sub."' , '".$expand1."' , '".$expand2."' , '".$amount."', '".$description."');";
			//print $str;
			$ret = database_query($str);
			//database_close($ret);
			if($ret) {
				message_box("","เพิ่มข้อมูลลงในฐานข้อมูลเรียนร้อยแล้ว หากต้องการเพิ่มข้อมูลที่มีโครงสร้างเหมือนเดิม คลิ๊กด้านล่างเพื่อกลับหน้าเดิม","javascript:history.back()");
			}
			else {
				message_box("","มีข้อผิดพลาดขึ้นในการจัดเก็บกรุณาตรวมสอบข้อมูลใหม่","javascript:history.back()");
			}
	}

	function estimate_expense($year,$side,$money_type,$project,$activity,$fund,$expense_sub,$enpand,$amount,$description) {
			$str = "INSERT INTO `estimate_expense` ( `ID` , `YEAR` , `MONEY_TYPE_ID` , `SIDE_ID` , `PROJECT_ID` , `ACTIVITY_ID` , `FUND_ID` , `EXPENSE_SUB_ID` , `EXPAND` , `AMOUNT` , `DESCRIPTION` ) VALUES ('', '".$year."', '".$money_type."' , '".$side."', '".$project."', '".$activity."', '".$fund."', '".$expense_sub."', '".$enpand."', '".$amount."', '".$description."');";		
			//print $str;
			$ret = database_query($str);
			//database_close($ret);
			if($ret) {
				message_box("","เพิ่มข้อมูลลงในฐานข้อมูลเรียนร้อยแล้ว หากต้องการเพิ่มข้อมูลที่มีโครงสร้างเหมือนเดิม คลิ๊กด้านล่างเพื่อกลับหน้าเดิม","javascript:history.back()");
			}
			else {
				message_box("","มีข้อผิดพลาดขึ้นในการจัดเก็บกรุณาตรวมสอบข้อมูลใหม่","javascript:history.back()");
			}
	}

	function real_receipt_the_eatimate($year,$date,$amount,$ref,$description) {
			$str = "INSERT INTO `real_receipt` ( `ID` , `YEAR` , `MONEY_TYPE_RECEIPT_ID` , `RECEIPT_SUB_ID` , `EXPAND1` , `EXPAND2` ,  `DATE` , `AMOUNT` , `REF_DOCUMENT` , `DESCRIPTION` ) VALUES ('', '".$year."', '42000',  NULL, '', '', '".$date."', '".$amount."', '".$ref."', '".$description."');";
			//print $str;
			$ret = database_query($str);
			//database_close($ret);
			if($ret) {
				message_box("","เพิ่มข้อมูลลงในฐานข้อมูลเรียนร้อยแล้ว หากต้องการเพิ่มข้อมูลที่มีโครงสร้างเหมือนเดิม คลิ๊กด้านล่างเพื่อกลับหน้าเดิม","javascript:history.back()");
			}
			else {
				message_box("","มีข้อผิดพลาดขึ้นในการจัดเก็บกรุณาตรวมสอบข้อมูลใหม่","javascript:history.back()");
			}
	}

	function real_receipt_money($year,$receipt_sub,$expand,$expand2,$date,$amount,$ref,$description) {
		$str = "INSERT INTO `real_receipt` ( `ID` , `YEAR` , `MONEY_TYPE_RECEIPT_ID` , `RECEIPT_SUB_ID` , `EXPAND1` , `EXPAND2` ,  `DATE` , `AMOUNT` , `REF_DOCUMENT` , `DESCRIPTION` ) VALUES ('', '".$year."', '43000', '".$receipt_sub."', '".$expand."', '".$expand2."', '".$date."', '".$amount."', '".$ref."', '".$description."');";
			//print $str;
			$ret = database_query($str);
			//database_close($ret);
			if($ret) {
				message_box("","เพิ่มข้อมูลลงในฐานข้อมูลเรียนร้อยแล้ว หากต้องการเพิ่มข้อมูลที่มีโครงสร้างเหมือนเดิม คลิ๊กด้านล่างเพื่อกลับหน้าเดิม","javascript:history.back()");
			}
			else {
				message_box("","มีข้อผิดพลาดขึ้นในการจัดเก็บกรุณาตรวมสอบข้อมูลใหม่","javascript:history.back()");
			}
	}

	function real_expense($year,$side,$money_type,$project,$activity,$activity_sub,$fund,$expense_sub,$enpand,$date,$amount,$ref,$description) {
		$str = "INSERT INTO `real_expense` ( `ID` , `YEAR` ,`MONEY_TYPE_ID` , `SIDE_ID` , `PROJECT_ID` , `ACTIVITY_ID` , `ACTIVITY_SUB_ID` , `FUND_ID` , `EXPENSE_SUB_ID` , `EXPAND` , `DATE` , `AMOUNT` , `REF_DOCUMENT` , `DESCRIPTION` ) VALUES ('', '".$year."' ,'".$money_type."', '".$side."', '".$project."', '".$activity."', '".$activity_sub."', '".$fund."', '".$expense_sub."', '".$enpand."', '".$date."', '".$amount."', '".$ref."', '".$description."');";
		//print $str;		
		$ret = database_query($str);
		//database_close($ret);
		if($ret) {
			message_box("","เพิ่มข้อมูลลงในฐานข้อมูลเรียนร้อยแล้ว หากต้องการเพิ่มข้อมูลที่มีโครงสร้างเหมือนเดิม คลิ๊กด้านล่างเพื่อกลับหน้าเดิม","javascript:history.back()");
		}
		else {
			message_box("","มีข้อผิดพลาดขึ้นในการจัดเก็บกรุณาตรวมสอบข้อมูลใหม่","javascript:history.back()");
		}
	}

	/*
	print $mode;
   print $year . "///";	
   print $side . "///";
   print $money_type . "///";
   print $project . "///";
   print $activity . "///";
   print $fund . "///";
   print $expense_sub . "///";
   print $expand . "///";
   print $amount . "///";
   print $description . "///";
   */

	// select hidden filed
	// ประมาณการรายรับ ส่วยของเงินงบประมาณ
	if($mode == "estimate_receipt1") {
		estimate_receipt_the_estimate($year,$amount,$description);
	}
	// ประมาณการราบรับ ส่วนของเงินรายได้สถาบัน
	else if($mode == "estimate_receipt2") {			
		estimate_receipt_money($year,$receipt_sub,$expand1,$expand2,$amount,$description);
	}
	// ประมาณการรายจ่าย 
	else if($mode == "estimate_expense") {
		estimate_expense($year,$side,$money_type,$project,$activity,$fund,$expense_sub,$expand,$amount,$description);
	}
	// รายรับจริง ในส่วนของเงินงบประมาณ
	else if($mode == "real_receipt1") {
		real_receipt_the_eatimate($year,$date,$amount,$ref,$description);
	}
	// รายรับจริง ในส่วนของเงินรายได้สถาบัน
	else if($mode == "real_receipt2") {
		if( (($year == $dyear)&&($month >= 10)) || (($year != $dyear)&&($month >=1 && $month <= 9)&&($dyear == ($year+1))) ) {					
			$date = $dyear . "-" . $month . "-" . "00";
			real_receipt_money($year,$receipt_sub,$expand,$expand2,$date,$amount,$ref,$description);
		}
		else {
			message_box("","คุณใส่ปีงบประมาณไม่ถูกต้อง","javascript:history.back()");
		}
	}
	// รายจ่ายจริง
	else if($mode == "real_expense") {
		if( (($year == $dyear)&&($month >= 10)) || (($year != $dyear)&&($month >=1 && $month <= 9)&&($dyear == ($year+1))) ) {
			$date = $dyear . '-' . $month . '-' . $day;			
			real_expense($year,$side,$money_type,$project,$activity,$activity_sub,$fund,$expense_sub,$expand,$date,$amount,$ref,$description);
		}
		else {
			message_box("","คุณใส่ปีงบประมาณไม่ถูกต้อง","javascript:history.back()");
		}
	}

?>