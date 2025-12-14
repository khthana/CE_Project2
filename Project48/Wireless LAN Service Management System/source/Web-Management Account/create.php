<?php
include 'menu.php';
@session_start();
// basic sequence with LDAP is connect, bind, search, interpret search
// result, close connection
// $ldaphost = "127.0.0.1";
// $login_dn = "cn=Administrator,cn=Users,dc=companyb,dc=com";
// $login_pass = "Fv,gruhp";
// $base_dn = "ou=Students,dc=companyb,dc=com";

$object_name  = isset($_POST['uname']) ? $_POST['uname'] : null;
$fname = isset($_POST['name']) ? $_POST['name'] : null;
$sname  = isset($_POST['surname']) ? $_POST['surname'] : null;
$mail  = isset($_POST['email']) ? $_POST['email'] : "";
$userpass = isset($_POST['password']) ? $_POST['password'] : null;
$userpass2 = isset($_POST['rpassword']) ? $_POST['rpassword'] : null;


echo "<h3>LDAP Create</h3>";
echo "Connecting ...";
$ds=@ldap_connect($_SESSION['ss_ldaphost']);  // must be a valid LDAP server!
ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3);
echo "connect result is " . $ds . "<br />";

if ($ds) {
   echo "Binding ...";
   $r=@ldap_bind($ds,$_SESSION['ss_login_dn'],$_SESSION['ss_login_pass']);     // this is an "anonymous" bind, typically
                          // read-only access
   echo "Bind result is " . $r . "<br />";

   // prepare data
    $adduser["cn"]=$object_name ;
    $adduser["givenname"]=$fname ;
    $adduser["sn"]=$sname;
    $adduser["mail"]=$mail;
    $adduser["userAccountControl"] = "544";
    $adduser["sAMAccountName"] =$object_name;
    $adduser["userPassword"] =$userpass;
    $adduser["objectclass"][0] = "top";
    $adduser["objectclass"][1] = "person";
    $adduser["objectclass"][2] = "organizationalPerson";
    $adduser["objectclass"][3] = "user";


$dnn="cn=".$object_name.",".$_SESSION['ss_base_dn'];
// echo "fn: ".$fname."<br />";
// echo "sn: ".$sname."<br />";
// echo "mail: ".$mail."<br />";
// echo "cn : ".$object_name."<br />";
// echo "password : ".$userpass."<br />";
// echo "dnn : ".$dnn."<br />";


   // add data to directory
   $ldapadd=@ldap_add($ds, $dnn, $adduser);
   if($ldapadd)
   {echo "Create ".$dnn." successful<br />";}
   else
   {echo "Create user failed<br />";}

   @ldap_close($ds);
} else {
   echo "Unable to connect to LDAP server";
}

