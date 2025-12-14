<?php
session_start();
$user_id=0;
$crp_password='';
$user_type='';
session_unregister("user_id");
session_unregister("user_type");
session_unregister("crp_password");
session_destroy();
     
header("Location:http://document.ce.kmitl.ac.th/index.php?logout=true"); 

?>