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
<xsl:template match="libraryinfo">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Central Library KMITL</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<link href="style.css" rel="stylesheet" type="text/css" />

</head>

<body bgcolor="#FFFFFF">
	<table width="680" align="left" border="0" cellpadding="10" cellspacing="0">
	<tr><td>
	<table width="605" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="105" rowspan="2"><img src="images/logo.gif" width="105" height="100" /></td>
        <td height="75" valign="bottom">
		<p><span class="headline">
			<xsl:value-of select="title" />
		</span><br/>
			<xsl:value-of select="engtitle" />
		</p></td>
      </tr>
      <tr>
        <td align="left" valign="bottom"><img src="images/line.gif" width="500" height="25" /></td>
      </tr>
    </table>
	</td></tr>
	<tr><td align="center">
			<xsl:apply-templates select="picture" />
	</td></tr>
	<tr><td>
		<xsl:value-of select="description" disable-output-escaping="yes" />
	</td></tr>
<xsl:for-each select="info">
	<xsl:if test=" text() != '' ">
	<tr><td>
		<p class="boldfont"><u><xsl:value-of select="@meaning" disable-output-escaping="yes" /></u></p>
	</td></tr>
	<tr><td>
		<xsl:value-of select="." disable-output-escaping="yes" />
	</td></tr>
	</xsl:if>
</xsl:for-each>
	</table>
</body>
</html>

</xsl:template>

<xsl:template match="picture">
  <xsl:for-each select=".">
  <xsl:if test=" src!='' ">
  <xsl:choose>
  <xsl:when test=" width!='' and height!='' ">
    <img src="{src}" width="{width}" height="{height}" alt="{alt}" border="0" /> 
  </xsl:when>
  <xsl:otherwise>
  	<img src="{src}" alt="{alt}" border="0" /> 
  </xsl:otherwise>
</xsl:choose> 
</xsl:if>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>