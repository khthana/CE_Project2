<?xml version="1.0" encoding="windows-874"?><!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="windows-874" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>
<xsl:template match="menulink">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Service link</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body background="images/bg_datazone_03.gif">
	<table width="200" align="left" border="0" cellpadding="5" cellspacing="0" >
	<tr><td align="left" valign="baseline" class="linkfont">
			<strong><xsl:value-of select="@title" /></strong>
	</td></tr>
	<tr><td align="left" valign="top"><img src="images/linkline.gif" width="190" height="19" /></td>
	</tr>
	<xsl:for-each select="subject">
	<tr><td align="left" valign="top">
		<a href="{link}" target="main"><xsl:value-of select="name" /></a>
	</td>
	</tr>
	</xsl:for-each>
	</table>
</body>
</html>

</xsl:template>
</xsl:stylesheet>