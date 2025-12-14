<?php
define('FPDF_FONTPATH','font/');
require('mc_indent.php');


						$InterLigne = 7;
						$line=65;

						$pdf=new PDF();
						$pdf->Open();
						$pdf->AddPage();
						$pdf->SetMargins(30,10,30);
						//$pdf->SetFont('Arial','',12);
						$pdf->AddFont('Angsau','','angsau.php'); 
						$pdf->SetFont('Angsau','',12);
						$pdf->Image('immage/kpig.jpg',25,10,20);
						$txt = NULL;
						$txtLen = $pdf->GetStringWidth($txt);
						$milieu = (210-$txtLen)/2;
						$pdf->SetX($milieu);
						$pdf->Write(5,$txt);
						//ลิ้ง ยอมรับ
						$pdf->Write(5,'Visit ','');
						//$pdf->Write(5,'fpdf.org','fpdf.org');
						 $pdf->SetTextColor(255,0,0);
						$pdf->Text(150,10,'ส่งเอกสารขอรับเลขที่หนังสือ');
						//$pdf->Link(150, 8, 30, 10,$pdf->Write(5,'fpdf.org','fpdf.org')) ;
						$pdf->SetTextColor(0,0,0);
						//บันทึกข้อความ
						$x=15;$y=10;
						$pdf->SetFont('Angsau','',25);
						$pdf->Text($x+55,$y+15,'บันทึกข้อความ ');
						//ส่วนราชการเจ้าของเรื่อง
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+15,$y+28,'ส่วนราชการ  ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+40,$y+28,"ภาควิชาวิศวกรรมศาสตร์ คณะวิศวกรรมศาสตร์ สจล. โทร. 3900,3901");
						//ที่
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+15,$y+38,'ที่  ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+20,$y+38,"ศธ.0524.02.7/");
						//วันที่
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+70,$y+38,'วันที่  ');
						$pdf->SetFont('Angsau','',12);
						$txt =$data_date;
						$pdf->Text($x+83,$y+38,"$txt");
						//เรื่อง
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+15,$y+48,'เรื่อง ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+25,$y+48,"$data4");
						//เรียน
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+15,$y+58,'เรียน  ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+25,$y+58,"$data5");
//วรรคแรก
						$pdf->ln(60);	
						$txt = $data7;
						$nstring=strlen("$data7");
						if($nstring <= 100)
						{
									$txt="           $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
						//วรรค2
						$pdf->ln(2);
						$txt =$data11;
						$nstring=strlen("$data11");
						if($nstring <= 100)
						{
									$txt="           $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
						
						//วรรค3
						$pdf->ln(2);
						$txt = $data8;
						$nstring=strlen("$data8");
						if($nstring <= 100)
						{
									$txt="           $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
						//ผู้ออกหนังสือ
						$pdf->ln(18);
						$txt =$menu2;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//ตำแหน่งผู้ออกหนังสือ
						$pdf->ln(3);
						$txt = $menu4;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//สำเนาเอกสาร
						$pdf->SetFont('Angsau','',40);
    $pdf->SetTextColor(255,192,203);
    $pdf->Text(10,25,'สำเนาเอกสาร');
	
$pdf->Output();
?> 
