<%
		inid =  request("id")
		name =  request("name")
		typeid = request("char")
		level = request("level")
		human_hp = request("human_hp")
		inexp = request("exp")
		red = request("red")
		white = request("white")
		m = request("m")
		l = request("l")
		k = request("k")
		money = request("money")
		job = request("job")
		
		inname = replace(name,"'","''")
		
		
		
		
		
		DataBase="File name=" & request.servervariables("APPL_PHYSICAL_PATH") & "connect.udl"
		set Cn = Server.CreateObject("ADODB.connection")
		Cn.Open(DataBase)
		sql = "UPDATE idtable SET cus_name='" & inname & "',cha='" & typeid & "',human_hp=" & human_hp & ",lv=" & level & ",expna=" & inexp & ",red=" & red & ",white=" & white & ",m=" & m & ",k=" & k & ",l=" & l & ",moneyna=" & money & ",job=" & job & "  Where real_id=" & inid 
		
		Cn.execute(sql)
		Cn.close
%>

