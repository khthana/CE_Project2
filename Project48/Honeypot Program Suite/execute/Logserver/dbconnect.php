<?

#include("conf.php");
$host="localhost";
$uid="snort";
$pwd="honeypot";
$dbname="snort";

$con = mysql_connect($host, $uid, $pwd) or die("Unable to connect to database");
@mysql_select_db("$dbname") or die ("Unable to select database");

?>
