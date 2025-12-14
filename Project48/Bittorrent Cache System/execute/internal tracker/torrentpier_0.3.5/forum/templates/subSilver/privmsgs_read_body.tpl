
<table cellspacing="2" cellpadding="2" border="0" align="center">
  <tr>
	<td valign="middle">{INBOX_IMG}</td>
	<td valign="middle"><span class="cattitle">{INBOX} &nbsp;</span></td>
	<td valign="middle">{SENTBOX_IMG}</td>
	<td valign="middle"><span class="cattitle">{SENTBOX} &nbsp;</span></td>
	<td valign="middle">{OUTBOX_IMG}</td>
	<td valign="middle"><span class="cattitle">{OUTBOX} &nbsp;</span></td>
	<td valign="middle">{SAVEBOX_IMG}</td>
	<td valign="middle"><span class="cattitle">{SAVEBOX}</span></td>
  </tr>
</table>

<br clear="all" />

<form method="post" action="{S_PRIVMSGS_ACTION}" style="display: inline">
<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr>
	  <td valign="middle">{REPLY_PM_IMG}</td>
	  <td width="100%"><span class="nav">&nbsp;<a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
  </tr>
</table>

<table border="0" cellpadding="4" cellspacing="1" width="100%" class="forumline">
	<tr>
	  <th colspan="3" class="thHead" nowrap="nowrap">{BOX_NAME} :: {L_MESSAGE}</th>
	</tr>
	<tr>
	  <td class="row2"><span class="genmed">{L_FROM}:</span></td>
	  <td width="100%" class="row2" colspan="2"><span class="genmed">{MESSAGE_FROM}</span></td>
	</tr>
	<tr>
	  <td class="row2"><span class="genmed">{L_TO}:</span></td>
	  <td width="100%" class="row2" colspan="2"><span class="genmed">{MESSAGE_TO}</span></td>
	</tr>
	<tr>
	  <td class="row2"><span class="genmed">{L_POSTED}:</span></td>
	  <td width="100%" class="row2" colspan="2"><span class="genmed">{POST_DATE}</span></td>
	</tr>
	<tr>
	  <td class="row2"><span class="genmed">{L_SUBJECT}:</span></td>
	  <td width="100%" class="row2"><span class="genmed">{POST_SUBJECT}</span></td>
	  <td nowrap="nowrap" class="row2"> {QUOTE_PM_IMG} {EDIT_PM_IMG} </td>
	</tr>
	<tr>
	  <td valign="top" colspan="3" class="row1"><span class="postbody">{MESSAGE}</span>
<!-- BEGIN postrow -->
	{ATTACHMENTS}
<!-- END postrow -->
	  </td>
	</tr>
	<tr>
	  <td width="78%" height="28" valign="bottom" colspan="3" class="row1">
		<table cellspacing="0" cellpadding="0" border="0" height="18">
		  <tr>
			<td valign="middle" nowrap="nowrap">{PROFILE_IMG} {PM_IMG} {EMAIL_IMG}
			  {WWW_IMG} {AIM_IMG} {YIM_IMG} {MSN_IMG} {ICQ_IMG}</td>
		  </tr>
		</table>
	  </td>
	</tr>
	<tr>
	  <td class="catBottom" colspan="3" height="28" align="right"> {S_HIDDEN_FIELDS}
		<input type="submit" name="save" value="{L_SAVE_MSG}" class="liteoption" />
		&nbsp;
		<input type="submit" name="delete" value="{L_DELETE_MSG}" class="liteoption" />
<!-- BEGIN switch_attachments -->
		&nbsp;
		<input type="submit" name="pm_delete_attach" value="{L_DELETE_ATTACHMENTS}" class="liteoption" />
<!-- END switch_attachments -->
	  </td>
	</tr>
  </table>
</form>

<div><img src="images/spacer.gif" alt="" width="1" height="6" /></div>

<form action='{S_PRIVMSGS_ACTION}' method='post' name='post' onsubmit='return checkForm(this)' style="display: inline">
<table border='0' cellpadding='4' cellspacing='1' width='100%' class='forumline'>
	<tr>
		<th class='thHead' height='25' align='center'><b>PM Quick Reply</b></th>
	</tr>
	<tr>
		<td class='row2' align='center' width="100%"><span class="gen"><b>{L_TO}: </b> <input type="text" name="username" size="18" maxlength="25" style="width:110px" class="post" value="{MESSAGE_FROM}" />&nbsp; <b>{L_SUBJECT}: </b> <input type="text" name="subject" size="50" maxlength="60" style="width:300px" class="post" value="{QR_SUBJECT}" /></span></td>
	</tr>
	<tr>
		<td class="row2" align='center'>
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td align="center">
					<span class="genmed">
						<input class="button" title="Bold (Ctrl+B)" style="font-weight: bold; width: 30px" type="button" value=" B " name="codeB" />
						<input class="button" title="Italic (Ctrl+I)" style="width: 30px; font-style: italic" type="button" value=" i " name="codeI" />
						<input class="button" title="Underline (Ctrl+U)" style="width: 30px; text-decoration: underline" type="button" value=" u " name="codeU" />&nbsp;
						<input class="button" title="Quote (Ctrl+Q)" style="width: 50px" type="button" value="Quote" name="codeQuote" />
						<input class="button" title="Image (Ctrl+R)" style="width: 40px" type="button" value="Img" name="codeImg" />
						<input class="button" title="URL (Ctrl+W)" style="width: 40px; text-decoration: underline" type="button" value="URL" name="codeUrl" /><input type="hidden" name="codeUrl2" />&nbsp;
						<input class="button" title="Code (Ctrl+K)" style="width: 40px" type="button" value="Code" name="codeCode" />
						<input class="button" title="List (Ctrl+L)" style="width: 40px" type="button" value="List" name="codeList" />
						<input class="button" title="List item (Ctrl+0)" style="width: 30px" type="button" value="1." name="codeOpt" />&nbsp;
						<input class="button" title="{L_QUOTE_SEL}" style="width: 120px" type="button" name="quoteselected" value="Quote selected" onmouseout="bbcode && bbcode.refreshSelection(false)" onmouseover="bbcode && bbcode.refreshSelection(true)" onclick="bbcode && bbcode.onclickQuoteSel(); return false" />&nbsp;
						<input class="button" title="(-;" style="width: 70px" onclick="window.open('posting.php?mode=smilies', '_phpbbsmilies', 'HEIGHT=400,WIDTH=500,resizable=yes,scrollbars=yes'); return false" type="button" value="Smilies" />
					</span>
					</td>
				</tr>
				<tr>
					<td class="row2" align='center'>
					<span class="gen"><textarea id="post_body" name="message" rows="17" cols="78" wrap="virtual" style="width:640px" class="post" onselect="storeCaret(this)" onclick="storeCaret(this)" onkeyup="storeCaret(this)">{L_REPLY}</textarea></span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class='catBottom' height='28' align='center'>{S_HIDDEN_FIELDS}<input title="Alt+Enter" type='submit' name='preview' class='mainoption' value='{L_PREVIEW}' />&nbsp;
		<input title="Ctrl+Enter" type='submit' name='post' class='mainoption' value='{L_SUBMIT}' /></td>
	</tr>
</table>
</form>
<script language=JavaScript>
<!--
var bbcode = new BBCode(document.post.message);
var ctrl = "ctrl";
bbcode.addTag("codeB", "b", null, "B", ctrl);
bbcode.addTag("codeI", "i", null, "I", ctrl);
bbcode.addTag("codeU", "u", null, "U", ctrl);

bbcode.addTag("codeQuote", "quote", null, "Q", ctrl);
bbcode.addTag("codeImg", "img", null, "R", ctrl);
bbcode.addTag("codeUrl", "url", "/url", "", ctrl);
bbcode.addTag("codeUrl2", "url=", "/url", "W", ctrl);

bbcode.addTag("codeCode", "code", null, "K", ctrl);
bbcode.addTag("codeList", "list", null, "L", ctrl);
bbcode.addTag("codeOpt", "*", "", "0", ctrl);
//-->
</script>
<br />
<table width="100%" cellspacing="2" border="0" align="center" cellpadding="2">
  <tr>
	<td valign="top" align="right"><span class="gensmall">{JUMPBOX}</span></td>
  </tr>
</table>