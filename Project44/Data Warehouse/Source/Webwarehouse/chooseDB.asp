<html>
<head>
<title>Choose Database</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>


<%
'define constant
Const adSchemaProviderSpecific = -1
Const adSchemaAsserts = 0
Const adSchemaCatalogs = 1
Const adSchemaCharacterSets = 2
Const adSchemaCollations = 3
Const adSchemaColumns = 4
Const adSchemaCheckConstraints = 5
Const adSchemaConstraintColumnUsage = 6
Const adSchemaConstraintTableUsage = 7
Const adSchemaKeyColumnUsage = 8
Const adSchemaReferentialContraints = 9
Const adSchemaTableConstraints = 10
Const adSchemaColumnsDomainUsage = 11
Const adSchemaIndexes = 12
Const adSchemaColumnPrivileges = 13
Const adSchemaTablePrivileges = 14
Const adSchemaUsagePrivileges = 15
Const adSchemaProcedures = 16
Const adSchemaSchemata = 17
Const adSchemaSQLLanguages = 18
Const adSchemaStatistics = 19
Const adSchemaTables = 20
Const adSchemaTranslations = 21
Const adSchemaProviderTypes = 22
Const adSchemaViews = 23
Const adSchemaViewColumnUsage = 24
Const adSchemaViewTableUsage = 25
Const adSchemaProcedureParameters = 26
Const adSchemaForeignKeys = 27
Const adSchemaPrimaryKeys = 28
Const adSchemaProcedureColumns = 29
Const adSchemaCubes = 32
	
	set con = server.createobject("ADODB.Connection")
	set rs = server.createobject("ADODB.Recordset")
    con.Open "provider=msolap;data source="& Request.QueryString("server")&";user id=;password=;Connect timeout=120;"

	response.write("<BODY>")
	response.write("Select Database you want to query")
	response.write("<form name=""checkForm"" methode=""get"" action=""chooseCube.asp"">")
	response.write("<p>")
	response.write("<select name=""Database"" size=8 multiple>")

	Set rs = con.OpenSchema(adSchemaCatalogs) 
	Do Until rs.EOF
			catalogName = rs.Fields(0).Value
			response.write("<option value= """&catalogName&""">")
			response.write(catalogName)
			response.write("</option>")
			rs.MoveNext
	Loop

%>
</select>
</p>
<input type="hidden" name="server" value="<% =Request.QueryString("server")%>">
<input type="submit" name="Submit" value="Submit">
</form>
</body>
</html>
