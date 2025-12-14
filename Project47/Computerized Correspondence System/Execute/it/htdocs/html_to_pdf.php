<?php
define('FPDF_FONTPATH','font/');
require('fpdf.php');

class PDF extends FPDF
{
//Page header
function Header()
{
    //Logo
    $this->Image('immage/kpig.jpg',100,25,20);
}
//Page footer
function Footer()
{
    //Position at 1.5 cm from bottom
    $this->SetY(-15);
    //Arial italic 8
    $this->SetFont('Arial','I',8);
    //Page number
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}

//Instanciation of inherited class
	$pdf=new PDF();
	$pdf->AliasNbPages();
	$pdf->AddPage();
	$pdf->AddFont('Angsau','','angsau.php'); 
	$pdf->SetFont('Angsau','',16); 
	$x=15;$y=10;
	$pdf->Text($x+10,$y+25,'ที่ '); 	$pdf->Text($x+14,$y+25,$data1);
	$pdf->Text($x+130,$y+25,$data2);
	$pdf->Text($x+82,$y+50,$data3);
	$pdf->Text($x+10,$y+65,'เรื่อง');		$pdf->Text($x+19,$y+65,$data4);
	$pdf->Text($x+10,$y+75,'เรียน');		$pdf->Text($x+19,$y+75,$data5);
	$pdf->Text($x+10,$y+85,'สิ่งที่ส่งมาด้วย');	$pdf->Text($x+35,$y+85,$data6);
	$pdf->SetX(40);
	$pdf->SetY(100);
	$pdf->Write(5,$data7);
	$pdf->SetX(30);
	$pdf->SetY(110);
	$pdf->Write(5,$data11);
	$pdf->SetX(40);
	$pdf->SetY(115);
	$pdf->Write(5,$data8);
	$pdf->Text($x+150,$y+155,$data9);
	$pdf->Text($x+10,$y+175,$data10);
	$pdf->Line(2, 250, 180, 250) ;
	$pdf->Link(2, 240, 180, 240," /htdocs/html_to_pdf.php") ;
	$pdf->Output();
?>
