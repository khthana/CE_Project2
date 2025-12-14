<?php

	require('thaipdfclass.php');
	include('database.php');	
	
	//$year = 2547;
	
	database_connect();
	$pdf=new ThaiPDF();
	$pdf->SetThaiFont();
	$pdf->AddPage();
	
	$pdf->SetFont('AngsanaNew','B',16);
	$pdf->SetTextColor(0,0,0);
	$pdf->Ln(7);
	$pdf->Cell(0,0,'สำนักทะเบียนและประมวลผล',0,1,'C');
	$pdf->Ln(7);
	$pdf->Cell(0,0,'รายงานรายรับจริง ประจำปี ' . $year,0,1,'C');
	$pdf->Ln(10);
	
	$pdf->SetFont('AngsanaNew','B',14);	
	$pdf->SetX(50);
	$pdf->Cell(0,0,"เงินงบประมาณ",0,1,'C');	
	$pdf->SetX(100);
	$pdf->Cell(0,0,"เงินรายได้",0,1,'C');	
	$pdf->SetX(150);
	$pdf->Cell(0,0,"รวมทั้งสิ้น",0,1,'C');	
	$pdf->SetX(190);
	$pdf->Cell(0,0,"อ้างอิง",0,1,'C');	
	$pdf->Ln(7);

	// ******************************************** เงินงบประมาณที่รัฐบาลจัดให้ ***************************************************
	$str_money_gov = "select * from money_type_receipt where id = any (select money_type_receipt_id from real_receipt where money_type_receipt_id = '42000' and year = '".$year."')";
	$ret_money_gov = database_query($str_money_gov);
	if(mysql_num_rows($ret_money_gov) != 0) {
			$object_money_gov = mysql_fetch_array($ret_money_gov);	
			$object_money_gov_txt = mysql_fetch_array(database_query("select * from real_receipt where money_type_receipt_id = '42000' and year = '".$year."' "));									
			
			// print เงินงบประมาณที่รัฐบาลจัดให้
			$pdf->Cell(0,0,$object_money_gov["MONEY_TYPE_RECEIPT"],0,1,'L');
	
			// print money gov
			$amount_gov = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
			$pdf->SetX(128);
			if($amount_gov[0] > 0)
			$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');			
	
			// print money all
			$pdf->SetX(175);
			$pdf->Cell(10,0,number_format($amount_gov[0]),0,1,'R');
			
			// print ref
			$pdf->SetFont('AngsanaNew','',14);	
			$pdf->SetX(190);
			$pdf->Cell(10,0,number_format($object_money_gov_txt["REF_DOCUMENT"]),0,1,'C');
			$pdf->Ln(7);
			
	} // end if of เงินงบประมาณที่รัฐบาลจัดให้	
	
	
	
	
	// ******************************************** เงินรายได้สถาบัน ***************************************************
	$str_money_ins = "select * from money_type_receipt where id = any (select money_type_receipt_id from real_receipt where money_type_receipt_id = '43000' and year = '".$year."')";
	$ret_money_ins = database_query($str_money_ins);
	if(mysql_num_rows($ret_money_ins) != 0) {
			$object_money_ins = mysql_fetch_array($ret_money_ins);
						
			// print เงินรายได้สถาบัน
			$pdf->SetFont('AngsanaNew','B',14);	
			$pdf->Cell(0,0,$object_money_ins["MONEY_TYPE_RECEIPT"],0,1,'L');
	
			// print money ins
			$amount_ins = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
			$pdf->SetX(150);
			if($amount_ins[0] > 0)
			$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');			
	
			// print money all
			$pdf->SetX(175);
			$pdf->Cell(10,0,number_format($amount_ins[0]),0,1,'R');
			$pdf->Ln(7);
			
	} // end if of เงินรายได้สถาบัน
	
	
	
	
	
	// ******************************************** ประจำเดือน ***************************************************
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
						
						// print เงินรายได้สถาบัน
						$pdf->SetFont('AngsanaNew','B',14);	
						$pdf->Cell(0,0,"      ประจำเดือน " . $month[$m],0,1,'L');
	
						// print money ins
						$amount_receipt_month = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and date = '".$object_receipt_month["DATE"]."' "));
						$pdf->SetX(150);
						if($amount_receipt_month[0] > 0)
						$pdf->Cell(10,0,number_format($amount_receipt_month[0]),0,1,'R');			
	
						// print money all
						$pdf->SetX(175);
						$pdf->Cell(10,0,number_format($amount_receipt_month[0]),0,1,'R');
						$pdf->Ln(7);
						
						
						
						
						// ******************************************** Receipt Type ***************************************************
						$str_receipt_type = "select * from receipt_type where id = any".
          		 													"(select receipt_type_id from receipt_sub where id = any".
          		 														 "(select receipt_sub_id from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and date = '".$object_receipt_month["DATE"]."'))";
          		 	$ret_receipt_type = database_query($str_receipt_type);												           		 		
          		 	while($object_receipt_type = mysql_fetch_array($ret_receipt_type)) {
						
								// print เงินรายได้สถาบัน
								$pdf->SetFont('AngsanaNew','',14);	
								$pdf->Cell(0,0,"            " . $object_receipt_type["RECEIPT_TYPE"],0,1,'L');
	
								// print money ins
								$amount_receipt_type = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and date = '".$object_receipt_month["DATE"]."' and receipt_sub_id = any ".
																																										"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' )"));
								$pdf->SetX(150);
								if($amount_receipt_type[0] > 0)
								$pdf->Cell(10,0,number_format($amount_receipt_type[0]),0,1,'R');			
	
								// print money all
								$pdf->SetX(175);
								$pdf->Cell(10,0,number_format($amount_receipt_type[0]),0,1,'R');
								$pdf->Ln(7);
								
								
								
								// ******************************************** Receipt Sub ***************************************************
								$str_receipt_temp = "select * from real_receipt where year = '".$year."' and money_type_receipt_id = '43000' and receipt_sub_id = any ".
          		 																	"(select id from receipt_sub where receipt_type_id = '".$object_receipt_type["ID"]."' ) and date = '".$object_receipt_month["DATE"]."' order by receipt_sub_id";
          		 			$ret_receipt_temp = database_query($str_receipt_temp);
          		 			while($object_receipt_temp = mysql_fetch_array($ret_receipt_temp)) {          		 						
          		 					
          		 					$object_receipt_sub = mysql_fetch_array(database_query("select * from receipt_sub where id = '".$object_receipt_temp["RECEIPT_SUB_ID"]."' "));
										
										// print เงินรายได้สถาบัน
										$pdf->SetFont('AngsanaNew','',14);	
										$pdf->Cell(0,0,"                  " . $object_receipt_sub["RECEIPT_SUB"] . "  " . $object_receipt_temp["EXPAND1"],0,1,'L');										
	
										// print money ins										
										$pdf->SetX(150);
										if($object_receipt_temp["AMOUNT"] > 0)
										$pdf->Cell(10,0,number_format($object_receipt_temp["AMOUNT"]),0,1,'R');			
	
										// print money all
										$pdf->SetX(175);
										$pdf->Cell(10,0,number_format($object_receipt_temp["AMOUNT"]),0,1,'R');										
										
										// print ref
										$pdf->SetX(190);
										$pdf->Cell(10,0,number_format($object_receipt_temp["REF_DOCUMENT"]),0,1,'C');
										$pdf->Ln(6);
										
										if($object_receipt_temp["EXPAND2"] != "") {
												$pdf->Cell(0,0,"                  ( " . $object_receipt_temp["EXPAND2"] . " )",0,1,'L');
												$pdf->Ln(6);
										}
									
								} // end while of Receipt Sub
						
						} // end while of Receipt Type
						
						$pdf->Ln(4);
						
				} // end if of ประจำเดือน 
				
	} // end while of ประจำเดือน
	
	
	// print เงินรายได้
   $pdf->SetFont('AngsanaNew','B',14);	   
   $pdf->Cell(0,0,"รวมรายรับทั้งสิ้น",0,1,'L');
         				
   // print money ins						
	$pdf->SetX(128);
	$amount_all_gov = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '42000'"));
	if($amount_all_gov[0] > 0)
	$pdf->Cell(10,0,number_format($amount_all_gov[0]),0,1,'R');	
         				
   // print money ins						
	$pdf->SetX(150);
	$amount_all_ins = mysql_fetch_array(database_query("select sum(amount) from real_receipt where year = '".$year."' and money_type_receipt_id = '43000'"));
	if($amount_all_ins[0] > 0)
	$pdf->Cell(10,0,number_format($amount_all_ins[0]),0,1,'R');	
	
	// print money all
	$pdf->SetX(175);
	$pdf->Cell(10,0,number_format(($amount_all_gov[0] + $amount_all_ins[0])),0,1,'R');
	
	
	$pdf->Output();
?>



