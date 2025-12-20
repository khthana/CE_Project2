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
<xsl:template match="diagram">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Central Library KMITL</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<link href="style.css" rel="stylesheet" type="text/css" />

</head>

<body bgcolor="#FFFFFF">
	<table width="680" align="left" border="0" cellpadding="10" cellspacing="0">
	<tr><td align="center">
		<span class="headline"><xsl:value-of select="./@name" /></span><br />
		<span class="boldfont"><xsl:value-of select="root/@name" /></span>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
	<xsl:for-each select="root/node">
	<tr><td class="orangefont">
		<blockquote><strong># <xsl:value-of select="./@name" disable-output-escaping="yes" /></strong></blockquote>
	</td></tr>
	<tr><td>
	<blockquote><blockquote>
		<xsl:for-each select="subnode">
					- &nbsp;&nbsp;<xsl:value-of select="./@name" disable-output-escaping="yes" /><br />
		</xsl:for-each>
	</blockquote></blockquote>
	</td></tr>
	</xsl:for-each>
	</table>
</body>
</html>

</xsl:template>

</xsl:stylesheet>