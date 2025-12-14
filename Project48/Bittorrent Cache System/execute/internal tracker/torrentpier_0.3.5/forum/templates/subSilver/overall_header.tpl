<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="{S_CONTENT_DIRECTION}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">
{META}
{NAV_LINKS}
<title>{PAGE_TITLE} :: {SITENAME}</title>
<link rel="stylesheet" href="templates/subSilver/subSilver.css" type="text/css">

<!-- //qr -->
<script language="JavaScript" type="text/javascript" src="misc/js/main.js"></script>
<!-- IF INCL_BBCODE_JS -->
<script language="JavaScript" type="text/javascript" src="misc/js/bbcode.js"></script>
<!-- ENDIF -->
<!-- //qr end -->

<style type="text/css">
<!--
/* //temp */
/* //temp end */
-->
</style>
<!-- BEGIN switch_enable_pm_popup -->
<script language="Javascript" type="text/javascript">
<!--
	if ( {PRIVATE_MESSAGE_NEW_FLAG} )
	{
		window.open('{U_PRIVATEMSGS_POPUP}', '_phpbbprivmsg', 'HEIGHT=225,resizable=yes,WIDTH=400');;
	}
//-->
</script>
<!-- END switch_enable_pm_popup -->
<script language="javascript">
<!--
	var myimages=new Array()
	function preloadimages() {
	for (i=0;i<preloadimages.arguments.length;i++) {
		myimages[i]=new Image()
		myimages[i].src=preloadimages.arguments[i]
		}
	}
preloadimages("templates/subSilver/images/cellpic3.gif","templates/subSilver/images/cellpic1.gif");
//--></script>
</head>
<body onload="preloadimages()" style="padding: 0px; margin: 0px; font: 12px Verdana,Arial,Helvetica,sans-serif;">

<!-- IF SVISTOK -->
<style type="text/css">
<!--
a.svistok:link, a.svistok:visited, a.svistok:hover, a.svistok:active {
	color: #000000; font-size: 13px; font-weight: bold; text-decoration: none; }
-->
</style>

<div style="position: absolute; top: 10px; right: 10px;">
<table cellpadding="0" cellspacing="1" border="0" bgcolor="#DEAA73">
	<tr>
		<td bgcolor="#FFFFFF">
			<table width="100%" cellpadding="0" cellspacing="2" border="0">
				<tr>
					<td align="center" bgcolor="#DEAA73" style="padding: 16px 20px 16px 20px"><a href="{U_PRIVATEMSGS}" class="svistok">{PRIVATE_MESSAGE_INFO}</a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<!-- ENDIF -->

<a name="top"></a>

<table width="100%" cellspacing="0" cellpadding="5" border="0" align="center">
	<tr>
		<td class="bodyline"><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<!-- <td><a href="{U_INDEX}"><img src="templates/subSilver/images/logo_phpBB.gif" border="0" alt="{L_INDEX}" vspace="1" /></a></td> -->
				<td align="center" width="100%" valign="middle"><!-- <span class="maintitle">{SITENAME}</span><br /><span class="gen">{SITE_DESCRIPTION}<br />&nbsp; </span> -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td class="mainmenu" align="center" valign="top" nowrap="nowrap">
							&nbsp;<a href="{TRACKER_HREF}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_tracker.gif" width="12" height="13" border="0" alt="" hspace="3" /><b>{L_TRACKER}</b></a>&nbsp;
							&nbsp;<a href="{U_FAQ}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_faq.gif" width="12" height="13" border="0" alt="{L_FAQ}" hspace="3" />{L_FAQ}</a>&nbsp;
							&nbsp;<a href="{U_SEARCH}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_search.gif" width="12" height="13" border="0" alt="{L_SEARCH}" hspace="3" />{L_SEARCH}</a>&nbsp;
							<!-- IF LOGGED_IN -->&nbsp;<a href="{U_MEMBERLIST}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_members.gif" width="12" height="13" border="0" alt="{L_MEMBERLIST}" hspace="3" />{L_MEMBERLIST}</a>&nbsp;<!-- ENDIF -->
							<!-- IF LOGGED_IN -->&nbsp;<a href="{U_GROUP_CP}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_groups.gif" width="12" height="13" border="0" alt="{L_USERGROUPS}" hspace="3" />{L_USERGROUPS}</a>&nbsp;<!-- ENDIF -->
							<!-- BEGIN switch_user_logged_out -->
							&nbsp;<a href="{U_REGISTER}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_register.gif" width="12" height="13" border="0" alt="{L_REGISTER}" hspace="3" />{L_REGISTER}</a>&nbsp;
							<!-- END switch_user_logged_out -->
						</td>
					</tr>
					<tr>
						<td class="mainmenu" height="25" align="center" valign="top" nowrap="nowrap">
							&nbsp;<a href="{U_PROFILE}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_profile.gif" width="12" height="13" border="0" alt="{L_PROFILE}" hspace="3" />{L_PROFILE}</a>&nbsp;
						<!-- IF PM_FLASH -->
							&nbsp;<a href="{U_PRIVATEMSGS}" class="mainmenu" id="flashlink0" flashtype="0" flashcolor="crimson"><img src="templates/subSilver/images/icon_mini_message.gif" width="12" height="13" border="0" alt="{PRIVATE_MESSAGE_INFO}" hspace="3" /><b><!-- IF PRIVATE_MESSAGE_INFO_UNREAD -->{PRIVATE_MESSAGE_INFO_UNREAD}<!-- ELSE -->{PRIVATE_MESSAGE_INFO}<!-- ENDIF --></b></a>&nbsp;
						<!-- ELSE -->
							&nbsp;<a href="{U_PRIVATEMSGS}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_message.gif" width="12" height="13" border="0" alt="{PRIVATE_MESSAGE_INFO}" hspace="3" /><!-- IF PRIVATE_MESSAGE_INFO_UNREAD -->{PRIVATE_MESSAGE_INFO_UNREAD}<!-- ELSE -->{PRIVATE_MESSAGE_INFO}<!-- ENDIF --></a>&nbsp;
						<!-- ENDIF -->
							&nbsp;<a href="{U_LOGIN_LOGOUT}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_login.gif" width="12" height="13" border="0" alt="{L_LOGIN_LOGOUT}" hspace="3" />{L_LOGIN_LOGOUT}</a>&nbsp;
						</td>
					</tr>
				</table></td>
			</tr>
		</table>

<div><img src="images/spacer.gif" alt="" width="1" height="6" /></div>
