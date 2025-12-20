
function insearch(xmlDocument,namelayer)
{
	td_result = htmldocument.getElementById("result1");
	txt_search = htmldocument.getElementById("txtsearch");
	search_txt = txt_search.value;
	
	if( xmlDocument != null )
	{
		itemNumber = 0;
		
		placexml = xmlDocument.responseXML;					
		placeRoot = placexml.documentElement;												
		
		text = ""
		place = placeRoot.getElementsByTagName("place");
		for( iPlace = 0; iPlace < place.length; iPlace++ )//place.length
		{			
			hname = place[iPlace].childNodes[1];
			if(hname.firstChild != null)
			{
				hospiName = hname.firstChild.nodeValue;				
				
				if( hospiName.search(search_txt) >= 0 )
				{
					itemNumber++;
					ppoint = place[iPlace].childNodes[0];
					px = ppoint.getAttribute("pointx");
					py = ppoint.getAttribute("pointy");
					
					text = text + "<font size='1' style='cursor: hand; font-family: MS Sans Serif;' onclick='onmarking("+px+","+py+", \""+hospiName+"\",\""+lines2+"\",\""+lines3+"\",\""+lines4+"\")'> "+String(itemNumber)+".)"+hospiName+"</font><br/>";										
				}	
			}			
		}
		texttitle = "<font size='1' style='cursor: default; background: #0000FF' color='white'>:: "+namelayer+" :: </font><font size='1' color='red' style='cursor: default; background: #0000FF'>"+String(itemNumber)+" </font><br/>"
		td_result.innerHTML = td_result.innerHTML+texttitle+text;		
	} 
	else
	{
		texttitle = "<font size='1' style='cursor: default; background: #0000FF' color='white'>:: "+namelayer+" :: </font><br/><font size='1'>ข้อมูลยังไม่โหลดมา</font><br/>"
		td_result.innerHTML = td_result.innerHTML+texttitle;
	}
}

function onmarking( x_utm, y_utm, sl1, sl2, sl3, sl4 )
{
	place_marker = mapdocument.getElementById("objectsx");
	place_marker.setAttribute("cx",x_utm);
	place_marker.setAttribute("cy",y_utm);
	
	//svgDocument_sp = evt.getTarget().getOwnerDocument();
    svgRoot_sp = mapdocument.documentElement;	
    newScale_sp = svgRoot_sp.currentScale;
    translation_sp = svgRoot_sp.currentTranslate;
    
	pp = svgRoot_sp.createSVGPoint();
					
    viewBoxes_sp = svgRoot_sp.getAttribute( "viewBox" );
    posi_sp = viewBoxes_sp.indexOf(" ");
    posi2_sp = posi_sp+1;
    view_x_sp = viewBoxes_sp.substring( 0, posi_sp );
    view_x_int_sp = parseFloat(view_x_sp);
    posi_sp = viewBoxes_sp.indexOf(" ", posi2_sp);
    view_y_sp = viewBoxes_sp.substring( posi2_sp, posi_sp );
    view_y_int_sp = parseFloat(view_y_sp);
                        			
	picposition_x = translation_sp.x - ((( view_x_int_sp - x_utm )*newScale_sp)/60);
	picposition_y = translation_sp.y - ((( view_y_int_sp - y_utm )*newScale_sp)/60);
	flagAdjust = 1;
	//alert(svgRoot_sp.currentTranslate.x+','+svgRoot_sp.currentTranslate.y+','+translation_sp.x + ( 300 - picposition_x )+','+translation_sp.y + ( 240 - picposition_y ));
	svgRoot_sp.currentTranslate.x = translation_sp.x + ( 332.5 - picposition_x );	
	//alert(svgRoot_sp.currentTranslate.x+',,,'+svgRoot_sp.currentTranslate.y);
	setTimeout('svgRoot_sp.currentTranslate.y = translation_sp.y + ( 240 - picposition_y )',75);		
	//alert(svgRoot_sp.currentTranslate.x+',,,'+svgRoot_sp.currentTranslate.y);
	popupWindow = mapdocument.getElementById("windowspopup");
	popupBox = mapdocument.getElementById("popbox");
	popupLine1 = mapdocument.getElementById("textline1");
	popupLine2 = mapdocument.getElementById("textline2");
	popupLine3 = mapdocument.getElementById("textline3");
	popupLine4 = mapdocument.getElementById("textline4");

	marker_target = mapdocument.getElementById("objectsx");
    marker_target.setAttributeNS(null, 'visibility', 'visible');

	btnclose = mapdocument.getElementById("closewindow");
	btnll1 = mapdocument.getElementById("ll1");
	btnll2 = mapdocument.getElementById("ll2");

	weblink = mapdocument.getElementById("website");
	
	weblink.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href",sl4);
	popupLine1.firstChild.setData(sl1);
	popupLine2.firstChild.setData(sl2);
	popupLine3.firstChild.setData(sl3);
	popupLine4.firstChild.setData(sl4);

	popupBox.setAttribute('visibility', 'visible');
    popupWindow.setAttribute('visibility', 'visible');
	btnclose.setAttribute('visibility', 'visible');
	btnll1.setAttribute('visibility', 'visible');
	btnll2.setAttribute('visibility', 'visible');
}

function imapsearch()
{
	txt_search = htmldocument.getElementById("txtsearch");
	search_txt = txt_search.value;

	td_result = htmldocument.getElementById("result1");
	td_result.innerHTML = "";
	if( search_txt != "" )
	{					
		ci = 0;

		howcheck = htmldocument.getElementById("chhospital");
		if( howcheck.getAttribute("value") == "checked" )
		{			
			insearch(xmlHttpHospital,"โรงพยาบาล");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("chschool");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpSchool,"โรงเรียน");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("chstpolice");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpPolice,"สถานีตำรวจ");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("chsthospital");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpStHospital,"สถานีอนามัย");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("chhouse");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpHouse,"บ้าน");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("chghouse");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpGHouse,"หมู่บ้าน");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("complex");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpComplex,"กรม");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("market");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpMarket,"ตลาด");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("train");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpTrain,"สถานีรถไฟ");
			ci = 1;
		}
		howcheck = htmldocument.getElementById("univer");
		if( howcheck.getAttribute("value") == "checked" )
		{
			insearch(xmlHttpUniver,"มหาวิทยาลัย");
			ci = 1;
		}
		if( ci == 0 )
		{
			texttitle = "<font size='1' style='cursor: default; background: #FF0000' color='black'> ไม่มีชั้นข้อมูลสถานที่ !!!</font><br/>"
			td_result.innerHTML = td_result.innerHTML+texttitle;
		}
	}
	else
	{
		texttitle = "<font size='1' style='cursor: default; background: #FF0000' color='black'> โปรดใส่คำที่ต้องการหา !!!</font><br/>"
		td_result.innerHTML = td_result.innerHTML+texttitle;
	}
}