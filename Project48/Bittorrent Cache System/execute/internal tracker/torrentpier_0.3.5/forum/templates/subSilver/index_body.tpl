<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" style="margin-top:3px;">
  <tr>
	<td align="left" valign="bottom">
		<!-- //bt -->
		<!-- BEGIN user_ratio -->
		<span class="gensmall"><span class="genmed"><b>UL</b></span>/<span class="genmed"><b>DL:</b> &nbsp;</span><span class="seedmed"><b>{user_ratio.U_UP_TOTAL}</b></span> / <span class="leechmed"><b>{user_ratio.U_DOWN_TOTAL}</b></span><span class="genmed"> [ <b>{user_ratio.U_RATIO}</b> ]</span></span><br />
		<!-- END user_ratio -->
		<!-- //bt end -->
	<!-- BEGIN switch_user_logged_in -->
	<span class="gensmall">{LAST_VISIT_DATE}<br />
	<!-- END switch_user_logged_in -->
	</span><span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
	<td align="right" valign="bottom" class="gensmall">
		<!-- BEGIN switch_user_logged_in -->
		<a href="{U_SEARCH_NEW}" class="gensmall"><b>{L_SEARCH_NEW}</b></a><br /><a href="{U_SEARCH_SELF}" class="gensmall">{L_SEARCH_SELF}</a><br />
		<!-- END switch_user_logged_in -->
		<a href="{U_SEARCH_UNANSWERED}" class="gensmall">{L_SEARCH_UNANSWERED}</a></td>
  </tr>
</table>

<table width="100%" cellpadding="1" cellspacing="1" border="0" class="forumline">
<tr>
	<th colspan="2" class="thCornerL" height="18" nowrap="nowrap">&nbsp;{L_FORUM}&nbsp;</th>
	<th width="50" class="thTop" nowrap="nowrap">&nbsp;{L_TOPICS}&nbsp;</th>
	<th width="50" class="thTop" nowrap="nowrap">&nbsp;{L_POSTS}&nbsp;</th>
	<th class="thCornerR" nowrap="nowrap">&nbsp;{L_LASTPOST}&nbsp;</th>
</tr>
<!-- BEGIN catrow -->
<tr>
	<td class="cat" colspan="5" style="padding-left: 12px; height: 26px"><span class="cattitle"><a href="{catrow.U_VIEWCAT}" class="cattitle">{catrow.CAT_DESC}</a></span></td>
</tr>
<!-- BEGIN forumrow -->
<tr>
	<td class="row1" align="center" valign="middle" height="30" style="padding: 2px 0px 2px 0px"><img src="{catrow.forumrow.FORUM_FOLDER_IMG}" width="46" height="25" alt="{catrow.forumrow.L_FORUM_FOLDER_ALT}" title="{catrow.forumrow.L_FORUM_FOLDER_ALT}" /></td>
	<td class="row1" width="100%" valign="middle" style="padding: 4px 4px 5px 4px">
		<div class="forumlink"><a href="{catrow.forumrow.U_VIEWFORUM}" class="forumlink">{catrow.forumrow.FORUM_NAME}</a></div>
		<!-- IF catrow.forumrow.FORUM_DESC --><div class="genmed" style="margin-top: 1px">{catrow.forumrow.FORUM_DESC}</div><!-- ENDIF -->
		<!-- BEGIN sf -->
		<!-- IF catrow.forumrow.sf.SF_NUM == 1 -->
		<div><img src="images/spacer.gif" alt="" width="1" height="2" /></div>
		<span class="genmed">{L_SUBFORUMS}:</span>
		<!-- ENDIF -->
		<img style="margin-right: 1px" src="{catrow.forumrow.sf.SF_IMG_SRC}" width="12" height="9" title="{catrow.forumrow.sf.SF_IMG_TITLE}"><a class="gensmall" href="{catrow.forumrow.sf.SF_HREF}" title="{catrow.forumrow.sf.SF_DESC}"><b>{catrow.forumrow.sf.SF_NAME}</b></a><!-- IF catrow.forumrow.sf.SF_LAST_SUBF --> <!-- ELSE -->, <!-- ENDIF -->
		<!-- END sf -->
		<!-- IF catrow.forumrow.MODERATORS --><div class="gensmall" style="margin-top: 2px">{catrow.forumrow.L_MODERATOR}: {catrow.forumrow.MODERATORS}</div><!-- ENDIF -->
	</td>
	<td class="row2" align="center" valign="middle"><span class="genmed">{catrow.forumrow.TOPICS}</span></td>
	<td class="row2" align="center" valign="middle"><span class="genmed">{catrow.forumrow.POSTS}</span></td>
	<td class="row2" align="center" valign="middle" nowrap="nowrap" style="padding: 4px">
		<!-- BEGIN last -->
			<!-- IF catrow.forumrow.last.FORUM_LAST_POST && catrow.forumrow.last.LAST_POST_USER_NAME -->

				<!-- IF catrow.forumrow.last.SHOW_LAST_TOPIC -->
				<div class="genmed"><a class="genmed" title="{catrow.forumrow.last.LAST_TOPIC_TIP}" href="{catrow.forumrow.last.LAST_TOPIC_HREF}">{catrow.forumrow.last.LAST_TOPIC_TITLE}</a> <a href="{catrow.forumrow.last.LAST_POST_HREF}"><img src="{TEMPLATE}images/icon_latest_reply.gif" border="0" width="18" height="9" alt="" title="" /></a></div>
				<div class="gensmall" style="margin-top:4px;">by
					<!-- IF catrow.forumrow.last.LAST_POST_USER_HREF -->
					<a class="gensmall" href="{catrow.forumrow.last.LAST_POST_USER_HREF}">{catrow.forumrow.last.LAST_POST_USER_NAME}</a>
					<!-- ELSE -->
					{catrow.forumrow.last.LAST_POST_USER_NAME}
					<!-- ENDIF -->
				&nbsp;{catrow.forumrow.last.LAST_POST_TIME}
				</div>

				<!-- ELSE -->
				<div class="gensmall">{catrow.forumrow.last.LAST_POST_TIME}</div>
				<div class="gensmall" style="margin-top:3px;">
				<!-- IF catrow.forumrow.last.LAST_POST_USER_HREF -->
					<a href="{catrow.forumrow.last.LAST_POST_USER_HREF}">{catrow.forumrow.last.LAST_POST_USER_NAME}</a>
				<!-- ELSE -->
					{catrow.forumrow.last.LAST_POST_USER_NAME}
				<!-- ENDIF -->
				<a href="{catrow.forumrow.last.LAST_POST_HREF}"><img src="{TEMPLATE}images/icon_latest_reply.gif" border="0" width="18" height="9" alt="" title="" /></a>
				</div>
				<!-- ENDIF -->

			<!-- ELSE -->
			<span class="genmed">{L_NO_POSTS}</span>
			<!-- ENDIF -->

		<!-- END last -->
	</td>
</tr>
<!-- END forumrow -->
<!-- END catrow -->
</table>

<table width="100%" cellspacing="0" border="0" align="center" cellpadding="2">
  <tr>
	<td align="left"><span class="gensmall"><a href="{U_MARK_READ}" class="gensmall">{L_MARK_FORUMS_READ}</a></span></td>
		<!-- BEGIN switch_user_logged_in -->
		<!-- //bt -->
	<td align="right"><span class="gensmall"><a href="{U_SEARCH_DL_WILL}" class="gensmall">{L_SEARCH_DL_WILL} {L_SEARCH_DL}</a>&nbsp;::&nbsp;<a href="{U_SEARCH_DL_DOWN}" class="gensmall">{L_SEARCH_DL_DOWN}</a>&nbsp;::&nbsp;<a href="{U_SEARCH_DL_COMPLETE}" class="gensmall">{L_SEARCH_DL_COMPLETE}</a>&nbsp;::&nbsp;<a href="{U_SEARCH_DL_CANCEL}" class="gensmall">{L_SEARCH_DL_CANCEL}</a></span></td>
		<!-- //bt end -->
		<!-- END switch_user_logged_in -->
  </tr>
</table>

<table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
<tr>
	<td class="catHead" colspan="2" style="padding-left: 12px; height: 26px"><span class="cattitle"><a href="{U_VIEWONLINE}" class="cattitle">{L_WHO_IS_ONLINE}</a></span></td>
</tr>
<tr>
	<td class="row1" align="center" valign="middle" rowspan="2"><img src="templates/subSilver/images/whosonline.gif" alt="{L_WHO_IS_ONLINE}" /></td>
	<td class="row1" align="left" width="100%"><span class="gensmall">{TOTAL_POSTS}<br />{TOTAL_USERS}<br />{NEWEST_USER}</span></td>
</tr>
<tr>
	<td class="row1" align="left"><span class="gensmall"><!-- IF SHOW_ONLINE_LIST -->{TOTAL_USERS_ONLINE} &nbsp; [ {L_WHOSONLINE_ADMIN} ] &nbsp; [ {L_WHOSONLINE_MOD} ]<br /><!-- ENDIF -->{RECORD_USERS}<br /><!-- IF SHOW_ONLINE_LIST -->{LOGGED_IN_USER_LIST}<!-- ENDIF --></span></td>
</tr>
</table>

<table width="100%" cellpadding="1" cellspacing="1" border="0">
<tr>
	<td align="left" valign="top"><span class="gensmall">{L_ONLINE_EXPLAIN}</span></td>
	<td align="right"><span class="gensmall">{CURRENT_TIME}<br />{S_TIMEZONE}</span></td>
</tr>
</table>

<!-- BEGIN switch_user_logged_out -->
<form method="post" action="{S_LOGIN_ACTION}">
  <table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
	<tr>
	  <td class="catHead" height="28"><a name="login"></a><span class="cattitle">{L_LOGIN_LOGOUT}</span></td>
	</tr>
	<tr>
	  <td class="row1" align="center" valign="middle" height="28"><span class="gensmall">{L_USERNAME}:
		<input class="post" type="text" name="username" size="10" />
		&nbsp;&nbsp;&nbsp;{L_PASSWORD}:
		<input class="post" type="password" name="password" size="10" maxlength="32" />
		&nbsp;&nbsp; &nbsp;&nbsp;{L_AUTO_LOGIN}
		<input class="text" type="checkbox" name="autologin" />
		&nbsp;&nbsp;&nbsp;
		<input type="submit" class="mainoption" name="login" value="{L_LOGIN}" />
		</span> </td>
	</tr>
  </table>
</form>
<!-- END switch_user_logged_out -->

<br clear="all" />

<table cellspacing="3" border="0" align="center" cellpadding="0">
  <tr>
	<td width="20" align="center"><img src="templates/subSilver/images/folder_new_big.gif" alt="{L_NEW_POSTS}"/></td>
	<td><span class="gensmall">{L_NEW_POSTS}</span></td>
	<td>&nbsp;&nbsp;</td>
	<td width="20" align="center"><img src="templates/subSilver/images/folder_big.gif" alt="{L_NO_NEW_POSTS}" /></td>
	<td><span class="gensmall">{L_NO_NEW_POSTS}</span></td>
	<td>&nbsp;&nbsp;</td>
	<td width="20" align="center"><img src="templates/subSilver/images/folder_locked_big.gif" alt="{L_FORUM_LOCKED}" /></td>
	<td><span class="gensmall">{L_FORUM_LOCKED}</span></td>
  </tr>
</table>
