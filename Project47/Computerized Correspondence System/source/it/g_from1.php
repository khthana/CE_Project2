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
						$pdf->SetFont('Angsau','',12);
						$txt = NULL;
						$txtLen = $pdf->GetStringWidth($txt);
						$milieu = (210-$txtLen)/2;
						$pdf->SetX($milieu);
						$pdf->Write(5,$txt);
						//เขียนที่
						$pdf->ln(7);
						$txt = "เขียนที่ภาควิชาวิศวกรรมคอมพิวเตอร์";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',0,0); 
						//วันที่
						$pdf->ln(2);
						$txt = "วันที่ $data_date";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'R',0,0); 
						//เรื่อง
						$pdf->ln(2);
						$txt = "เรื่อง $d2";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						//เรียน
						$pdf->ln(3);
						$txt = "เรียน  คณบดี คณะวิศวกรรมศาตร์";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						//วรรคแรก
						$pdf->ln(3);	
						$txt="               ข้าพเจ้า  $user_name   ตำแหน่ง  $position_user ระดับ $re_level  ภาควิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="ขอลา $d2  เนื่องจาก $d3 ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,0); 
						$txt="ตั้งแต่วันที่ $d4  เดิอน $d5 พ.ศ.$d6  ถึงวันที่ $d7 เดือน $d8 พ.ศ. $d9 มีกำหนด $d10 วันทำการ ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						$txt="ข้าพเจ้าได้ลา $d2 ครั้งสุดท้าย ตั้งแต่วันที่ $d11   เดือน $d12 พ.ศ. $d13  ถึงวันที่ $d14 เดือน $d15 พ.ศ. $d16 มีกำหนด $d17 วันทำการ  ในระหว่างลาจะติดต่อข้าพเจ้าได้ที่ $d18 ";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 		
						
						//คำลงท้าย
						$pdf->ln(10);
						$txt ="ขอแสดงความนับถือ";
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',0); 
						//ลงชื่อ
						$pdf->ln(10);
						$txt ="( $d19 )";
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						
						//ผู้บังคับบัญชา และคำสั่ง
						$pdf->ln(3);
						$txt = "ความเห็นผู้บังคับบัญชา                                                      																					คำสั่ง";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						$txt = "(  )อนุญาต    (  )ไม่อนุญาต                                                          																			(  )อนุญาต    (  )ไม่อนุญาต";
						$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						$txt = "........................................................................ ...                                   							............................................................................................";
						$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						$txt = ".............................................................................                                  							............................................................................................";
						$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						$txt = "(ลงชื่อ).....ดร.วัชระ ฉัตรวิรัยะ............................                                     						(ลงชื่อ)..................................................................................";
						$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						$txt = "(ตำแหน่ง)หัวหน้าภาควิชาวิศวกรรมคอมพิวเตอร์                                 							(ตำแหน่ง)...........คณะบดี คณะวิศวกรรมศาสตร๋.....................";
						$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						$txt = "วันที่................./........................../.........................                                							วันที่................./........................../.........................";
						$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						$pdf->ln(1);
						//$txt = "							สถิติการลาในงบประมาณนี้";
						//$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,0); 
						//$pdf->Cell(20,10,'Title',1,1,'C'); 

$pdf->Output();
?> 
