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
#	$message = get_layout ($author_userid);
#	$layout = $message[layout];
#	$item_seq = $message[item_seq];
	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<title><?php print $title; ?></title>
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

function displayWindow(url, width, height) {
        var Win = window.open(url,"displayWindow",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=no,menubar=no,status=no' );
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
                <td width="75">Edit your blog </td>
                <td width="274"><?php ($_SESSION['ss_Access_Error']) ? print  "Warning : ".$_SESSION['ss_Access_Error'] : "";
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
<div class="item" style="float:left;">
			<div class="item_topic">Profile</div>
		  <div class="item_content">
				<div><img src="images/avatar.jpg" width="100" height="120"></div>
				<div class="comment_content">
				<strong>Name : </strong><br>
				Age : <br>
				Favourite : <br>
				</div>
		  </div>
			<div class="item_topic">Archive</div>
			<div class="center_content">
				<a href="#" >September 2005</a><br>
				<a href="#" >December 2005</a><br>
				<a href="#" >January 2006</a><br>
		  </div>
			<div class="item_topic">Category</div>
			<div class="item_content">
				<a href="#" >Music</a><br>
				<a href="#" >Travel</a><br>
				<a href="#" >Technology</a><br>
				<a href="#" >Education</a><br>
			</div>
			<div class="item_topic">Search</div>
			<div class="item_content" style="text-align:center; margin:0px; padding:0px; width:100%;">
				  <form name="form1" method="post" action="" style="margin:0px;  ">
					<input name="tsearch" type="text" id="tsearch" size="15">
					<br>
					<input name="scoperadio" type="radio" value="local" checked>Local
					<input name="scoperadio" type="radio" value="global"> Global
					<br>
					<div style="text-align:left; padding-left:5px;">
						<input name="checktopic" type="checkbox" disabled id="checktopic" value="yes" checked>Topic
						<input name="checkmsg" type="checkbox" id="checkmsg" value="yes">Content</div>
					<div style="text-align:left; padding-left:5px;">
						<input name="checkcomment" type="checkbox" id="checkcomment" value="yes">Comment</div>
				  </form>
			</div>
			<div class="item_topic">Favourite</div>
			<div class="center_content">
				<a href="#" >Favourite1</a><br>
				<a href="#" >Favourite2</a><br>
				<a href="#" >Favourite3</a><br>
			</div>
		</div>
		<div class="center" style="width:470px; margin-left:10px; float:left; ">
			<div class="center_topic1">Introduction</div>
			
				<?php include ("richtext.php");?>
			<div class="status" style="margin-bottom:px; margin-top:10px; ">Copyright 2003 - 2005 soi13.com.,ALL RIGHT RESERVED</div>
		</div>
				<div class="item" style="float:right;">
			<div class="item_topic">Profile</div>
		  <div class="item_content">
				<div><img src="images/avatar.jpg" width="100" height="120"></div>
				<strong>Name : </strong><br>
				Age : <br>
				Favourite : <br>
		  </div>
			<div class="item_topic">Archive</div>
			<div class="center_content">
				<a href="#" >September 2005</a><br>
				<a href="#" >December 2005</a><br>
				<a href="#" >January 2006</a><br>
			</div>
			<div class="item_topic">Category</div>
			<div class="item_content">
				<a href="#" >Music</a><br>
				<a href="#" >Travel</a><br>
				<a href="#" >Technology</a><br>
				<a href="#" >Education</a><br>
			</div>
			<div class="item_topic">Favourite</div>
			<div class="center_content">
				<a href="#" >Favourite1</a><br>
				<a href="#" >Favourite2</a><br>
				<a href="#" >Favourite3</a><br>
			</div>
		</div>
	</div>
</body></center>
</html>
<?php
#########################Function GET_CONFIG_PROFILE##########################

?>