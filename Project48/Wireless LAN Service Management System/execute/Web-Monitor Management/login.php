<?php
include 'menu.php';
// basic sequence with LDAP is connect, bind, search, interpret search
// result, close connection
@session_start();
if (!session_is_registered("ss_login_dn")) session_register("ss_login_dn");
if (!session_is_registered("ss_login_pass")) session_register("ss_login_pass");
if (!session_is_registered("ss_ldaphost")) session_register("ss_ldaphost");
if (!session_is_registered("ss_base_dn")) session_register("ss_base_dn");
//if (!session_is_registered("ss_login_dn")) session_register("ss_login_dn");

$ss_login_dn  = isset($_POST['login_dn']) ? $_POST['login_dn'] : null;
$ss_login_pass = isset($_POST['login_pass']) ? $_POST['login_pass'] : null;
//$uid = isset($_POST['uid']) ? $_POST['uid'] : null;

// echo "login dn : ".$ss_login_dn."<br />";
// echo "password : ".$ss_login_pass."<br />";


$ss_ldaphost = "127.0.0.1";
$ss_base_dn = "ou=Students,dc=companyb,dc=com";

//$login_dn = "cn=Administrator,cn=Users,dc=companyb,dc=com";
//$login_pass = "Fv,gruhp";

echo "Connecting ...";
$ds=@ldap_connect($ss_ldaphost);  // must be a valid LDAP server!
ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3);
ldap_set_option($ds, LDAP_OPT_REFERRALS, 0);
echo "connect result is " . $ds . "<br />";

if ($ds) {
   echo "Binding ...";
   $r=@ldap_bind($ds,$ss_login_dn,$ss_login_pass);
                          // read-only access
   echo "Bind result is " . $r . "<br />";
   if($r)
   {echo "Bind successful<br />";}
   else
   {echo "Bind failed<br />";}
   
   }

   @ldap_close($ds);

?>
