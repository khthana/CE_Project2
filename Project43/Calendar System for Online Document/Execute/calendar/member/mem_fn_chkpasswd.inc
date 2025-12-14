<?
function chk_user_pass($word1)
{
	$word=trim($word1);
	$pos_space=strpos($word1," ");
	$pos_quot=strpos($word1,'"');
	$pos_comma=strpos($word1,","); 
	$pos_slash1=strpos($word1,"/");
	$pos_slash2=strpos($word1,'\\');
	$pos_dot=strpos($word1,".");
	$pos_quot2=strpos($word1,"'");
	$pos_semi=strpos($word1,";");
	if($pos_space !== false || $pos_quot !== false  || $pos_comma !== false || $pos_slash1 !== false || $pos_slash2 !== false || $pos_dot !== false || $pos_quot2 !== false || $pos_semi !== false)
	{ return "F";
	}else
	{
		return "T";
	}
} //function
//--------------------------------------
$host="localhost";

$usermysql="magazine";

$password="magazine";

$table="ads_usr";

$db="magazine";

mysql_connect($host,$usermysql,$password) or

die("äÁèÊÒÁÒÃ¶µÔ´µèÍ°Ò¹¢éÍÁÙÅä´é");

mysql_select_db("magazine") or die("äÁèÊÒÁÒÃ¶µÔ´µèÍá¿éÁ¢éÍÁÙÅä´é"); 

//---------main-----------
$sql="select * from member where mem_username = '$user'";

	$result=mysql_db_query("magazine",$sql);

	$nrow = @mysql_num_rows($result);

 if($nrow<1)
   {

		$num_chk=9;//true
		if(strlen($user)<3)
		{
		$err=6;
		$num_chk=1;//false
		}elseif($pass<>$pass2)
		{
		$err=2;
		$num_chk=1;//false
		}elseif(strlen($pass)<4)
		{ 
				$err=5;
				$num_chk=1;//false
		}elseif(chk_user_pass($user)=="F")
		{		$err=7;
				$num_chk=1; //false
		}elseif(chk_user_pass($pass)=="F")
		{		$err=8;
				$num_chk=1; //false
	    }

}else //nrow
{
		$num_chk=1;//false
		$err=1;
 }   
            
mysql_close();
?>