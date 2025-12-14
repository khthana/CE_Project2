<?php
@session_start();
if (session_is_registered("ss_login_dn")) session_unregister("ss_login_dn");
if (session_is_registered("ss_login_pass")) session_unregister("ss_login_pass");
if (session_is_registered("ss_ldaphost")) session_unregister("ss_ldaphost");
if (session_is_registered("ss_base_dn")) session_unregister("ss_base_dn");
?>
<script language='javascript'>
parent.location.href = "login_form.php";
</script>
