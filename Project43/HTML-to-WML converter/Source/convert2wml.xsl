<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:strip-space elements="*"/>
   <xsl:template match="extractbody">
	<xsl:processing-instruction name="cocoon-format">type="text/wml"</xsl:processing-instruction>
	<wml>
	<template> 
	    <do type="prev" label="Home"><prev/></do> 
	</template> 
	<card id="index" title="index">

		<p align="center" mode="wrap">
			<xsl:apply-templates />
			
		</p>
	</card>


	</wml>
   </xsl:template>
<!-- horizontal -->
   <xsl:template match="hr">
	<br/> ------ <br/>
   </xsl:template>
<!-- break line -->
   <xsl:template match="br">
	<br/>
   </xsl:template>

<!-- style text -->

   <xsl:template match="h1|h2|h3|h4|h5|h6">
	<br/>
	<big>
		<xsl:apply-templates/>
     	</big>
	<br/>
   </xsl:template>
   <xsl:template match="b">
<!--	<b>
		<xsl:apply-templates/>
	</b>-->
	<xsl:call-template name="b"/>
   </xsl:template>

   <xsl:template name="b">
	<xsl:choose>
	<xsl:when test="descendant::a">
		<xsl:apply-templates/>
	</xsl:when>
	<xsl:otherwise>
		<b>
			<xsl:apply-templates/>
		</b>
	</xsl:otherwise>
	</xsl:choose>
   </xsl:template>

   <xsl:template match="big">
	<big>
		<xsl:apply-templates/>
     	</big>
   </xsl:template>
   <xsl:template match="small">
	<small>
		<xsl:apply-templates/>
     	</small>
   </xsl:template>
      <xsl:template match="u">
	<u>
		<xsl:apply-templates/>
     	</u>
   </xsl:template>

   <xsl:template match="i">
	<xsl:call-template name="i"/>
   </xsl:template>

   <xsl:template name="i">
	<xsl:choose>
	<xsl:when test="descendant::a">
		<xsl:apply-templates/>
	</xsl:when>
	<xsl:otherwise>
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:otherwise>
	</xsl:choose>
   </xsl:template>
      
      
   <xsl:template match="em">
	<em>
		<xsl:apply-templates/>
     	</em>
   </xsl:template>
   <xsl:template match="address">
	<i>
		<xsl:apply-templates/>
     	</i>
   </xsl:template>
   <xsl:template match="blockquote">
	<br/>
	<xsl:text>&quot;</xsl:text>
		<xsl:apply-templates/>
	<xsl:text>&quot;</xsl:text>
   </xsl:template>
   <xsl:template match="cite">
	<i>
		<xsl:apply-templates/>
     	</i>
   </xsl:template>
   <xsl:template match="q">
	<xsl:text>&quot;</xsl:text>
		<xsl:apply-templates/>
	<xsl:text>&quot;</xsl:text>
   </xsl:template>

<!-- link  -->

   <xsl:template match="a">
	<xsl:variable name="label">
		<xsl:choose>
		<xsl:when test="descendant::text">
			<xsl:value-of select="descendant::text"/>
		</xsl:when>
		<xsl:when test="descendant::img and not(descendant::text)">
			<xsl:value-of select="string(descendant::img/@src)"/>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="name">
		<xsl:value-of select="string(@href)"/>
	</xsl:variable>
	<xsl:variable name="http">
		<xsl:choose>
		<xsl:when  test="contains($name,'http')">
			<xsl:value-of select="(substring-after($name,'http://'))"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$name"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ad">
		<xsl:choose>
		<xsl:when test="contains($http,'@')">
			<xsl:value-of select="translate($http,'@','.')"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$http"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="not">
		<xsl:choose>
		<xsl:when test="contains($ad,'~')">
			<xsl:value-of select="translate($ad,'~',':')"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$ad"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable> 
	<xsl:variable name="ques">
		<xsl:choose>
		<xsl:when test="contains($not,'?') or contains($not,'=') or contains($not,';')">
			<xsl:value-of select="translate($not,'?',':') and translate($not,'=',':') and translate($not,';',':')"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$not"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="link">
		<xsl:choose>
		<xsl:when test="contains($ques,'/')">
			<xsl:value-of select="translate($ques,'/',':')"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$ques"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>


	<xsl:element name="do">
		<xsl:attribute name="type">accept</xsl:attribute>	
		<xsl:attribute name="label">Link <xsl:value-of select="$label"/></xsl:attribute>
		<xsl:attribute name="name"><xsl:value-of select="$link"/></xsl:attribute>	
			<xsl:element name="go">
				<xsl:attribute name="href">http://161.246.5.113:8080/test/servlet/Handlerwap</xsl:attribute>
				<xsl:attribute name="method">get</xsl:attribute>
					<xsl:element name="postfield">
						<xsl:attribute name="name">url</xsl:attribute>
						<xsl:attribute name="value"><xsl:value-of select="@href"/></xsl:attribute>			
					</xsl:element>				
			</xsl:element>
	</xsl:element>
	<fieldset title="url"> 
		    <xsl:element name="input">
			<xsl:attribute name="type">text</xsl:attribute> 			
			<xsl:attribute name="name"><xsl:value-of select="$link"/></xsl:attribute>	
			<xsl:attribute name="emptyok">true</xsl:attribute> 
			<xsl:attribute name="value"><xsl:value-of select="$label"/></xsl:attribute>			
		   </xsl:element> 
	</fieldset> 
	<br/>
</xsl:template>


<!-- table -->          

   <xsl:template match="table">
	<xsl:choose>
		<xsl:when test="self::table and not(descendant::table) and not(descendant::form) and not(ancestor::form) and not(descendant::a)">
			<xsl:call-template name="table"/>		
		</xsl:when>
		<xsl:otherwise>
				<xsl:apply-templates />
		</xsl:otherwise>
	</xsl:choose>
   </xsl:template>
   
   <xsl:template name="table">   
			<xsl:element name="table">
				<xsl:choose>
					<xsl:when test="./@cols!=''">                               
						<xsl:attribute name="columns"><xsl:value-of select="@cols"/></xsl:attribute> 			
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="columns">1</xsl:attribute> 			
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="tr">
				<xsl:call-template name="tr"/>
				</xsl:for-each>
			</xsl:element> 
   </xsl:template>
	<!-- write table -->
   <xsl:template name="tr">
		<xsl:element name="tr">
			<xsl:for-each select="th">
				<xsl:call-template name="th"/>
			</xsl:for-each>
			<xsl:for-each select="td">
				<xsl:call-template name="td"/>
			</xsl:for-each>
		</xsl:element>
   </xsl:template>
   <xsl:template name="th">
		<xsl:element name="td">
			<b><xsl:apply-templates select="."/></b>
		</xsl:element>
   </xsl:template>

   <xsl:template name="td">
		<xsl:element name="td">
			<xsl:apply-templates select="."/>
		</xsl:element>
   </xsl:template>

	<!-- don't write table -->
   <xsl:template match="tr">
	<br/>
		<xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="td">
		<xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="th">
		<xsl:apply-templates/>
   </xsl:template>

<!--  list   -->

   <xsl:template match="lh">
	<xsl:apply-templates/><br/>
   </xsl:template> 
   <xsl:template match="li">
	<xsl:text>- </xsl:text><xsl:apply-templates/><br/>
   </xsl:template> 
   <xsl:template match="dt">
	<xsl:apply-templates/><br/>
   </xsl:template> 
   <xsl:template match="dd">
	<xsl:text>    </xsl:text><xsl:apply-templates/><br/>
   </xsl:template> 

<!-- image -->

   <xsl:template match="img">
   <xsl:variable name="pic">
   <small>cant show <xsl:value-of select="./@src"/> </small><br/>
   </xsl:variable>
    <xsl:element name="img">
	<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
	<xsl:choose>
		<xsl:when test="@alt">
			<xsl:attribute name="alt"><xsl:value-of select="./@alt"/></xsl:attribute> 
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="alt"><xsl:value-of select="$pic"/></xsl:attribute> 
		</xsl:otherwise>

	</xsl:choose>
	<xsl:if test="@width">
		<xsl:attribute name="width"><xsl:value-of select="./@width"/></xsl:attribute> 
	</xsl:if>
	<xsl:if test="@height">
		<xsl:attribute name="height"><xsl:value-of select="./@height"/></xsl:attribute> 
	</xsl:if>
	<xsl:if test="@hspace">
		<xsl:attribute name="hspace"><xsl:value-of select="./@hspace"/></xsl:attribute> 
	</xsl:if>
	<xsl:if test="@vspace">
		<xsl:attribute name="vspace"><xsl:value-of select="./@vspace"/></xsl:attribute> 
	</xsl:if>
	<xsl:if test="@align='top' or @align='middle' or @align='bottom'">
		<xsl:attribute name="align"><xsl:value-of select="./@align"/></xsl:attribute> 
	</xsl:if>
   </xsl:element> 
   </xsl:template>

<!--  form  -->

   <xsl:template match="form">
	<do type="accept" label="Submit">
		<go href="http://161.246.5.113:8080/test/servlet/WapForm" method="get">
			<xsl:for-each select="descendant::node()">
				<xsl:if test="self::select or self::input/@type='text' or self::input/@type='TEXT' or self::input/@type='password' or self::textarea" >
					<xsl:element name="postfield">	
						<xsl:attribute name="name"><xsl:value-of select="./@name"/></xsl:attribute>
						<xsl:attribute name ="value">$(<xsl:value-of select="./@name"/>)</xsl:attribute>
					</xsl:element>				
				</xsl:if>
				<xsl:if test="self::input/@type='checkbox' and (not(ancestor::input/@type='checkbox') and not(preceding-sibling::input/@type='checkbox'))">
					<xsl:element name="postfield">	
						<xsl:attribute name="name"><xsl:value-of select="./@name"/></xsl:attribute>
						<xsl:attribute name ="value">$(<xsl:value-of select="./@name"/>)</xsl:attribute>
					</xsl:element>				
				</xsl:if>
				<xsl:if test="self::input/@type='radio' and (not(ancestor::input/@type='radio') and not(preceding-sibling::input/@type='radio'))">
					<xsl:element name="postfield">	
						<xsl:attribute name="name"><xsl:value-of select="./@name"/></xsl:attribute>
						<xsl:attribute name ="value">$(<xsl:value-of select="./@name"/>)</xsl:attribute>
					</xsl:element>				
				</xsl:if>
			</xsl:for-each>
		</go>
	</do>

   <xsl:for-each select="descendant::node()">
		<xsl:choose>
			<xsl:when test="self::text and not(ancestor::textarea) and not(ancestor::option) and not(ancestor::button) and not(ancestor::radio) and not(ancestor::checkbox)">
				<xsl:apply-templates select="."/>
			</xsl:when> 
			<xsl:when test="self::radio"> 
				<xsl:apply-templates select="self::node()" /> 
			</xsl:when>
			<xsl:when test="self::checkbox"> 
				<br/>
				<xsl:apply-templates select="self::node()" /> 
			</xsl:when>
			<xsl:when test="self::select or self::input/@type='text' or self::input/@type='TEXT' or self::input/@type='password' or self::input/@type='file' or self::button">
				<xsl:apply-templates select="self::node()"/>
			</xsl:when>
			<xsl:when test="self::textarea">
				<xsl:apply-templates select="self::node()"/>
			</xsl:when>
			<xsl:when test="self::input/@type='submit' or self::input/@type='reset' or self::input/@type='button' or self::input/@type='image' or self::input/@type='hidden'">
			</xsl:when>

			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
   </xsl:for-each>
   </xsl:template>

  <xsl:template match="input[@type='submit']">

  </xsl:template>
<!-- text -->
  <xsl:template match="input[@type='text'] | input[@type='TEXT']"> 

	<xsl:element name="input">
		<xsl:attribute name="type">text</xsl:attribute>
		<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
		<xsl:if test="./@value">
			<xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="./@maxlength">
			<xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="./@size">
			<xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute>
		</xsl:if>
	</xsl:element>
   </xsl:template>

  <xsl:template match="input[@type='password']"> 

	<xsl:element name="input">
		<xsl:attribute name="type">password</xsl:attribute>
		<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
		<xsl:if test="./@value">
			<xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="./@maxlength">
			<xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="./@size">
			<xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute>
		</xsl:if>
	</xsl:element>
   </xsl:template>

  <xsl:template match="input[@type='file']"> 
	<xsl:element name="input">
		<xsl:attribute name="type">file</xsl:attribute>
		<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
		<xsl:if test="./@value">
			<xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="./@maxlength">
			<xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="./@size">
			<xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute>
		</xsl:if>
	</xsl:element>
   </xsl:template>

<!-- textarea -->
   <xsl:template match="textarea">
	<xsl:element name="input">
		<xsl:attribute name="type">text</xsl:attribute>
		<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
		<xsl:attribute name="value"><xsl:apply-templates/></xsl:attribute>
	</xsl:element>
   </xsl:template>

<!--   radio  -->
   <xsl:template match="radio">
		<select name="{./input/@name}">
			<xsl:apply-templates select="input[@type='radio']"/>
		</select>
   </xsl:template>

<!--   radio  -->
  <xsl:template match="input[@type='radio']"> 
		
   			<option value="{@value}">
				<xsl:value-of select="following-sibling::text"/>
 			</option>
	</xsl:template> 

<!--   checkbox  -->
   <xsl:template match="checkbox">		
		<select name="{./input/@name}" multiple="true">
			<xsl:apply-templates select="input[@type='checkbox']"/>
		</select>
   </xsl:template>

<!--  checkbox  -->

   <xsl:template match="input[@type='checkbox']"> 
   			<option value="{@value}">
				<xsl:value-of select="following-sibling::text"/>
<!--				<xsl:apply-templates/>-->
 			</option>
   </xsl:template> 

<!--  select -->
   <xsl:template match="select">
	<xsl:element name="select">
		<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
		<xsl:if test="@multiple='yes'">
			<xsl:attribute name="multiple">true</xsl:attribute>
		</xsl:if>
		<xsl:if test="@multiple='no'">
			<xsl:attribute name="multiple">false</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates />
	</xsl:element>

   </xsl:template>

<!-- option -->
   <xsl:template match="option">
   	<option value="{@value}">
		<xsl:apply-templates/>
	</option>
   </xsl:template>

<!-- optgroup -->

   <xsl:template match="optgroup">
	<optgroup title="{@label}">
		<xsl:apply-templates />
	</optgroup>
   </xsl:template>


<!-- frame -->

   <xsl:template match="frameset">
	<xsl:if test="not(ancestor::frameset)">
		<small>Select Frame</small><br/>
	</xsl:if>
	<xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="noframes">
   </xsl:template>

<xsl:template match="frame">
	<xsl:element name="do">
		<xsl:attribute name="type">accept</xsl:attribute>	
		<xsl:attribute name="label">Link <xsl:value-of select="./@name"/></xsl:attribute>
		<xsl:attribute name="name"><xsl:value-of select="./@name"/></xsl:attribute>	
			<xsl:element name="go">
				<xsl:attribute name="href">http://161.246.5.113:8080/test/servlet/Handlerwap</xsl:attribute>
				<xsl:attribute name="method">get</xsl:attribute>

					<xsl:element name="postfield">
						<xsl:attribute name="name">url</xsl:attribute>
						<xsl:attribute name="value"><xsl:value-of select="@src"/></xsl:attribute>			
					</xsl:element>				
			</xsl:element>
	</xsl:element>
	<fieldset title="url"> 
		    <xsl:element name="input">
			<xsl:attribute name="type">text</xsl:attribute> 			
			<xsl:attribute name="name"><xsl:value-of select="./@name"/></xsl:attribute>	
			<xsl:attribute name="emptyok">true</xsl:attribute> 
			<xsl:attribute name="value"><xsl:value-of select="./@name"/></xsl:attribute> 			
		   </xsl:element> 
	</fieldset> 
	<br/>
</xsl:template>

<xsl:template match="text">
	<xsl:apply-templates />
</xsl:template>

</xsl:stylesheet>


