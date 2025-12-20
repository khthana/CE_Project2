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
<xsl:template match="rule">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ระเบียบการใช้ห้องสมุด</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<link href="style.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<table width="690" align="left" border="0" cellpadding="10" cellspacing="0">
	<tr><td align="center" valign="top">
		<span class="headline"><xsl:value-of select="headline" /></span><br />
		<strong><xsl:value-of select="maintitle" /></strong>
	</td></tr>
	<tr><td>
		<xsl:value-of select="maindescription"  disable-output-escaping="yes" />
	</td></tr>
	<tr><td>&nbsp;</td></tr>
<xsl:for-each select="data/category">
	<tr><td align="center" valign="top">
		<span class="boldfont"><xsl:value-of select="order" /></span><br />
		<xsl:value-of select="subject" />
	</td></tr>
	<tr><td>
		<table width="100%" align="left" border="0" cellpadding="4" cellspacing="0">
		<xsl:for-each select="description/item">
				<tr><td>
					<xsl:value-of select="." disable-output-escaping="yes" /><br />
				</td></tr>
		</xsl:for-each>
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</xsl:for-each>
	<tr><td>
		<table width="100%" align="left" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%">&nbsp;</td>
				<td width="60%" align="center" valign="top">
					<p><xsl:value-of select="signature/at" disable-output-escaping="yes" /></p>
					<p><xsl:value-of select="signature/by" disable-output-escaping="yes" /><br/>
					<xsl:value-of select="signature/position" disable-output-escaping="yes" /></p>
				</td>
			</tr>
		</table>
	</td></tr>
	</table>
</body>
</html>

</xsl:template>

<xsl:template match="picture">
  <img src="{src}" width="{width}" height="{height}" alt="{alt}" border="0" /> 
</xsl:template>

</xsl:stylesheet>