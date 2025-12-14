//		JavaScript code for manipulating cube browser in DHTML
//

// global variables
var drag = 0;
var move = 0;
var clickleft = 0;
var clicktop = 0;
var startleft = 0;
var starttop = 0;
var dimBrowser;
var afterDrop = 0;
var dimRemove = 0;
var BlockObject;


//
// check position of the mouse
//
function insideResultTable() {
	result = false
	t = document.all.ResultTable

	// check height
	if ((window.event.y > t.offsetTop) && 
	     (window.event.y < t.offsetTop + t.offsetHeight)) {
		result = true	
	}

	// check width
	if (result) {
		if ((window.event.x > t.offsetLeft) && 
		     (window.event.x < t.offsetLeft + t.offsetWidth)) {
			result = true	
		}
		else {
			result = false
		}
	}

	return result
}

function insideSliceTable() {
	result = false
	t = document.all.SliceTable

	// check height
	if ((window.event.y > t.offsetTop) && 
	     (window.event.y < t.offsetTop + t.offsetHeight)) {
		result = true	
	}

	// check width
	if (result) {
		if ((window.event.x > t.offsetLeft) && 
		     (window.event.x < t.offsetLeft + t.offsetWidth)) {
			result = true	
		}
		else {
			result = false
		}
	}

	return result
}

function insideXAxis() {
	t = document.all.ResultTable

	// calculate the top and the bottom of the first row
	xAxisTop = t.offsetTop
	xAxisBottom = t.offsetTop + t.rows[0].offsetHeight

	xAxisLeft = t.offsetLeft
	xAxisRight = t.offsetLeft + t.offsetWidth
	numRowDim = parseInt(document.queryForm.elements("numRowDim").value)
	for (i=0; i<=numRowDim-1; i++ )
	{
		xAxisLeft = xAxisLeft + t.rows[0].cells[i].offsetWidth
	}

	if (window.event.y > xAxisTop && window.event.y < xAxisBottom) {
		if (window.event.x > xAxisLeft && window.event.x < xAxisRight)
		{
    		return true
		}
	}

	return false
}

function insideYAxis() {
var i, numRowDim
	t = document.all.ResultTable

	// calculate the top and the bottom of the first row
	yAxisLeft = t.offsetLeft
	
	numRowDim = parseInt(document.queryForm.elements("numRowDim").value)
	yAxisRight = t.offsetLeft
	for (i=0; i<=numRowDim-1; i++ )
	{
		yAxisRight = yAxisRight + t.rows[0].cells[i].offsetWidth
	}

	if (window.event.x > yAxisLeft && window.event.x < yAxisRight) {
		return true
	}

	return false
}

//
// initialize the window event handlers
//
function init() {
	window.document.onmousemove = mouseMove
	window.document.onmousedown = mouseDown
	window.document.onmouseup = mouseUp
	window.document.onmouseover = mouseOver
	window.document.onmouseout = mouseOut
	window.document.ondragstart = mouseStop
	window.document.onclick = expand
		HideBlock();
}

function HideBlock()
{
		BlockObject = MoveOutBlock;
		BlockObject.style.visibility = "hidden";
}

function expand()
{	var expandDimName

	if (window.event.srcElement.className == "Dimension") 
	{
		expandDimName = window.event.srcElement.id
		document.queryForm.elements("expandDim").value = expandDimName
		document.queryForm.submit()

	}
}

//
// on mouse down remember where we started to drag
//
function mouseDown() {
	if (window.event.srcElement.className == "DimensionNameOnTable")
	{	
		BlockObject.style.visibility = "visible";
		BlockObject.style.left = window.event.x;
		BlockObject.style.top = window.event.y;
		dragObj = BlockObject;

		drag = 1
			t = document.all.ResultTable
			numRowDim = parseInt(document.queryForm.elements("numRowDim").value)
			
			if (numRowDim != 1)	
			{
				yAxisLeft = t.offsetLeft
				yAxisRight = t.offsetLeft		
				for (i=0; i<=numRowDim-1; i++ )
				{
					yAxisRight = yAxisRight + t.rows[0].cells[i].offsetWidth
					if (window.event.x > yAxisLeft && window.event.x < yAxisRight) 
					{
						dimRemove = i+1
					}
					yAxisLeft = yAxisRight
				}
			}
			else dimRemove = 0;	// if number of dimension is equal one ,can't move it out
	}

	if (drag) {
		clickleft = window.event.x - parseInt(dragObj.style.left)
		clicktop = window.event.y - parseInt(dragObj.style.top)
		startleft = dragObj.style.left
		starttop = dragObj.style.top

		dragObj.style.zIndex += 1
		move = 1 
	}
}

function mouseStop() {
	window.event.returnValue = false
}

//
// if we are moving an object then update its position
// as the mouse moves
//
function mouseMove() {
	if (move) {
		dragObj.style.left = window.event.x - clickleft
		dragObj.style.top = window.event.y - clicktop
	}
	window.event.returnValue = false
}

//
// on mouseUp event execute the drag and drop
//
function mouseUp() {
	if (move) {
		move = 0
		
		// get the dimension name
		dimName = window.event.srcElement.id;
		oldRowName = document.queryForm.elements("rows").value;
		oldDimRowName = document.queryForm.elements("row dimension").value;
		WhereValue = document.queryForm.elements("where").value;

	  if (window.event.srcElement.className == "Dimension") //move dimension
	  {
			if (insideSliceTable())
			{	SliceDimension();
			}
			else if (insideResultTable())
			{	if (insideXAxis())
				{
					document.queryForm.elements("columns").value = "{[" + dimName + "].Levels(0).Members}";
					document.queryForm.elements("column dimension").value = dimName;
					if (WhereValue.indexOf("["+dimName+"]") != -1)
					{	document.queryForm.elements("where").value = "";
					}
					document.queryForm.submit();
					afterDrop = 1;
					return false;
				}
				else if (insideYAxis())
				{
					document.queryForm.elements("LevelDisplay").value =  "{[" + dimName + "].Levels(0).Members}";
					document.queryForm.elements("rows").value = "{[" + dimName + "].Levels(0).Members}";
					document.queryForm.elements("row dimension").value = "[" + dimName + "]";
					document.queryForm.elements("numRowDim").value = 1;
					if (WhereValue.indexOf("["+dimName+"]") != -1)
					{	document.queryForm.elements("where").value = "";
					}
					//alert(document.queryForm.elements("where").value);
					document.queryForm.submit();
					afterDrop = 1;
					return false
				}
				else
    			{	dragObj.style.left = startleft
	    			dragObj.style.top = starttop
					BlockObject.style.visibility = "hidden"
		    	}

			}
			else
			{	dragObj.style.left = startleft
				dragObj.style.top = starttop
				BlockObject.style.visibility = "hidden"
			}
	  }
	  else if (window.event.srcElement.className == "Level") //move Level
	  { 
		// check if the drop occured inside the table
		if (insideResultTable()) {
			if (insideYAxis()) {
				//document.queryForm.elements("LevelDisplay").value = document.queryForm.elements("LevelDisplay").value + "," + "[" + dimName + "].members"
				document.queryForm.elements("LevelDisplay").value = document.queryForm.elements("LevelDisplay").value + "," +  dimName + ".members"
				//document.queryForm.elements("rows").value = "crossjoin(" + oldRowName + ",{[" + dimName +"].members})"
				document.queryForm.elements("rows").value = "crossjoin(" + oldRowName + ",{" + dimName +".members})"
				document.queryForm.elements("row dimension").value = oldDimRowName + "," +"[" + document.queryForm.elements("expandDim").value + "]";
				document.queryForm.elements("numRowDim").value = parseInt(document.queryForm.elements("numRowDim").value) +1
				dimension = document.queryForm.elements("expandDim").value; //because dimName in this case is not dimension name
				if (WhereValue.indexOf("["+dimension+"]") != -1)
				{	document.queryForm.elements("where").value = "";
				}
				document.queryForm.submit()
				afterDrop = 1
				return false
			}				
			else {
				// return the dimension to the starting position
				dragObj.style.left = startleft
				dragObj.style.top = starttop
				BlockObject.style.visibility = "hidden"
			}

		}
		else
		{	dragObj.style.left = startleft
			dragObj.style.top = starttop
			BlockObject.style.visibility = "hidden"
		}
	  }
	  else if (dimRemove != 0) // drop occur for remove dimension from table
		   { if (insideResultTable()==false)
			 {
			    DimDisplay = document.queryForm.elements("row dimension").value;
				LevDisplay = document.queryForm.elements("LevelDisplay").value;
				Dim_len = DimDisplay.length;
				Lev_len = LevDisplay.length;

				switch (dimRemove)
				 {
					case 1 :{ pos1 = DimDisplay.indexOf(",",0);
							  pos2 = LevDisplay.indexOf(",",0);
							  DimDisplay = DimDisplay.substring(pos1+1,Dim_len);
							  LevDisplay = LevDisplay.substring(pos2+1,Lev_len);
							  document.queryForm.elements("row dimension").value = DimDisplay;
							  document.queryForm.elements("LevelDisplay").value = LevDisplay;
							  document.queryForm.elements("numRowDim").value = parseInt(document.queryForm.elements("numRowDim").value) -1;
							  if (parseInt(document.queryForm.elements("numRowDim").value) != 1)
							  {
     							  writeMDX(LevDisplay,parseInt(document.queryForm.elements("numRowDim").value));	
							  }
							  else 	document.queryForm.elements("rows").value = LevDisplay;
							  document.queryForm.submit();
							break;}
					case parseInt(document.queryForm.elements("numRowDim").value) :
			    		 {  
							pos1 = 0;
							pos2 = 0;
							for (i=1;i<=parseInt(document.queryForm.elements("numRowDim").value)-1; i++ )
			    				{	 pos1 = DimDisplay.indexOf(",",pos1+1);
									 pos2 = LevDisplay.indexOf(",",pos2+1);
			    				}							
							DimDisplay = DimDisplay.substring(0,pos1);  //exclude last position 
																		//exclude ','
							LevDisplay = LevDisplay.substring(0,pos2);
						    document.queryForm.elements("row dimension").value = DimDisplay;
						    document.queryForm.elements("LevelDisplay").value = LevDisplay;
						    document.queryForm.elements("numRowDim").value = parseInt(document.queryForm.elements("numRowDim").value) -1;
							if (parseInt(document.queryForm.elements("numRowDim").value) != 1)
							{
     						   writeMDX(LevDisplay,parseInt(document.queryForm.elements("numRowDim").value));	
							}
							else 	document.queryForm.elements("rows").value = LevDisplay;
							document.queryForm.submit();
						 break;}
					default :
						{	start1 = 0; end1 = 0;
							start2 = 0; end2 = 0;
							
							for ( i=1; i<=dimRemove-1 ;i++ )
							{	start1 = DimDisplay.indexOf(",",start1+1);
								start2 = LevDisplay.indexOf(",",start2+1);
							}
							end1 = DimDisplay.indexOf(",",start1+1);
							end2 = LevDisplay.indexOf(",",start2+1);
							DimDisplay = DimDisplay.substring(0,start1) + DimDisplay.substring(end1,Dim_len);
							LevDisplay = LevDisplay.substring(0,start2) + LevDisplay.substring(end2,Lev_len);
						    document.queryForm.elements("row dimension").value = DimDisplay;
						    document.queryForm.elements("LevelDisplay").value = LevDisplay;
						    document.queryForm.elements("numRowDim").value = parseInt(document.queryForm.elements("numRowDim").value) -1;
							if (parseInt(document.queryForm.elements("numRowDim").value) != 1)
							{
     						   writeMDX(LevDisplay,parseInt(document.queryForm.elements("numRowDim").value));	
							}
							else 	document.queryForm.elements("rows").value = LevDisplay;
							document.queryForm.submit();
						 break;}
				 }
			 }
			 else
			   {			dragObj.style.left = startleft
							dragObj.style.top = starttop
							BlockObject.style.visibility = "hidden"
			    }
			}
		else {
			// return the dimension to the starting position
			dragObj.style.left = startleft
			dragObj.style.top = starttop
			BlockObject.style.visibility = "hidden"
		}

		afterDrop = 0
	}
}

// function for write new MDX after we move the dimension out of table
function writeMDX(Level,NumRow)
{ 
	len = Level.length;
	start = 0;
	end = Level.indexOf(",",start);
	BeginLevel = Level.substring(start,end);
	start = end+1;
	
	for (i=1; i<=NumRow-2; i++)
	{
		end = Level.indexOf(",", start);
		tmp_level = Level.substring(start,end);
		document.queryForm.elements("rows").value = "crossjoin(" + BeginLevel + "," + tmp_level + ")";
		BeginLevel = document.queryForm.elements("rows").value;
		start = end+1;
	}
	tmp_level = Level.substring(start,len);
	document.queryForm.elements("rows").value = "crossjoin(" + BeginLevel + "," + tmp_level + ")";
}


//
// if we are over a "draggable" object then set the drag flag
//
function mouseOver() {
var i, numRowDim
	if (window.event.srcElement.className == "Level" || window.event.srcElement.className == "Dimension") {
		dragObj = window.event.srcElement
		drag = 1
		dimRemove = 0
	}
	

}

function mouseOut() {
	drag = 0
}


//
// if the user clicks on a dimension then display the dimension members in 
// the new window
//
function SliceDimension() {
	if (afterDrop == 1) {
		return false
	}

	if (window.event.srcElement.className == "Dimension") {
		// get the dimension name
		dimName = window.event.srcElement.id

		// open the new window
		dimBrowser = window.open("", "DimensionBrowser", 
					 "resizable,scrollbars,height=400,width=300")
		dimBrowser.focus()

		// write to the new window
		newContent = "<HTML>"
		newContent = newContent + "<HEAD>"
		newContent = newContent + "<TITLE>Dimension Browser: " + dimName + "</TITLE>"
		newContent = newContent + "<LINK REL=STYLESHEET TYPE=\"text/css\" HREF=\"styles.css\">"
		newContent = newContent + "</HEAD>"
		newContent = newContent + "<BODY>"
		newContent = newContent + "Retrieving dimension information..."
		newContent = newContent + "<form CLASS=invisibleForm name=\"queryForm\" action=\"DimBrowser.asp\" method=\"get\">"
		newContent = newContent + "<input type=\"TEXT\" name=\"server\" value=\"" + document.queryForm.elements("server").value + "\" size=20>"
		newContent = newContent + "<input type=\"TEXT\" name=\"database\" value=\"" + document.queryForm.elements("database").value + "\" size=20>"
		newContent = newContent + "<input type=\"TEXT\" name=\"cube\" value=\"" + document.queryForm.elements("cube").value + "\" size=20>"
		newContent = newContent + "<input type=\"TEXT\" name=\"dimension\" value=\"" + dimName + "\" size=20>"
		newContent = newContent + "<input type=\"TEXT\" name=\"level\" value=\"1\" size=20>"
		newContent = newContent + "<input type=submit value=\"Send\">"
		newContent = newContent + "</form>"
		newContent = newContent + "</BODY>"
		newContent = newContent + "</HTML>"
		dimBrowser.document.write(newContent)
		dimBrowser.document.close()
		dragObj.style.left = startleft
		dragObj.style.top = starttop
		dimBrowser.document.queryForm.submit()
	}	
}

//
// this function is called when the user clicks on a cell in the table
//
function drill(evt) {
	var sMemberName
	if (window.event.srcElement.className == "axisXCell") {
		sMemberName = window.event.srcElement.id
		document.queryForm.elements("columns").value = "ToggleDrillState(" + document.queryForm.elements("columns").value + ",{" + sMemberName + "})"
		document.queryForm.submit()
	}
	else if (window.event.srcElement.className == "axisYCell") {
		sMemberName = window.event.srcElement.id
		document.queryForm.elements("rows").value = "ToggleDrillState(" + document.queryForm.elements("rows").value + ",{" + sMemberName + "})"
		document.queryForm.submit()
	}

	return false
}
