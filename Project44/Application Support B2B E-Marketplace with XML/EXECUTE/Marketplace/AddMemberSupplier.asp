<%	response.Buffer = true ' เพราะจะใช้ Response.redirect%>



<%
		
Set upload = Server.CreateObject("Dundas.Upload.2")
upload.SaveToMemory


Set fileEvidance1 = upload.Files("fEvidance1")
Set fileEvidance2 = upload.Files("fEvidance2")
Set fileMap = upload.Files("fMap")

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

Set rs = Server.CreateObject("ADODB.Recordset") 
sql = "Select  max(RegID)  From Register"
rs.Open sql,conn
RegID=rs(0)+1
rs.close

Set rs = Server.CreateObject("ADODB.Recordset") 
sql = "Select  *  From Register"
rs.Open sql,conn,1,3


rs.addnew

rs("RegType")="s"
rs("RegID")=RegID
rs("RegBizName")=upload.form("fBizName")
rs("RegContactTitle")=upload.form("fTitle")
rs("RegContactName")=upload.form("fName")
rs("RegContactDept")=upload.form("fDepartment")
rs("RegContactPosition")=upload.form("fPosition")
rs("RegBizAddress")=upload.form("fAddress")
rs("RegBizZip")=upload.form("fZip")

rs("RegBizCountry")=upload.form("fCountry")

if upload.form("fCountry")<>"Thailand" then
	rs("ProvinceID")=0
	rs("RegBizRegion")="O"
else
	rs("ProvinceID")=upload.form("fProvince")
	rs("RegBizRegion")=upload.form("fRegion")
end if

rs("RegBizPhone1")=upload.form("fPhone1")
rs("RegBizPhone2")=upload.form("fPhone2")
rs("RegBizFax1")=upload.form("fFax1")
rs("RegBizFax2")=upload.form("fFax2")
rs("RegBizEmail1")=upload.form("fEmail1")
rs("RegBizEmail2")=upload.form("fEmail2")
rs("RegBizType")=upload.form("fType")
rs("RegBizDetail")=upload.form("fDetail")
rs("RegBizURL")=upload.form("fURL")
rs("RegBizEmployee")=upload.form("fEmployee")
rs("RegBizIncome")=upload.form("fIncome")


rs("RegXML")=1
rs("RegEmail")=1
rs("RegFax")=1

rs("RegDate")=now

for each file in upload.Files 
rs("RegBizEvidance1")=fileEvidance1.Binary
next 
'rs("RegBizEvidance2")=fileEvidance2.Binary

'rs("RegBizMap")=fileMap.Binary



rs.Update
rs.Close
conn.Close

response.redirect("SentRegInfo.asp")
				
			
%>
