var WidthVB =2245;
var HeightVB =1725;
var rectOveXcorner;
var rectOveYcorner;
var rectXcorner = 0;
var rectYcorner = 0;
var widthOverview;
var heightOverview;
var svgRect;
var svgMainViewport;
var width;
var height;
var nWidth;
var nHeight;
var newViewport;
var theZoom = 100;
var offsetYmap = 90;
var offsetXmap = 90;
var pressed= 0;
var zoomVal =  100;
var evtX;
var evtY;
var zoom = 20;
var zoom_init;
var scaleFactor = 1;
var infoTipOffsetFactor =1;
var nblayer;
var tablayers;
var rectOvewidth;
var rectOveheight;
var Rpressed = 0;
var RevtX, RevtY;
var RnewevtX, RnewevtY;
var MapX = 0;
var MapY = 0;
var svgdoc;
var zoomtool;
var qualityfactor=5;
var mapWidth =449;
var mapHeight =345;
var nbsplit;
var zoomScaling=true;
var svgns = 'http://www.w3.org/2000/svg';
var dbxns = 'http://www.dbxgeomatics.com/ns';
function showinfotip (evt, info){
var splitString;
splitString = info.split('\n');
nbsplit = splitString.length;
var target = get_target(evt);
svgdoc = target.getOwnerDocument();
var svgdocElement = svgdoc.getDocumentElement();
var scale = svgdocElement.getCurrentScale();
var translateX = svgdocElement.getCurrentTranslate().getX();
var translateY = svgdocElement.getCurrentTranslate().getY();
var pixel = qualityfactor / scale;
var infotip = 'infotip';
var infotiprect = 'infotipRect';
var svgobj = svgdoc.getElementById (infotip);
var svgobjtxt = svgobj;
svgobj.setAttributeNS(null,'x', Math.round(evt.getClientX()+15));
svgobj.setAttributeNS(null,'y', Math.round(evt.getClientY()));
var svgstyle = svgobj.getStyle();
svgstyle.setProperty ('visibility', 'visible');
svgstyle.setProperty('font-size', 12);
svgobj1 = svgobj.getFirstChild();
if (nbsplit == 1)
	{
	svgobj1.setData(info);
	}
else
	{
	svgobj1.setData(splitString[0]);
	for (k=1; k<nbsplit ; k++)
		{
		myspan = svgdoc.createElement('tspan');
		myspan.setAttributeNS(null,'dy', 1.2+'em');
		myspan.setAttributeNS(null,'id', k);
		myspan.setAttributeNS(null,'x', Math.round(evt.getClientX()+15));
		myspan.appendChild(svgdoc.createTextNode(splitString[k]));
		svgobj.appendChild(myspan);
		}
	}
var txtlen=1.2*svgobj.getBBox().width;
var svgobj = svgdoc.getElementById (infotiprect);
svgobj.setAttributeNS(null,'x', (Math.round(evt.getClientX()+12.5)));
svgobj.setAttributeNS(null,'y', (Math.round(evt.getClientY()-10)));
svgobj.setAttributeNS(null,'width', txtlen);
if (nbsplit >1) svgobj.setAttributeNS(null,'height',1.2*nbsplit+'em');else svgobj.setAttribute ('height',1+'em');
svgobj.setAttributeNS(null,'rx', 3);
svgobj.setAttributeNS(null,'ry', 3);
var svgstyle = svgobj.getStyle();
svgstyle.setProperty('visibility', 'visible');
}

function hideinfotip(evt)
	{
	var target = get_target(evt);
	svgdoc = target.getOwnerDocument();
	var infotip = 'infotip';
	var infotiprect = 'infotipRect';
	var svgobj = svgdoc.getElementById (infotip);
	if (nbsplit == 1)
		{
		svgobj.getStyle().setProperty ('visibility', 'hidden');
		}
	else
		{
		nodelist = svgobj.getChildNodes();
		for (k=nbsplit-1; k>0; k--)
			{
			svgobj.removeChild(nodelist.item(k))
			}
		svgobj.getStyle().setProperty ('visibility', 'hidden');
	}
	svgdoc.getElementById(infotiprect).getStyle().setProperty ('visibility', 'hidden');
}

function expandLegend(id,layer){checkobj = svgdoc.getElementById('check' + id);checkvisibility = checkobj.getStyle().getPropertyValue('visibility');checkcolor = checkobj.getStyle().getPropertyValue('stroke');indice = parseInt(id);if (checkvisibility == 'visible')
{if (checkcolor == 'rgb(0, 0, 0)'){	checkobj.getStyle().setProperty('visibility','hidden');	showSVGLayer(layer,'check'+ id );}if (checkcolor == 'rgb(255, 0, 0)'){checkobj.getStyle().setProperty('visibility','hidden');}
}else{if (checkobj.getAttributeNS(dbxns,'pot_visible')=='true'){showSVGLayer(layer,'check'+ id );}checkobj.getStyle().setProperty('visibility','visible');}}
function showAbout(evt){about = svgdoc.getElementById('AboutSVGMapMaker');about.getStyle().setProperty('visibility','visible');var animations = svgDocument.getElementsByTagName('animate'); for ( var i = 0; i < animations.length; i++ ) { animations.item(i).beginElement(); }var animations = svgDocument.getElementsByTagName('animateTransform');
for ( var i = 0; i < animations.length; i++ ) { animations.item(i).beginElement(); } closerect = svgdoc.getElementById('closerect');closerect.getStyle().setProperty('fill','none');}function hideAbout(){about = svgdoc.getElementById('AboutSVGMapMaker');about.getStyle().setProperty('visibility','hidden');}
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

function Zoomin(evt)
{
	svgdoc= evt.getTarget().getOwnerDocument();
	objbgrectevt = svgdoc.getElementById('bgrectevt');
	objbgrectevt.getStyle().setProperty('pointer-events','visible');
	objbgrectevt.getStyle().setProperty('visibility','visible');
	
	svgdoc.getElementById('bgrectevt').getStyle().setProperty('visibility','visible');
	svgdoc.getElementById('zoominpusheffectbr').getStyle().setProperty('visibility','hidden');
	svgdoc.getElementById('zoominpusheffectul').getStyle().setProperty('visibility','visible');
	svgdoc.getElementById('zoominpusheffectrec').getStyle().setProperty('fill','url(#lcDeg4)');
	zoomtool = 'zoomin';
	svgdoc.getElementById('releasezoom').getStyle().setProperty('visibility','visible');
	svgdoc.getElementById('releasezoom').getStyle().setProperty('pointer-events','visible');
	
}

function releaseZoom(evt)
{	
	svgdoc= evt.getTarget().getOwnerDocument();
	svgdoc.getElementById('bgrectevt').getStyle().setProperty('pointer-events','none');
	svgdoc.getElementById('bgrectevt').getStyle().setProperty('visibility','hidden');
	svgdoc.getElementById('releasezoom').getStyle().setProperty('visibility','hidden');
	svgdoc.getElementById('releasezoom').getStyle().setProperty('pointer-events','none');
	svgdoc.getElementById('zoominpusheffectbr').getStyle().setProperty('visibility','visible');
	svgdoc.getElementById('zoominpusheffectul').getStyle().setProperty('visibility','hidden');
	svgdoc.getElementById('zoominpusheffectrec').getStyle().setProperty('fill','url(#lcDeg3)');
	zoomtool='';
}

function Zoomless(evt)
{
zoomVal = zoomVal - 50;
Zoomto(evt,zoomVal);
}

function Zoommore(evt)
{

zoomVal = zoomVal + 50;
Zoomto(evt,zoomVal);
}

function cleanzoombar(evt)
{
svgdoc = evt.getTarget().getOwnerDocument();
for (var i=0; i<19; i++)
	{
	oldbarzoom = svgdoc.getElementById('rectzoom'+parseInt(100+i*50));
	oldbarzoom.getStyle().setProperty('fill','rgb(165,206,239)');
	}
}

function Zoomto(evt,tovalue)
{
	svgdoc = evt.getTarget().getOwnerDocument();
	cleanzoombar(evt);
	var oldbarzoom = svgdoc.getElementById('rectzoom'+theZoom);
	oldbarzoom.getStyle().setProperty('stroke','none');
	var barzoom = svgdoc.getElementById('rectzoom'+tovalue);
	barzoom.getStyle().setProperty('stroke','rgb(0,0,0)');
	svgdoc.getElementById('gcursor').setAttributeNS(null,'transform','translate(0,'+ parseInt(-parseInt(tovalue)*0.08 +90) +')');
	var coef;
	coef = theZoom/tovalue;
	if (zoomScaling)
	{
	if (tovalue < theZoom)
		{
		resizeObjects(evt,'grow',coef);
		}
	else
		{
		resizeObjects(evt,'reduce',coef);
		}
	}	
	zoomVal = parseInt(tovalue);
	theZoom  = zoomVal;
	svgRect = svgdoc.getElementById('locationRect');
	svgMainViewport = svgdoc.getElementById('mapid');
	rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
	rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
	rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
	rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
	xcenter = rectOveXcorner + rectOvewidth / 2;
	ycenter = rectOveYcorner + rectOveheight / 2;
	xnulcorner = xcenter - qualityfactor*mapWidth / 2 * (100/zoomVal);
	ynulcorner = ycenter - qualityfactor*mapHeight / 2 * (100/zoomVal);
	if ((zoomtool == 'zoomin') && (Rpressed != 0))
		{
		xnulcorner = rectOveXcorner +(MapX-10)*(rectOvewidth/(mapWidth));
		ynulcorner = rectOveYcorner + (MapY-40)*(rectOveheight/(mapHeight));
		}
	
	nWidth = qualityfactor*mapWidth * (100/zoomVal);
	nHeight = qualityfactor*mapHeight * (100/zoomVal);
	svgRect.setAttributeNS(null,'x',xnulcorner);
	svgRect.setAttributeNS(null,'y',ynulcorner);
	svgRect.setAttributeNS(null,'width',nWidth);
	svgRect.setAttributeNS(null,'height',nHeight);
	svgRect.setAttributeNS(null,'visibility','visible');
	locateResizingRect(evt);
	y = svgMainViewport.currentTranslate.y; 
	x = svgMainViewport.currentTranslate.x;
	xnulcorner = xnulcorner + (qualityfactor*x*100/zoomVal);
	ynulcorner = ynulcorner + (qualityfactor*y*100/zoomVal);
	newViewport = xnulcorner + ' ' + ynulcorner + ' ' + nWidth + ' ' + nHeight;
	svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
	
	if (zoomVal>100)
		{
		zoomin=svgdoc.getElementById('zoomless');
		zoomin.getStyle().setProperty('pointer-events','visible');
		zoomin.getStyle().setProperty('opacity','1');
		}
	else
		{
		zoomin=svgdoc.getElementById('zoomless');
		zoomin.getStyle().setProperty('pointer-events','none');
		zoomin.getStyle().setProperty('opacity','0.5');
		}
	if (zoomVal==1000)
		{
		zoomin=svgdoc.getElementById('ZoomInGraphics');
		zoomin.getStyle().setProperty('pointer-events','none');
		zoomin.getStyle().setProperty('opacity','0.5');
		zoomin=svgdoc.getElementById('zoommore');
		zoomin.getStyle().setProperty('pointer-events','none');
		zoomin.getStyle().setProperty('opacity','0.5');
		}
	else
		{
		zoomin=svgdoc.getElementById('ZoomInGraphics');
		zoomin.getStyle().setProperty('pointer-events','visible');
		zoomin.getStyle().setProperty('opacity','1');
		zoomin=svgdoc.getElementById('zoommore');
		zoomin.getStyle().setProperty('pointer-events','visible');
		zoomin.getStyle().setProperty('opacity','1');
		}
	if (zoomVal == 100)
		{
		svgRect.setAttributeNS(null,'visibility','hidden');
		newViewport = 0 + ' ' + 0 + ' ' + qualityfactor*mapWidth + ' ' + qualityfactor*mapHeight;
		svgRect.setAttributeNS(null,'viewBox',newViewport);
		svgMainViewport = svgdoc.getElementById('mapid');
		svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
		svgRect.setAttributeNS(null,'x',0);
		svgRect.setAttributeNS(null,'y',0);
		svgRect.setAttributeNS(null,'width',qualityfactor*mapWidth);
		svgRect.setAttributeNS(null,'height',qualityfactor*mapHeight);
		}
	
	if (zoomtool == 'zoomin')
		{
		svgdoc.getElementById('zoominpusheffectbr').getStyle().setProperty('visibility','visible');
		svgdoc.getElementById('zoominpusheffectul').getStyle().setProperty('visibility','hidden');
		svgdoc.getElementById('zoominpusheffectrec').getStyle().setProperty('fill','url(#lcDeg3)');
		}
	initScaleBar(evt);
	svgdoc.getElementById('releasezoom').getStyle().setProperty('visibility','hidden');
	svgdoc.getElementById('releasezoom').getStyle().setProperty('pointer-events','none');
	checkForTiles(evt);
}

function initialize(evt) 
	{
	svgdoc=evt.getTarget().getOwnerDocument();
	overviewmap = svgdoc.getElementById('overviewmap');
	svgmain = svgdoc.getElementById('main');
	widthOverview = parseFloat(overviewmap.getAttributeNS(null,'width'));
	heightOverview = parseFloat(overviewmap.getAttributeNS(null,'height'));
	svgRect = svgdoc.getElementById('locationRect');
	rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
	rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
	rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
	rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
	newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
	zoom_init = zoom;
	svgobj = svgdoc.getElementById('rightNumber');
	childobj = svgobj.getFirstChild();
	childobj.setData(parseFloat(parseInt(100*zoom_init/5)/100));
	svgobj = svgdoc.getElementById('centerNumber');
	childobj = svgobj.getFirstChild();
	childobj.setData(parseFloat(parseInt(100*zoom_init/10)/100));
	faire_menus(evt,'myCustomMenu'); 
	zoomLayering(evt);
	}

function faire_menus(evt,nom_menu){
svgdoc=evt.getTarget().getOwnerDocument();
var newMenuRoot=parseXML(printNode(svgdoc.getElementById(nom_menu)),contextMenu);
contextMenu.replaceChild(newMenuRoot.firstChild,contextMenu.firstChild);
}
function initScaleBar(evt)
{
	svgdoc=evt.getTarget().getOwnerDocument();
	var svgobj = svgdoc.getElementById('rightNumber');
	var childobj = svgobj.getFirstChild();
	childobj.setData(parseFloat(parseInt(100*zoom_init*20/zoomVal))/100);
	svgobj = svgdoc.getElementById('centerNumber');
	childobj = svgobj.getFirstChild();
	childobj.setData(parseFloat(parseInt(100*zoom_init*10/zoomVal))/100);
	zoomLayering(evt);
}

function beginResize(evt)
{
	RevtX = parseFloat(evt.clientX);
	RevtY = parseFloat(evt.clientY);
	if (zoomtool == 'zoomin')
		{
		var objrectevt;
		if ((RevtX > 10) && (RevtX < 10+mapWidth) && (RevtY> 40 ) && (RevtY <= 40 + mapHeight))
			{
			Rpressed = 1;
			svgdoc= evt.getTarget().getOwnerDocument();
			objrectevt = svgdoc.getElementById('rectevt');
			objrectevt.setAttributeNS(null,'x',RevtX);
			objrectevt.setAttributeNS(null,'y',RevtY);
			MapX = RevtX;
			MapY = RevtY;
		}
	}
}

function doResize(evt){
var withrect;
var heightrect;
var objrectevt;
if ((Rpressed == 1) && (zoomtool == 'zoomin'))
	{
	svgdoc= evt.getTarget().getOwnerDocument();
	objrectevt = svgdoc.getElementById('rectevt');
	RnewevtX = parseFloat(evt.clientX);
	RnewevtY = parseFloat(evt.clientY);
	if ((RnewevtX >= 10) && (RnewevtX <= mapWidth+10))
		{
		if (RnewevtX > RevtX)
			{
			widthrect = RnewevtX - RevtX;
			}	
		else
			{
			objrectevt.setAttributeNS(null,'x',RnewevtX);
			widthrect = - (RnewevtX - RevtX);
			MapX = RnewevtX;
			}
		}
	else
		{
		if (RnewevtX < 10)
			{
			objrectevt.setAttributeNS(null,'x',10);
			widthrect = -(10-RevtX);
			MapX = 10;
			} 
		if (RnewevtX > mapWidth+10)
			{
			widthrect = mapWidth+10-RevtX;
			}
		}
	if ((RnewevtY> 40 ) && (RnewevtY <= 40 + mapHeight))
		{	
		if (RnewevtY > RevtY)
			{
			heightrect = RnewevtY - RevtY;
			}
		else
			{
			objrectevt.setAttributeNS(null,'y',RnewevtY);
			heightrect = -(RnewevtY - RevtY);
			MapY = RnewevtY;
			}
		}
	else
		{
		if (RnewevtY<= 40 )
			{
			objrectevt.setAttributeNS(null,'y',40);
			heightrect = -(40 - RevtY);
			MapY = 40;
			}
		if (RnewevtY > 40 + mapHeight)	
			{
			heightrect = mapHeight+40 - RevtY;
			}
		}
	objrectevt.setAttributeNS(null,'height',heightrect);
	objrectevt.setAttributeNS(null,'width',widthrect);
	objrectevt.getStyle().setProperty('visibility','visible');
	svgRect = svgdoc.getElementById('locationRect');
	realzoom = parseFloat((mapWidth/widthrect)*(theZoom/100));
	
	if (realzoom < 1.5 && realzoom >= 1 ) { svgdoc.getElementById('rectzoom150').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom150').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 2 && realzoom >= 1.5 ) { svgdoc.getElementById('rectzoom200').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom200').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 2.5 && realzoom >= 2 ) { svgdoc.getElementById('rectzoom250').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom250').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 3 && realzoom >= 2.5 ) { svgdoc.getElementById('rectzoom300').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom300').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 3.5 && realzoom >= 3.0 ) { svgdoc.getElementById('rectzoom350').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom350').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 4.0 && realzoom >= 3.5 ) { svgdoc.getElementById('rectzoom400').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom400').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 4.5 && realzoom >= 4.0 ) { svgdoc.getElementById('rectzoom450').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom450').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 5.0 && realzoom >= 4.5 ) { svgdoc.getElementById('rectzoom500').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom500').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 5.5 && realzoom >= 5 ) { svgdoc.getElementById('rectzoom550').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom550').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 6.0 && realzoom >= 5.5 ) { svgdoc.getElementById('rectzoom600').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom600').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 6.5 && realzoom >= 6 ) { svgdoc.getElementById('rectzoom650').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom650').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 7.0 && realzoom >= 6.5 ) { svgdoc.getElementById('rectzoom700').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom700').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 7.5 && realzoom >= 7 ) { svgdoc.getElementById('rectzoom750').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom750').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 8.0 && realzoom >= 7.5 ) { svgdoc.getElementById('rectzoom800').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom800').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 8.5 && realzoom >= 8 ) { svgdoc.getElementById('rectzoom850').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom850').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 9.0 && realzoom >= 8.5 ) { svgdoc.getElementById('rectzoom900').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom900').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom < 9.5 && realzoom >= 9.0 ) { svgdoc.getElementById('rectzoom950').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom950').getStyle().setProperty('fill','rgb(165,206,239)');
	if (realzoom >= 9.5 ) { svgdoc.getElementById('rectzoom1000').getStyle().setProperty('fill','rgb(0,33,99)');}
	else svgdoc.getElementById('rectzoom1000').getStyle().setProperty('fill','rgb(165,206,239)');
	}
}

function endResize(evt){
if ((Rpressed == 1) && (zoomtool == 'zoomin'))
	{
	svgdoc= evt.getTarget().getOwnerDocument();
	objrectevt = svgdoc.getElementById('rectevt');
	objrectevt.getStyle().setProperty('visibility','hidden');
	
	rectOvewidth = objrectevt.getAttributeNS(null,'width');
	realzoom = parseFloat((mapWidth/rectOvewidth)*(theZoom/100));
	if (realzoom < 1.5 && realzoom >= 1 ) Zoomto(evt,150);
	if (realzoom < 2 && realzoom >= 1.5 ) Zoomto(evt,200);
	if (realzoom < 2.5 && realzoom >= 2 ) Zoomto(evt,250);
	if (realzoom < 3 && realzoom >= 2.5 ) Zoomto(evt,300);
	if (realzoom < 3.5 && realzoom >= 3.0 ) Zoomto(evt,350);
	if (realzoom < 4.0 && realzoom >= 3.5 )	Zoomto(evt,400);
	if (realzoom < 4.5 && realzoom >= 4.0 ) Zoomto(evt,450);
	if (realzoom < 5.0 && realzoom >= 4.5 ) Zoomto(evt,500);
	if (realzoom < 5.5 && realzoom >= 5 ) Zoomto(evt,550);
	if (realzoom < 6.0 && realzoom >= 5.5 ) Zoomto(evt,600);
	if (realzoom < 6.5 && realzoom >= 6 ) Zoomto(evt,650);
	if (realzoom < 7.0 && realzoom >= 6.5 ) Zoomto(evt,700);
	if (realzoom < 7.5 && realzoom >= 7 ) Zoomto(evt,750);
	if (realzoom < 8.0 && realzoom >= 7.5 ) Zoomto(evt,800);
	if (realzoom < 8.5 && realzoom >= 8 ) Zoomto(evt,850);
	if (realzoom < 9.0 && realzoom >= 8.5 ) Zoomto(evt,900);
	if (realzoom < 9.5 && realzoom >= 9.0 ) Zoomto(evt,950);
	if (realzoom >= 9.50) Zoomto(evt,1000);
	objbgrectevt = svgdoc.getElementById('bgrectevt');
	objbgrectevt.getStyle().setProperty('pointer-events','none');
	objbgrectevt.getStyle().setProperty('visibility','hidden');
	}
Rpressed = 0;
}

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

function endPan(evt) 
	{
	svgdoc=evt.getTarget().getOwnerDocument();
	svgRect = svgdoc.getElementById('locationRect');
	svgMainViewport = svgdoc.getElementById('mapid');
	rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
	rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
	y = svgMainViewport.currentTranslate.y;
	x = svgMainViewport.currentTranslate.x;
	rectOveYcorner = parseFloat(rectOveYcorner + (qualityfactor*y*100/zoomVal));
	rectOveXcorner = parseFloat(rectOveXcorner + (qualityfactor*x*100/zoomVal));
	rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
	rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
	newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
	svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
	if (pressed == 1)
		{
		checkForTiles(evt);
		}
	pressed = 0;
}

function goEast(evt)
{
	if (theZoom !=100) 
		{
		var rectX;
		var ovrDoc;
		var x,z,w;
		svgMainViewport = svgdoc.getElementById('mapid');
		x = svgMainViewport.currentTranslate.x;
		ovrDoc= svgdoc.getElementById('locationRect');
		rectX = parseFloat(ovrDoc.getAttributeNS(null,'x'));
		w =  parseFloat(ovrDoc.getAttributeNS(null,'width'));
		theZoom = zoomVal;
		z= rectX + w;
		if (z < (WidthVB-14*qualityfactor))
			{
			rectX = rectX + qualityfactor*offsetXmap*100/zoomVal;
			ovrDoc.setAttributeNS(null,'x', rectX);
			rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
			rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
			y = svgMainViewport.currentTranslate.y;
			x = svgMainViewport.currentTranslate.x;
			rectOveYcorner = parseFloat(rectOveYcorner + (qualityfactor*y*100/zoomVal));
			rectOveXcorner = parseFloat(rectOveXcorner + (qualityfactor*x*100/zoomVal));
			rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
			rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
			newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
			svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
			}
		}
	checkForTiles(evt);
}

function goWest(evt)
	{
	if (theZoom !=100)
		{
		var rectX;
		var ovrDoc;
		var x,y;
		svgMainViewport = svgdoc.getElementById('mapid');
		x = svgMainViewport.currentTranslate.x;
		ovrDoc= svgdoc.getElementById('locationRect');
		rectX = parseFloat(ovrDoc.getAttributeNS(null,'x'));
		theZoom = zoomVal;
		if (rectX > 100)
			{
			rectX = rectX - qualityfactor*offsetXmap*100/zoomVal;
			ovrDoc.setAttributeNS(null,'x', rectX);
			rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
			rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
			y = svgMainViewport.currentTranslate.y;
			x = svgMainViewport.currentTranslate.x;
			rectOveYcorner = parseFloat(rectOveYcorner + (qualityfactor*y*100/zoomVal));
			rectOveXcorner = parseFloat(rectOveXcorner + (qualityfactor*x*100/zoomVal));
			rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
			rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
			newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
			svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
			}
		}
	checkForTiles(evt);	
}

function goNorth(evt)
{
	if (theZoom!=100)
		{
		var rectY;
		var ovrDoc;
		var x,y;
		svgMainViewport = svgdoc.getElementById('mapid');
		y = svgMainViewport.currentTranslate.y;
		ovrDoc= svgdoc.getElementById('locationRect');
		rectY = parseFloat(ovrDoc.getAttributeNS(null,'y'));
		theZoom = zoomVal;
		if (rectY > 14*qualityfactor)
			{
			svgMainViewport.currentTranslate.y =  parseFloat(y+offsetYmap);
			rectY = rectY - qualityfactor*offsetYmap*100/zoomVal;
			ovrDoc.setAttributeNS(null,'y', rectY);
			rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
			rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
			y = svgMainViewport.currentTranslate.y;
			x = svgMainViewport.currentTranslate.x;
			rectOveYcorner = parseFloat(rectOveYcorner + (qualityfactor*y*100/zoomVal));
			rectOveXcorner = parseFloat(rectOveXcorner + (qualityfactor*x*100/zoomVal));
			rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
			rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
			newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
			svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
			}
		}
	checkForTiles(evt);
}

function goSouth(evt)
{
	if (theZoom !=100) 
		{
		var rectY;
		var y,h,z;
		svgMainViewport = svgdoc.getElementById('mapid');
		svgRect= svgdoc.getElementById('locationRect');
		rectY = parseFloat(svgRect.getAttributeNS(null,'y'));
		h= parseFloat(svgRect.getAttributeNS(null,'height'));
		y = parseFloat(svgMainViewport.currentTranslate.y);
		z= rectY+h;
		theZoom = zoomVal;
		if (z < (HeightVB-14*qualityfactor)) 
			{
			rectY = rectY + qualityfactor*offsetYmap*100/zoomVal;
			svgRect.setAttributeNS(null,'y', rectY);
			rectOveXcorner = parseFloat(svgRect.getAttributeNS(null,'x'));
			rectOveYcorner = parseFloat(svgRect.getAttributeNS(null,'y'));
			y = svgMainViewport.currentTranslate.y;
			x = svgMainViewport.currentTranslate.x;
			rectOveYcorner = parseFloat(rectOveYcorner + (qualityfactor*y*100/zoomVal));
			rectOveXcorner = parseFloat(rectOveXcorner + (qualityfactor*x*100/zoomVal));
			rectOvewidth = parseFloat(svgRect.getAttributeNS(null,'width'));
			rectOveheight = parseFloat(svgRect.getAttributeNS(null,'height'));
			newViewport = rectOveXcorner + ' ' + rectOveYcorner + ' ' + rectOvewidth + ' ' + rectOveheight;
			svgMainViewport.setAttributeNS(null,'viewBox',newViewport);
			}
		}
	checkForTiles(evt);
}

function showSVGLayer(id,check_n)
	{
	var svgObj;
	var svgStyle;
	var checkVal;
	svgObj = svgdoc.getElementById(id);
	svgStyle = svgObj.getStyle();
	checkcolor = svgdoc.getElementById(check_n);
	if (svgStyle.getPropertyValue('visibility') == 'visible' || svgStyle.getPropertyValue('visibility') == 'hidden')
		{
		if (svgStyle.getPropertyValue('visibility') == 'visible')
			{checkVal = false;}
		if (svgStyle.getPropertyValue('visibility') == 'hidden')
			{
			checkVal= true;
			}
		}
	else
		{
		checkVal = false;
		}
	if (checkVal == true)
		{
		svgStyle.setProperty('visibility','visible');
		svgStyle.setProperty('pointer-events','all');
		checkobj = svgdoc.getElementById(check_n);
		checkobjstyle = checkobj.getStyle();
		checkobjstyle.setProperty('visibility','visible');
		}
	else 
		{
		svgStyle.setProperty('visibility','hidden');
		svgStyle.setProperty('pointer-events','none');
		checkobj = svgdoc.getElementById(check_n);
		checkobjstyle = checkobj.getStyle();
		checkobjstyle.setProperty('visibility','hidden');
		}
	}

function switchColor (evt,property,newcolor,idpath)
{
var target ;
svgdoc = evt.getTarget().getOwnerDocument();
target = get_target(evt);
if (idpath.substring(0,17) == 'composedLineStyle')
   {
	 objpath = svgdoc.getElementById(idpath.substring(17,idpath.length));objpath.setAttributeNS(null,'style','');
	 tempobj = svgdoc.getElementById(idpath);tempobj.getStyle().setProperty(property,newcolor);
	 }
else
	{
	target = get_target(evt);
	target.getStyle().setProperty (property, newcolor);
	}
}

function get_target (evt){
var target = evt.getTarget(); 
while (target && !target.getAttributeNS(null,'id'))target = target.getParentNode();
return target;
}

function switchZoomColor (evt,id,property,newcolor)
{
svgdoc = evt.getTarget().getOwnerDocument();
var obj = svgdoc.getElementById(id);
obj.getStyle().setProperty(property, newcolor);
}

function zoomLayering(evt)
{
svgdoc = evt.getTarget().getOwnerDocument();
var svgdocElement = svgdoc.getDocumentElement();
var nlayer;
var layerzoommin;
var layerzoommax;
var zoomlayervalue;
zoomlayervalue= parseFloat(zoom_init*100/zoomVal);
tablayers = layers.split(';');
nblayer = tablayers.length - 1;
	for (nlayer = 0;nlayer <= nblayer-1;nlayer++)
		{
		objlayer = svgdoc.getElementById(tablayers[nlayer]);
		zoomLayer = objlayer.getAttributeNS(dbxns,'zoomLayer');
		if (zoomLayer == 'true')
			{
			zoommin = parseFloat(objlayer.getAttributeNS(dbxns,'zoomMin'));
			zoommax = parseFloat(objlayer.getAttributeNS(dbxns,'zoomMax'));
			if ((zoomlayervalue >= zoommin) && (zoomlayervalue <= zoommax))
				{
				var checkbox;checkbox = svgdoc.getElementById('check'+eval(nlayer+1));
				if (checkbox.getStyle().getPropertyValue('visibility') == 'visible')
					{
					objlayer.getStyle().setProperty('visibility','visible');
					objlayer.getStyle().setProperty('pointer-events','all');
					}
				checkbox.getStyle().setProperty('stroke','rgb(0, 0, 0)');
				checkbox.setAttributeNS(dbxns,'pot_visible','true');
				if (objlayer.getAttributeNS(dbxns,'label') == 'true')
					{
					checkbox = svgdoc.getElementById('checklabel' + eval(nlayer+1));
					if (checkbox.getStyle().getPropertyValue('visibility') == 'visible')
						{
						objlayer.getStyle().setProperty('visibility','visible');
						objlayer.getStyle().setProperty('pointer-events','all');
						objlayerlabel = svgdoc.getElementById(tablayers[nlayer] + '_Labels');
						objlayerlabel.getStyle().setProperty('visibility','visible');
						objlayerlabel.getStyle().setProperty('pointer-events','all');
						}
					checkbox.getStyle().setProperty('stroke','rgb(0, 0, 0)');
					checkbox.setAttributeNS(dbxns,'pot_visible','true');
					}
				}
				else
					{
					objlayer.getStyle().setProperty('visibility','hidden');
					objlayer.getStyle().setProperty('pointer-events','none');
					var checkbox = svgdoc.getElementById('check'+eval(nlayer+1));
					checkbox.getStyle().setProperty('stroke','rgb(255,0,0)');
					checkbox.setAttributeNS(dbxns,'pot_visible','false');
					if (objlayer.getAttributeNS(dbxns,'label') == 'true')
						{
						checkbox = svgdoc.getElementById('checklabel'+eval(nlayer+1));
						checkbox.getStyle().setProperty('stroke','rgb(255,0,0)');
						checkbox.setAttributeNS(dbxns,'pot_visible','false');
						objlayerlabel = svgdoc.getElementById(tablayers[nlayer] + '_Labels');
						objlayerlabel.getStyle().setProperty('visibility','hidden');
						objlayerlabel.getStyle().setProperty('pointer-events','none');
						}
					}
				}
			}
		}

function resizeObjects(evt,type,factor)
	{
	svgdoc=evt.getTarget().getOwnerDocument();
	nodestylesheet = svgdoc.getElementById('mapstyle');
	objCSSstylesheet = nodestylesheet.getSheet();
	if (objCSSstylesheet != null)
		{
		rulelist = objCSSstylesheet.cssRules;
		for (k = 0; k<rulelist.length; k++)
			{
			cssstylerule = rulelist.item(k);
			if (cssstylerule.selectorText.substring(8,9) == 's' || cssstylerule.selectorText.substring(8,9) == 'p'){
cssstyledeclaration = cssstylerule.style;if (cssstylerule.selectorText.substring(8,9) == 's')
				{
				oldsize = cssstyledeclaration.getPropertyValue('font-size');}
				if (cssstylerule.selectorText.substring(8,9) == 'p')
					{
					oldsize = cssstyledeclaration.getPropertyValue('stroke-width');
					oldsize = oldsize.substring(0,oldsize.length-2);
strokeUnits='pt';
					}
					newsize = oldsize*factor;
					if (cssstylerule.selectorText.substring(8,9) == 's' || cssstylerule.selectorText.substring(8,9) == 'p')
					{
					if (cssstylerule.selectorText.substring(8,9) == 's') cssstyledeclaration.setProperty('font-size',newsize,null);
					if (cssstylerule.selectorText.substring(8,9) == 'p') cssstyledeclaration.setProperty('stroke-width',newsize+strokeUnits,null);
					}
				}
			}
		reload(evt);
		}
	}

function reload(evt)
{
	svgdoc=evt.getTarget().getOwnerDocument();
	var targetobj = svgdoc.getElementById('mapWindow');
	var parentobj = targetobj.getParentNode();targetobj.getParentNode().appendChild(targetobj);
}

function getCallbackHandler(grp){
var cb = function(urlRequestStatus)
    {
    var string='';
    if (urlRequestStatus.success)
       {
       string=urlRequestStatus.content;
	}else{return;}
    var docFragment=parseXML(string, document);
    var content = document.getElementById (cb.insertAfter);
    content.appendChild (docFragment);
    }
cb.insertAfter=grp;
return cb;
}

function addLayer(url, grp){
	getURL(url,getCallbackHandler(grp));
}

function removeLayer(id,from) 
{
	
	var nodeToRemove = document.getElementById(id);
	var parent=document.getElementById(from);
	parent.removeChild(nodeToRemove);
}

function checkForTiles(evt)
{
	tablayers = layers.split(';');	
	nblayer = tablayers.length - 1;
	var nbtiles;
	var nblincol;
	var rectov;
	
	var objinterRectsvg = svgdoc.getElementById('locationRect'); 
	rectov= new Rectangle(objinterRectsvg.getAttributeNS(null,'x'),objinterRectsvg.getAttributeNS(null,'y'),objinterRectsvg.getAttributeNS(null,'width'),objinterRectsvg.getAttributeNS(null,'height'));
	for (var klayer = 0;klayer <= nblayer-1; klayer++)
		{
		objlayer = svgdoc.getElementById(tablayers[klayer]);
		layername = tablayers[klayer];
		
		if ((objlayer.getAttributeNS(dbxns,'tiled') == 'true') && (objlayer.getStyle().getPropertyValue('visibility') == 'visible'))
			{
			nbtiles = parseInt(objlayer.getAttributeNS(dbxns,'nbTiles'));
			nblincol = Math.sqrt(nbtiles);
			for (var klin=1; klin<=nblincol; klin++)
				{
				for (var kcol=1; kcol<=nblincol; kcol++)			
					{
					if (IntersectOvTile(rectov,layername+klin+'_'+kcol+'_tile') == true)
						{
						if (svgdoc.getElementById(layername+klin+'_'+kcol+'_tile').getAttributeNS(dbxns,'tileloaded')=='false')		 
							{
if (svgdoc.getElementById(layername+klin+'_'+kcol+'_tile').getAttributeNS(dbxns,'compressed') == 'true')
{
addLayer(layername + klin+'_'+kcol+'.svgz',layername);
}
else addLayer(layername + klin+'_'+kcol +'.svg',layername);
							svgdoc.getElementById(layername+klin+'_'+kcol+'_tile').setAttributeNS(dbxns,'tileloaded','true');
							}
						}
					else
						{
						if (svgdoc.getElementById(layername+klin+'_'+kcol+'_tile').getAttributeNS(dbxns,'tileloaded')=='true')
							{
							removeLayer(layername+klin+'_'+kcol,layername);
							svgdoc.getElementById(layername+klin+'_'+kcol+'_tile').setAttributeNS(dbxns,'tileloaded','false');
							}
						}
					}
				}
			}
		}
}
function IntersectOvTile(objinterRectsvg,idtile)
{
	var svgTile = svgdoc.getElementById(idtile);
	var objTile = new Rectangle(svgTile.getAttributeNS(null,'x'),svgTile.getAttributeNS(null,'y'),svgTile.getAttributeNS(null,'width'),svgTile.getAttributeNS(null,'height'));
	
	if (intersectrect(objinterRectsvg,objTile))
		{
		return true;
		}
	else return false;
}

function Rectangle(x,y,w,h)
{
	this.x = x;
	this.y = y;
	this.w = w;
	this.h = h;
}

function Point(x,y)
{
	this.x = x;
	this.y = y;
}

function intersectrect(rect1,rect2)
{
	var A = new Point(parseFloat(rect1.x),parseFloat(rect1.y));
	var B = new Point(parseFloat(rect1.x)+parseFloat(rect1.w),parseFloat(rect1.y));
	var C = new Point(parseFloat(rect1.x)+parseFloat(rect1.w),parseFloat(rect1.y)+parseFloat(rect1.h));
	var D = new Point(parseFloat(rect1.x),parseFloat(rect1.y)+parseFloat(rect1.h));
	
	var E = new Point(parseFloat(rect2.x),parseFloat(rect2.y));
	var F = new Point(parseFloat(rect2.x)+parseFloat(rect2.w),parseFloat(rect2.y));
	var G = new Point(parseFloat(rect2.x)+parseFloat(rect2.w),parseFloat(rect2.y)+parseFloat(rect2.h));
	var H = new Point(parseFloat(rect2.x),parseFloat(rect2.y)+parseFloat(rect2.h));
		
	intersection=false;
	if      (pointinRectangle(rect2,A)){ intersection=true; return intersection;}
	else if (pointinRectangle(rect2,B)){ intersection=true; return intersection;}
	else if (pointinRectangle(rect2,C)){ intersection=true; return intersection;}
	else if (pointinRectangle(rect2,D)){ intersection=true; return intersection;}
	
	else if (pointinRectangle(rect1,E)){ intersection=true; return intersection;}
	else if (pointinRectangle(rect1,F)){ intersection=true; return intersection;}
	else if (pointinRectangle(rect1,G)){ intersection=true; return intersection;}
	else if (pointinRectangle(rect1,H)){ intersection=true; return intersection;}
	
	else if (intersect2segment(A,B,E,F)) { intersection=true; return intersection;}
	else if (intersect2segment(A,B,F,G)) { intersection=true; return intersection;}
	else if (intersect2segment(A,B,G,H)) { intersection=true; return intersection;}
	else if (intersect2segment(A,B,H,E)) { intersection=true; return intersection;}
	else if (intersect2segment(B,C,E,F)) { intersection=true; return intersection;}
	else if (intersect2segment(B,C,F,G)) { intersection=true; return intersection;}
	else if (intersect2segment(B,C,G,H)) { intersection=true; return intersection;}
	else if (intersect2segment(B,C,H,E)) { intersection=true; return intersection;}
	else if (intersect2segment(C,D,E,F)) { intersection=true; return intersection;}
	else if (intersect2segment(C,D,F,G)) { intersection=true; return intersection;}
	else if (intersect2segment(C,D,G,H)) { intersection=true; return intersection;}
	else if (intersect2segment(C,D,H,E)) { intersection=true; return intersection;}
	else if (intersect2segment(D,A,E,F)) { intersection=true; return intersection;}
	else if (intersect2segment(D,A,F,G)) { intersection=true; return intersection;}
	else if (intersect2segment(D,A,G,H)) { intersection=true; return intersection;}
	else if (intersect2segment(D,A,H,E)) { intersection=true; return intersection;}
	
	return intersection;
}

function pointinRectangle(rectobj,checkPoint)
{
	var A = new Point(parseFloat(rectobj.x),parseFloat(rectobj.y));
	var B = new Point(parseFloat(rectobj.x)+parseFloat(rectobj.w),parseFloat(rectobj.y));
	var C = new Point(parseFloat(rectobj.x)+parseFloat(rectobj.w),parseFloat(rectobj.y)+parseFloat(rectobj.h));
	var D = new Point(parseFloat(rectobj.x),parseFloat(rectobj.y)+parseFloat(rectobj.h)); 
		
	tabd = new Array();
	
	tabd[0] = A.x;	tabd[1] = A.y;
	tabd[2] = B.x;	tabd[3] = B.y;
	tabd[4] = C.x;	tabd[5] = C.y;
	tabd[6] = D.x;	tabd[7] = D.y;
	tabd[8] = A.x;	tabd[9] = A.y;
	var lentabd;	
	lentabd = 11;
	
	var counter = 0;
	for (i=0; i<lentabd-3; i=i+2)
		{
		p1x = parseFloat(tabd[i]);
		p1y = parseFloat(tabd[i+1]);
		p2x = parseFloat(tabd[i+2]);
		p2y = parseFloat(tabd[i+3]);
		if(checkPoint.y>Math.min(p1y,p2y))
			{
			if(checkPoint.y<=Math.max(p1y,p2y))
				{
				if(checkPoint.x<=Math.max(p1x,p2x))
					{
					if(p1y!=p2y)
						{
						x_inter=(checkPoint.y-p1y)*(p2x-p1x)/(p2y-p1y)+p1x;
						if(p1x==p2x||checkPoint.x<=x_inter){counter++;}
						}
					}
				}
			}
		}
return counter%2==1;
}

function intersect2segment(point1,point2,point3,point4)
{
	var afirst;
	var asec;
	var bfirst;
	var bsec;
	var intersection;
	var vector1vert = false;
	var vector2vert = false;
	
	if (point2.x != point1.x)
		{
		afirst = parseFloat(point2.y-point1.y)/parseFloat(point2.x-point1.x);
		bfirst = parseFloat(point1.y) - parseFloat(afirst*point1.x);
		}
	else vector1vert = true;
	
	if (point3.x != point4.x)
		{
		asec = parseFloat(point4.y-point3.y)/parseFloat(point4.x-point3.x);
		bsec = parseFloat(point3.y) - parseFloat(asec*point3.x);
		}
	else vector2vert = true;
		
	intersection=false;
	if (!vector1vert || !vector2vert)
		{
		if (!vector1vert && !vector2vert)
			{
			if (afirst != asec)
				{
				y_inter = parseFloat(afirst*(bsec-bfirst)/(afirst-asec)) + parseFloat(bfirst);
				x_inter = parseFloat((bfirst-bsec)/(asec-afirst));
				if ((y_inter >= Math.min(point1.y,point2.y)) && (y_inter <= Math.max(point1.y,point2.y)))
					{
					if ((y_inter >= Math.min(point3.y,point4.y)) && (y_inter <= Math.max(point3.y,point4.y)))
						{
						if ((x_inter >= Math.min(point1.x,point2.x)) && (x_inter <= Math.max(point1.x,point2.x)) )
							{
							if ((x_inter >= Math.min(point3.x,point4.x)) && (x_inter <= Math.max(point3.x,point4.x)))
								{
								intersection = true;
								}
							}
						}
					}
				}
			else
				{
				if (bfirst == bsec)
					{
					if (Math.min(point3.x,point4.x) <= Math.max(point1.x,point2.x))
						{
						if (Math.max(point3.x,point4.x) >= Math.min(point1.x,point2.x))
							{
							intersection = true;
							}
						}
					}
				}
			}
		else
			{
			if (vector1vert)
				{
				if ((point1.x >= Math.min(point3.x,point4.x)) && (point1.x <= Math.max(point3.x,point4.x)))
					{
					y_inter = parseFloat(asec*point3.x + bsec);
					if ((bsec >= Math.min(point1.y,point2.y)) && (bsec <= Math.max(point1.y,point2.y)))
						{
						intersection = true;
						}
					}
				}
			if (vector2vert)
				{
				if ((point3.x >= Math.min(point1.x,point2.x)) && (point3.x <= Math.max(point1.x,point2.x)))
					{
					y_inter = parseFloat(afirst*point1.x + bfirst);
					if ((y_inter >= Math.min(point3.y,point4.y)) && (y_inter <= Math.max(point3.y,point4.y)))
						{
						intersection = true;
						}
					}
				}
			}
		}
	else
	{
	if (point1.x == point3.x)
		{
		if (Math.min(point3.y,point4.y) <= Math.max(point1.y,point2.y))
			{
			if (Math.max(point3.y,point4.y) >= Math.min(point1.y,point2.y))
				{
				intersection = true;
				}
			}
		}
	}
return intersection;
}
