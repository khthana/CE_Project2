<%
		dim id
		dim pass
		id =  request("id")
		pass =  request("pass")
		inid = replace(id,"'","''")
		inpass = replace(pass,"'","''")
		
		DataBase="File name=" & request.servervariables("APPL_PHYSICAL_PATH") & "connect.udl"
		set Cn = Server.CreateObject("ADODB.connection")
		Cn.Open(DataBase)
		sql = "select * from idtable where cus_id = '"& inid &"' and cus_password = '" & inpass & "'"
		
		set rs = Cn.execute(sql)
		if not rs.eof then
			response.write(rs("cus_name")&" "&rs("lv")&" "&rs("m")&" "&rs("l")&" "&rs("k")&" "&rs("red")&" "&rs("white")&" "&rs("expna")&" "&rs("human_hp")&" "&rs("moneyna")&" "&rs("cha")&" "&rs("job")&" "&rs("real_id"))
			
		else
			'do nothing
		end if
		
		rs.close
		Cn.close
%>