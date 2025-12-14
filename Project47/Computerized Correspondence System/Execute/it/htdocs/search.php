<?
require("config.mee.php");
$conn=mysql_connect($host,$username,$password);
mysql_select_db($database,$conn);
?>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
 
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"><font size="3" color="#006699"> <strong>ผลการค้นหาข้อมูล</strong> 
      </font><font size="3" color="#CC0000"><b>
      <?=$search?></b>
      &nbsp; </font></td>
    <td width="5" align="right" valign="top" background="../npe/images/x_r2_c5.gif"><img src="../npe/images/x_r2_c5.gif" width="5" height="1"></td>
  </tr>
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r4_c1.gif" width="5" height="5"></td>
    <td valign="top" background="../npe/images/x_r4_c4.gif"><img src="../npe/images/x_r4_c4.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r4_c5.gif" width="5" height="5"></td>
  </tr>
</table>
<?			
if($search!=Null){
			$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '%$search%' AND newproduct.Brand=newbrand.brand_no";
			$log=mysql_query($query,$conn);
			$arr=mysql_num_rows($log);
			if($arr!=0){
				#echo "ไม่พบข้อมูลที่ต้องการค้นหา";
			$gopage=$HTTP_GET_VARS["page"];
				if($gopage==""){
						$gopage=1;
				}
				$pagesize=$HTTP_GET_VARS["pagesize"];
				//กำหนดแสดง เร็คคอร์ดต่อหน้า ของข่าว
				$pagesize=9;         // Record per page 
				$maxcount=ceil($arr/$pagesize);
				$gopage=(($gopage-1)*$pagesize)+$recs;
				$recs=1;
				$checkpage=($gopage/$pagesize)+1;
				if($checkpage==$maxcount){
						$newsize=$arr % $pagesize;
						$pagesize=$newsize;
				}

?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width="1%"><img src="../npe/images/bar001.jpg" width="14" height="29"></td>
        <td width="98%" align="center" background="../npe/images/bar002.jpg"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              
          <td width=13% height="24"><b>เลขที่หนังสือ</b></td>
          <td width=32% align="center"><strong>รายละเอียดหนังสือ</strong></td>
              <td width=24% align="center"><strong>รุ่น</strong></td>
              <td width=17% align="center"><strong>ราคา (บาท)</strong></td>
              
          <td width=14% align="center"><strong>ชนิดหนังสือ</strong></td>
            </tr>
          </table>
          <strong><font size="3" color="#ffffff"> </font></strong></td>
        <td width="1%" align="right" background="../npe/images/bar002.jpg"><img src="../npe/images/bar003.jpg" width="14" height="29"></td>
      </tr>
    </table>

    
<?

echo "<table width=\"100%\" border=\"0\" cellpadding=\"4\"bordercolor=#ffffff> ";

				$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '%$search%' AND newproduct.Brand=newbrand.brand_no ORDER BY id DESC LIMIT $gopage,$pagesize";
				$log2=mysql_query($query2,$conn);
While($recs<=$pagesize){          
				$number=$gopage+$recs;
				$arr2=mysql_fetch_array($log2);
echo "<tr><td bordercolor=#cccccc>";
echo"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\">"
  . "              <tr> "
  . "                <td width=\"15%\" align=\"center\" valign=\"middle\">";


 $current_dir="images/product/small";
  $dir=opendir($current_dir);
  while($file=readdir($dir)){
  	$newfile=explode(".",$file);	
	//echo"$newfile[0]<br>";
		if($obj_array[ID]==$newfile[0]){
				$shownull=0;
				break;	
		}
  }
  if($shownull==0){
  	echo " <img src=\"images/product/small/$arr2[ID].jpg\" width=\"70\" height=\"50\">";
  }else {
 	 echo " <img src=\"images/product/null.jpg\" width=\"70\" height=\"50\">";
  }


echo "<td width=\"40%\" valign=\"top\"><strong>รหัสสินค้า : <font color=\"blue\">$arr2[ID]</font><br>&nbsp;&nbsp;$arr2[Description]</td><td width=15% valign=\"top\"><font color=#4987ED><b>$arr2[Model]</b></font></strong></td><td valign=\"top\" width=15% align=center><b><font color=red>$arr2[Price]</font></b></td>"
."<td valign=\"top\"><strong><u><font color=\"red\"><img src=\"images/icon_shop_cart.gif\" width=\"15\" height=\"11\" align='absmiddle'>คลิกเพื่อสั่งซื้อ</font></u></strong></td>"
  . "</tr>"
  . "<tr> "
  . "<td valign=\"top\"></td>"
  . "</tr>"
  . "</table>";
echo"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
  . "              <tr>"
  . "                <td>                  </font></strong>
                  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
                    <tr>
                      <td background=\"images/pointsmall.gif\"><img src=\"images/pointsmall.gif\" width=\"3\" height=\"1\"></td>
                    </tr>
                  </table>
                  <strong><font size=\"3\" color=\"#ffffff\"></td>"
  . "              </tr>"
  . "            </table>"
 ."";

		echo "</td></tr>";
			$recs++;
			}
 echo "</table>";
//link
echo "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
                         ."<tr>" 
                        ."<td align=right>&nbsp&nbsp<font size=\"2\"></font>&nbsp&nbsp&nbsp&nbsp&nbsp";
						if($checkpage > 1){
								$check=$checkpage-1;
								echo "[ <a href=\"$scriptname?data=search&search=$search&page=$check&pagesize=$pagesize\"><< Back </a> ]";
						}
						if($checkpage < $maxcount){
							$check=$checkpage+1;
								echo "[ <a href=\"$scriptname?data=search&search=$search&page=$check&pagesize=$pagesize\">Next >></a> ]";
						}
						
						$pad="";
						$Scriptname=${"Script_Name"};
						for($n=1;$n<=$maxcount;$n=$n+1){
							if($n>=10){$pad="";}
							echo " [";
							$ref="<a href=".$Scriptname."?data=search&search=$search&page=".$n."&pagesize=".$pagesize.">".$pad.$n."</a>";
							echo " ".$ref." ";
							echo "] ";
						}
				echo "</td></tr>"
                        ."</table>";
									}else {
										echo "<br><b><center><font color='red' size=4>:: ไม่พบข้อมูลที่ต้องการค้นหา ::</font></center></b>";
									} //จบเช็คว่ามีข้อมูลเหรือไม่
									
						}else {
								echo "<br><br><center><font size=4><b>กรุณากรอกข้อมูลที่ต้องการค้นหา</b></font></center><br><br>";
						}
?>
</body>
</html>
