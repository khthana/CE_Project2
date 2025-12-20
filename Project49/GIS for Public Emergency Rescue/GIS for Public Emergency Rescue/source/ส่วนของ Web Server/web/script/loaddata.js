var htmldocument = document;
var mapdocument = null;
var maprootelement = null;

var xmlSearchResult = null;
var docSearch = null;

var xmlHttp = null;
var xmlHttpHospital = null;
var xmlHttpSchool = null;
var xmlHttpAmphoe = null;
var xmlHttpSubRoad = null;
var xmlHttpPolice = null;
var xmlHttpStHospital = null;
var xmlHttpHouse = null;
var xmlHttpComplex = null;
var xmlHttpMarket = null;
var xmlHttpTrain = null;
var xmlHttpUniver = null;
var xmlHttpFire = null;
var xmlHttpRiver1 = null;
var xmlHttpGHouse = null;

var picposition_y = 0;
var translation_sp = null;
var flagAdjust = 0;
/////// Test ////////
var lines2 = "เวลาเปิด  08.30-16.30 น.";
var lines3 = "029-999-999 ต่อ 30-45";
var lines4 = "http://www.kmitl.ac.th/";
///////CAMERA////////
var service_id = null;
var httpService = null;
function submitontrack()
{
	txt_serv_id = document.getElementById("txtserv_id");
	if (txt_serv_id.value == "")
	{
		alert("โปรดป้อนรหัสการเรียกขอความช่วยเหลือ");
		return;
	}
	else
	{
		service_id = txt_serv_id.value;
		alert(service_id);
		httpService = GetXmlHttpObject();
		if ( httpService == null )
		{
			alert ("Browser does not support HTTP Request");
			return;
		} 
		var url="./xml/serv.py/cameraip?serv_id="+service_id;	
		httpService.onreadystatechange = handleService;
		
		httpService.open("GET",url,true);
		httpService.send(null);
	}
}
function handleService()
{
	if ( httpService.readyState == 4 || httpService.readyState == "complete" )
	{ 		
		dataxml = httpService.responseXML;					
		dataxmlRoot = dataxml.documentElement;
		

		subr = dataxmlRoot.getElementsByTagName("camera");
		ip_txt = subr[0].getAttribute("ip");
		alert(ip_txt);
		if ( subr[0].getAttribute("serv_state") != "None" )
		{
			screen = htmldocument.getElementById("dis_video");
			screen.setAttribute("src","http://www.natur.in.th/xml/serv.py/camera?camera_ip="+ip_txt);
			btnmoveup = htmldocument.getElementById("pztup");
			btnmovedown = htmldocument.getElementById("pztdown");
			btnmoveleft = htmldocument.getElementById("pztleft");
			btnmoveright = htmldocument.getElementById("pztright");
			btnzoomin = htmldocument.getElementById("pztzoomin");
			btnzoomout = htmldocument.getElementById("pztzoomout");
			btnoverview = htmldocument.getElementById("pztoverview");

			btnmoveup.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&move=up");
			btnmovedown.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&move=down");
			btnmoveleft.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&move=left");
			btnmoveright.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&move=right");
			btnzoomin.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&rzoom=1000");
			btnzoomout.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&rzoom=-1000");
			btnoverview.setAttribute("href","http://"+subr[0].getAttribute("ip")+"/axis-cgi/com/ptz.cgi?camera=1&zoom=0");
		}
	}
}
///////Waiter////////
var waitCounter = 0;
function openWait()
{
     if( waitCounter++ == 0 )
     {
        waitTag = htmldocument.getElementById("waiting");
		//waitTag.style['visibility']="visible";
		waitTag.setAttribute("src","./picture/gui/gwait.gif");
     }         
}
function closeWait()
{     
     if( --waitCounter == 0 )
     {
        waitTag = htmldocument.getElementById("waiting"); 
		//waitTag.style['visibility'] = 'hidden';
		waitTag.setAttribute("src","./picture/gui/virtual.gif");
     }
}
//////Waiter/////////
var httpEmail = null
function onsendemail()
{
	serv_id = mapdocument.getElementById("serviceid");
	idOfServ = serv_id.firstChild.nodeValue;
	alert(idOfServ);

	linkEmail = "http://shopper.cnet.com/4513-6515_9-31725529.html?tag=txt&rmail=predominantMan@gmail.com&umsg=123456789ILOVEYOU&umail=predominantMan@hotmail.com&emailUrl=http://shopper.cnet.com/4014-6515_9-31725529.html&domainName=shopper.cnet.com&originalMtfUri=http://shopper.cnet.com/4512-6515_9-31725529.html&productName=Brother+LT+5300+-+media+tray+%2F+feeder+-+250+sheets&prodReview=12"
	httpEmail=GetXmlHttpObject();
	if (httpEmail==null)
	{
		alert ("Browser does not support HTTP Request");
		return;
	} 
	//var url="./xml/mapgml.py/river1";	
	httpEmail.onreadystatechange=stateChangedSendToEmail;
	httpEmail.open("POST",linkEmail,true);
	//httpEmail.send(null);
}
function stateChangedSendToEmail()
{
	if (httpEmail.readyState==4 || httpEmail.readyState=="complete")
	{
		alert("Yes");
	}
}

//var xml = null; //new XMLDocument();

function additional()
{
	td_result = htmldocument.getElementById("result1");
	
	for( i = 0; i < 50 ; i++ )
	{
		text = "<br/><font size='1'>โนนสวาง1234."+String(i)+"</font>";
		td_result.innerHTML = td_result.innerHTML+text;		
	}	
}
			
function init()
{
	mapdocument = htmldocument.embeds[0].getSVGDocument();
	maprootelement = mapdocument.documentElement;
	getXMLSearchResult();
	//additional();
	loadamphoe();
}

function GetXmlHttpObject()
{ 
	var objXMLHttp=null;
	if (window.XMLHttpRequest)
	{
		objXMLHttp=new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	return objXMLHttp;
} 
/////////////////////////////////////////////////////////////////////
function river1()
{
	chRiver = htmldocument.getElementById("river1");
	
	if(chRiver.getAttribute("value") == "unchecked")
	{
	 	openWait();
		gRiver = maprootelement.getElementById("mapriver1");
		gRiver.setAttribute("visibility","visible");					
		gInRiver = gRiver.getElementsByTagName("g");					
		if(gInRiver.length == 0 )
		{
			xmlHttpRiver1=GetXmlHttpObject();
			if (xmlHttpRiver1==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/river1";	
			xmlHttpRiver1.onreadystatechange=stateChangedRiver1;
			xmlHttpRiver1.open("GET",url,true);
			xmlHttpRiver1.send(null);	
		}
		else
		{
			closeWait();
		}	
		chRiver.setAttribute("value","checked");							
	}
	else
	{
		gRiver = maprootelement.getElementById("mapriver1");
		gRiver.setAttribute("visibility","hidden");			
		chRiver.setAttribute("value","unchecked");
	}								
}
			
function stateChangedRiver1() 
{ 
	if (xmlHttpRiver1.readyState==4 || xmlHttpRiver1.readyState=="complete")
	{ 		
		dataxml = xmlHttpRiver1.responseXML;					
		dataxmlRoot = dataxml.documentElement;					
		
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "none" );
		gElement.setAttribute("fill-opacity","0.7");
		gElement.setAttribute("stroke","deepskyblue");
		gElement.setAttribute("stroke-width","5");
		subr = dataxmlRoot.getElementsByTagName("river");
		
		for( isubr = 0; isubr < subr.length ; isubr++ ) //subr.length
		{								
			rtype = subr[isubr].getAttribute("type");
			if( rtype == "linestring" )
			{
				plElement = mapdocument.createElement("polyline");
			}
			else
			{
				plElement = mapdocument.createElement("polygon");
				gElement.setAttribute("fill", "deepskyblue" );
			}
			//plElement.setAttribute("id","river"+String(isubr));
			plElement.setAttribute("points",subr[isubr].getAttribute("points"));							
			
			gElement.appendChild(plElement);					
		}
		gRiver = maprootelement.getElementById("mapriver1");
		gRiver.appendChild(gElement);									
        closeWait();
	} 
} 
/////////////////////////////////////////////////////////////////////////////////

function mainroad1234()
{
	chSubRoad = htmldocument.getElementById("subroad");
	
	if(chSubRoad.getAttribute("value") == "unchecked")
	{
	 	openWait();
		gSubRoad = maprootelement.getElementById("mapsubroad");
		gSubRoad.setAttribute("visibility","visible");					
		gInSubRoad = gSubRoad.getElementsByTagName("g");					
		if(gInSubRoad.length == 0 )
		{
			xmlHttpSubRoad=GetXmlHttpObject();
			if (xmlHttpSubRoad==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/subroad????????????????";	
			xmlHttpSubRoad.onreadystatechange=stateChangedSubRoad;
			xmlHttpSubRoad.open("GET",url,true);
			xmlHttpSubRoad.send(null);	
		}
		else
		{
			closeWait();
		}	
		chSubRoad.setAttribute("value","checked");							
	}
	else
	{
		gSubRoad = maprootelement.getElementById("mapsubroad");
		gSubRoad.setAttribute("visibility","hidden");			
		chSubRoad.setAttribute("value","unchecked");
	}								
}
			
function stateChangedSubRoad() 
{ 
	if (xmlHttpSubRoad.readyState==4 || xmlHttpSubRoad.readyState=="complete")
	{ 	
	//alert("Sub Road");	
		subRoadxml = xmlHttpSubRoad.responseXML;					
		subRRoot = subRoadxml.documentElement;					
		//if(subRRoot){alert("Not Null");}else{alert("Null");}				
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "none" );
		gElement.setAttribute("fill-opacity","0.7");
		gElement.setAttribute("stroke","goldenrod");
		gElement.setAttribute("stroke-width","30");
		subr = subRRoot.getElementsByTagName("road");
		//alert(subr.length);
		for( isubr = 0; isubr < subr.length ; isubr++ ) //subr.length
		{								
			rtype = subr[isubr].getAttribute("type");
			if( rtype == "linestring" )
			{
				plElement = mapdocument.createElement("polyline");
			}
			else
			{
				plElement = mapdocument.createElement("polygon");
				plElement.setAttribute("fill","red");
			}
			plElement.setAttribute("id","road"+String(isubr));
			plElement.setAttribute("points",subr[isubr].getAttribute("points"));
			//plElement.setAttribute("onmousemove","position(evt)");
			//plElement.setAttribute("onmouseout","hideTooltip(evt)");

			/*titleName = mapdocument.createElement("title");
			titleName.setAttribute("id","name"+String(isch));
			schname = schPlace[isch].childNodes[1];
			if(schname.firstChild != null)
			{
				schoolName = schname.firstChild.nodeValue;
			}
			else
			{
				schoolName = " ไม่มีชื่อ";
			}					
			txtName = mapdocument.createTextNode(schoolName);
			titleName.appendChild(txtName);
			cElement.appendChild(titleName);*/					
			
			gElement.appendChild(plElement);					
		}
		gSubRoad = maprootelement.getElementById("mapsubroad");
		gSubRoad.appendChild(gElement);									
        closeWait();
	} 
} 

function mainRoad()
{	
	checkMainRoad = htmldocument.getElementById("mainroad");
	if(checkMainRoad.getAttribute("value")=="unchecked")
	{
		openWait();
		gMainRoad = maprootelement.getElementById("mapmainroad");
		gMainRoad.setAttribute("visibility","visible");					
		gInMainRoad = gMainRoad.getElementsByTagName("g");					
		if(gInMainRoad.length == 0 )
		{
			xmlHttp=GetXmlHttpObject();
			if (xmlHttp==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/mainroad";	
			xmlHttp.onreadystatechange=stateChangedMainRoad;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);	
		}
		else
        {
            closeWait();
        }

		checkMainRoad.setAttribute("value","checked");					
	}
	else
	{
		gMainRoad = maprootelement.getElementById("mapmainroad");
		gMainRoad.setAttribute("visibility","hidden");					
		checkMainRoad.setAttribute("value","unchecked");
	}								
}
			
function stateChangedMainRoad() 
{ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{ 					
		xml = xmlHttp.responseXML;					
		rootElement = xml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "none" );
		gElement.setAttribute("fill-opacity","1");
		gElement.setAttribute("stroke","gold");
		gElement.setAttribute("stroke-width","40");				

		road = rootElement.getElementsByTagName("road");					
		for( iroad = 0; iroad < road.length; iroad++ )
		{
			plElement = mapdocument.createElement("polyline");
					
			rline = road[iroad].childNodes[0];
			plElement.setAttribute("points",rline.getAttribute("points"));
			
			plElement.setAttribute("onmouseout","hideTooltip(evt)");			

			titleName = mapdocument.createElement("title");
			
			rname = road[iroad].childNodes[1];
			if(rname.firstChild != null)
			{
				roadName = rname.firstChild.nodeValue;
			}
			else
			{
				roadName = "ไม่ระบุ";
			}	
			plElement.setAttribute("onmousemove","position(evt,'"+String(roadName)+"')");
			
			setElement = mapdocument.createElement("set");								
			setElement.setAttribute("attributeType",'XML');
			setElement.setAttribute("attributeName",'stroke-width');
			setElement.setAttribute("to",'50');
			setElement.setAttribute("begin",'mouseover');
			setElement.setAttribute("end",'mouseout');
			plElement.appendChild(setElement);

			setElement = mapdocument.createElement("set");								
			setElement.setAttribute("attributeType",'XML');
			setElement.setAttribute("attributeName",'stroke');
			setElement.setAttribute("to",'sienna');
			setElement.setAttribute("begin",'mouseover');
			setElement.setAttribute("end",'mouseout');							
			plElement.appendChild(setElement);

			setElement = mapdocument.createElement("set");								
			setElement.setAttribute("attributeType",'XML');
			setElement.setAttribute("attributeName",'fill-opacity');
			setElement.setAttribute("to",'1');
			setElement.setAttribute("begin",'mouseover');
			setElement.setAttribute("end",'mouseout');							
			plElement.appendChild(setElement);

			gElement.appendChild(plElement);					
		}
		rroad = maprootelement.getElementById("mapmainroad");	
		rroad.appendChild(gElement);									
        closeWait();
	} 
} 
/////////////////////////////////////Search Result//////////////////////////////////
function getXMLSearchResult()
{    				
	xmlSearchResult = GetXmlHttpObject();
	if ( xmlSearchResult == null )
	{
		alert ("Browser does not support HTTP Request");
		return;
	} 
	var url = "./xml/search.xml";	
	xmlSearchResult.onreadystatechange = stateChangedSearchResult;
	xmlSearchResult.open( "GET", url, true );
	xmlSearchResult.send( null );			
}
											
function stateChangedSearchResult() 
{ 
	if ( xmlSearchResult.readyState ==4 || xmlSearchResult.readyState == "complete" )
	{ 					
		docSearch = xmlSearchResult.responseXML;
	}
}
////////////////////////////////////////////////////////////////////////////////////
function loadamphoe()
{
    openWait();		
	gAmphoe = maprootelement.getElementById("mapamphoe");
	gAmphoe.setAttribute("visibility","visible");					
	xmlHttpAmphoe=GetXmlHttpObject();
	if (xmlHttpAmphoe==null)
	{
		alert ("Browser does not support HTTP Request");
		return;
	} 
	var url="./xml/mapgml.py/amphoe50";	
	xmlHttpAmphoe.onreadystatechange=stateChangedAmphoe50;
	xmlHttpAmphoe.open("GET",url,true);
	xmlHttpAmphoe.send(null);			
}
											
function stateChangedAmphoe50() 
{ 
	if (xmlHttpAmphoe.readyState==4 || xmlHttpAmphoe.readyState=="complete")
	{ 					
		xml = xmlHttpAmphoe.responseXML;					
		rootElement = xml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "lightgrey" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","black");
		gElement.setAttribute("stroke-width","15");
		//gElement.setAttribute("onclick","move(evt)");
		amphoe = rootElement.getElementsByTagName("amphoe");					
		for( iamphoe = 0; iamphoe < amphoe.length; iamphoe++ )
		{
			plElement = mapdocument.createElement("polygon");
					
			ppoint = amphoe[iamphoe].getAttribute("points");
			plElement.setAttribute("points",ppoint);
			
			plElement.setAttribute("onmouseout","hideTooltip(evt)");
			//plElement.setAttribute("marker-end","url(#hospital)");

			titleName = mapdocument.createElement("title");
			//titleName.setAttribute("id","name"+String(iamphoe));
			aname = amphoe[iamphoe].childNodes[0];
			if(aname.firstChild != null)
			{
				amphoeName = aname.firstChild.nodeValue;
			}
			else
			{
				amphoeName = " ไม่มีชื่อ";
			}
			plElement.setAttribute("onmousemove","position(evt,'"+String(amphoeName)+"')");
			//txtName = mapdocument.createTextNode(amphoeName);
			//titleName.appendChild(txtName);
			//plElement.appendChild(titleName);
						
			setNameElement = mapdocument.createElement("set");								
			setNameElement.setAttribute("attributeType",'XML');
			setNameElement.setAttribute("attributeName",'stroke-width');
			setNameElement.setAttribute("to","45");
			setNameElement.setAttribute("begin",'mouseover');
			setNameElement.setAttribute("end",'mouseout');
			plElement.appendChild(setNameElement);

			setNameElement = mapdocument.createElement("set");								
			setNameElement.setAttribute("attributeType",'XML');
			setNameElement.setAttribute("attributeName",'stroke');
			setNameElement.setAttribute("to","tomato");
			setNameElement.setAttribute("begin",'mouseover');
			setNameElement.setAttribute("end",'mouseout');
			plElement.appendChild(setNameElement);

			setNameElement = mapdocument.createElement("set");								
			setNameElement.setAttribute("attributeType",'XML');
			setNameElement.setAttribute("attributeName",'fill');
			setNameElement.setAttribute("to","lightgrey");
			setNameElement.setAttribute("begin",'mouseover');
			setNameElement.setAttribute("end",'mouseout');
			plElement.appendChild(setNameElement);

			setNameElement = mapdocument.createElement("set");								
			setNameElement.setAttribute("attributeType",'XML');
			setNameElement.setAttribute("attributeName",'fill-opacity');
			setNameElement.setAttribute("to","1");
			setNameElement.setAttribute("begin",'mouseover');
			setNameElement.setAttribute("end",'mouseout');
			plElement.appendChild(setNameElement);

			gElement.appendChild(plElement);					
		}
		gAmphoe = maprootelement.getElementById("mapamphoe");
		gAmphoe.appendChild(gElement);									
        closeWait();
	} 
}	
////////////////////////////////////////////////////////////////////
//    Place
////////////////////////////////////////////////////////////////////

function hospital()
{        
	chHospital = htmldocument.getElementById("chhospital");
	if(chHospital.getAttribute("value") == "unchecked")
	{
		openWait();
		gHospital = maprootelement.getElementById("maphospital");
		gHospital.setAttribute("visibility","visible");					
		gInHospital = gHospital.getElementsByTagName("g");					
		if(gInHospital.length == 0 )
		{
			xmlHttpHospital=GetXmlHttpObject();
			if (xmlHttpHospital==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=hospital";	
			xmlHttpHospital.onreadystatechange=stateChangedHospital;
			xmlHttpHospital.open("GET",url,true);
			xmlHttpHospital.send(null);	
		}
		else
        {
             closeWait();
        }

		chHospital.setAttribute("value","checked");					
	}
	else
	{
		gHospital = maprootelement.getElementById("maphospital");
		gHospital.setAttribute("visibility","hidden");					
		chHospital.setAttribute("value","unchecked");
	}								
}
			
function stateChangedHospital() 
{ 
	if (xmlHttpHospital.readyState==4 || xmlHttpHospital.readyState=="complete")
	{ 					
		hospitalxml = xmlHttpHospital.responseXML;					
		hospitalRoot = hospitalxml.documentElement;									
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "red" );
		gElement.setAttribute("fill-opacity","1");
		gElement.setAttribute("stroke","blue");
		gElement.setAttribute("stroke-width","10");		

		place = hospitalRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");			
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
			clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
			clElement.setAttribute("r","100");
			clElement.setAttribute("fill",'white');
			clElement.setAttribute("fill-opacity","0.2");
			clElement.setAttribute("stroke","none");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+','+ppoint.getAttribute("pointy"));
			//plElement.setAttribute("onmousemove","position(evt)");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");
			plElement.setAttribute("marker-start","url(#hospital)");
									
			//titleName = mapdocument.createElement("title");
			//titleName.setAttribute("id","name"+String(iHosp));
			hname = place[iPlace].childNodes[1];
			if(hname.firstChild != null)
			{
				hospiName = hname.firstChild.nodeValue;
			}
			else
			{
				hospiName = " ไม่มีชื่อ";
			}
			
			clElement.setAttribute("onmousemove","position(evt,'"+String(hospiName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+hospiName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
			//txtName = mapdocument.createTextNode(hospiName);
			//titleName.appendChild(txtName);
			//cElement.appendChild(titleName);					
			
			gElement.appendChild(clElement);
			gElement.appendChild(plElement);					
		}
		
		gHospital = maprootelement.getElementById("maphospital");
		//gHospital.appendChild(defss);
		gHospital.appendChild(gElement);		
        closeWait();
	} 
} 

function school()
{
	chSchool = htmldocument.getElementById("chschool");
	if(chSchool.getAttribute("value") == "unchecked")
	{
		openWait();
		gSchool = maprootelement.getElementById("mapschool");
		gSchool.setAttribute("visibility","visible");					
		gInSchool = gSchool.getElementsByTagName("g");					
		if(gInSchool.length == 0 )
		{
			xmlHttpSchool=GetXmlHttpObject();
			if (xmlHttpSchool==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=school";	
			xmlHttpSchool.onreadystatechange=stateChangedSchool;
			xmlHttpSchool.open("GET",url,true);
			xmlHttpSchool.send(null);	
		}
		else
        {
            closeWait();
        }
		chSchool.setAttribute("value","checked");					
	}
	else
	{
		gSchool = maprootelement.getElementById("mapschool");
		gSchool.setAttribute("visibility","hidden");					
		chSchool.setAttribute("value","unchecked");
	}								
}
			
function stateChangedSchool() 
{ 
	if (xmlHttpSchool.readyState==4 || xmlHttpSchool.readyState=="complete")
	{ 					
		schoolxml = xmlHttpSchool.responseXML;					
		placeRoot = schoolxml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "green" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","black");
		gElement.setAttribute("stroke-width","10");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");

			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));						
			plElement.setAttribute("marker-start","url(#markerschool)");
			
			nameElement = place[iPlace].childNodes[1];
			if(nameElement.firstChild != null)
			{
				placeName = nameElement.firstChild.nodeValue;
			}
			else
			{
				placeName = " ไม่มีชื่อ";
			}			
			clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");			

			gElement.appendChild(clElement);
			gElement.appendChild(plElement);					
		}
		gSchool = maprootelement.getElementById("mapschool");
		gSchool.appendChild(gElement);									
        closeWait();
	} 
}

function police()
{
    howcheck = htmldocument.getElementById("chstpolice");
	if( howcheck.getAttribute("value") == "unchecked" )
	{
		openWait();	
		gNode = maprootelement.getElementById("mappolicestation");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if( gInNode.length == 0 )
		{
			xmlHttpPolice=GetXmlHttpObject();
			if (xmlHttpPolice==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=policestation";	
			xmlHttpPolice.onreadystatechange=stateChangedPolice;
			xmlHttpPolice.open("GET",url,true);
			xmlHttpPolice.send(null);	
		}
		else
        {
            closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mappolicestation");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedPolice() 
{ 
	if ( xmlHttpPolice.readyState==4 || xmlHttpPolice.readyState=="complete" )
	{ 					
		//alert("Ting Tong++aaa");
		statexml = xmlHttpPolice.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "blueviolet" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","blue");
		gElement.setAttribute("stroke-width","7");
		
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markerpolice)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");			
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);					
		}		
		gPlace = maprootelement.getElementById("mappolicestation");
		gPlace.appendChild(gElement);									
        closeWait();
	} 
} 

function stHospital()
{
	howcheck = htmldocument.getElementById("chsthospital");
	if( howcheck.getAttribute("value") == "unchecked" )
	{
		openWait();		
		gNode = maprootelement.getElementById("mapsthospital");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if( gInNode.length == 0 )
		{
			xmlHttpStHospital=GetXmlHttpObject();
			if (xmlHttpStHospital==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=hospitalstation";	
			xmlHttpStHospital.onreadystatechange=stateChangedStHospital;
			xmlHttpStHospital.open("GET",url,true);
			xmlHttpStHospital.send(null);	
		}
		else
        {
            closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mapsthospital");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedStHospital() 
{ 
	if( xmlHttpStHospital.readyState==4 || xmlHttpStHospital.readyState=="complete" )
	{ 							
		statexml = xmlHttpStHospital.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "yellow" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","red");
		gElement.setAttribute("stroke-width","8");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markersthospital)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);					
		}		
		gPlace = maprootelement.getElementById("mapsthospital");
		gPlace.appendChild(gElement);									
        closeWait();
	}
}
//////////////////////////////////////////////////////////////////
function lhouse()
{
  	howcheck = htmldocument.getElementById("chhouse");
	if( howcheck.getAttribute("value") == "unchecked" )
	{
		openWait();		
		gNode = maprootelement.getElementById("maphouse");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpHouse=GetXmlHttpObject();
			if (xmlHttpHouse==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=house";	
			xmlHttpHouse.onreadystatechange=stateChangedHouse;
			xmlHttpHouse.open("GET",url,true);
			xmlHttpHouse.send(null);	
		}
		else
        {
            closeWait();
        }
		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("maphouse");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedHouse() 
{ 
	if ( xmlHttpHouse.readyState==4 || xmlHttpHouse.readyState=="complete")
	{ 							
		statexml = xmlHttpHouse.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "bule" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","20");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markerhouse)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);					
		}		
		gPlace = maprootelement.getElementById("maphouse");
		gPlace.appendChild(gElement);									
		closeWait();
	}
}
///////////////////////////////////////////////////////////////////////////
function ghouse()
{
        //openWait();

	howcheck = htmldocument.getElementById("chghouse");
	if(howcheck.getAttribute("value") == "unchecked")
	{
		openWait();		
		gNode = maprootelement.getElementById("mapghouse");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpGHouse=GetXmlHttpObject();
			if (xmlHttpGHouse==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=ghouse";	
			xmlHttpGHouse.onreadystatechange=stateChangedGHouse;
			xmlHttpGHouse.open("GET",url,true);
			xmlHttpGHouse.send(null);	
		}
		else
        {
             closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mapghouse");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedGHouse() 
{ 
	if (xmlHttpGHouse.readyState==4 || xmlHttpGHouse.readyState=="complete")
	{ 							
		statexml = xmlHttpGHouse.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "lime" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","8");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markerghouse)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);				
		}		
		gPlace = maprootelement.getElementById("mapghouse");
		gPlace.appendChild(gElement);									
        closeWait();
	} 
}
////////////////////////////////////////////////////////////////////
function complex()
{       
	howcheck = htmldocument.getElementById("complex");
	if(howcheck.getAttribute("value") == "unchecked")
	{
		openWait();		
		gNode = maprootelement.getElementById("mapcomplex");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpComplex=GetXmlHttpObject();
			if (xmlHttpComplex==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=subdepartment";	
			xmlHttpComplex.onreadystatechange=stateChangedComplex;
			xmlHttpComplex.open("GET",url,true);
			xmlHttpComplex.send(null);	
		}
		else
        {
            closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mapcomplex");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedComplex() 
{ 
	if (xmlHttpComplex.readyState==4 || xmlHttpComplex.readyState=="complete")
	{ 							
		statexml = xmlHttpComplex.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "lime" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","7");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markerkrom)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);				
		}		
		gPlace = maprootelement.getElementById("mapcomplex");
		gPlace.appendChild(gElement);									
        closeWait();
	}                 
}
////////////////////////////////////////////////////////////////////
function market()
{   
    howcheck = htmldocument.getElementById("market");
	if(howcheck.getAttribute("value") == "unchecked")
	{
		openWait();		
		gNode = maprootelement.getElementById("mapmarket");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpMarket=GetXmlHttpObject();
			if (xmlHttpMarket==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=market";	
			xmlHttpMarket.onreadystatechange=stateChangedMarket;
			xmlHttpMarket.open("GET",url,true);
			xmlHttpMarket.send(null);	
		}
		else
        {
            closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mapmarket");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedMarket() 
{ 
	if (xmlHttpMarket.readyState==4 || xmlHttpMarket.readyState=="complete")
	{ 							
		statexml = xmlHttpMarket.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "magenta" );
		gElement.setAttribute("fill-opacity","0.5");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","7");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markermarket)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);				
		}		
		gPlace = maprootelement.getElementById("mapmarket");
		gPlace.appendChild(gElement);									
		closeWait();
	}
}
////////////////////////////////////////////////////////////////////
function train()
{       
	howcheck = htmldocument.getElementById("train");
	if(howcheck.getAttribute("value") == "unchecked")
	{
		openWait();		
		gNode = maprootelement.getElementById("maptrain");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpTrain=GetXmlHttpObject();
			if (xmlHttpTrain==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=trainstation";	
			xmlHttpTrain.onreadystatechange=stateChangedTrain;
			xmlHttpTrain.open("GET",url,true);
			xmlHttpTrain.send(null);	
		}
		else
        {
            closeWait();
        }
		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("maptrain");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedTrain() 
{ 
	if (xmlHttpTrain.readyState==4 || xmlHttpTrain.readyState=="complete")
	{ 							
		statexml = xmlHttpTrain.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "red" );
		gElement.setAttribute("fill-opacity","1");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","12");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markertrain)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);				
		}		
		gPlace = maprootelement.getElementById("maptrain");
		gPlace.appendChild(gElement);									
        closeWait();
	} 
}
////////////////////////////////////////////////////////////////////
function univer()
{      
	howcheck = htmldocument.getElementById("univer");
	if(howcheck.getAttribute("value") == "unchecked")
	{
		openWait();		
		gNode = maprootelement.getElementById("mapuniver");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpUniver=GetXmlHttpObject();
			if (xmlHttpUniver==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=univer";	
			xmlHttpUniver.onreadystatechange=stateChangedUniver;
			xmlHttpUniver.open("GET",url,true);
			xmlHttpUniver.send(null);	
		}
		else
        {
            closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mapuniver");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedUniver() 
{ 
	if (xmlHttpUniver.readyState==4 || xmlHttpUniver.readyState=="complete")
	{ 							
		statexml = xmlHttpUniver.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "red" );
		gElement.setAttribute("fill-opacity","1");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","15");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markeruniver)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);				
		}		
		gPlace = maprootelement.getElementById("mapuniver");
		gPlace.appendChild(gElement);									
        closeWait();

	} 
}
////////////////////////////////////////////////////////////////////
function firestation()
{
	howcheck = htmldocument.getElementById("firestation");
	if(howcheck.getAttribute("value") == "unchecked")
	{
		openWait();		
		gNode = maprootelement.getElementById("mapfirestation");
		gNode.setAttribute("visibility","visible");					
		gInNode = gNode.getElementsByTagName("g");					
		if(gInNode.length == 0 )
		{
			xmlHttpFire=GetXmlHttpObject();
			if (xmlHttpFire==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			} 
			var url="./xml/mapgml.py/place?typePlace=firestation";	
			xmlHttpFire.onreadystatechange=stateChangedFire;
			xmlHttpFire.open("GET",url,true);
			xmlHttpFire.send(null);	
		}
		else
        {
            closeWait();
        }

		howcheck.setAttribute("value","checked");					
	}
	else
	{
		gNode = maprootelement.getElementById("mapfirestation");
		gNode.setAttribute("visibility","hidden");
		howcheck.setAttribute("value","unchecked");
	}	
}
			
function stateChangedFire() 
{ 
	if (xmlHttpFire.readyState==4 || xmlHttpFire.readyState=="complete")
	{ 							
		statexml = xmlHttpFire.responseXML;					
		placeRoot = statexml.documentElement;					
					
		gElement = mapdocument.createElement("g");
		gElement.setAttribute("fill", "orangered" );
		gElement.setAttribute("fill-opacity","1");
		gElement.setAttribute("stroke","orange");
		gElement.setAttribute("stroke-width","20");
		place = placeRoot.getElementsByTagName("place");					
		for( iPlace = 0; iPlace < place.length; iPlace++ )
		{
			plElement = mapdocument.createElement("polyline");
			clElement = mapdocument.createElement("circle");
					
			ppoint = place[iPlace].childNodes[0];

			clElement.setAttribute("cx",ppoint.getAttribute("pointx"));
            clElement.setAttribute("cy",ppoint.getAttribute("pointy"));
            clElement.setAttribute("r","100");
            clElement.setAttribute("fill",'white');
            clElement.setAttribute("fill-opacity","0.2");
            clElement.setAttribute("stroke","none");
			clElement.setAttribute("onmouseout","hideTooltip(evt)");

			plElement.setAttribute("points",ppoint.getAttribute("pointx")+","+ppoint.getAttribute("pointy"));
			plElement.setAttribute("marker-end","url(#markerhouse)");
			
			nameElement = place[iPlace].childNodes[1];
            if(nameElement.firstChild != null)
            {
                placeName = nameElement.firstChild.nodeValue;
            }
            else
            {
                placeName = "ไม่ระบุชื่อ";
			}                                                        
            clElement.setAttribute("onmousemove","position(evt,'"+String(placeName)+"')");
			clElement.setAttribute("onmousedown", "maponmarking(evt,\""+placeName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")");
            gElement.appendChild(clElement);								
			gElement.appendChild(plElement);				
		}		
		gPlace = maprootelement.getElementById("mapfirestation");
		gPlace.appendChild(gElement);									
        closeWait();

	} 

}
