<?
require("config.mee.php");
$conn=mysql_connect($host,$username,$password);
mysql_select_db($database,$conn);
?>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
 
<body>
<?
if($search!=NULL){
?>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="../npe/images/header.gif">
  <tr> 
    <td align="right"><strong><font size="3" color="#ffffff"> <?echo "<font color=white size=3><b>Advance Search</b></font>&nbsp;&nbsp;";?> 
      </font></strong></td>
  </tr>
</table><table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"> <form action="../npe/left.php?data=advance_search" method="post" name="form_new" id="form_new" onSubmit="return check()">
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td width="37%" align="right"><strong>｢鯱､ﾇﾒﾁｷﾕ襍鯱ｧ｡ﾒﾃ､鮖 :</strong></td>
            <td width="63%"><input name="advance_search" type="text" id="advance_search" size="25"></td>
          </tr>
          <tr> 
            <td align="right"><strong>､鮖ﾋﾒｨﾒ｡ :</strong></td>
            <td><select name="select" onChange="MM_jumpMenu('parent',this,0)">
              <? if($values==1){
				echo "<option value=\"index.php?data=advance_search&values=1\" selected>ﾃﾋﾑﾊﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=1\">ﾃﾋﾑﾊﾊﾔｹ､鰓</option>";
			  }
			  ?>
			  <? if($values==2){
				echo "<option value=\"index.php?data=advance_search&values=2\" selected>ﾃﾒﾂﾅﾐ猩ﾕﾂｴﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=2\">ﾃﾒﾂﾅﾐ猩ﾕﾂｴﾊﾔｹ､鰓</option>";
			  }
			  ?><? if($values==3){
				echo "<option value=\"index.php?data=advance_search&values=3\" selected>ﾃﾘ雹｢ﾍｧﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=3\">ﾃﾘ雹｢ﾍｧﾊﾔｹ､鰓</option>";
			  }
			  ?>			  <? if($values==4){
				echo "<option value=\"index.php?data=advance_search&values=4\" selected>ﾂﾕ靈鯱｢ﾍｧﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=4\">ﾂﾕ靈鯱｢ﾍｧﾊﾔｹ､鰓</option>";
			  }
			  ?>			  <? if($values==5){
				echo "<option value=\"index.php?data=advance_search&values=5\" selected>ﾃﾒ､ﾒﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=5\">ﾃﾒ､ﾒﾊﾔｹ､鰓</option>";
			  }
			  ?><? if($values==6){
				echo "<option value=\"index.php?data=advance_search&values=6\" selected>ｻﾃﾐ狢ｷ｢ﾍｧﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=6\">ｻﾃﾐ狢ｷ｢ﾍｧﾊﾔｹ､鰓</option>";
			  }
			  ?>
              </select> <input name="values" type="hidden" id="values" value="<?=$values?>"> 
            </td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td>
            <td>
			<?
			if($values==4){
			$query3="SELECT * FROM  ".$prefix."newbrand";
			$log3=mysql_query($query3,$conn);
			$numrow3=mysql_num_rows($log3);
				echo "<select name=\"brandsearch\">";
              for($i=1;$i<=$numrow3;$i++){
			  $arr3=mysql_fetch_array($log3);	
				echo "<option value=\"$arr3[brand_no]\"> $arr3[brand_value] </option>";	
			  }
				echo "</select>";
			 }
			  ?>
			  <?
			if($values==6){
			$query3="SELECT * FROM  ".$prefix."newclass";
			$log3=mysql_query($query3,$conn);
			$numrow3=mysql_num_rows($log3);
				echo "<select name=\"classsearch\">";
              for($i=1;$i<=$numrow3;$i++){
			  $arr3=mysql_fetch_array($log3);	
				echo "<option value=\"$arr3[class_no]\"> $arr3[class_value] </option>";	
			  }
				echo "</select>";
			 }
			  ?></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><input type="submit" name="Submit" value="､鮖ﾋﾒ｢鯱ﾁﾙﾅ">
              &nbsp;
              <input name="search" type="hidden" id="search" value="1"></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><a href="../npe/index.php?data=advance_search"><b>
              <script language="JavaScript">
function check()
{
      var v1 = document.form_new.advance_search.value;

        if (v1.length==0)
           {
           alert("｡ﾃﾘｳﾒｻ鯱ｹ｢鯱ﾁﾙﾅｷﾕ襍鯱ｧ｡ﾒﾃ､鮖ﾋﾒ");
           document.form_new.advance_search.focus();           
           return false;
           }else
           return true;
}
</script>
              </b></a></td>
          </tr>
        </table>
      </form></td>
    <td width="5" align="right" valign="top" background="../npe/images/x_r2_c5.gif"><img src="../npe/images/x_r2_c5.gif" width="5" height="1"></td>
  </tr>
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r4_c1.gif" width="5" height="5"></td>
    <td valign="top" background="../npe/images/x_r4_c4.gif"><img src="../npe/images/x_r4_c4.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r4_c5.gif" width="5" height="5"></td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"><font size="3" color="#006699"> <strong>ｼﾅ｡ﾒﾃ､鮖ﾋﾒ｢鯱ﾁﾙﾅ</strong> 
      </font><font size="3" color="#CC0000"><b>
      <?=$advance_search?></b>
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
if($search!=NULL){
			if($brandsearch!=NULL){
			$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$advance_search%' AND brand_no='$brandsearch' AND newproduct.Brand=newbrand.brand_no";
			}else if($classsearch!=NULL){
				$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$advance_search%' AND Class='$classsearch' AND newproduct.Brand=newbrand.brand_no";
			}else if($values==1){
				$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE ID like '$advance_search%' AND newproduct.Brand=newbrand.brand_no";
			}else if($values==2){
				$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$advance_search%' AND newproduct.Brand=newbrand.brand_no";
			}else if($values==3){
				$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Model like '$advance_search%' AND newproduct.Brand=newbrand.brand_no";
			}else if($values==5){
				$query="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Price='$advance_search' AND newproduct.Brand=newbrand.brand_no";
			}
			$log=mysql_query($query,$conn);
			$arr=mysql_num_rows($log);
if($arr!=NULL){
			$gopage=$HTTP_GET_VARS["page"];
				if($gopage==""){
						$gopage=1;
				}
				$pagesize=$HTTP_GET_VARS["pagesize"];
				//｡ﾓﾋｹｴ睫ｴｧ 狹遉､ﾍﾃ�ｴｵ靉ﾋｹ鰓 ｢ﾍｧ｢靨ﾇ
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
              
          <td width=18% height="24"><b></b></td>
              <td width=27% align="center"><strong>ﾃﾒﾂﾅﾐ猩ﾕﾂｴﾊﾔｹ､鰓</strong></td>
              <td width=24% align="center"><strong>ﾃﾘ雹</strong></td>
              <td width=17% align="center"><strong>ﾃﾒ､ﾒ (ｺﾒｷ)</strong></td>
              <td width=14% align="center"><strong>ﾊﾑ隗ｫﾗ鯱</strong></td>
            </tr>
          </table>
          <strong><font size="3" color="#ffffff"> </font></strong></td>
        <td width="1%" align="right" background="../npe/images/bar002.jpg"><img src="../npe/images/bar003.jpg" width="14" height="29"></td>
      </tr>
    </table>

    
<?
echo "<table width=\"100%\" border=\"0\" cellpadding=\"4\"bordercolor=#ffffff> ";
			if($brandsearch!=NULL){
			$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$advance_search%' AND brand_no='$brandsearch' AND newproduct.Brand=newbrand.brand_no ORDER BY ID DESC LIMIT $gopage,$pagesize";
			}else if($classsearch!=NULL){
				$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$advance_search%' AND Class='$classsearch' AND newproduct.Brand=newbrand.brand_no ORDER BY ID DESC LIMIT $gopage,$pagesize";
			}else if($values==1){
				$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE ID like '$advance_search%' AND newproduct.Brand=newbrand.brand_no ORDER BY  ID DESC LIMIT $gopage,$pagesize";
			}else if($values==2){
				$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$advance_search%' AND newproduct.Brand=newbrand.brand_no ORDER BY ID DESC LIMIT $gopage,$pagesize";
			}else if($values==3){
				$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Model like '$advance_search%' AND newproduct.Brand=newbrand.brand_no ORDER BY ID DESC LIMIT $gopage,$pagesize";
			}else if($values==5){
				$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Price='$advance_search' AND newproduct.Brand=newbrand.brand_no ORDER BY ID DESC LIMIT $gopage,$pagesize";
			}				
				//$query2="SELECT * FROM  ".$prefix."newproduct,newbrand WHERE Description like '$search%' AND newproduct.Brand=newbrand.brand_no ORDER BY  ID DESC LIMIT $gopage,$pagesize";
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


echo "<td width=\"40%\" valign=\"top\"><strong>ﾃﾋﾑﾊﾊﾔｹ､鰓 : <font color=\"blue\">$arr2[ID]</font><br>&nbsp;&nbsp;$arr2[Description]</td><td width=15% valign=\"top\"><font color=#4987ED><b>$arr2[Model]</b></font></strong></td><td valign=\"top\" width=15% align=center><b><font color=red>$arr2[Price]</font></b></td>"
."<td valign=\"top\"><strong><u><font color=\"red\"><img src=\"images/icon_shop_cart.gif\" width=\"15\" height=\"11\" align='absmiddle'>､ﾅﾔ｡狎ﾗ靉ﾊﾑ隗ｫﾗ鯱</font></u></strong></td>"
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
								echo "[ <a href=\"$scriptname?data=advance_search&advance_search=$advance_search&brandsearch=$brandsearch&classsearch=$classsearch&values=$values&search=$search&page=$check&pagesize=$pagesize\"><< ﾋｹ鰓ｷﾕ鞦ﾅ鯢</a> ]";
						}
						if($checkpage < $maxcount){
							$check=$checkpage+1;
								echo "[ <a href=\"$scriptname?data=advance_search&advance_search=$advance_search&brandsearch=$brandsearch&classsearch=$classsearch&values=$values&search=$search&page=$check&pagesize=$pagesize\">ﾋｹ鰓ｶﾑｴ莉 >></a> ]";
						}
						
						$pad="";
						$Scriptname=${"Script_Name"};
						for($n=1;$n<=$maxcount;$n=$n+1){
							if($n>=10){$pad="";}
							echo " [";
							$ref="<a href=".$Scriptname."?data=advance_search&advance_search=$advance_search&brandsearch=$brandsearch&classsearch=$classsearch&values=$values&search=$search&page=".$n."&pagesize=".$pagesize.">".$pad.$n."</a>";
							echo " ".$ref." ";
							echo "] ";
						}
				echo "</td></tr>"
                        ."</table>";

						
 }else {
 				echo "<br><font size=4 color=red><b>菽霎ｺ｢鯱ﾁﾙﾅｷﾕ襍鯱ｧ｡ﾒﾃ､鮖ﾋﾒ</b></font><br>";
}				
						}else {
								echo "<br><br><center><font size=4><b>｡ﾃﾘｳﾒ｡ﾃﾍ｡｢鯱ﾁﾙﾅｷﾕ襍鯱ｧ｡ﾒﾃ､鮖ﾋﾒ</b></font></center><br><br>";
						}

?>
<?
}else{
?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="../npe/images/header.gif">
        <tr> 
          <td align="right"><strong><font size="3" color="#ffffff"> <?echo "<font color=white size=3><b>Advance Search</b></font>&nbsp;&nbsp;";?> 
            </font></strong></td>
        </tr>
      </table> </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"> <form action="../npe/left.php?data=advance_search" method="post" name="form_new" id="form_new" onSubmit="return check()">
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td width="37%" align="right"><strong>｢鯱､ﾇﾒﾁｷﾕ襍鯱ｧ｡ﾒﾃ､鮖 :</strong></td>
            <td width="63%"><input name="advance_search" type="text" id="advance_search" size="25"></td>
          </tr>
          <tr> 
            <td align="right"><strong>､鮖ﾋﾒｨﾒ｡ :</strong></td>
            <td><select name="select" onChange="MM_jumpMenu('parent',this,0)">
              <? if($values==1){
				echo "<option value=\"index.php?data=advance_search&values=1\" selected>ﾃﾋﾑﾊﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=1\">ﾃﾋﾑﾊﾊﾔｹ､鰓</option>";
			  }
			  ?>
			  <? if($values==2){
				echo "<option value=\"index.php?data=advance_search&values=2\" selected>ﾃﾒﾂﾅﾐ猩ﾕﾂｴﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=2\">ﾃﾒﾂﾅﾐ猩ﾕﾂｴﾊﾔｹ､鰓</option>";
			  }
			  ?><? if($values==3){
				echo "<option value=\"index.php?data=advance_search&values=3\" selected>ﾃﾘ雹｢ﾍｧﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=3\">ﾃﾘ雹｢ﾍｧﾊﾔｹ､鰓</option>";
			  }
			  ?>			  <? if($values==4){
				echo "<option value=\"index.php?data=advance_search&values=4\" selected>ﾂﾕ靈鯱｢ﾍｧﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=4\">ﾂﾕ靈鯱｢ﾍｧﾊﾔｹ､鰓</option>";
			  }
			  ?>			  <? if($values==5){
				echo "<option value=\"index.php?data=advance_search&values=5\" selected>ﾃﾒ､ﾒﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=5\">ﾃﾒ､ﾒﾊﾔｹ､鰓</option>";
			  }
			  ?><? if($values==6){
				echo "<option value=\"index.php?data=advance_search&values=6\" selected>ｻﾃﾐ狢ｷ｢ﾍｧﾊﾔｹ､鰓</option>";
			  }else {
				echo "<option value=\"index.php?data=advance_search&values=6\">ｻﾃﾐ狢ｷ｢ﾍｧﾊﾔｹ､鰓</option>";
			  }
			  ?>
              </select> <input name="values" type="hidden" id="values" value="<?=$values?>"> 
            </td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td>
            <td>
			<?
			if($values==4){
			$query3="SELECT * FROM  ".$prefix."newbrand";
			$log3=mysql_query($query3,$conn);
			$numrow3=mysql_num_rows($log3);
				echo "<select name=\"brandsearch\">";
              for($i=1;$i<=$numrow3;$i++){
			  $arr3=mysql_fetch_array($log3);	
				echo "<option value=\"$arr3[brand_no]\"> $arr3[brand_value] </option>";	
			  }
				echo "</select>";
			 }
			  ?>
			  <?
			if($values==6){
			$query3="SELECT * FROM  ".$prefix."newclass";
			$log3=mysql_query($query3,$conn);
			$numrow3=mysql_num_rows($log3);
				echo "<select name=\"classsearch\">";
              for($i=1;$i<=$numrow3;$i++){
			  $arr3=mysql_fetch_array($log3);	
				echo "<option value=\"$arr3[class_no]\"> $arr3[class_value] </option>";	
			  }
				echo "</select>";
			 }
			  ?></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><input type="submit" name="Submit" value="､鮖ﾋﾒ｢鯱ﾁﾙﾅ">
              &nbsp;
              <input name="search" type="hidden" id="search" value="1"></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><a href="../npe/index.php?data=advance_search"><b>
              <script language="JavaScript">
function check()
{
      var v1 = document.form_new.advance_search.value;

        if (v1.length==0)
           {
           alert("｡ﾃﾘｳﾒｻ鯱ｹ｢鯱ﾁﾙﾅｷﾕ襍鯱ｧ｡ﾒﾃ､鮖ﾋﾒ");
           document.form_new.advance_search.focus();           
           return false;
           }else
           return true;
}
</script>
              </b></a></td>
          </tr>
        </table>
      </form></td>
    <td width="5" align="right" valign="top" background="../npe/images/x_r2_c5.gif"><img src="../npe/images/x_r2_c5.gif" width="5" height="1"></td>
  </tr>
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r4_c1.gif" width="5" height="5"></td>
    <td valign="top" background="../npe/images/x_r4_c4.gif"><img src="../npe/images/x_r4_c4.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r4_c5.gif" width="5" height="5"></td>
  </tr>
</table>
<? } ?>
</body>
</html>
