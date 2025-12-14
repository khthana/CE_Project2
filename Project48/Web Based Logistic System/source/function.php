<?
function displaydate($x){
	$thai_m=array("มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฏาคม","สิงหาคม","กันยายน","ตุลาคม","พฤจิกายน","ธันวาคม");
	$date_array=explode("-",$x);
	$y=$date_array[0];
	$m=$date_array[1]-1;
	$d=$date_array[2];
	
	$m=$thai_m[$m];
	$y=$y+543;
	
	$displaydate="$d   $m   $y";
	return $displaydate;
	}
	function checkemail($checkemail){
		if(ereg("^[^@ ]+@([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9\-]{2} |net|com|gov|mil|org|edu|int)$",$checkemail) )
	{
				return true;
	}else{
		return false;
	}
	}function genid(){
		$idcus=C.U.str_pad(rand(0,9999999),7,'0'); 
		include"connect.php";
		$sql="select id_cus from customers where id_cud='$idcus'";
		$result=mysql_db_query($dbname,$sql);
		if($result)
		{ 
			genid();
		}else{
			return $idcus;
		}
	}
	function genpassword(){
		$dictionary = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		$pass = str_shuffle($dictionary);
		$pass = substr($pass, 0, 8);
		return $pass;
	}

?>
