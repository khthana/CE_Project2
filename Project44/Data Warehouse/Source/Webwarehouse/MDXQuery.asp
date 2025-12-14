<%@ Language=VBScript %>
<% 

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


Function WriteLevel(Level, dimIndex,Dimension)
	' associate the dimension id with the DIV element
	dimensionID = Dimension.Name 
	LevelID = Level.Name
	Response.Write ("<DIV ")
	Response.Write ("ID=" & Chr(34) & "["& dimensionID &"].[" &  LevelID & "]"& Chr(34) & " ")
	if LevelID <> "(All)" then 
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
	Response.Write (Level.Name)
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
<LINK REL=STYLESHEET TYPE="text/css" HREF="styles.css"> 
<SCRIPT LANGUAGE="JavaScript" SRC="CubeBrowser.js"></SCRIPT>

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
	
	dimIndex = 1
	for i = 0 to cubeDefs.Dimensions.Count - 1
		set dimension = cubeDefs.Dimensions(i)

		
		if Request.QueryString("rows") <> "" then
			if (InStr(Request.QueryString("column dimension"),dimension.Name)= 0) And  (InStr(Request.QueryString("row dimension"),"[" & dimension.Name & "]")= 0) then
				WriteDimension dimension, dimIndex

				expandDim = request.querystring("expandDim")
				if  dimension.Name = expandDim then
					dim kadop
					for kadop = 0 to cubeDefs.dimensions(i).hierarchies(0).levels.count -1
					dimIndex= dimIndex + 1 

						writeLevel cubedefs.Dimensions(i).Hierarchies(0).Levels(kadop) ,dimIndex,dimension
					next
				end if

				
				dimIndex = dimIndex + 1
			end if
		else
			if (dimension.Name <> Columns_dim) And (("[" & dimension.Name & "]") <> Rows_dim) then
				WriteDimension dimension, dimIndex
				dimIndex = dimIndex + 1
			end if
		end if 
	next	


	'
	' construct the MDX query
	'
	' get the params

	szCube = "[" & Request.QueryString("cube") & "]"    'use [] for the cube that has space in name
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
			
	cs.Open szMDX
	Session("StringMDX") = szMDX
%>
</DIV>

<div id="MoveOutBlock" style="position:absolute; left:50px; top:70px; width:50px; height:20px; clip:rect(0px 30px 30px 0px); background-color:red; layer-background-color:red;"></div>

<P CLASS="Cube">
	<%	response.write("<B>Cube : </B>" & Request.QueryString("cube"))
	%>
</P>
<P CLASS="sliceDisplay">
	<%	response.write("<B>Slice Dimension : </B>" & Request.QueryString("where"))
	%>
</P>

<!-- <p> -->
<TABLE ID="SliceTable" CLASS="sliceTable" BORDER=1 cellpadding=5 cellspacing=1 width=180>
<TR>
<TD>
<%
	response.write("Drop dimension here to slice")
%>
</TD>
</TR>
</TABLE>

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
	start_pos = 1	 	'the position of "["
	end_pos = 1		'the position of "]"
	DimDisplay = ""
	for i = 0 to cs.Axes(1).Positions(0).Members.count - 1
		start_pos = InStr(start_pos,RowDimValue,"[")	
		end_pos = InStr(start_pos+1,RowDimValue,"]")
		length = end_pos-start_pos-1
		DimensionName = Mid(RowDimValue,start_pos+1,length)
		DimDisplay = DimDisplay & "<TD NOWRAP CLASS=DimensionNameOnTable >" & DimensionName & "</TD>"
		start_pos = start_pos + 1
	next

	' Display the columns axis
	for i = 0 to cs.Axes(0).Positions(0).Members.count - 1
		Response.Write ("<TR>" & DimDisplay)

		memberName = ""		' current member name
		memberUniqueName = ""	' current member unique name
		memberDepth = 0		' current member level depth
		cols = 0 		' number of columns with the same member
       
		for each px in cs.Axes(0).Positions
			if memberName = "" then
				memberName = px.Members(i).Caption
				memberUniqueName = Chr(34) & px.Members(i).UniqueName & Chr(34)
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

	' Display each row, row label first, then data cells
	y = 0
	
	for each py in cs.Axes(1).Positions
		Response.Write ("<TR>")

		' Do the row labels
		for each m in py.Members
			WriteYAxisMember Chr(34) & m.UniqueName & Chr(34), m.Caption, m.LevelDepth
		next

		' Data cells
		for x = 0 to cs.Axes(0).Positions.Count-1
			WriteDataCell cs(x,y).FormattedValue, py.Members(0).LevelDepth
		next

		Response.Write ("</TR>")
		y = y + 1		
	next
%>

</TABLE>

<!--
	hidden form
-->
<div id=invisibleForm>
<form CLASS=invisibleForm name="queryForm" action="MDXQuery.asp" method="get">
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
<form CLASS=makeExcel action="ExcelReport.asp" method="get" target="blank">
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
<!-- Custom Graph  Button-->
<TABLE ID="CustomGraph" CLASS="CustomGraph" BORDER=1 cellpadding=0 cellspacing=1>
<form CLASS="MakeCustomChart"  action="MakeCustomChart.asp" target="blank" method="get">
<TR>
<TD>
<input type="hidden" name="server" value="<% = Request.QueryString("server") %>" size=20>
<input type="hidden" name="database" value="<% = Request.QueryString("database") %>" size=20>
<input type="hidden" name="cube" value="<% = Request.QueryString("cube") %>" size=20>
<input type="hidden" name="column dimension" value="<%'=Session("QueryString_col_dim")%>" size=40>
<input type="hidden" name="columns" value="<% '=Session("QueryString_col")%>" size=40>
<input type="hidden" name="row dimension" value="<%'=Session("QueryString_row_dim")%>" size=40>
<input type="hidden" name="rows" value="<%'=Session("QueryString_row")%>" size=40>
<input type="hidden" name="where" value="" size=40>
<input type="hidden" name="expandDim" value="<% '= Request.QueryString("expandDim") %>"> 
<input type="hidden" name="numRowDim" value="<% '= Request.QueryString("numRowDim") %>">
<input type="hidden" name="LevelDisplay" value="<%' = Session("QueryString_LevelDisplay") %>">
<input type="hidden" name="customdimY" value="0">
<input type="hidden" name="customdimX" value="0">
<input type=submit value="Custom Graph">
</TR>
</form>
</TD>

</BODY>
</HTML>

</BODY>
</HTML>