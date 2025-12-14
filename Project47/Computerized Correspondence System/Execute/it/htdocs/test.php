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
switch($type_book)
{
	case 'external_book' :
	{
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
						$pdf->Text($x+15,$y+20,'ที่ '); 	$pdf->Text($x+19,$y+20,"ศธ.0524.02.7/");
							//ส่วนราชการเจ้าของเรื่อง
						$pdf->Text($x+125,$y+20,'ภาควิชาวิศวกรรมคอมพิวเตอร์ ');
						$pdf->Text($x+125,$y+25,'คณะวิศวกรรมศาสตร์ ');
						$pdf->Text($x+125,$y+30,'สถาบันเทคโนโลยีพระจอมเกล้า');
						$pdf->Text($x+125,$y+35,'เจ้าคุณทหารลาดกระบัง ');
						//วันที่
						$txt =$data_date;
						$pdf->Text(110,55,"$txt");
						//เรื่อง
						$pdf->ln(43);
						$txt = "เรื่อง $data4";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						//เรียน
						$pdf->ln(3);
						$txt = "เรียน $data5";
						$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						if($data6 != NULL)
						{
									//สิ่งที่ว่งมาด้วย
									$pdf->ln(3);
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
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						}
						//วรรค2
						$pdf->ln($line);
						$txt =$data11;
						$nstring=strlen("$data11");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						}
						
						//วรรค3
						$pdf->ln($line);
						$txt = $data8;
						$nstring=strlen("$data8");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,15); 
						}
						//คำลงท้าย
						$pdf->ln(10);
						$txt =$menu1;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',0); 
						//ผู้ออกหนังสือ
						$pdf->ln(10);
						$txt =$menu2;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//ตำแหน่งผู้ออกหนังสือ
						$pdf->ln(3);
						$txt = $menu4;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//<font size="2">ส่วนราชการเจ้าของเรื่อง
						$pdf->ln(10);
						$txt = $menu3;
						$pdf->MultiCell(55,$InterLigne,$txt,0,'J',0,0); 
	}break;
	case 'internal_book' :
	{
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
	$pdf->SetFont('Angsau','',18);
	$pdf->Text($x+15,$y+58,'เรียน  ');
	$pdf->SetFont('Angsau','',12);
	$pdf->Text($x+25,$y+58,"$data5");
//วรรคแรก
$pdf->ln($line);
$txt ="$data6";
$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
//วรรคแรก
$pdf->ln(2);
$txt ="$data7";
$nstring=strlen("$data7");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
//วรรค2
$pdf->ln(2);
$txt ="$data11";
$nstring=strlen("$data11");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
//วรรค3
$pdf->ln(2);
$txt ="$data8";
$pdf->ln(2);
$txt ="$data7";
$nstring=strlen("$data7");
						if($nstring <= 100)
						{
									$txt="                       $txt";
									$pdf->MultiCell(170,$InterLigne,$txt,0,'J',0,20); 		
						}else
						{
								$pdf->MultiCell(0,$InterLigne,$txt,0,'J',0,10); 
						}
//ผู้ออกหนังสือ
						$pdf->ln(10);
						$txt =$menu2;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//ตำแหน่งผู้ออกหนังสือ
						$pdf->ln(3);
						$txt = $menu4;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
	}break;
	case 'tab_book' :
	{
	
	}break;
	case 'order_book' :
	{
	
	}break;
	case 'infromation_book' :
	{
	
	}break;
	default :
	{
	   echo "ไม่มีข้อมูลหนังสือ";
	}break;

}
$pdf->Output();
?> 
