<?
function sendmail($Username,$Email)
{
echo"<img src=./images/email.gif width=14height=10 border=0 alt='Mail to $Username'>";
echo "\t<img src='./images/tc.gif' ><a href=\"mail2me.php?wemail=$Email&&name=$Username\" target=\"mail2me\">$Email";
}

function checkicq($uin)
{
  echo"\t\t<img src='http://web.icq.com/whitepages/online?icq=$uin&img=20' alt='ICQ-$uin'>";
}

function showdate($revdate)
{
$d3=substr($revdate,0,2);
$d2=substr($revdate,2,2);
$d1=substr($revdate,4,2);
$date=$d1."/".$d2."/".$d3;

return $date;
}


function ssendmail($from,$to,$subject,$body)
{

include("smtpmail.php");

}

?>
