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
//บันทึกข้อความ
$x=15;$y=10;
	$pdf->SetFont('Angsau','',25);
	$pdf->Text($x+55,$y+20,'บันทึกข้อความ ');
//ส่วนราชการเจ้าของเรื่อง
	$pdf->SetFont('Angsau','',18);
	$pdf->Text($x+15,$y+28,'ส่วนราชการ  ');
	$pdf->SetFont('Angsau','',14);
	$pdf->Text($x+40,$y+28,"$data1");
//ที่
	$pdf->SetFont('Angsau','',18);
	$pdf->Text($x+15,$y+38,'ที่  ');
	$pdf->SetFont('Angsau','',14);
	$pdf->Text($x+20,$y+38,"$data2");
//วันที่
	$pdf->SetFont('Angsau','',18);
	$pdf->Text($x+70,$y+38,'วันที่  ');
	$pdf->SetFont('Angsau','',14);
	$pdf->Text($x+83,$y+38,"$data3");
//เรื่อง
	$pdf->SetFont('Angsau','',18);
	$pdf->Text($x+15,$y+48,'เรื่อง ');
	$pdf->SetFont('Angsau','',14);
	$pdf->Text($x+25,$y+48,"$data3");
//เรียน
	$pdf->SetFont('Angsau','',18);
	$pdf->Text($x+15,$y+58,'เรียน  ');
	$pdf->SetFont('Angsau','',14);
	$pdf->Text($x+25,$y+58,"$data4");
//วรรคแรก
$pdf->ln($line);
$txt ="$data6";
$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
//วรรคแรก
$pdf->ln(2);
$txt ="$data7";
$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
//วรรค3
$pdf->ln(2);
$txt ="$data8";
$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
//ลงชื่อ
$pdf->ln(10);
$txt ="$data9";
$pdf->MultiCell(250,$InterLigne,$txt,0,'C',0); 

$pdf->Output();
?> 
