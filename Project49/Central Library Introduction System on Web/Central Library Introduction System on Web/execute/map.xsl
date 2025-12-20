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
<xsl:template match="map">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Central Library KMITL</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="rolloverimage.js"></script>
</head>

<body bgcolor="#FFFFFF" onload="{preloadpicture}">
	<table width="680" align="left" border="0" cellpadding="0" cellspacing="0">
	<tr><td align="center" valign="top">
			<xsl:apply-templates select="picture" />
	</td></tr>
	<tr><td align="center" valign="top">
		<table width="660" border="1" cellpadding="5" cellspacing="0" bordercolor="#EF610A">
  		<tr>
    		<td width="210" align="center" valign="top" bgcolor="#EF610A" class="strongwhite">ส่วนที่ให้บริการ</td>
    		<td width="225" align="center" valign="top" bgcolor="#EF610A" class="strongwhite">บริการ</td>
    		<td width="225" align="center" valign="top" bgcolor="#EF610A" class="strongwhite">ทรัพยากรสารนิเทศ</td>
	  </tr>
  	  <xsl:for-each select="data">
	  <tr>
    	   <td align="left" valign="top" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('map','','{overimage}',1)">
		   	<strong><xsl:value-of select="section" disable-output-escaping="yes" /></strong>
		  </td>
  		  <td align="left" valign="top">
		  <ul>
		  	<xsl:for-each select="service">
		  		<li><xsl:value-of select="." disable-output-escaping="yes" /></li>
		 	 </xsl:for-each>
		  </ul>
		  </td>	  
   		  <td align="left" valign="top">
		  <ul>
		  	<xsl:for-each select="media">
		  		<li><xsl:value-of select="." disable-output-escaping="yes" /></li>
		 	 </xsl:for-each>
		  </ul>
		  </td>
	 </tr>
	 </xsl:for-each>
	</table>
	</td></tr>
	</table>
</body>
</html>

</xsl:template>

<xsl:template match="picture">
  <img src="{src}" width="{width}" height="{height}" alt="{alt}" border="0" name="map" id="map" /> 
</xsl:template>

</xsl:stylesheet>