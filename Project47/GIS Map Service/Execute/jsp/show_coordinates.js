//global variables
//var svgObjCity;
//var svgObjX;
//var svgObjY;
var svgSVGObj;
var svgDoc;
var svgCoordsGroup;
var ulXCorner;
var ulYCorner;
var origPixSize;
var pixSize;
var offsetX;
var offsetY;
var yMinusVal;
var refCoordRect;
var ratioY;
var pixHeight;

var tempScaleX;
var tempScaleY;
var tempCity;

function initMap(evt) {
	// Retrieve the SVG document object:
	var directTarget = evt.target;
	
	if( directTarget.getNodeType() != 9 ) // if not DOCUMENT_NODE
		svgDoc = directTarget.ownerDocument;
	else
		svgDoc = directTarget;
	
	//get reference to text-Element
 //   svgObjCity = svgDoc.getElementById("varCity");
//	svgObjX = svgDoc.getElementById("coordx");
	svgObjY = svgDoc.getElementById("coordy");
	//get reference to text within text-Element
//	svgObjCity = svgObjCity.firstChild;	
//	svgObjX = svgObjX.firstChild;	
//	svgObjY = svgObjY.firstChild;
	svgSVGObj = svgDoc.documentElement;
	//reference to coordinate box (for later scaling and translating)
	refCoordRect = svgDoc.getElementById("groupShowCoords");
	//initialize coordinates, pixsize etc.
	var viewbox = new String(svgSVGObj.getAttribute("viewBox"));
	var viewboxes = viewbox.split(' ');
	ulXCorner = viewboxes[0];
	ulYCorner = viewboxes[1];
	var width = viewboxes[2];
	var height = viewboxes[3];
	var pixWidth = svgSVGObj.getAttribute("width");
	pixHeight = svgSVGObj.getAttribute("height");
	origPixSize = width / pixWidth;
	//a value to subtract Y-Values, because of inverted y-axis
	yMinusVal =1222;//700==yMin
	
	//determine ratio for coordinate box placement y
	translateY = getTranslate("groupShowCoords","y");
	ratioY = translateY / height;
	
	//call resetCoords();
	resetCoords();
}

function showCity(city) {
	//change text-Value
//	var temp=city;
//	svgObjCity.setData("0");
//  window.status ="";
 //svgObjCity.setData(city);
// show();
 //var cityC=city;
// function show(){

 //   window.status = "city"+city;
//	String x=city;
 //  setTimeout ("showCity('"+city+"')",333);
 
//alert(city);
//city = new String(city.getBytes("UTF-8"), "WINDOWS-874").toString(); //encode string


tempCity=city;


}

function emptyCity() {
	//empty text-String
//svgObjCity.setData("")
tempCity="";
tempScaleX="";
tempScaleY="";
}

function cityClick(text) {
	//show an alert message

	//alert(text);
}

function showCoords(evt) {
	//to show coordinates
//	svgObjX.setData(Math.round(offsetX + evt.clientX * pixSize))
//	svgObjY.setData(Math.round(-(yMinusVal - evt.clientY * pixSize - (offsetY))))
	//svgObjX.setData("0");
	//	svgObjY.setData("0");
	tempScaleX=(Math.round(offsetX + evt.clientX * pixSize));
	tempScaleY=(Math.round(yMinusVal - evt.clientY * pixSize - (offsetY)));
	tempScaleY=(Math.round(2*ulYCorner)+tempScaleY-400)
	window.status = "Name:" +tempCity+"           Coordinate  X:"+tempScaleX+"   ,Y:"+tempScaleY;
// setTimeout ("showCity('"+evt+"')",30);
 setTimeout("showCity('"+tempCity+"')",3);		   

	
	
}

function resetCoords() {
	//get current zoom and pan values
	var scale = svgSVGObj.currentScale;
	var trans = svgSVGObj.currentTranslate;
        var transx = trans.x;
        var transy = trans.y;
        //reset offset-values and pixSize according to current scale and translate
        pixSize = origPixSize / scale;
        offsetX = parseFloat(ulXCorner) - transx * pixSize;
        offsetY = parseFloat(ulYCorner) - transy * pixSize;
	
	//to determine y-position, x-position is always the same ...
        var height = pixHeight * pixSize;
	var newScale = 1 / parseFloat(scale);
        var newTranslateX = offsetX;
        var newTranslateY = offsetY + height * ratioY; //position always relative to bottom of viewBox
        newtransform = "translate(" + newTranslateX + " " + newTranslateY + ") " + "scale(" + newScale + ")";
        
        //reset position and scale for the showCoordsgroup so it always stays at the same place
        refCoordRect.setAttribute('transform', newtransform);
}

function getTranslate(myElement,xOrY) {
        //get reference to element
	element = svgDoc.getElementById(myElement);
        //first get transform value of coordinate box
        var curTransform = element.getAttribute("transform");
        curTransform = new String(curTransform); //Wert in ein String umwandeln
        //no fear from Regular expressions ... just copy it, I copied it either ...
        var translateRegExp=/translate\(([-+]?\d+)(\s*[\s,]\s*)([-+]?\d+)\)\s*/;
        //This part extracts the translation-part from the overall transform-string
        if (curTransform.length != 0)
        {
          var result = curTransform.match(translateRegExp);
          if (result == null || result.index == -1)
          {
             var oldTranslateX = 0;
             var oldTranslateY = 0;
          }
          else
          {
             var oldTranslateX = result[1];
             var oldTranslateY = result[3];
          }
        }
        if (xOrY == "x") {
        	 return oldTranslateX;
        }
        if (xOrY == "y") {
        	 return oldTranslateY;
        }      
}
