<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Database clear</title>
</head>
<body>
<?php  
$hostname_conn = "localhost";
$database_conn = "poadb";
$username_conn = "root";
$password_conn = "poa";
$conn = mysql_pconnect($hostname_conn, $username_conn, $password_conn) or trigger_error(mysql_error(),E_USER_ERROR); 
mysql_select_db($database_conn,$conn);
if(mysql_query("DROP TABLE users")){echo"Table users clear<br>";}
if(mysql_query("DROP TABLE admin")){echo"Table admin clear<br>";}
if(mysql_query("DROP TABLE teacher")){echo"Table teacher clear<br>";}
if(mysql_query("DROP TABLE student")){echo"Table student clear<br>";}
if(mysql_query("DROP TABLE subject")){echo"Table subject clear<br>";}
if(mysql_query("DROP TABLE course")){echo"Table course clear<br>";}
if(mysql_query("DROP TABLE store")){echo"Table store clear<br>";}
if(mysql_query("DROP TABLE register")){echo"Table register clear<br>";}
if(mysql_query("DROP TABLE news")){echo"Table news clear<br>";}
if(mysql_query("DROP TABLE QandA")){echo"Table QandA clear<br>";}
if(mysql_query("DROP TABLE webboard_data")){echo"Table webboard_data clear<br>";}
if(mysql_query("DROP TABLE webboard_ans")){echo"Table webboard_ans clear<br>";}
if(mysql_query("DROP TABLE webboard_member")){echo"Table webboard_member clear<br>";}
if(mysql_query("DROP TABLE useronline")){echo"Table useronline clear<br>";}

if(mysql_query("DROP TABLE config")){echo"Table config clear<br>";}
echo"<br>";
//if(mysql_query("DROP Database poadb")){echo"Database clear<br>";}
?>
</body>
</html>
