<?php
include 'menu.php';
@session_start();
// basic sequence with LDAP is connect, bind, search, interpret search
// result, close connection
// $ldaphost = "127.0.0.1";
// $login_dn = "cn=Administrator,cn=Users,dc=companyb,dc=com";
// $login_pass = "Fv,gruhp";
// $base_dn = "ou=Students,dc=companyb,dc=com";

// echo "login dn : ".$_SESSION['ss_login_dn']."<br />";
// echo "password : ".$_SESSION['ss_login_pass']."<br />";
// echo "host : ".$_SESSION['ss_ldaphost']."<br />";


$ldapfilter  = isset($_POST['filter']) ? $_POST['filter'] : null;

echo "<h3>LDAP Search</h3>";
echo "Connecting ...";
$ds=@ldap_connect($_SESSION['ss_ldaphost']);  // must be a valid LDAP server!
ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3);
ldap_set_option($ds, LDAP_OPT_REFERRALS, 0);
echo "connect result is " . $ds . "<br />";

if ($ds) {
   echo "Binding ...";
   $r=@ldap_bind($ds,$_SESSION['ss_login_dn'],$_SESSION['ss_login_pass']);
   echo "Bind result is " . $r . "<br />";

   echo "Searching for (".$ldapfilter.") ...";

   $sr=@ldap_search($ds, $_SESSION['ss_base_dn'], $ldapfilter);
   echo "Search result is " . $sr . "<br />";

   echo "Number of entires returned is " . @ldap_count_entries($ds, $sr) . "<br />";

   echo "Getting entries ...<p>";
   $info = @ldap_get_entries($ds, $sr);
   echo "Data for " . $info["count"] . " items returned:<p>";

   for ($i=0; $i<$info["count"]; $i++) {
       echo "dn is: " . $info[$i]["dn"] . "<br />";
       echo "first cn entry is: " . $info[$i]["cn"][0] . "<br />";
       echo "first email entry is: " . $info[$i]["mail"][0] . "<br /><hr />";
   }

   @ldap_close($ds);

} else {
   echo "<h4>Unable to connect to LDAP server</h4>";
}
?>
