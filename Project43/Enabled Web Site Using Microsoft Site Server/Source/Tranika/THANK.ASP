<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->
<%
		dept_id = mscsPage.RequestString("dept_id")
		pf_id = mscsPage.RequestString("pf_id")
		sku = mscsPage.RequestString("sku")
		zone = mscsPage.RequestString("zone")
		shopper_id = mscsPage.RequestString("shopper_id")
		price = mscsPage.RequestNumber("price")
		reserve_id = mscsPage.RequestNumber("reserve_id")
		phone = mscsPage.RequestString("phone")
		date_start = date()
		date_end = date_start + 14
		
%>
<%
		Set errorList = Server.CreateObject("Commerce.SimpleList")
		On Error Resume Next
		if Request("Validate").count <> 0 then

		reserve_id = mscsPage.RequestNumber("reserve_id", "", 1, 20000)
	    if IsNull(reserve_id) then
        errorList.Add "reserve_id must be between 1 and 20000"
		end if

		dept_id = mscsPage.RequestNumber("dept_id", "", 1, 20000)
	    if IsNull(dept_id) then
        errorList.Add "dept_id must be between 1 and 20000"
		end if

		pf_id = mscsPage.RequestString("pf_id", "", 1, 100)
		if IsNull(pf_id) then
        errorList.Add "pf_id must be between 1 and 100 characters"
		end if
	
		zone = mscsPage.RequestString("zone", "", 1, 100)
		if IsNull(zone) then
        errorList.Add "zone must be between 1 and 100 characters"
		end if

		sku = mscsPage.RequestString("sku", "", 1, 100)
		if IsNull(sku) then
        errorList.Add "sku must be between 1 and 100 characters"
		end if

		price = mscsPage.RequestMoneyAsNumber("price", "", 0, 2147483647)
'    list_price = mscsPage.RequestString("list_price", "", 1, 255)
	    if IsNull(price) then
        errorList.Add "price must be between 0 and 2147483647"
'        errorList.Add "list_price must be between 1 and 255 characters"
		end if
		
		status = mscsPage.RequestString("status", "", 1, 100)
		if IsNull(status) then
        errorList.Add "status must be between 1 and 100 characters"
		end if

		shopper_id = mscsPage.RequestString("shopper_id", "", 1, 100)
		if IsNull(shopper_id) then
        errorList.Add "shopper_id must be between 1 and 100 characters"
		end if

		password = mscsPage.RequestString("password", "", 1, 100)
		if IsNull(password) then
        errorList.Add "password must be between 1 and 100 characters"
		end if

		name = mscsPage.RequestString("name", "", 1, 255)
		if IsNull(name) then
        errorList.Add "name must be between 1 and 255 characters"
	    end if
 
		address = mscsPage.RequestString("address", "", 1, 100)
		if IsNull(address) then
        errorList.Add "address must be between 1 and 100 characters"
		end if

		country = mscsPage.RequestString("country", "", 1, 100)
		if IsNull(country) then
        errorList.Add "country must be between 1 and 100 characters"
		end if

		phone = mscsPage.RequestString("phone", "", 1, 100)
		if IsNull(phone) then
        errorList.Add "phone must be between 1 and 100 characters"
		end if
'    sale_price = mscsPage.RequestMoneyAsNumber("sale_price", "0", 0, 2147483647)
'    if IsNull(sale_price) then
'        errorList.Add "sale_price must be between 0 and 2147483647"
'    end if
 '   date_start = mscsPage.RequestDate("date_start")
  '  if IsNull(date_start) then
   ' errorList.Add "date_start must be a valid date"
    'end if

'    date_end = mscsPage.RequestDate("date_end")
'    if IsNull(date_end) then
'    errorList.Add "date_end must be a valid date"
'    end if
    	
'    if DateDiff("d", sale_end, sale_start) > 0 then
'        errorList.Add "sale_end must be a valid date on or after sale_start"
'    end if
    
    If errorList.Count = 0 Then
	     cmdTemp.CommandText = Replace("SELECT * FROM tranika_reserve WHERE reserve_id = ?", "?", "'" & Replace(Request("reserve_id"),"'","''") & "'")
        Set rsExe = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

		cmdTemp.CommandText = Replace("SELECT * FROM tranika_shopper WHERE shopper_id = ?", "?", "'" & Replace(Request("shopper_id"),"'","''") & "'")
        Set rsShop = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsShop.Open cmdTemp, , adOpenStatic, adLockOptimistic

'		cmdTemp.CommandText = Replace("SELECT * FROM tranika_shopper WHERE shopper_id = ?", "?", "'" & Replace(Request("shopper_id"),"'","''") & "'")
 '       Set rsInsert = Server.CreateObject("ADODB.Recordset")
  '      On Error Resume Next
   '     rsInsert.Open cmdTemp, , adOpenStatic, adLockOptimistic		

        if Err.Number <> 0 then
            Set errorList = Server.CreateObject("Commerce.SimpleList")
            errorList.Add "The table could not be found or the database connection failed."
            pageTitle = "Error"

        end if
%>



<HTML>
<HEAD>
    <TITLE><%= displayName %>: Product<% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>

<BODY BACKGROUND="<%' = Application("background") %>"  TEXT= "#000000" LINK= "#FF0000" VLINK= "#FF0000" ALINK=  "#FF0000" >
<!--#INCLUDE FILE="main.htm" -->
<P align="center"><Font size="16" Color=#3333FF><B>Thank you for interest my product<B><br>
<A href="default.asp"><Font size="16" Color=#FF3333><B>Click ! Come back to front<B></P></a>

<%
       

        rsExe.AddNew
        rsExe("reserve_id").Value = mscsPage.RequestNumber("reserve_id", "", 1, 255)
		rsExe("dept_id").value = dept_id
		rsExe("pf_id").value = pf_id
        rsExe("zone").Value = mscsPage.RequestString("zone", "", 1, 255)
		rsExe("shopper_id").Value = mscsPage.RequestString("shopper_id", "", 1, 255)
		rsExe("date_start").Value =  date_start 
		rsExe("date_end").Value = date_end
        rsExe("sku").Value = mscsPage.RequestString("sku", "", 1, 255)
        rsExe("price").Value = price
		rsExe("status").Value = mscsPage.RequestString("status", "", 1, 255)
       rsExe.Update

	   rsShop.AddNew
       rsShop("shopper_id").Value = mscsPage.RequestString("shopper_id", "", 1, 255)
	   rsShop("password").Value = mscsPage.RequestString("password", "", 1, 255)
	   rsShop("name").Value = mscsPage.RequestString("name", "", 1, 255)
       rsShop("address").Value = mscsPage.RequestString("address", "", 1, 255)
       rsShop("country").Value = mscsPage.RequestString("country", "", 1, 255)
       rsShop("phone").Value = mscsPage.RequestString("phone", "", 1, 255)
	   rsShop.Update
	  End if
	  		Response.end

	  End if
%>

<!--#INCLUDE FILE="i_footer.asp" -->

</BODY>

</HTML>
