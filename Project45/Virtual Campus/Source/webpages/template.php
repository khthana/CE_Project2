<?php

$dir_webdata="web_vrcampus";
$url_home="http://161.246.6.2";
$url_source="http://161.246.6.2";
$url_webdata="$url_home/$dir_webdata";

echo ("
	<style>
	body {scrollbar-arrow-color: #008800; scrollbar-base-color: #black; scrollbar-face-color: #ffffff; scrollbar-highlight-color: #f0fff0; scrollbar-shadow-color: #ffffff;}
	.header,.thai,body,img,li,a,input,span,table {font-family :Tahoma, MS Sans Serif; font-size :9pt;}
	.header {color: #FFFFFF;}
	.footer {font-family: Arial; font-size :8pt; color: #333333;}
	a {text-decoration:none;color: 008800}
	a:hover {text-decoration:underline;color: #0088ff}
	a:active {text-decoration:underline;color: #111111}
	input,botton,textarea {border-width:1pt;}

	</style>
");

function write_header($header_mark,$header_name,$header_width) {
	if(!isset($header_width)) $header_width=100;
	echo ("
		<table border=0 cellspacing=0 cellpadding=0 width=100%>
		<tr><td  height=1 bgcolor=#666699></td></tr></table>
		<table border=0 cellspacing=0 cellpadding=0>
		<t	r>
		      <td rowspan=2 valign=middle  nowrap bgcolor='#666699' height = 10 width=$header_width style=HEIGHT:10px;width:$header_width>
			<a name=$header_mark><font class =header>&nbsp;$header_name</font></td>
		      <td width=8 height=8 bgcolor=#666699></td>
			  <td width=8 height=8 bgcolor=#9999CC></td>
		      <td width=8 height=8 bgcolor=#CCCCFF></td>
		</tr>
		<tr><td width=8 height=8 bgcolor=#9999CC></td>
		      <td width=8 height=8 bgcolor=#CCCCFF></td>
			  <td width=8 height=8 bgcolor=#FFFFFF></td>
		</tr>
		</table>
	");
}
?>