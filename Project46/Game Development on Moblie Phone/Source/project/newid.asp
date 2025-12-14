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
		sql = "select * from idtable where cus_id = '"& inid &"' "
		
		set rs = Cn.execute(sql)
		if not rs.eof then
			'do nothing
		else
			sql = "insert into idtable (cus_id,cus_password) values  ('" & inid & "','" & inpass & "' )"
			Cn.execute(sql)
			sql = "select * from idtable where cus_id = '"& inid &"' "
			set rs = Cn.execute(sql)
			if not(rs.eof) then
			realid = rs("real_id")
			response.write(realid)
		end if
		end if
		
		rs.close
		Cn.close
%>