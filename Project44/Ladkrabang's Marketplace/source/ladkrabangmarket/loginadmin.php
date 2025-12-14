<?
session_start();

function no_auth_msg() {
   global $PHP_SELF;
   $page = basename($PHP_SELF);

   echo "<h1>401 Authorization Required</h1>";
   echo "This server could not verify that you are authorized to access the document requested. ";
   echo "Either you supplied the wrong credentials (e.g., bad password), or your browser doesn't ";
   echo "understand how to supply the credentials required. Please ";
   echo "<a href=\"loginadmin/$page\">";
   echo "click here</a> to try again.";
}

function authenticate() {
   Header("WWW-Authenticate: Basic realm=\"Administrator Area\",strftime('%c',time())");
   Header("HTTP/1.0 401 Unauthorized");
   no_auth_msg();
   exit;
}

if (isset($PHP_AUTH_USER)) {


   // Verify username and pw
   include("config.inc.php");

   
     if (($PHP_AUTH_USER ==$admin) &&( $PHP_AUTH_PW ==$admin_pwd )) {
      // User is valid
		$isadmin=1;
		session_register("isadmin");
	  header("Location: admin/menuadmin.php");
      exit;
   } else {
      // User is not valid
      authenticate();
   }
} else {
   // username is not yet set
   // Show authentication dialogue
   authenticate();
}



?>


 

