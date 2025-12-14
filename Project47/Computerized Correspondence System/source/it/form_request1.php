<?
if($preview=="preview"){
define('FPDF_FONTPATH','font/');
require('mc_indent.php');
//include ("datethai.php");

$InterLigne = 7;
$line=2;
/*//$pdf=new PDF();
//$pdf->Open();
//$pdf->AddPage();
//$pdf->SetMargins(30,10,30);
$pdf->SetFont('Arial','B',50);
$pdf->SetTextColor(255,192,203);
$pdf->RotatedText(30,190,'W a t e r m a r k   d e m o',45);*/
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
						//????????????
						$x=15;$y=10;
						$pdf->SetFont('Angsau','',25);
						$pdf->Text($x+55,$y+15,'???????????? ');
						//??????????????????
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+15,$y+28,'?????????  ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+40,$y+28,"?????????????????????????????????????????. ??. 3900,3901");
						//???
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+15,$y+38,'??? ');
						$pdf->SetFont('Angsau','',12);
						$txt="??.0524.02.7/$id";
						$pdf->Text($x+20,$y+38,$txt);
						//??????
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+70,$y+38,'?????? ');
						$pdf->SetFont('Angsau','',12);
						$txt =$data_date;
						$pdf->Text($x+83,$y+38,"$txt");
						//????
						$pdf->SetFont('Angsau','',18);
						$pdf->Text($x+15,$y+48,'???? ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+25,$y+48,"$data4");
						//????
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+15,$y+58,'????  ');
						$pdf->SetFont('Angsau','',12);
						$pdf->Text($x+25,$y+58,"$data5");
//??????
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
						//????2
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
						
						//????3
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
						//????????????
						$pdf->ln(18);
						$txt =$menu2;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//?????????????????
						$pdf->ln(3);
						$txt = $menu4;
						$pdf->MultiCell(190,$InterLigne,$txt,0,'C',40,0); 
						//?????????
						if($username!='?????????'){
								$pdf->SetFont('Angsau','',40);
  								$pdf->SetTextColor(255,192,203);
    							$pdf->Text(70,10,'?????????');
						}
$pdf->Output();
}else{
?><html>
<head>
<title>ŧ¹˹ѧѺ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>

<body>
<?


		include  "datethai.php";
		
?>
<?
echo "$data4 $data5 $data6";
?><form action="index2.php?data=save5&username=<?=$username;?>&pwd=<?=$pwd;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%" border="0" cellpadding="0" cellspacing="5">
    <tr> 
      <td colspan="3" align="center"><font color="#006699" size="5"><strong>Ţ˹ѧ</strong></font></td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bgcolor="#CCCCCC">Ըա</td>
    </tr>
    <tr align="center"> 
      <td width="9%" align="right" valign="top">Ըա</td>
      <td colspan="2" align="left"><input type="radio" name="type_sent" value="ش˹ѧ">
        ش˹ѧ 
        <input type="radio" name="type_sent" value="ҡ蹴µͧ">
        ҡ/ 蹴µͧ 
        <input type="radio" name="type_sent" value="">
         
        <input type="radio" name="type_sent" value="fax">
        fax </td>
    </tr>
    <tr> 
      <td>Ṻ</td>
      <td colspan="2"><p> 
          <input  type="file" name="files">
        </p></td>
    </tr>
    <tr align="center"> 
      <td colspan="3">
	  		<input name="i_data1" type="hidden" value="<?=$data7;?>">
			<input name="i_data2" type="hidden" value="<?=$data11;?>">
			<input name="i_data3" type="hidden" value="<?=$data8;?>">
			<input name="i_topic" type="hidden" value="<?=$data4;?>">
			<input name="i_to" type="hidden" value="<?=$data5;?>">
			<input name="i_and" type="hidden" value="<?=$data6;?>">
	</td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bgcolor="#CCCCCC">ӤѭѺ(Keywords)</td>
    </tr>
    <tr> 
      <td rowspan="4" align="right" valign="top">Ӥѭͤ</td>
      <td width="25%"><input name="k1" type="checkbox" id="k1" value="عԨ">
        عԨ</td>
      <td width="28%"><input name="k5" type="checkbox" id="k5" value="ºʶҺѹ">
        ºʶҺѹ</td>
    </tr>
    <tr> 
      <td><input name="k2" type="checkbox" id="k2" value="ع¹">
        ع¹</td>
      <td><input name="k6" type="checkbox" id="k6" value="Ԩùѡ֡">
        Ԩùѡ֡</td>
    </tr>
    <tr> 
      <td><input name="k3" type="checkbox" id="k3" value="ҳ»">
        ҳ»</td>
      <td><input name="k7" type="checkbox" id="k7" value="ؤҡ">
        ؤҡ</td>
    </tr>
    <tr> 
      <td><input name="k4" type="checkbox" id="k4" value="ʴ">
        ʴ</td>
      <td> <input name="k8" type="checkbox" id="k8" value="yes"> <input name="d4" type="text" id="d4"></td>
    </tr>
    <tr> 
      <td></td>
      <td colspan="2"><blockquote> 
          <blockquote> 
            <p> 
              <input type="submit" name="Submit" value="Submit">
            </p>
          </blockquote>
        </blockquote></td>
    </tr>
  </table>
</form>
</body>
</html>
<?
}
?>