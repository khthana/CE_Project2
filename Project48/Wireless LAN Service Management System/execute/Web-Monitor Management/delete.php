<?php
include 'menu.php';
@session_start();
// basic sequence with LDAP is connect, bind, search, interpret search
// result, close connection
// $ldaphost = "127.0.0.1";
// $login_dn = "cn=Administrator,cn=Users,dc=companyb,dc=com";
// $login_pass = "Fv,gruhp";
// $base_dn = "ou=Students,dc=companyb,dc=com";

//  echo "login dn : ".$_SESSION['ss_login_dn']."<br />";
//  echo "password : ".$_SESSION['ss_login_pass']."<br />";
//  echo "host : ".$_SESSION['ss_ldaphost']."<br />";



$del_dn  = isset($_POST['deldn']) ? $_POST['deldn'] : null;

echo "<h3>LDAP Delete</h3>";
echo "Connecting ...";
$ds=@ldap_connect($_SESSION['ss_ldaphost']);  // must be a valid LDAP server!
ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3);
echo "connect result is " . $ds . "<br />";

if ($ds) {
   echo "Binding ...";
   $r=@ldap_bind($ds,$_SESSION['ss_login_dn'],$_SESSION['ss_login_pass']);     // this is an "anonymous" bind, typically
                          // read-only access
   echo "Bind result is " . $r . "<br />";

   $ldapdel=@ldap_delete($ds,$del_dn);
   if($ldapdel)
   {echo "Delete ".$del_dn." successful<br />";}
   else
   {echo "Delete failed<br />";}

   @ldap_close($ds);

} else {
   echo "<h4>Unable to connect to LDAP server</h4>";
}
?>
