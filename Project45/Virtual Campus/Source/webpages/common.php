<?PHP
include("template.php");

$My_Url=$url_home; # คือ ที่อยู่ของเวบคุณ
$Data_Url=$url_webdata; #คือที่ตั้งของ Web Database Program
$Logo_Url=$url_webdata . "/logo.gif"; #คือไฟล์โลโก้ของคุณ
$Script_Url=$url_webdata;

$db_name = "VRCampus";
$tbl_name = "users";

#CHECK SQL SERVER SUPPORT
if(!function_exists("mysql_connect")) {
	echo "<b>Error : Mysql support is not available on this server.</b>";
	exit;
}


#CHECK DATABASE IN USE
if(isset($db_name)&&($db_name!='')) {
	$header_name="Database : ".$db_name;
	$header_width=150;
	if(isset($tbl_name)) {
		$header_name=$header_name." - Table : ".$tbl_name;
		$header_width=250;
		if(isset($action)) {
		    $header_name=$header_name . " - Action : " . $action;
			$header_width=300;
		}
	}
   write_header("database",$header_name , $header_width);
} else {
	write_header("database","Database" , 100);
}


echo ("
	<style>th {text-align: center;background-color: #D3DCE3}
				.data_table {background-color: #EFEFEF}
	</style>
      <div align=center> | <a href='$Data_Url/index.html' target=_top>Home</a> 
        | <a href='$Data_Url/webdata.php'>Databases</a> 
		| <a href='$Data_Url/webdata.php?db_name=$db_name'>Tables</a> 
		|
      </div>
	 <hr size='1' width='100%'>
");



$host_name="localhost";
$link_id = mysql_connect($host_name) or die ("Could not connect");
?>