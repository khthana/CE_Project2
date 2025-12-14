<%@ Language=VBScript %>
<%
  'change HTML header to specify Excel's MIME content type
   Response.Buffer=TRUE
   Response.ContentType="application/vnd.ms-excel"
%>

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


Function WriteLevel(Dimension, dimIndex)
	' associate the dimension id with the DIV element
	dimensionID = Dimension.Name 
	Response.Write ("<DIV ")
	Response.Write ("ID=" & Chr(34) & dimensionID & Chr(34) & " ")
	if dimensionID <> "(All)" then 
		Response.Write ("CLASS=Level ")
	else Response.Write ("CLASS=Level_All ")
	end if
	

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
<!--<LINK REL=STYLESHEET TYPE="text/css" HREF="styles.css">--> 
<SCRIPT LANGUAGE="JavaScript" SRC="CubeBrowser.js"></SCRIPT>

</HEAD> 
<BODY onLoad="init()">

<!--
	display the dimensions
-->

<%
	
 	 ' check if we already have a connection
    '	if Not IsObject(Session("ADODBConnection")) then 
	  ' get the connection params
 	  szServer = Request.QueryString("server")
	  szDatabase = Request.QueryString("database")

	  ' create and open ADODB Connection
    	  set C = Server.CreateObject("ADODB.Connection")
    	  C.Provider = "msolap"
    	  C.Open "provider=msolap;data source=" & szServer & ";user id=;password=;Connect timeout=120;Initial catalog=" & szDatabase
	  ' set the session object
    	  Set Session("ADODBConnection") = C
    '	end if
	


	'
	' get a cube definition object
	'

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
			szRows = "[" & cubeDefs.Dimensions(0).Name & "].[(All)].members"
			Rows_dim = cubeDefs.Dimensions(0).Name
		else 
			szRows = "[" & cubeDefs.Dimensions(1).Name & "].[(All)].members"
			Rows_dim = cubeDefs.Dimensions(1).Name
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
	
	


	'
	' construct the MDX query
	'
	' get the params

	szCube = "[" & Request.QueryString("cube") & "]"
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
			
	cs.Open szMDX
	Session("StringMDX") = szMDX
%>
<!-- </DIV>
<p> -->


<!--
	display the results of the query
-->

<TABLE ID="ResultTable" CLASS="resultTable" BORDER=0 cellpadding=5 cellspacing=1 onClick="drill(event)">
<%
        
	' construct the query
	'szMDX = ConstructMDXQuery
	szMDX = Session("StringMDX")

	' create a cellset
	Set cs = CreateCellset(szMDX)

	' calculate how many blank cells precede the column labels
	blankCells = ""
	for i = 0 to cs.Axes(1).Positions(0).Members.count - 1
		blankCells = blankCells & "<TD></TD>"
	next
   
	' Display the columns axis
	for i = 0 to cs.Axes(0).Positions(0).Members.count - 1
		Response.Write ("<TR>" & blankCells)	' start the row, emit upper-left, blank cell

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

	' Display each row, row label first, then data cells
	y = 0
	for each py in cs.Axes(1).Positions
		Response.Write ("<TR>")
         'response.write(py.members(0).Levelname)
		' Do the row labels
		for each m in py.Members
			'WriteYAxisMember Chr(34) & m.UniqueName & Chr(34), m.Caption, m.LevelDepth
         '(szMemberUniqueName, szMemberName, iMemberDepth)

		 'write the cell tag
		Response.Write ("<TD ")
		' the cell should not wrap the text
		Response.Write ("NOWRAP ")
		' write the class name (used for style binding)
		Response.Write ("CLASS=axisYCell ")
		'write the id
		Response.Write ("ID=" & Chr(34) &  m.UniqueName & Chr(34) & ">")
		' indent the member based on the level depth
		for j = 1 to m.LevelDepth
		'	Response.Write ("&nbsp &nbsp ")
		next
		'write the content of the cell
		Response.Write (m.Caption)
		'close the cell
		Response.Write ("</TD>")

		'response.write(m.UniqueName)
		next

		' Data cells
		for x = 0 to cs.Axes(0).Positions.Count-1
			'WriteDataCell cs(x,y).FormattedValue, py.Members(0).LevelDepth
			' get the style for the data cell depending on the depth of the X axis member
			'dataStyle = "dataCell" & Min( py.Members(0).LevelDepth, 3)

			'Response.Write ("<TD CLASS=" & dataStyle & " >")
			'Response.Write (cs(x,y).FormattedValue)
			'Response.Write ("</TD>")
		next

		Response.Write ("</TR>")
		y = y + 1		
	next
%>

</TABLE>

</BODY>
</HTML>