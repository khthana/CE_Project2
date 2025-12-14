<?php
include 'menu.php';
 ?>
<!doctype html public "-//W3C//DTD HTML 4.01//EN">

<html>

   <head>
      <title>Edit User</title>
      <meta http-equiv="generator" content="PHP Designer 2005" />
   </head>

   <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
<?php
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


$edit_dn  = isset($_POST['editdn']) ? $_POST['editdn'] : null;

echo "<h3>LDAP Edit</h3>";

$ds=@ldap_connect($_SESSION['ss_ldaphost']);  // must be a valid LDAP server!


if ($ds) {

   $r=@ldap_bind($ds,$_SESSION['ss_login_dn'],$_SESSION['ss_login_pass']);     // this is an "anonymous" bind, typically
                          // read-only access
  //  echo "Bind result is " . $r . "<br />";
   if($r)
   {echo "Bind successful<br />";}
   else
   {echo "Bind failed<br />";}


   $sr=@ldap_search($ds, $edit_dn, "cn=*");
  //  echo "Search result is " . $sr . "<br />";

  //  echo "Number of entires returned is " . @ldap_count_entries($ds, $sr) . "<br />";

  //  echo "Getting entries ...<p>";
   $first = @ldap_first_entry($ds, $sr);
   $info =@ldap_get_attributes($ds,$first);
   // echo "Data for " . $info["count"] . " items returned:<p>";

       $username = $info["cn"][0] ;
       $fname = $info["givenName"][0] ;
       $sname = $info["sn"][0] ;
       $email = $info["mail"][0] ;
       $password = $info["userPassword"][0] ;
       $sta = $info["userAccountControl"][0] ;
       
//        echo "-username  ".$username."<br />";
//        echo "-fname  ".$fname."<br />";
//        echo "-sname  ".$sname."<br />";
//        echo "-email  ".$email."<br />";
//        echo "-password  ".$password."<br />";
//        echo "-status  ".$sta."<br />";



   @ldap_close($ds);

} else {
   echo "<h4>Unable to connect to LDAP server</h4>";
   }
 ?>
<form action="modify.php" method="POST"  name="delete">
<center>
<table>
<tr>
         <td>Name </td>
         <td><input type="text" name="name" value="<?php echo $fname; ?>" /></td>
</tr>
<tr>
         <td>Surname</td>
         <td><input type="text" name="surname" value="<?php echo $sname; ?>"/></td>
</tr>
<tr>
         <td>Email</td>
         <td><input type="text" name="email"value="<?php echo $email; ?>" /></td>
</tr>
<tr>
         <td>User name</td>
         <td><input type="text" name="uname"value="<?php echo $username; ?>" /></td>
</tr>
<tr>
         <td>Password</td>
         <td><input type="password" name="password"value="<?php echo $password; ?>" /></td>
</tr>
<tr>
         <td>Re password</td>
         <td><input type="password" name="rpassword" value="<?php echo $password; ?>"/></td>
</tr>
<?php
if ($sta=="544" || $sta=="66048")
{ ?>
<tr>
        <td><input type="radio" value="544" checked="checked"name="status" />Enable account</td>
        <td><input type="radio" value="546" name="status" />Disable account</td>
</tr>
<?php } else{?>
<tr>
        <td><input type="radio" value="544" name="status" />Enable account</td>
        <td><input type="radio" value="546" checked="checked"name="status" />Disable account</td>
</tr>
<?php } ?>
<tr>
	<td colspan="2"><center><input type="submit" name="btdel" value="<?php echo ('Edit'); ?>" /></center></td>
</table>
</center>

</form>

   </body>
</html>
