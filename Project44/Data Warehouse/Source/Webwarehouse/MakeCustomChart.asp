<%@ Language=VBScript %>
<% 
'----------------------------------------------------------------------------------
' Disclaimer
'----------------------------------------------------------------------------------
'Microsoft provides this sample application "as is" for informational purposes only 
'and Microsoft makes no warranties, either express or implied, as to its accuracy 
'of operation or suitability for use. Technical support is not available for the 
'provided source code.
'----------------------------------------------------------------------------------

'
' connect to OLAP server
'
Function ConnectToServer()
	' check if we already have a connection
    	if Not IsObject(Session("ADODBConnection")) then 
	  ' get the connection params
 	  szServer = Request.QueryString("server")
	  szDatabase = Request.QueryString("database")

	  ' create and open ADODB Connection
    	  set C = Server.CreateObject("ADODB.Connection")
    	  C.Provider = "msolap"
    	  C.Open "provider=msolap;data source=" & szServer & ";user id=;password=;Connect timeout=120;Initial catalog=" & szDatabase

	  ' set the session object
    	  Set Session("ADODBConnection") = C
    	end if
End Function

'
' construct the MDX query
'
Function ConstructMDXQuery()
	' get the params
	szCube = Request.QueryString("cube")
	szColumns = Request.QueryString("columns")
	szRows = Request.QueryString("rows")
	szWhere = Request.QueryString("where")

	' construct the MDX query
	szMDX = "select " & szColumns & " on columns, " & szRows & " on rows from " & szCube
	if szWhere <> "" then
		szMDX = szMDX & " where " & szWhere
	end if
	ConstructMDXQuery = szMDX	
End Function

'
' create a cellset
'
Function CreateCellset(szMDX)
	' connect to the OLAP server
	ConnectToServer

	' create the cellset	
	set cs = Server.CreateObject("adomd.Cellset")
	set cs.ActiveConnection = Session("ADODBConnection")
	cs.Open szMDX

	Set CreateCellset = cs
End Function

'
' get a cube definition object
'
Function GetCubeDefinition()
	' connect to the OLAP server
	ConnectToServer

	' create a catalog
	set cat = Server.CreateObject("ADOMD.Catalog")
	
	' set the catalog's connection
	set cat.ActiveConnection = Session("ADODBConnection")

	' get the cube definition
	cubeName = Request.QueryString("cube")
	set GetCubeDefinition = cat.CubeDefs(cubeName)
End Function


'
' write the X axis member
'
Function WriteXAxisMember(szMemberUniqueName, szMemberName, iMemberDepth, iColSpan)
	Response.Write ("<TD CLASS=axisXCell>")	
	'write the content of the cell
	'the content is another table which we use to vertically indent members

	' open the table inside the cell
	Response.Write ("<table BORDER=0 cellpadding=0 cellspacing=0>")

	' indent the member vertically by adding rows to the inner table
	for j = 1 to iMemberDepth	
		Response.Write("<tr height=10><td></td></tr>")
	next

	' write the member name in the new row
	Response.Write ("<TR>")
	' write the cell tag
	Response.Write ("<TD ")
	' the cell should not wrap the text
	Response.Write ("NOWRAP ")
	' write the class name (used for style binding)
	Response.Write ("CLASS=axisXCell ")
	'write the id
	Response.Write ("ID=" & szMemberUniqueName & " ")
	'write how many columns are spanned by this cell
	Response.Write ("colspan=" & iColSpan & ">")
	' write the member name
	Response.Write (szMemberName)
	'close the cell
	Response.Write ("</TD>")
	' close the row
	Response.Write ("</TR>")

	' close the table
	Response.Write ("</table>")

	Response.Write ("</TD>")
End Function

'
' write the Y axis member
'
Function WriteYAxisMember(szMemberUniqueName, szMemberName, iMemberDepth)
	' write the cell tag
	Response.Write ("<TD ")
	' the cell should not wrap the text
	Response.Write ("NOWRAP ")
	' write the class name (used for style binding)
	Response.Write ("CLASS=axisYCell ")
	'write the id
	Response.Write ("ID=" & szMemberUniqueName & ">")
	' indent the member based on the level depth
	for j = 1 to iMemberDepth
		Response.Write ("&nbsp &nbsp ")
	next
	'write the content of the cell
	Response.Write (szMemberName)
	'close the cell
	Response.Write ("</TD>")
End Function

'
' write the data cell
'
Function WriteDataCell(FormattedValue, XLevelDepth)
	' get the style for the data cell depending on the depth of the X axis member
	dataStyle = "dataCell" & Min(XLevelDepth, 3)

	Response.Write ("<TD CLASS=" & dataStyle & ">")
	Response.Write (FormattedValue)
	Response.Write ("</TD>")
End Function


Function WriteLevel(Dimension, dimIndex)
	' associate the dimension id with the DIV element
	dimensionID = Dimension.Name 
	Response.Write ("<DIV ")
	Response.Write ("ID=" & Chr(34) & dimensionID & Chr(34) & " ")
	if dimensionID <> "(All)" then 
		Response.Write ("CLASS=Level ")
	else Response.Write ("CLASS=Level_All ")
	end if
	'Response.Write ("CLASS=Dimension ")

	' set the location
	dimLeft = 30
	dimTop = (dimIndex * 30) + 10
	Response.Write ("STYLE=""left: " & dimLeft & "; top:" & dimTop & """ ")

	Response.Write (">")

	' display the dimension icon and the dimension name
	Response.Write ("<IMG SRC=""level1.bmp"">")
	Response.Write (Dimension.Name)
	'kadop test add levels
	Response.Write ("</DIV>")
End Function


'
' write the dimension header
'
Function WriteDimension(Dimension, dimIndex)
	' associate the dimension id with the DIV element
	dimensionID = Dimension.Name 
	Response.Write ("<DIV ")
	Response.Write ("ID=" & Chr(34) & dimensionID & Chr(34) & " ")
	Response.Write ("CLASS=Dimension ")

	' set the location
	dimLeft = 30
	dimTop = (dimIndex * 30) + 10
	Response.Write ("STYLE=""left: " & dimLeft & "; top:" & dimTop & """ ")

	Response.Write (">")

	' display the dimension icon and the dimension name
	Response.Write ("<IMG SRC=""dim.bmp"">")
	Response.Write (Dimension.Name)
	'kadop test add levels
	Response.Write ("</DIV>")


End Function


'
' utility functions
'
Function Min(x, y)
	if x > y then
		Min = y
	else
		Min = x
	end if
End Function

Function Max(x, y)
	Max = Min(y, x)
End Function
%>


<HTML> 
<HEAD> 
<LINK REL=STYLESHEET TYPE="text/css" HREF="customstyles.css"> 
<SCRIPT LANGUAGE="JavaScript" SRC="CubeAxisBrowser.js"></SCRIPT>

</HEAD> 
<BODY onLoad="init()">

<!--
	display the dimensions
-->
<DIV ID="DimensionDisplay" STYLE="height:200">
<b>Dimensions</b><br>
<%

   	'if Not IsObject(Session("ADODBConnection")) then 
	  szServer = Request.QueryString("server")
	  szDatabase = Request.QueryString("database")
      chktablex=Request.QueryString("customdimX")
      chktabley=Request.QueryString("customdimY")
	  ' create and open ADODB Connection
    	  set C = Server.CreateObject("ADODB.Connection")
    	  C.Provider = "msolap"
    	  C.Open "provider=msolap;data source=" & szServer & ";user id=;password=;Connect timeout=120;Initial catalog=" & szDatabase

	  ' set the session object
      Set Session("ADODBConnection") = C
	'end if
	

	' create a catalog
	set cat = Server.CreateObject("ADOMD.Catalog")
	' set the catalog's connection
	set cat.ActiveConnection = Session("ADODBConnection")
	' get the cube definition
	cubeName = Request.QueryString("cube")
	set cubeDefs = cat.CubeDefs(cubeName)

	
	' check for first query
	if Request.QueryString("columns") = "" then
		szColumns = "measures.members"
		Columns_dim = "Measures"
		Session("QueryString_col") = szColumns
		Session("QueryString_col_dim") = Columns_dim
	else 
		szColumns = Request.QueryString("columns")
		Session("QueryString_col") = szColumns
		Session("QueryString_col_dim") = Request.QueryString("column dimension")
	end if
	
	if Request.QueryString("rows") = "" then
		if cubeDefs.Dimensions(0).Name <> "Measures" then 
			szRows = "{[" & cubeDefs.Dimensions(0).Name & "].Levels(0).members}"
			Rows_dim = "[" & cubeDefs.Dimensions(0).Name & "]"
		else 
			szRows = "{[" & cubeDefs.Dimensions(1).Name & "].Levels(0).members}"
			Rows_dim = "[" & cubeDefs.Dimensions(1).Name & "]"
		end if 
		Session("QueryString_row") = szRows
		Session("QueryString_row_dim") = Rows_dim
		Session("QueryString_LevelDisplay") = szRows
	else
		szRows = Request.QueryString("rows")
		Session("QueryString_row") = szRows
		Session("QueryString_row_dim") = Request.QueryString("row dimension")
		Session("QueryString_LevelDisplay") = Request.QueryString("LevelDisplay")
	end if

'write dimension====================================================================================
dimIndex = 1
if (request.QueryString("customdimx") and request.QueryString("customdimy")) then
	for i = 0 to cubeDefs.Dimensions.Count - 1
		set dimension = cubeDefs.Dimensions(i)
		'if (dimension.Name <> Request.QueryString("column dimension")) And (dimension.Name <> Request.QueryString("row dimension")) then
		
		if Request.QueryString("rows") <> "" then
			if (InStr(Request.QueryString("column dimension"),dimension.Name)= 0) And  (InStr(Request.QueryString("row dimension"),"[" & dimension.Name & "]")= 0) then
				WriteDimension dimension, dimIndex
				'kadop test add level
				expandDim = request.querystring("expandDim")
				if  dimension.Name = expandDim then
					dim kadop
					for kadop = 0 to cubeDefs.dimensions(i).hierarchies(0).levels.count -1
					dimIndex= dimIndex + 1 
						'if cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop).name <> "(All)" then
						writeLevel cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop) ,dimIndex
						'else dimIndex = dimIndex - 1
						'end if
					next
				end if
				'end kadop test 
				
				dimIndex = dimIndex + 1
			end if
		else
			if (dimension.Name <> Columns_dim) And (("[" & dimension.Name & "]") <> Rows_dim) then
				WriteDimension dimension, dimIndex
				dimIndex = dimIndex + 1
			end if
		end if 
	next	
elseif request.QueryString("customdimy") then
    for i = 0 to cubeDefs.Dimensions.Count - 1
		set dimension = cubeDefs.Dimensions(i)
		
		if Request.QueryString("rows") <> "" then
			if (InStr(Request.QueryString("row dimension"),"[" & dimension.Name & "]")= 0) then
				WriteDimension dimension, dimIndex
				'kadop test add level
				expandDim = request.querystring("expandDim")
				if  dimension.Name = expandDim then
					'dim kadop
					for kadop = 0 to cubeDefs.dimensions(i).hierarchies(0).levels.count -1
					dimIndex= dimIndex + 1 
						'if cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop).name <> "(All)" then
						writeLevel cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop) ,dimIndex
						'else dimIndex = dimIndex - 1
						'end if
					next
				end if
				'end kadop test 
				
				dimIndex = dimIndex + 1
			end if
		else
			if (("[" & dimension.Name & "]") <> Rows_dim) then
				WriteDimension dimension, dimIndex
				dimIndex = dimIndex + 1
			end if
		end if 
	next	
elseif request.QueryString("customdimX") then
	for i = 0 to cubeDefs.Dimensions.Count - 1
		set dimension = cubeDefs.Dimensions(i)
		'if (dimension.Name <> Request.QueryString("column dimension")) And (dimension.Name <> Request.QueryString("row dimension")) then
		
		if Request.QueryString("rows") <> "" then
			if (InStr(Request.QueryString("column dimension"),dimension.Name)= 0) then
				WriteDimension dimension, dimIndex
				'kadop test add level
				expandDim = request.querystring("expandDim")
				if  dimension.Name = expandDim then
					'dim kadop
					for kadop = 0 to cubeDefs.dimensions(i).hierarchies(0).levels.count -1
					dimIndex= dimIndex + 1 
						'if cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop).name <> "(All)" then
						writeLevel cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop) ,dimIndex
						'else dimIndex = dimIndex - 1
						'end if
					next
				end if
				'end kadop test 
				
				dimIndex = dimIndex + 1
			end if
		else
			if (dimension.Name <> Columns_dim) then
				WriteDimension dimension, dimIndex
				dimIndex = dimIndex + 1
			end if
		end if 
	next
else
for i = 0 to cubeDefs.Dimensions.Count - 1
		set dimension = cubeDefs.Dimensions(i)
		'if (dimension.Name <> Request.QueryString("column dimension")) And (dimension.Name <> Request.QueryString("row dimension")) then
		
		if Request.QueryString("rows") <> "" then
			'if (InStr(Request.QueryString("column dimension"),dimension.Name)= 0) And  '(InStr(Request.QueryString("row dimension"),"[" & dimension.Name & "]")= 0) then
				WriteDimension dimension, dimIndex
				'kadop test add level
				expandDim = request.querystring("expandDim")
				if  dimension.Name = expandDim then
					'dim kadop
					for kadop = 0 to cubeDefs.dimensions(i).hierarchies(0).levels.count -1
					dimIndex= dimIndex + 1 
						'if cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop).name <> "(All)" then
						writeLevel cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop) ,dimIndex
						'else dimIndex = dimIndex - 1
						'end if
					next
				end if
				'end kadop test 
				
				dimIndex = dimIndex + 1
			'end if
		else
			'if (dimension.Name <> Columns_dim) And (("[" & dimension.Name & "]") <> Rows_dim) then
				WriteDimension dimension, dimIndex
				dimIndex = dimIndex + 1
			'end if
		end if 
	next

end if
'end dimension==========================================================================================
	'
	' construct the MDX query
	'
	' get the params



	szCube = "[" & Request.QueryString("cube") & "]"    'use [] for the cube that has space in name
	'szRows = Request.QueryString("rows")
	szWhere = Request.QueryString("where") 

	' construct the MDX query
	szMDX = "select " & szColumns & " on columns, " & szRows & " on rows from " & szCube
	if szWhere <> "" then
		szMDX = szMDX & " where ( " & szWhere & " )"
	end if
	
	'
	' create a cellset
	'
	set cs = Server.CreateObject("adomd.Cellset")
	set cs.ActiveConnection = Session("ADODBConnection")
if (request.QueryString("customdimx") and request.QueryString("customdimy")) then
	cs.Open szMDX
	Session("StringMDX") = szMDX
 end if
%>
</DIV>



<!-- Drop Dimension here to Select columns value
<TABLE ID="colAxis" CLASS="colAxis" BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<%
	response.write("Drop dimension here to select columns")
%>
</TD>
</TR>-->
<div id="MoveOutBlock" style="position:absolute; left:50px; top:70px; width:50px; height:20px; clip:rect(0px 30px 30px 0px); background-color:red; layer-background-color:red;"></div>
<P CLASS="Cube">
	<%	response.write("<B>Cube : </B>" & Request.QueryString("cube"))
	%>
</P>
<P CLASS="sliceDisplay">
	<%	
	response.write("<B>Slice Dimension : </B>" & Request.QueryString("where"))
	%>
</P> 

<!-- <p> -->
<% if (request.QueryString("customdimx") and request.QueryString("customdimy")) then %>
<TABLE ID="SliceTable" CLASS="sliceTable" bgcolor="#FFCC33" BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<%
	response.write("Drop dimension here to slice")
%>
</TD>
</TR>
</TABLE>
<% end if %>


<% if (request.QueryString("customdimx")) then %>
<!-- <p> -->
<TABLE ID="AxisXTable" CLASS="AxisXTable" bgcolor="#FFCC33" BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<%
	response.write("Drop dimension here for column")
%>
</TD>
</TR>
</TABLE>
<% else   %>
<TABLE ID="AxisXTable" CLASS="AxisXTable"  BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<%
	response.write("Drop one dimension for column first")
%>
</TD>
</TR>
</TABLE>
<% end if %>



<% if (request.QueryString("customdimy")) then %>
<!-- <p> -->
<TABLE ID="AxisYTable" CLASS="AxisYTable" bgcolor="#FFCC33" BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<% 
	response.write("Drop dimension here to  crossjoin")
%>
</TD>
</TR>
<% else %>
<!-- <p> -->
<TABLE ID="AxisYTable" CLASS="AxisYTable" BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<%
	response.write("Drop one dimension for row first")
%>
</TD>
</TR>

<% end if %>



<!-- </TABLE> -->
<TABLE ID="ResultTable" CLASS="resultTable" BORDER=0 cellpadding=5 cellspacing=1 onClick="drill(event)">
<%

	' construct the query
	'szMDX = ConstructMDXQuery
	szMDX = Session("StringMDX")

	' create a cellset
	Set cs = CreateCellset(szMDX)

	' calculate how many blank cells precede the column labels
	' Show the name of Dimension on row
	RowDimValue = Session("QueryString_row_dim")
	start_pos = 1	'the position of "["
	end_pos = 1		'the position of "]"
	'blankCells = ""
	DimDisplay = ""
	'red block

if (request.QueryString("customdimx") and request.QueryString("customdimy")) then
	for i = 0 to cs.Axes(1).Positions(0).Members.count - 1
		'blankCells = blankCells & "<TD></TD>"
		start_pos = InStr(start_pos,RowDimValue,"[")	
		end_pos = InStr(start_pos+1,RowDimValue,"]")
		length = end_pos-start_pos-1
		DimensionName = Mid(RowDimValue,start_pos+1,length)
		DimDisplay = DimDisplay & "<TD NOWRAP CLASS=DimensionNameOnTable >" & DimensionName & "</TD>"
		start_pos = start_pos + 1
	next
end if

if (request.QueryString("customdimx") and request.QueryString("customdimy")) then
	' Display the columns axis
	for i = 0 to cs.Axes(0).Positions(0).Members.count - 1
		'Response.Write ("<TR>" & blankCells)	' start the row, emit upper-left, blank cell
		Response.Write ("<TR>" & DimDisplay)

		memberName = ""		' current member name
		memberUniqueName = ""	' current member unique name
		memberDepth = 0		' current member level depth
		cols = 0 		' number of columns with the same member
       
		for each px in cs.Axes(0).Positions
			if memberName = "" then
				memberName = px.Members(i).Caption
				'kadop test 
				
				'response.write(memberUniqueName)
			    'response.write(memberName)
				memberUniqueName = Chr(34) & px.Members(i).UniqueName & Chr(34)
				'response.write(memberUniqueName)
				memberDepth = px.Members(i).LevelDepth
				cols = 1
			else
				if memberName = px.Members(i).Caption then
					cols = cols + 1
				else
					WriteXAxisMember memberUniqueName, memberName, memberDepth, cols
                   
					memberName = px.Members(i).Caption
					memberUniqueName = Chr(34) & px.Members(i).UniqueName & Chr(34)
					memberDepth = px.Members(i).LevelDepth
					cols = 1
				end if
			end if
		next
		if memberName <> "" then
			WriteXAxisMember memberUniqueName, memberName, memberDepth, cols
		end if
		Response.Write ("</TR>")
	next
end if

if (request.QueryString("customdimx") and request.QueryString("customdimy")) then
	' Display each row, row label first, then data cells
	y = 0
	
	'response.write(cs.Axes(1).Positions(0).members.count)
	for each py in cs.Axes(1).Positions
		Response.Write ("<TR>")

		' Do the row labels
		for each m in py.Members
			WriteYAxisMember Chr(34) & m.UniqueName & Chr(34), m.Caption, m.LevelDepth
			'response.write(m.LevelDepth)
			'response.write(m.Caption)
			'response.write("&nbsp;&nbsp;&nbsp;")
			'response.write(m.ParentSameAsPrev)
		next

		' Data cells
		for x = 0 to cs.Axes(0).Positions.Count-1
			WriteDataCell cs(x,y).FormattedValue, py.Members(0).LevelDepth
		next

		Response.Write ("</TR>")
		y = y + 1		
	next
end if
%>

</TABLE>

<!--
	hidden form
-->
<div id=invisibleForm>
<form CLASS=invisibleForm name="queryForm" action="MakeCustomChart.asp" method="get">
<input type="hidden" name="server" value="<% = Request.QueryString("server") %>" size=20>
<input type="hidden" name="database" value="<% = Request.QueryString("database") %>" size=20>
<input type="hidden" name="cube" value="<% = Request.QueryString("cube") %>" size=20>
<input type="hidden" name="column dimension" value="<% =Session("QueryString_col_dim")%>" size=40>
<input type="hidden" name="columns" value="<% =Session("QueryString_col")%>" size=40>
<input type="hidden" name="row dimension" value="<% =Session("QueryString_row_dim")%>" size=40>
<input type="hidden" name="rows" value="<% =Session("QueryString_row")%>" size=40>
<input type="hidden" name="where" value="<% =Request.QueryString("where")%>" size=40>

<input type="hidden" name="expandDim" value="<% = Request.QueryString("expandDim") %>"> 
<input type="hidden" name="numRowDim" value="<% = Request.QueryString("numRowDim") %>">
<input type="hidden" name="LevelDisplay" value="<% = Session("QueryString_LevelDisplay") %>">
<!-- test customdim -->
<input type="hidden" name="customdimX" value="<% = Request.QueryString("customdimX") %> ">
<input type="hidden" name="customdimY" value="<% = Request.QueryString("customdimY") %> ">
<input type=submit value="Send">
</form>
</div>

<!-- Graph Button-->
<TABLE ID="Menu" CLASS="Menu" BORDER=1 cellpadding=0 cellspacing=1>
<form CLASS="MakeChart"  action="MakeChart.asp" target="blank" method="get">
<TR>
<TD>
<input type="hidden" name="szMDX" value="<% = szMDX %>">
<input type=submit name=submit value="graph">
</TR>
</form>
</TD>

<!-- Excel Button-->
<TABLE ID="excel" CLASS="excel" BORDER=1 cellpadding=0 cellspacing=1>
<form CLASS=makeExcel action="ExcelReport.asp" method="get" target="_blank">
<TR>
<TD>
<input type="hidden" name="server" value="<% = Request.QueryString("server") %>" >
<input type="hidden" name="database" value="<% = Request.QueryString("database") %>" >
<input type="hidden" name="cube" value="<% = Request.QueryString("cube") %>" >
<input type="hidden" name="column dimension" value="<% =Session("QueryString_col_dim")%>" >
<input type="hidden" name="columns" value="<% =Session("QueryString_col")%>">
<input type="hidden" name="row dimension" value="<% =Session("QueryString_row_dim")%>" >
<input type="hidden" name="rows" value="<% =Session("QueryString_row")%>" >
<input type="hidden" name="where" value="<% =Request.QueryString("where")%>" >
<input type="hidden" name="expandDim" value="<% = Request.QueryString("expandDim") %>"> 
<input type="hidden" name="numRowDim" value="<% = Request.QueryString("numRowDim") %>">
<input type="hidden" name="LevelDisplay" value="<% = Session("QueryString_LevelDisplay") %>">
<input type=submit name=submit value="Excel">
</TR>
</form>
</TD>

<!-- reset Button-->
<TABLE ID="resetbutton" CLASS="resetbutton" BORDER=1 cellpadding=0 cellspacing=1>
<form CLASS=makeExcel action="MakeCustomChart.asp" method="get">
<TR>
<TD>
<input type="hidden" name="server" value="<% = Request.QueryString("server") %>" size=20>
<input type="hidden" name="database" value="<% = Request.QueryString("database") %>" size=20>
<input type="hidden" name="cube" value="<% = Request.QueryString("cube") %>" size=20>
<input type="hidden" name="column dimension" value="" size=40>
<input type="hidden" name="columns" value="" size=40>
<input type="hidden" name="row dimension" value="" size=40>
<input type="hidden" name="rows" value="" size=40>
<input type="hidden" name="where" value="" size=40>

<input type="hidden" name="expandDim" value="<% = Request.QueryString("expandDim") %>"> 
<input type="hidden" name="numRowDim" value="<% = Request.QueryString("numRowDim") %>">
<input type="hidden" name="LevelDisplay" value="<% = Session("QueryString_LevelDisplay") %>">
<!-- test customdim -->
<input type="hidden" name="customdimX" value="0">
<input type="hidden" name="customdimY" value="0">
<input type=submit value="Reset">
</TR>
</form>
</TD
</TABLE>
</BODY>
</HTML>