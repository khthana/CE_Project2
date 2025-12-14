<?xml version="1.0"?>
<!-- edited with XMLSpy v2005 sp2 U (http://www.altova.com) by art (home) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svg="http://www.w3.org/2000/svg" xmlns:pre1="http://www.opengis.net/examples" xmlns:exp="/">
	<xsl:output indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="X1">
			<xsl:value-of select="substring-before(gml:featureCollection/gml:boundedBy/gml:Box/gml:coordinates,',')"/>
		</xsl:variable>
		<xsl:variable name="Temp">
			<xsl:value-of select="substring-after(gml:featureCollection/gml:boundedBy/gml:Box/gml:coordinates,',')"/>
		</xsl:variable>
		<xsl:variable name="Y1">
			<xsl:value-of select="substring-before($Temp,' ')"/>
		</xsl:variable>
		<xsl:variable name="Temp1">
			<!-- <xsl:value-of select="substring-after(gml:featureCollection/gml:boundedBy/gml:Box/gml:coordinates,' ')"/> -->
			<xsl:value-of select="substring-after($Temp,' ')"/>
		</xsl:variable>
		<xsl:variable name="X2">
			<xsl:value-of select="substring-before($Temp1,',')"/>
		</xsl:variable>
		<xsl:variable name="Y2">
			<xsl:value-of select="substring-after($Temp1,',')"/>
		</xsl:variable>
		<xsl:variable name="WIDTH">
			<xsl:value-of select="$X2 - $X1"/>
		</xsl:variable>
		<xsl:variable name="HEIGHT">
			<xsl:value-of select="$Y2 - $Y1"/>
		</xsl:variable>
		<xsl:if test="$WIDTH&gt;$HEIGHT">
			<xsl:variable name="MAX" select="$WIDTH"/>
			<xsl:element name="svg">
				<xsl:attribute name="xml:space">preserve</xsl:attribute>
				<xsl:attribute name="width">900</xsl:attribute>
				<xsl:attribute name="height">500</xsl:attribute>
				<xsl:attribute name="id">svgAll</xsl:attribute>
				<xsl:attribute name="onmousemove">showCoords(evt)</xsl:attribute>
				<xsl:attribute name="onzoom">resetCoords()</xsl:attribute>
				<xsl:attribute name="onscroll">resetCoords()</xsl:attribute>
				<xsl:attribute name="onload">initMap(evt)</xsl:attribute>
				<!-- <xsl:attribute name="xmlns">http://www.w3.org/2000/svg</xsl:attribute>
				<xsl:attribute name="xmlns:xlink">http://www.w3.org/1999/xlink</xsl:attribute> -->
				<xsl:attribute name="viewBox"><xsl:value-of select="concat($X1,' ',$Y1,' ',$WIDTH,' ',$HEIGHT)"/></xsl:attribute>
				<!-- <xsl:attribute name="width"><xsl:value-of select="$WIDTH"/></xsl:attribute>
				<xsl:attribute name="height"><xsl:value-of select="$HEIGHT"/></xsl:attribute> -->
				<xsl:variable name="matrix">
					<xsl:value-of select="$Y1 + $Y2"/>
				</xsl:variable>
				<xsl:element name="g">
					<xsl:attribute name="transform"><xsl:value-of select="concat(concat('matrix(1 0 0 -1 0 ',$matrix),')')"/></xsl:attribute>
					<xsl:element name="script">
						<xsl:attribute name="xlink:href">show_coordinates.js</xsl:attribute>
						<xsl:attribute name="type">text/javascript</xsl:attribute>
						<xsl:attribute name="onmouseover">showCity('ECC')</xsl:attribute>
						<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
					</xsl:element>
					<xsl:element name="g">
						<xsl:attribute name="id">background</xsl:attribute>
						<xsl:attribute name="stroke-width">0</xsl:attribute>
						<xsl:attribute name="visibility">visible</xsl:attribute>
						<xsl:element name="path">
							<xsl:attribute name="id">background_0</xsl:attribute>
							<xsl:attribute name="fill">rgb(255,255,255)</xsl:attribute>
							<xsl:attribute name="stroke">rgb(255,255,255)</xsl:attribute>
							<xsl:attribute name="d"><xsl:value-of select="concat('M',$X1,' ',$Y1,',',$X2,' ',$Y1,',',$X2,' ',$Y2,',',$X1,' ',$Y2,',',$X1,' ',$Y2,'Z')"/></xsl:attribute>
							<xsl:attribute name="onmouseover">showCity()</xsl:attribute>
							<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<!--/////////////////////////////////////////////Line//////////////////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">line</xsl:attribute>
						<xsl:attribute name="stroke-width"><xsl:value-of select="5000 div $MAX"/></xsl:attribute>
						<xsl:for-each select="gml:featureCollection/gml:featureMember/*/*/gml:LineString">
							<xsl:call-template name="buildLine">
								<xsl:with-param name="MAX" select="$MAX"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:element>
					<!--/////////////////////////////////////////////////PolyGon////////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">polygon</xsl:attribute>
						<xsl:attribute name="stroke-width"><xsl:value-of select="0.5 div $MAX"/></xsl:attribute>
						<!-- buildingagriind-->
						<xsl:for-each select="gml:featureCollection/gml:featureMember/*/*/gml:Polygon">
							<xsl:call-template name="buildPolygon">
								<xsl:with-param name="MAX" select="$MAX"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:element>
					<!--/////////////////////////////////////////////////////Point/////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">point</xsl:attribute>
						<xsl:attribute name="stroke-width"><xsl:value-of select="0.5 div $MAX"/></xsl:attribute>
						<xsl:for-each select="gml:featureCollection/gml:featureMember/*/*/gml:Point">
							<xsl:call-template name="buildPoint">
								<xsl:with-param name="MAX" select="$MAX"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:element>
					<!--//////////////////////////////////////////////////EndPoint/////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">groupShowCoords</xsl:attribute>
						<xsl:attribute name="transform"><xsl:value-of select="concat('translate','(',$X1,' ',$matrix,')')"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
		<xsl:if test="$HEIGHT&gt;$WIDTH">
			<xsl:variable name="MAX" select="$HEIGHT"/>
			<xsl:element name="svg">
				<xsl:attribute name="xml:space">preserve</xsl:attribute>
				<xsl:attribute name="width">900</xsl:attribute>
				<xsl:attribute name="height">500</xsl:attribute>
				<xsl:attribute name="id">svgAll</xsl:attribute>
				<xsl:attribute name="onmousemove">showCoords(evt)</xsl:attribute>
				<xsl:attribute name="onzoom">resetCoords()</xsl:attribute>
				<xsl:attribute name="onscroll">resetCoords()</xsl:attribute>
				<xsl:attribute name="onload">initMap(evt)</xsl:attribute>
				<!-- <xsl:attribute name="xmlns">http://www.w3.org/2000/svg</xsl:attribute>
				<xsl:attribute name="xmlns:xlink">http://www.w3.org/1999/xlink</xsl:attribute> -->
				<xsl:attribute name="viewBox"><xsl:value-of select="concat($X1,' ',$Y1,' ',$WIDTH,' ',$HEIGHT)"/></xsl:attribute>
				<!-- <xsl:attribute name="width"><xsl:value-of select="$WIDTH"/></xsl:attribute>
				<xsl:attribute name="height"><xsl:value-of select="$HEIGHT"/></xsl:attribute> -->
				<xsl:variable name="matrix">
					<xsl:value-of select="$Y1 + $Y2"/>
				</xsl:variable>
				<xsl:element name="g">
					<xsl:attribute name="transform"><xsl:value-of select="concat(concat('matrix(1 0 0 -1 0 ',$matrix),')')"/></xsl:attribute>
					<xsl:element name="script">
						<xsl:attribute name="xlink:href">show_coordinates.js</xsl:attribute>
						<xsl:attribute name="type">text/javascript</xsl:attribute>
						<xsl:attribute name="onmouseover">showCity('ECC')</xsl:attribute>
						<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
					</xsl:element>
					<xsl:element name="g">
						<xsl:attribute name="id">background</xsl:attribute>
						<xsl:attribute name="stroke-width">0</xsl:attribute>
						<xsl:attribute name="visibility">visible</xsl:attribute>
						<xsl:element name="path">
							<xsl:attribute name="id">background_0</xsl:attribute>
							<xsl:attribute name="fill">rgb(255,255,255)</xsl:attribute>
							<xsl:attribute name="stroke">rgb(255,255,255)</xsl:attribute>
							<xsl:attribute name="d"><xsl:value-of select="concat('M',$X1,' ',$Y1,',',$X2,' ',$Y1,',',$X2,' ',$Y2,',',$X1,' ',$Y2,',',$X1,' ',$Y2,'Z')"/></xsl:attribute>
							<xsl:attribute name="onmouseover">showCity()</xsl:attribute>
							<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<!--/////////////////////////////////////////////Line//////////////////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">line</xsl:attribute>
						<xsl:attribute name="stroke-width"><xsl:value-of select="5000 div $MAX"/></xsl:attribute>
						<xsl:for-each select="gml:featureCollection/gml:featureMember/*/*/gml:LineString">
							<xsl:call-template name="buildLine">
								<xsl:with-param name="MAX" select="$MAX"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:element>
					<!--/////////////////////////////////////////////////PolyGon////////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">polygon</xsl:attribute>
						<xsl:attribute name="stroke-width"><xsl:value-of select="0.5 div $MAX"/></xsl:attribute>
						<!-- buildingagriind-->
						<xsl:for-each select="gml:featureCollection/gml:featureMember/*/*/gml:Polygon">
							<xsl:call-template name="buildPolygon">
								<xsl:with-param name="MAX" select="$MAX"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:element>
					<!--/////////////////////////////////////////////////////Point/////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">point</xsl:attribute>
						<xsl:attribute name="stroke-width"><xsl:value-of select="0.5 div $MAX"/></xsl:attribute>
						<xsl:for-each select="gml:featureCollection/gml:featureMember/*/*/gml:Point">
							<xsl:call-template name="buildPoint">
								<xsl:with-param name="MAX" select="$MAX"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:element>
					<!--//////////////////////////////////////////////////EndPoint/////////////////////////////////////////////////////-->
					<xsl:element name="g">
						<xsl:attribute name="id">groupShowCoords</xsl:attribute>
						<xsl:attribute name="transform"><xsl:value-of select="concat('translate','(',$X1,' ',$matrix,')')"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<!--////////////////////////////////////////////////////////////FunctionBuildPoint///////////////////////////////////////////////////////////////////////////////////////-->
	<xsl:template name="buildPoint">
		<xsl:param name="MAX"/>
		<xsl:element name="ellipse">
			<xsl:attribute name="id"><xsl:value-of select="substring-before(name(parent::*),'.')"/></xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="ancestor::*[2]/child::*[3]"/></xsl:attribute>
			<xsl:attribute name="fill"><xsl:choose><xsl:when test="substring-before(name(parent::*),'.')='atm'"><xsl:value-of select="'green'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='telephone'"><xsl:value-of select="'orange'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='canteen'"><xsl:value-of select="'pink'"/></xsl:when><xsl:otherwise><xsl:value-of select="'yellow'"/></xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:attribute name="stroke">Black</xsl:attribute>
			<xsl:attribute name="stroke-width"><xsl:value-of select="0.5 div $MAX"/></xsl:attribute>
			<!-- define coordinate -->
			<xsl:attribute name="cx"><xsl:value-of select="substring-before(gml:coordinates,' ')"/></xsl:attribute>
			<xsl:attribute name="cy"><xsl:value-of select="substring-after(gml:coordinates,' ')"/></xsl:attribute>
			<!-- elllipse radious-->
			<xsl:attribute name="rx"><xsl:value-of select="0.5*$MAX div 100"/></xsl:attribute>
			<xsl:attribute name="ry"><xsl:value-of select="0.5*$MAX div 100"/></xsl:attribute>
			<xsl:attribute name="onmouseover">showCity('<xsl:value-of select="ancestor::*[2]/child::*[3]"/>')</xsl:attribute>
			<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
			<xsl:attribute name="onclick">cityClick('<xsl:value-of select="ancestor::*[2]/child::*[3]"/>')</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<!--////////////////////////////////////////////////////////////FunctionBuildLine///////////////////////////////////////////////////////////////////////////////////////-->
	<xsl:template name="buildLine">
		<xsl:param name="MAX"/>
		<xsl:element name="path">
			<xsl:attribute name="id"><xsl:value-of select="substring-before(name(parent::*),'.')"/></xsl:attribute>
			<xsl:attribute name="fill">none</xsl:attribute>
			<xsl:attribute name="stroke"><xsl:choose><xsl:when test="substring-before(name(parent::*),'.')='rail'"><xsl:value-of select="'maroon'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='road'"><xsl:value-of select="'Grey'"/></xsl:when></xsl:choose></xsl:attribute>
			<xsl:attribute name="stroke-width"><xsl:value-of select="5000 div $MAX"/></xsl:attribute>
			<xsl:attribute name="d"><xsl:value-of select="concat('M',gml:outerBoundaryIs/gml:LineString/gml:coordinates)"/></xsl:attribute>
			<xsl:attribute name="onmouseover">showCity('<xsl:value-of select="ancestor::*[2]/child::*[3]"/>')</xsl:attribute>
			<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
			<xsl:attribute name="onclick">cityClick('<xsl:value-of select="ancestor::*[2]/child::*[3]"/>')</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<!--////////////////////////////////////////////////////////////FunctionBuildPolygon///////////////////////////////////////////////////////////////////////////////////////-->
	<xsl:template name="buildPolygon">
		<xsl:param name="MAX"/>
		<xsl:element name="path">
			<!-- <xsl:attribute name="id"><xsl:value-of select="concat(agricultural_industry_building.name,'Building')"/></xsl:attribute> -->
			<xsl:attribute name="id"><xsl:value-of select="substring-before(name(parent::*),'.')"/></xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="ancestor::*[2]/child::*[3]"/></xsl:attribute>
			<xsl:attribute name="fill"><xsl:choose><xsl:when test="substring-before(name(parent::*),'.')='buildingagriind'"><xsl:value-of select="'red'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='buildingarch'"><xsl:value-of select="'purple'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='engineering_building'"><xsl:value-of select="'navy'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='buildingindedu'"><xsl:value-of select="'brown'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='buildingsci'"><xsl:value-of select="'fuchsia'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='institute_building'"><xsl:value-of select="'pink'"/></xsl:when><xsl:when test="substring-before(name(parent::*),'.')='water_polygon'"><xsl:value-of select="'aqua'"/></xsl:when><xsl:otherwise><xsl:value-of select="'lime'"/></xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:attribute name="stroke">black</xsl:attribute>
			<xsl:attribute name="stroke-width"><xsl:value-of select="0.5 div $MAX"/></xsl:attribute>
			<xsl:attribute name="d"><xsl:value-of select="concat('M',gml:outerBoundaryIs/gml:LinearRing/gml:coordinates,' ','Z')"/></xsl:attribute>
			<xsl:attribute name="onmouseover">showCity('<xsl:value-of select="ancestor::*[2]/child::*[3]"/>')</xsl:attribute>
			<xsl:attribute name="onmouseout">emptyCity()</xsl:attribute>
			<xsl:attribute name="onclick">cityClick('<xsl:value-of select="ancestor::*[2]/child::*[3]"/>')</xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
