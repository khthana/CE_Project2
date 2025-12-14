<?php
include "service_register.php";

$params["user_id"] = $_GET["userid"];
$params["type"] = "bg";
$params["passkey"] = $passkey;

$message = $client->call('obtain_image', $params);

if ($message["success"] == "no") {
	$mode = "url";
	$url = "http://soi13.com/blog/images/1px.jpg";
} else {
	$mode = $message["mode"];
	$url = $message["url"];
}

if ($mode == "file") {
	$dec = base64_decode($message["enc_image"]);

	header("Content-type: image");
	print $dec;

} else {

	if (!@getimagesize($url)) { 
		$url = "http://soi13.com/blog/images/1px.jpg";	
	}

	$imginfo = getimagesize($url);

	(!$imginfo) ? $imginfo = getimagesize("http://soi13.com/blog/images/1px.jpg") : "" ;

	switch ($imginfo['mime']) {
		case 'image/gif' :
			$imgGif = imagecreatefromgif($url);

			header("Content-type: image/gif");

			imagegif($imgGif);
			imagedestroy($imgGif);

			break;
		
		case 'image/jpeg' :
			$imgJpg = imagecreatefromjpeg($url);

			header("Content-type: image/jpeg");

			imagejpeg($imgJpg);
			imagedestroy($imgJpg);

			break;

		case 'image/png' :
			$imgPng = imagecreatefrompng($url);

			header("Content-type: image/png");

			imagejpeg($imgPng);
			imagedestroy($imgPng);

			break;

		case 'image/wbmp' :
			$imgWbmp = imagecreatefromwbmp($url);

			header("Content-type: image/png");

			imagejpeg($imgWbmp);
			imagedestroy($imgWbmp);

			break;
	}

}

?>