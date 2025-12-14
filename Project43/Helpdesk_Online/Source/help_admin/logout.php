<?

		session_start();

		session_unregister("admin");

		header ("Location: index.php");  

		exit;

?>