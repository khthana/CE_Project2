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
<xsl:template match="kmitl">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Central  Library Infomation</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<link href="style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<xsl:comment>
body {
	background-image: url(images/home_14.gif);
}
</xsl:comment>
</style></head>

<body>
	<p align="center" class="headline"><xsl:value-of select="wish/@subject" /></p>
	<p class="boldfont" align="center" ><xsl:value-of select="wish" disable-output-escaping="yes" /></p>
	&nbsp;<br />
	<p align="center" class="lightfont"><strong><xsl:value-of select="address" disable-output-escaping="yes" /></strong></p>
	
	<p align="center" class="homefont" ><xsl:value-of select="tel/@subject" /> : <xsl:value-of select="tel" disable-output-escaping="yes" />&nbsp;&nbsp;&nbsp;
	<xsl:value-of select="fax/@subject" /> : <xsl:value-of select="fax" disable-output-escaping="yes" /></p>
	
</body>
</html>

</xsl:template>
</xsl:stylesheet>