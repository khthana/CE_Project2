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
						$pdf->Image('immage/kpig.jpg',90,10,30);
						$txt = NULL;
						$txtLen = $pdf->GetStringWidth($txt);
						$milieu = (210-$txtLen)/2;
						$pdf->SetX($milieu);
						$pdf->Write(5,$txt);
						//ที่
						$x=15;$y=10;
						$pdf->Text($x+16,$y+33,'ที่ '); 	$pdf->Text($x+21,$y+33,"ศธ.0524.02.7/");
						//ถึง
						$pdf->ln(34);
						$txt ="ถึง $data5";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						if($data6 != NULL)
						{
									//สิ่งที่ว่งมาด้วย
									$pdf->ln(2);
									$txt ="สิ่งที่ส่งมาด้วย $data6";
									$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						}
						//วรรคแรก
						$pdf->ln(3);	
						$txt = $data7;
						$nstring=strlen("$data7");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,10); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
						//วรรค2
						$pdf->ln($line);
						$txt =$data11;
						$nstring=strlen("$data11");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,10); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
						
						//วรรค3
						$pdf->ln($line);
						$txt = $data8;
						$nstring=strlen("$data8");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,10); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
								//ส่วนราชการที่ส่งหนังสือ
						$pdf->ln(2);
						$pdf->MultiCell(190,$InterLigne,'ภาควิชาวิศวกรรมคอมพิวเตอร์ ',0,'C',40,0); 
						$pdf->ln(0);
						$pdf->MultiCell(190,$InterLigne,'คณะวิศวกรรมศาสตร์ ',0,'C',40,0); 
						$pdf->ln(0);
						$pdf->MultiCell(190,$InterLigne,'สถาบันเทคโนโลยีพระจอมเกล้า ',0,'C',40,0); 
						$pdf->ln(0);
						$pdf->MultiCell(190,$InterLigne,'เจ้าคุณทหารลาดกระบัง  ',0,'C',40,0); 
						//วันที่
						$txt =$data_date;
						$pdf->ln(5);
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//<font size="2">ส่วนราชการเจ้าของเรื่อง
						$pdf->ln(10);
						$txt = $menu3;
						$pdf->MultiCell(55,$InterLigne,$txt,0,'J',0,0); 

$pdf->Output();
?> 
