	var evtX;
	var evtY;
	var rectUlXCorner;
	var rectUlYCorner;
	var rectOvewidth;
	var rectOveheight;
	var pressed;
	var rectOveXcorner;
	var rectOveYcorner;
	var xZoomRadian;
	var yZoomRadian;
	var xZoomFactor;
	var yZoomFactor;
	var panFactor = 2000;
	//var defaultZoomView = 100;
	//var zoomVal = 100;
	var zoomNow = false; // if true = can zoom,  if false = can't zoom
	var zoomIn; // false
	var zoomOut; // false
	var SVGDoc;
	var elementTarget;
	var mapView;
	var newViewBox;
	var fixViewBox;
	var xCenter;
	var yCenter;
	var fixXCorner = 654500;
	var fixYCorner = 1537000;
	var xCornerViewBox;
	var yCornerViewBox;
	var fixWidthViewBox = 10000;
	var fixHeightViewBox = 10000;
	var widthViewBox;
	var heightViewBox;
	var transform;
	var scaleVal = 1;
	var defaultScaleVal = 1;
	var x;
	var y;
	var placeLat;
	var placeLon;
	var callIndicator = false;
	var setangle;
	var angle;

	var svgRect;
	var theZoom = 100;
	var zoomVal = 100;
	var rectOveXcorner;
	var rectOveYcorner;
	var rectXcorner = 0;
	var rectYcorner = 0;
	var qualityfactor=5;
	var qualityfactorX=5;
	var qualityfactorY=5;
	var mapWidth =600;
	var mapHeight =400;
	var WidthVB =3000;
	var HeightVB =2000;
	var svgMainViewport;
	var yy;
	var xx;
//===========================================================
//=							Main							=
//===========================================================
	function main(evt) {
		SVGDoc = evt.target.ownerDocument;
		xZoomFactor = (fixWidthViewBox/2) - (0.45*fixWidthViewBox);
		yZoomFactor = (fixHeightViewBox/2) - (0.45*fixHeightViewBox);
		widthViewBox = fixWidthViewBox;
		heightViewBox = fixHeightViewBox;
		xZoomRadian = widthViewBox/2;
		yZoomRadian = heightViewBox/2;
		xCornerViewBox = fixXCorner;
		yCornerViewBox = fixYCorner;
		xCenter = xCornerViewBox + (fixWidthViewBox/2);
		yCenter = yCornerViewBox + (fixHeightViewBox/2);
		fixViewBox = fixXCorner + " " + fixYCorner + " " + fixWidthViewBox + " " + fixHeightViewBox;
		angle = 0;
		//alert("xfac : " + xZoomFactor + ", yfac : " + yZoomFactor);
	}

//===========================================================
//=						switchColor							=
//===========================================================
	function switchColor (evt,property,newcolor) {
		var target = evt.target;
		target.getStyle().setProperty(property, newcolor, ""); //batik
	}

//===========================================================
//=						setArrowCursor						=
//===========================================================
	function setArrowCursor() {
		zoomNow = false;
		SVGDoc.getElementById("main").setAttribute("cursor", "auto");
	}

//===========================================================
//=						setZoomIn							=
//===========================================================
	function setZoomIn(evt) {
		if (xZoomRadian > 500)
		{
		zoomNow = true;
		zoomIn = true;
		zoomOut = false;
		//SVGDoc.getElementById("main").setAttribute("cursor", getURL("http://161.246.5.56/pic/zoomIn2.gif"));

		_zoomIn(evt);
		//if (callIndicator) {
		//	showIndicator();
		//}
		}	
	}

//===========================================================
//=						setZoomOut							=
//===========================================================
	function setZoomOut(evt) {
		if (xZoomRadian < 5000)
		{
		zoomNow = true;
		zoomIn = false;
		zoomOut = true;
		//SVGDoc.getElementById("main").setAttribute("cursor", "url(#zoomOutCursor)");

		_zoomOut(evt);
		//if (callIndicator) {
		//	showIndicator();
		//}
		}
	}

//===========================================================
//=						resetZoomView						=
//===========================================================
	function resetZoomView(evt) {
		zoomNow = false;
		Zoomto(evt,"100");
		xCornerViewBox = fixXCorner;
		yCornerViewBox = fixYCorner;
		widthViewBox = fixWidthViewBox;
		heightViewBox = fixHeightViewBox;
		xZoomFactor = (fixWidthViewBox/2) - (0.45*fixWidthViewBox);
		yZoomFactor = (fixHeightViewBox/2) - (0.45*fixHeightViewBox);
		xZoomRadian = widthViewBox/2;
		yZoomRadian = heightViewBox/2;
		panFactor = 1000;
		mapView = SVGDoc.getElementById("mapview");
		mapView.setAttribute("viewBox", fixViewBox);
		changeAngle(evt,'ro',-angle)
		//hideIndicator();
		svgRect.setAttributeNS(null,'x',0);
		svgRect.setAttributeNS(null,'y',0);
		svgRect.setAttributeNS(null,'width',WidthVB);
		svgRect.setAttributeNS(null,'height',HeightVB);

	}

//===========================================================
//=						_zoomIn								=
//===========================================================
	function _zoomIn(evt) {
		mapView = SVGDoc.getElementById("mapview");

		xZoomRadian = widthViewBox/2;
		yZoomRadian = heightViewBox/2;

		if (xZoomRadian <= xZoomFactor) {
			if (xZoomFactor > 200) {
				xZoomFactor = 100;
				yZoomFactor = 100;
			}
			else {
				xZoomFactor = 0;
				yZoomFactor = 0;
			}
		}

		
		if (xZoomFactor <= 0) {
			zoomIn = false;
			SVGDoc.getElementById("ZoomInGraphics").setAttribute("opacity", "0.5");
			SVGDoc.getElementById("ZoomInGraphics").setAttribute("pointer-events", "none");
		}
		else if (xZoomFactor > 0) {
			zoomIn = true;
			SVGDoc.getElementById("ZoomInGraphics").setAttribute("opacity", "1");
			SVGDoc.getElementById("ZoomInGraphics").setAttribute("pointer-events", "all");
		}
		// Let's Zoom in 
		if (zoomIn) {
			xZoomRadian = xZoomRadian - xZoomFactor;
			yZoomRadian = yZoomRadian - yZoomFactor;

			if (xZoomRadian > 0) {
				xCornerViewBox = xCenter - xZoomRadian;
				yCornerViewBox = yCenter - yZoomRadian;
				widthViewBox = xZoomRadian*2;
				heightViewBox = yZoomRadian*2;
				newViewBox = xCornerViewBox + " " + yCornerViewBox + " " + widthViewBox + " " + heightViewBox;
				mapView.setAttribute("viewBox", newViewBox);
			}
			//alert("xR : " + xZoomRadian);
			//alert("xCorner : " + xCornerViewBox + ", yCorner : " + yCornerViewBox + ", width : " + widthViewBox + ", height : " + heightViewBox);
		}
		zoomminimap(evt);
	}

//===========================================================
//=						_zoomOut							=
//===========================================================
	function _zoomOut(evt) {
		mapView = SVGDoc.getElementById("mapview");

			xZoomRadian = widthViewBox/2;
			yZoomRadian = heightViewBox/2;

			if ((xZoomFactor <= 0) || (yZoomFactor <= 0)) {
				xZoomFactor = 0.2*xZoomFactor;
				yZoomFactor = 0.2*yZoomFactor;
			}
			else {
				xZoomFactor = (fixWidthViewBox/2) - (0.45*fixWidthViewBox);
				yZoomFactor = (fixHeightViewBox/2) - (0.45*fixHeightViewBox);
			}

		// Let's Zoom Out
		if (zoomOut) {
			xZoomRadian = xZoomRadian + xZoomFactor;
			yZoomRadian = yZoomRadian + yZoomFactor;

			if (xZoomRadian > 0) {
				xCornerViewBox = xCenter - xZoomRadian;
				yCornerViewBox = yCenter - yZoomRadian;
				widthViewBox = xZoomRadian*2;
				heightViewBox = yZoomRadian*2;
				//alert("xCorner : " + xCornerViewBox + ", yCorner : " + yCornerViewBox + ", width : " + widthViewBox + ", height : " + heightViewBox);
				newViewBox = xCornerViewBox + " " + yCornerViewBox + " " + widthViewBox + " " + heightViewBox;
				mapView.setAttribute("viewBox", newViewBox);
			}
		}
		zoomminimap(evt);
	}
	
//===========================================================
//=						Zoomminimap							=
//===========================================================
	function zoomminimap(evt) {
		//alert("xR : " + xZoomRadian);
		//alert("xCorner : " + xCornerViewBox + ", yCorner : " + yCornerViewBox + ", width : " + widthViewBox + ", height : " + heightViewBox);
		var valueto;
		switch (xZoomRadian)
		{
		case 5000 : valueto = 100; break;
		case 4500 : valueto = 111; break;
		case 4000 : valueto = 125; break;
		case 3500 : valueto = 141; break;
		case 3000 : valueto = 167; break;
		case 2500 : valueto = 190; break;
		case 2000 : valueto = 235; break;
		case 1500 : valueto = 330; break;
		case 1000 : valueto = 485; break;
		case 500  : valueto = 830; break;
		case 400  : valueto = 850; break;
		default   : valueto = 0; break;
		}
		//var valueto = xZoomRadian/15;
		//alert("xR : " + valueto);
		Zoomto(evt,valueto);
	}
//===========================================================
//=							Pan								=
//===========================================================

	function pan(evt) {
		var target = evt.target;
		if (xZoomRadian > 3000) {
			panFactor = 2000;
		}
		else if ((xZoomRadian > 1500) && (xZoomRadian < 3000)) {
			panFactor = 1000;
		}
		else if ((xZoomRadian > 700) && (xZoomRadian < 1500)) {
			panFactor = 500;
		}
		else if (xZoomRadian <= 700) {
			panFactor = 10;
		}
		//alert(panFactor);
		//alert(target.getAttribute("id"));
		

		if (target.getAttribute("id") == "panUpLeft") {
			xCornerViewBox = xCornerViewBox - panFactor;
			yCornerViewBox = yCornerViewBox - panFactor;
		}
		else if (target.getAttribute("id") == "panUp") {
			yCornerViewBox = yCornerViewBox - panFactor;
		}
		else if (target.getAttribute("id") == "panUpRight") {
			xCornerViewBox = xCornerViewBox + panFactor;
			yCornerViewBox = yCornerViewBox - panFactor;
		}

		else if (target.getAttribute("id") == "panLeft") {
			xCornerViewBox = xCornerViewBox - panFactor;
		}
		else if (target.getAttribute("id") == "panRight") {
			xCornerViewBox = xCornerViewBox + panFactor;

		}

		else if (target.getAttribute("id") == "panDownLeft") {
			xCornerViewBox = xCornerViewBox - panFactor;
			yCornerViewBox = yCornerViewBox + panFactor;
		}
		else if (target.getAttribute("id") == "panDown") {
			yCornerViewBox = yCornerViewBox + panFactor;
		}
		else if (target.getAttribute("id") == "panDownRight") {
			xCornerViewBox = xCornerViewBox + panFactor;
			yCornerViewBox = yCornerViewBox + panFactor;
		}

		xCenter = xCornerViewBox + (widthViewBox/2);
		yCenter = yCornerViewBox + (heightViewBox/2);


		newViewBox = xCornerViewBox + " " + yCornerViewBox + " " + widthViewBox + " " + heightViewBox;
		SVGDoc.getElementById("mapview").setAttribute("viewBox", newViewBox);
		//alert(newViewBox);
		
		/*if (callIndicator) {
			showIndicator();
		}*/

	}

//===========================================================
//=							move							=
//===========================================================
	function move(evt) {
		x = evt.getClientX();
		y = evt.getClientY();
		if ((x > 50) && (x < 650) && (y > 50) && (y < 450))
		{
			latMouse = ((x - 50)*widthViewBox/600) + xCornerViewBox;
			lonMouse = ((y - 50)*heightViewBox/400) + yCornerViewBox;
			latMouse = latMouse/10000;
			lonMouse = lonMouse/10000;
			
			var textLatMouseValue = SVGDoc.getElementById("textLatMouseValue");
			var textLonMouseValue = SVGDoc.getElementById("textLonMouseValue");
			textLatMouseValue.firstChild.nodeValue = latMouse;
			textLonMouseValue.firstChild.nodeValue = lonMouse;
			//alert(latMouse);
		}
	}

//===========================================================
//=						showInfo							=
//===========================================================
	function showInfo(evt, info, info2, info3) {
		elementTarget = get_target(evt);
		var objText = SVGDoc.getElementById("info");
		var objText2 = SVGDoc.getElementById("info2");
		var objText3 = SVGDoc.getElementById("info3");
		var objText4 = SVGDoc.getElementById("info4");
		var objBox = SVGDoc.getElementById("infoBoxRect");
				
		objText.firstChild.nodeValue = info;
		objText.setAttribute("x", x + 70); //x + 5 + 15
		objText.setAttribute("y", y - 3); //y + 12 - 15
		//objText.getStyle().setProperty("visibility", "visible",""); //batik
		objText.setAttribute("visibility", "visible");
		
		if (info2 != null) {
			objText2.firstChild.nodeValue = info2;
			objText2.setAttribute("x", x + 70); //x + 5 + 15
			objText2.setAttribute("y", y + 13); //y + 12 - 15 + 16
			//objText.getStyle().setProperty("visibility", "visible",""); //batik
			objText2.setAttribute("visibility", "visible");
		}
		
		if (info3 != null) {
			objText3.firstChild.nodeValue = info3;
			objText3.setAttribute("x", x + 70); //x + 5 + 15
			objText3.setAttribute("y", y + 29); //y + 12 - 15 + 16 + 16
			//objText.getStyle().setProperty("visibility", "visible",""); //batik
			objText3.setAttribute("visibility", "visible");
		}
		objBox.setAttribute("x", x + 15); // x +15
		objBox.setAttribute("y", y - 15); // y - 15
		//objBox.getStyle().setProperty("visibility", "visible",""); //batik
		objBox.setAttribute("visibility", "visible");
	}

//===========================================================
//=							hideInfo						=
//===========================================================
	function hideInfo(evt) {
		elementTarget = get_target(evt);
		var objText = SVGDoc.getElementById("info");
		var objText2 = SVGDoc.getElementById("info2");
		var objText3 = SVGDoc.getElementById("info3");
		var objBox = SVGDoc.getElementById("infoBoxRect");
		
		//objText.getStyle().setProperty("visibility", "hidden");
		objText.setAttribute("visibility", "hidden");
		objText2.setAttribute("visibility", "hidden");
		objText3.setAttribute("visibility", "hidden");
		//objBox.getStyle().setProperty("visibility", "hidden");
		objBox.setAttribute("visibility", "hidden");
	}

//===========================================================
//=						get_target							=
//===========================================================
	function get_target(evt) {
		var target = evt.getTarget();
		while (target && !target.getAttribute('id')) 
			target = target.getParentNode();
		return target;
	}

//===========================================================
//=						expandLegend						=
//===========================================================
	function expandLegend(id,layer) {
		checkobj = SVGDoc.getElementById(id + 'Check');
		checkvisibility = checkobj.getStyle().getPropertyValue('visibility');
		checkcolor = checkobj.getStyle().getPropertyValue('stroke');
		if (checkvisibility == 'visible') {
			checkobj.getStyle().setProperty('visibility','hidden');
			showSVGLayer(layer, id + 'Check');
		}
		else {
			checkobj.getStyle().setProperty('visibility','visible');
			showSVGLayer(layer, id + 'Check');
		}
	}

//===========================================================
//=						showSVGLayer						=
//===========================================================
	function showSVGLayer(id,check_n) {
		var svgObj;
		var svgStyle;
		var checkVal;
		svgObj = SVGDoc.getElementById(id);
		//svgStyle = svgObj.getStyle();
		//checkcolor = SVGDoc.getElementById(check_n);
		//alert(id);
		//window.alert(svgObj.getAttribute('visibility'));
		//window.alert(svgObj.getAttribute("visibility"));
		if (svgObj.getAttribute('visibility') == 'visible' || svgObj.getAttribute('visibility') == 'hidden') {
			if (svgObj.getAttribute('visibility') == 'visible') {
				checkVal = false;
			} 
			else {
				checkVal= true;
			}
		}
		else {
			checkVal = false;
		}
		if (checkVal == true) {
			svgObj.setAttribute('visibility','visible');
			checkobj = SVGDoc.getElementById(check_n);
			checkobjstyle = checkobj.getStyle();
			checkobjstyle.setProperty('visibility','visible');
		}
		else {
			svgObj.setAttribute('visibility','hidden');
			checkobj = SVGDoc.getElementById(check_n);
			checkobjstyle = checkobj.getStyle();
			checkobjstyle.setProperty('visibility','hidden');
		}
	}

//===========================================================
//=							search							=
//===========================================================
	function searchResult() {
		var placeIDText = SVGDoc.getElementById("placeID");
		var placeID = placeIDText.firstChild.nodeValue;
		placeLat = SVGDoc.getElementById(placeID).getAttribute("x");
		placeLon = SVGDoc.getElementById(placeID).getAttribute("y");
		xCenter = placeLat;
		yCenter = placeLon;
		fixXCorner = xCenter - 6000;
		fixYCorner = yCenter - 4000;
		xCornerViewBox = fixXCorner;
		yCornerViewBox = fixYCorner;
		fixWidthViewBox = 12000;
		fixHeightViewBox = 8000;
		widthViewBox = fixWidthViewBox;
		heightViewBox = fixHeightViewBox;
		newViewBox = fixXCorner + " " + fixYCorner + " " + widthViewBox + " " + heightViewBox;
		mapView = SVGDoc.getElementById("mapview");
		mapView.setAttribute("viewBox", newViewBox);
		//alert(placeIDText.firstChild.nodeValue);
		//alert(fixXCorner);
		//alert(placeIDText.firstChild.nodeValue);
	}

//===========================================================
//=						showIndicator						=
//===========================================================

	function showIndicator() {
		callIndicator = true;
		var indicator = SVGDoc.getElementById("indicator");
		indicator.setAttribute('visibility','visible');
		var xIndicator = ((placeLat - xCornerViewBox)*600/widthViewBox) + 50;
		var yIndicator = ((placeLon - yCornerViewBox)*400/heightViewBox) + 45;
		var transform = "translate(" + xIndicator + "," + yIndicator + ")";
		indicator.setAttribute('transform', transform);
	}

//===========================================================
//=						hideIndicator						=
//===========================================================
	
	function hideIndicator() {
		var indicator = SVGDoc.getElementById("indicator");
		indicator.setAttribute('visibility','hidden');
		callIndicator = false;
	}

//===========================================================
//=							test							=
//===========================================================
	function t() {
		//var url = "http://161.246.5.56/1234.jsp";
		//alert('http://161.246.5.56/1234.jsp');
		alert(document.cookie);
	}
	
//===========================================================
//=						  Change Angle						=
//===========================================================
	function changeAngle (evt,id,value) {
		angle = angle + value;
		checkobj = SVGDoc.getElementById('ro');
		//",652000,1537000)"
		setangle = "rotate(" + angle + "," + xCenter + "," + yCenter + ")";
		checkobj.setAttribute('transform', setangle);
		checkobj = SVGDoc.getElementById('AAA');
		setangle = "rotate(" + angle + ",28,5)";
		checkobj.setAttribute('transform', setangle);

	}

//===========================================================
//=                     Zoom to                             =
//===========================================================
function locateResizingRect(evt){
	svgdoc = evt.getTarget().getOwnerDocument();
	svgRect = svgdoc.getElementById('locationRect');
	if (parseInt(svgRect.getAttributeNS(null,'width')) != parseInt(WidthVB))
		{
		rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
		rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
		rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
		rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
		}
}

function Zoomto(evt,tovalue)
{
	if (tovalue != "0")
	{
	svgdoc = evt.getTarget().getOwnerDocument();
	zoomVal = parseInt(tovalue);
	theZoom  = zoomVal;
	svgRect = svgdoc.getElementById('locationRect');
	svgMainViewport = svgdoc.getElementById('mapview');
	rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
	rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
	rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
	rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
	xcenter = rectOveXcorner + rectOvewidth / 2;
	ycenter = rectOveYcorner + rectOveheight / 2;
	xnulcorner = xcenter - qualityfactorX*mapWidth / 2 * (100/zoomVal);
	ynulcorner = ycenter - qualityfactorY*mapHeight / 2 * (100/zoomVal);
	/*if ((zoomtool == 'zoomin') && (Rpressed != 0))
		{
		xnulcorner = rectOveXcorner +(MapX-10)*(rectOvewidth/(mapWidth));
		ynulcorner = rectOveYcorner + (MapY-40)*(rectOveheight/(mapHeight));
		}
	*/
	nWidth = qualityfactorX*mapWidth * (100/zoomVal);
	nHeight = qualityfactorY*mapHeight * (100/zoomVal);
	svgRect.setAttributeNS(null,'x',xnulcorner);
	svgRect.setAttributeNS(null,'y',ynulcorner);
	svgRect.setAttributeNS(null,'width',nWidth);
	svgRect.setAttributeNS(null,'height',nHeight);
	if (tovalue == "100")
	{
		svgRect.setAttributeNS(null,'visibility','hidden');
	} else {
		svgRect.setAttributeNS(null,'visibility','visible');
	}
	locateResizingRect(evt);
	yy = svgMainViewport.currentTranslate.y; 
	xx = svgMainViewport.currentTranslate.x;
	xnulcorner = fixXCorner + parseFloat(5*xnulcorner + (qualityfactor*xx*100/zoomVal)) - (10000-2*xZoomRadian)/4;
	ynulcorner = fixYCorner + parseFloat(5*ynulcorner + (qualityfactor*yy*100/zoomVal));
	newViewport = xnulcorner + ' ' + ynulcorner + ' ' + 10/3*nWidth + ' ' + 5*nHeight;
	svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
	}
}


//===========================================================
//=                     beginPan                            =
//===========================================================
function beginPan(evt) 
{
	svgdoc=evt.getTarget().getOwnerDocument();
	svgRect = svgdoc.getElementById('locationRect');
	pressed = 1;
	rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
	rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
	evtX = parseFloat(evt.clientX);
	evtY = parseFloat(evt.clientY);
	rectUlXCorner = parseFloat(svgRect.getAttributeNS(null,'x'));
	rectUlYCorner = parseFloat(svgRect.getAttributeNS(null,'y'));
}
//===========================================================
//=                      doPan                              =
//===========================================================
function doPan(evt)
{
	
	if (pressed == 1) 
		{
		svgdoc=evt.getTarget().getOwnerDocument();
		svgRect = svgdoc.getElementById('locationRect');
		newEvtX = parseFloat(evt.clientX);
		newEvtY = parseFloat(evt.clientY);
		toMoveX = parseFloat(rectUlXCorner + (newEvtX - evtX) * 5*qualityfactor);
		toMoveY = parseFloat(rectUlYCorner + (newEvtY - evtY) * 5*qualityfactor);
		if (toMoveX < rectXcorner) 
			{
			svgRect.setAttributeNS(null,'x',rectXcorner);
			}
		else if ((toMoveX + rectOvewidth) > (rectXcorner + WidthVB)) 
			{
			svgRect.setAttributeNS(null,'x',rectXcorner + WidthVB - rectOvewidth);}
		else 
			{
			svgRect.setAttributeNS(null,'x',toMoveX);
			}
		if (toMoveY < rectYcorner) 
			{
			svgRect.setAttributeNS(null,'y',rectYcorner);}
		else if ((toMoveY + rectOveheight) > (rectYcorner + HeightVB)) 
			{
			svgRect.setAttributeNS(null,'y',rectYcorner + HeightVB - rectOveheight);}
		else 
			{
			svgRect.setAttributeNS(null,'y',toMoveY);
			}
		evtX = newEvtX;
		evtY = newEvtY;
		rectUlXCorner = parseFloat(svgRect.getAttributeNS(null,'x'));
		rectUlYCorner = parseFloat(svgRect.getAttributeNS(null,'y'));
		locateResizingRect(evt);
		}
}
//===========================================================
//=                     endPan                              =
//===========================================================
function endPan(evt) 
	{
	var	miniViewport;
	svgdoc=evt.getTarget().getOwnerDocument();
	svgRect = svgdoc.getElementById('locationRect');
	svgMainViewport = svgdoc.getElementById('mapview');
	rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
	rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
	miniViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + parseFloat(svgRect.getAttributeNS(null,'width')) + ' ' + parseFloat(svgRect.getAttributeNS(null,'height'));
	//alert(rectOveXcorner + ' ' + rectOveYcorner);
	yyy = svgMainViewport.currentTranslate.y;
	xxx = svgMainViewport.currentTranslate.x;
	rectOveYcorner = fixYCorner + parseFloat(5*rectOveYcorner + (qualityfactor* yyy *100/zoomVal));
	rectOveXcorner = fixXCorner + parseFloat(5*rectOveXcorner + (qualityfactor* xxx *100/zoomVal)) - (10000-2*xZoomRadian)/4;
	rectOvewidth = 10/3*parseFloat(svgRect.getAttributeNS(null,'width'));
	rectOveheight = 5*parseFloat(svgRect.getAttributeNS(null,'height'));
	newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
	//alert(newViewport);
	svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
	if (pressed == 1)
		{
		//checkForTiles(evt);
		}
	pressed = 0;
}
