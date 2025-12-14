<?
include "nusoap.php";
include "config.inc.php";

$serviceURL= "http://network33.ce.kmitl.ac.th/service/server/server.php";
$client = new soapclient($serviceURL);

$params["user"] = $username;
$params["password"] = $password;

$message = $client->call('service_register', $params);

$success = $message["success"];

$passkey = $message["passkey"];

$error_message = $message["error_message"];

if($success == "no"){
	echo "ระบบไม่สามารถให้บริการได้ เนื่องจาก : $error_message \n";
	exit();
}

unset($params);
unset($success);
unset($error_message);

?>