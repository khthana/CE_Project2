<head>
<title>Search Result </title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<style type="text/css">
<!--
.style1 {
	font-size: 12px;
	font-weight: bold;
}
.style2 {font-size: large}
.style4 {font-size: large; font-weight: bold; }
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<p>



</p>
<p class="style4"><span class="style4">SEARCH RESULT</span>: </p>
<table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolor="#FF6600">
    <tr>
      <td colspan="2"><div align="center" class="style1 style2">
        <p>Your Picture <br>
          <img src="http://161.246.5.92/<?php echo $filename ?>" width="200" height="100">          <br>
        </p>
      </div></td>
    </tr>
    <tr>
      <td width="56%"><div align="center" class="style4">
        <p>Source</p>
      </div></td>
      <td width="44%"><div align="center" class="style4">
        <p>Picture</p>
      </div></td>
    </tr>
<?php
$color2 = $display;
$color2 = substr($color2, 1); 
$color2 = substr($color2, 0, strlen($color2) - 1); 
$explode2 = explode(", ", $color2);
//echo $color2."<br>";
$match = 0;
$f_match = 0;

$username="root";
$password="";
$database="python";
mysql_connect(localhost,$username,$password);
@mysql_select_db($database) or die( "Unable to select database");

$query = "SELECT * FROM table_image";
$result = mysql_query($query);

$num=mysql_numrows($result);

$j=0;
while ($j < $num) {

$id=mysql_result($result,$j,"id");
$urlimage=mysql_result($result,$j,"urlimage");
$date=mysql_result($result,$j,"date");
$histogram=mysql_result($result,$j,"histogram");

$color1 = $histogram;
// Delete [ at head and ] at tail
$color1 = substr($color1, 1); 
$color1 = substr($color1, 0, strlen($color1) - 1); 
// Explode color to Array explode1 and explode2
$explode1 = explode(", ", $color1);
//echo $color1;
// Compare position
for ($i = 0; $i <= 215; $i++) {
    if ($explode1[$i] != $explode2[$i])
	{
		if ((($explode1[$i] - $explode2[$i])  <= 5) and (($explode1[$i] - $explode2[$i])  >= -5))
			echo "";//$match = 0;
		else 
			$match =1 ;
	}
}
if ($match == 0){			
			 echo " <tr>";
			 echo "    <td height=\"110\"><div align=\"center\">".$urlimage."</div></td>";
			 echo "    <td><div align=\"center\"><img src=\"".$urlimage."\" width=\"200\" height=\"100\"></div></td>";
			 echo " </tr>";
			 $f_match = 1;
}
///////
$match = 0;
$j++;
}
mysql_close();
?>
</table>

<?php
if ($f_match == 0){	echo "NOT MATCH !!!!!"; }
?>
</p>
<iframe src="http://161.246.5.92/delete.php?filename=<?php echo $filename;?>" height="0" width="0" frameborder="0"></iframe>
</body>
</html>
