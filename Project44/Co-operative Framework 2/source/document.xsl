<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:JavaXML="http://www.oreilly.com/catalog/javaxml/" version="1.0"
>

	<xsl:template match="page">
		<html>
			<head>
				<title>
					<xsl:value-of select="title"/>
				</title>
			</head>
			<body bgcolor="#ffffff">
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="line">	
	<p>
		<xsl:element name="font">
		   <xsl:attribute name="face">
		      <xsl:value-of select="font" />
		   </xsl:attribute>
		   <xsl:attribute name="color">
		      <xsl:value-of select="color"/>
		   </xsl:attribute>
		   <xsl:attribute name="size">
		      <xsl:value-of select="size"/>
		   </xsl:attribute>
		  <xsl:value-of select="text"/>
		</xsl:element>
		<xsl:element name="img">
		   <xsl:attribute name="src">
		      <xsl:value-of select="picname"/>
		   </xsl:attribute>
	 	   <xsl:attribute name="width">
		      <xsl:value-of select="width"/>
		   </xsl:attribute>
		   <xsl:attribute name="height">
		      <xsl:value-of select="height"/>
		   </xsl:attribute>
	        </xsl:element>

	</p>
	</xsl:template>

	<xsl:template match="BOLD">	
	<b>
				<xsl:apply-templates/>
	</b>
	</xsl:template>

	<xsl:template match="ITALIC">	
	<i>
				<xsl:apply-templates/>
	</i>
	</xsl:template>


</xsl:stylesheet>