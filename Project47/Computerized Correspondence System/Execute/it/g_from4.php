<?php
define('FPDF_FONTPATH','font/');
require('mc_indent.php');
//include ("datethai.php");

$InterLigne = 7;
$line=2;
$pdf=new PDF();
$pdf->Open();
$pdf->AddPage();
$pdf->SetMargins(30,10,30);

						//$pdf->SetFont('Arial','',12);
						$pdf->AddFont('Angsau','','angsau.php'); 
						$pdf->SetFont('Angsau','',14);
						$txt = NULL;
						$txtLen = $pdf->GetStringWidth($txt);
						$milieu = (210-$txtLen)/2;
						$pdf->SetX($milieu);
						$pdf->Write(5,$txt);
						//***********************เลือก********
						switch($d2)
						{
							case '1' :{
										$pdf->Text(31,90,'  /');
							}break;
							case '2' :{
										$pdf->Text(31,97,'  /');
							}break;	
							case '3' :{
										$txt ="  /                                             $d61";
										$pdf->Text(31,104,$txt);
							}break;
						}
						//เขียนที่
						$pdf->ln(7);
						$txt = "ภาควิชาวิศวกรรมคอมพิวเตอร์";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',0,0); 
						//เรื่อง
						$pdf->ln(2);
						$txt = "ใบขออนุญาติใช้รถส่วนกลาง";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'C',0,15); 
						$pdf->ln(2);
						$txt = "คณะวิศวกรรมศาสตร์ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'C',0,15); 
						//วันที่
						$pdf->ln(2);
						$txt = "วันที่ $data_date";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',0,0); 
						
						//เรียน
						$pdf->ln(3);
						$txt = "เรียน  หัวหน้าแผนกยานพาหนะ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						//วรรคแรก
						$pdf->ln(3);	
						$txt="      ข้าพเจ้า  $user_name   ตำแหน่ง  $position_user ขออนุญาติใช้รถไปที่ $d50 เพื่อ $d51 มีคนนั่ง $d52 คน  ในวันที่ $d53  เดือน $d54 พ.ศ.$d55  เวลา $d56  ถึงวันที่ $d57 เดือน $d58 พ.ศ. $d59 เวลา $d60";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="                 ความประสงค์ของผู้ใช้รถ ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="[   ] ส่งเที่ยวเดียว                                                                         แผนกยานพาหนะคณะวิศวกรรมฯ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="[   ] ส่งแล้วรอรับกลับ                                                        รถเข้าเวลา............................................น.";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="[   ] ส่งแล้วให้ไปรับเวลา.......................น.                           ...................................เจ้าหน้าที่ผู้ตรวจ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 		
						
						//คำลงท้าย
						$pdf->ln(10);
						$txt =".............$user_name......ผู้ขออนุญาติ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',40); 
						//ลงชื่อ
						$pdf->ln(2);
						$txt =".................วัชระ ฉัตรวิริยะ.................หัวหน้าภาค";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',40); 
						$txt ="วันที่...............เดือน........................พ.ศ...............";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',40); 
						
						$pdf->ln(3);	
						$txt="ใช้รถหมายเลขทะเบียน....................................";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="พนักงานขับรถ.................................................";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="ลงนามผู้มีอำนาจสั่งใช้รถ..................................";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="                   ............./.................../...................";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="พนักงานขับรถ..............[    ] ผู้แทน   [   ] เซ้นรับทราบ...........................................................................";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="                                                                                 ........................./............................/........................";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 

$pdf->Output();
?> 
