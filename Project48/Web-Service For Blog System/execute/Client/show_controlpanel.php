<?php
	session_start();
	include ("user_conf.php");
	
	#Logout Case	
	if ($_GET['action']=="logout") {
		delete_cookie_func();
		$_SESSION['ss_Access'] = "";							#username mismatch with password
		$_SESSION['ss_Access_Error'] = "";

		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_archive.php?userid=".$_GET[userid]."&month=".$_GET[month]."&year=".$_GET[year]."\"> \n" ;
		exit();
	}
	
	#Login check
	$login = login_func();
	if ($login == "yes") {
		print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=show_archive.php?userid=".$_GET[userid]."&month=".$_GET[month]."&year=".$_GET[year]."\"> \n" ;
		exit();
	}
	
	#Get template & item variable
	$message = get_layout ($author_userid);
	$layout = $message[layout];
	$item_seq = $message[item_seq];
	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><?php print $title; ?></title>
<?php
	print "
				<script  language=\"javascript\" type=\"text/javascript\">
				var myVersion = parseInt(navigator.appVersion);
				var is_ie   = ((myAgent.indexOf(\"msie\") != -1)  && (myAgent.indexOf(\"opera\") == -1));
				var is_win   =  ((myAgent.indexOf(\"win\")!=-1) || (myAgent.indexOf(\"16bit\")!=-1));
				
				function emotion(emotion) {
					doInsert(emotion, \"\", false);
				}
				
				function doInsert(ibTag, ibClsTag, isSingle)
				{
					var isClose = false;
					var obj_ta = document.commenter.Post;
				
					if ( (myVersion >= 4) && is_ie && is_win) // Ensure it works for IE4up / Win only
					{
						if(obj_ta.isTextEdit){ // this doesn't work for NS, but it works for IE 4+ and compatible browsers
							obj_ta.focus();
							var sel = document.selection;
							var rng = sel.createRange();
							rng.colapse;
							if((sel.type == \"Text\" || sel.type == \"None\") && rng != null){
								if(ibClsTag != \"\" && rng.text.length > 0)
									ibTag += rng.text + ibClsTag;
								else if(isSingle)
									isClose = true;
					
								rng.text = ibTag;
							}
						}
						else{
							if(isSingle)
								isClose = true;
					
							obj_ta.value += ibTag;
						}
					}
					else
					{
						if(isSingle)
							isClose = true;
				
						obj_ta.value += ibTag;
					}
				
					obj_ta.focus();
					
					// clear multiple blanks
				//	obj_ta.value = obj_ta.value.replace(/  /, \" \");
				
					return isClose;
				}	
				</script>
			";
?>
<script language="javascript" type="text/javascript">
function checkLogin(form) {
	User= document.loginForm.tusername.value;
	Pass= document.loginForm.tpassword.value;
	if ((!User)&&(!Pass)) { 
		alert('กรุณาใส่Username และ Password ด้วยค่ะ');
		return false;
	} else {
		return true;
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="user_css.css" rel="stylesheet" type="text/css">
</head>

<center><body>
  <div class="content">
		<div class="header">User's index</div>
		<div class="status">
		<?php
			 
			if ((!$_COOKIE["username"])&&(!$_COOKIE["password"])&&($_SESSION['ss_Access'] != "valid")) {
		?>
		  <form name="loginForm" method="post" action="<?php print "?contentid=".$_GET['contentid'].""; ?>"  style=" margin:0px ; "onSubmit="return checkLogin (this.form)">
		    <table width="750" border="0" cellspacing="0" cellpadding="0" >
              <tr align="center" valign="middle">
                <td width="349"><?php ($_SESSION['ss_Access_Error']) ? print  "Warning : ".$_SESSION['ss_Access_Error'] : "";
												print $error_post_comment;?></td>
                <td width="70"><strong>Username :</strong></td>
                <td width="65"><input name="tusername" type="text" id="tusername" size="10" maxlength="20"></td>
                <td width="63"><strong>Password :</strong></td>
                <td width="64"><input name="tpassword" type="password" id="tpassword2" size="10" maxlength="20"></td>
                <td width="93"><input name="cremember" type="checkbox" id="cremember2" value="remember">&nbsp;<strong>Remember</strong></td>
                <td width="46"><input type="submit" name="Submit" value="Login" ></td>
              </tr>
            </table>
		  </form>
		  <?php
		  		} if (($_SESSION['ss_Access'] == "valid") ||(($_COOKIE["username"])&&($_COOKIE["password"]))) {
		  			$prefix = str_replace("show_content.php", "show_blog.php?userid=".$_COOKIE['user_id'],$_SERVER['PHP_SELF']);
		  			print 	"<span style=\"font-size:12px\"> คุณ Login เป็น&nbsp;:&nbsp;
								 <a class=\"status\" href=\"".$prefix."\">".$_COOKIE['username']."</a>&nbsp;|&nbsp;
								 <a class=\"status\" href=\"show_blog.php?action=logout\">Logout</a></span>";
		  		}
		  ?>
	</div>
		<?php
			$layout = "1";
			get_config_menu();
		?>
		</div>
</body></center>
</html>
<?php
#########################Function GET_CONFIG_MENU##########################
function get_config_menu () {
	print 	"<div class=\"item\" style=\"float:left;\">
					<div class=\"item_topic\">Menu</div>
					<div class=\"center_content\">
						Profile<br>
						<a href=\"show_setting.php\" >Setting</a><br>
						<a href=\"show_theme.php\" >Theme</a><br>
				  </div>
				</div>";
}

#########################Function GET_CONFIG_PROFILE##########################

?>