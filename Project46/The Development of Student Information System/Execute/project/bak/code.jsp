<%
		String t_tname = new String(request.getParameter("tname").getBytes("ISO8859_1"),"TIS-620");
		String t_tabb = new String(request.getParameter("tabb").getBytes("ISO8859_1"),"TIS-620");
		String t_tdean = new String(request.getParameter("tdean").getBytes("ISO8859_1"),"TIS-620");
		String t_tregis = new String(request.getParameter("tregis").getBytes("ISO8859_1"),"TIS-620");
		String t_tauth = new String(request.getParameter("tauth").getBytes("ISO8859_1"),"TIS-620");
		String t_tauthrank = new String(request.getParameter("tauthrank").getBytes("ISO8859_1"),"TIS-620");
	%>
	<jsp:setProperty name="addf" property="tname" value="<%=t_tname%>" />
	<jsp:setProperty name="addf" property="tabb" value="<%=t_tabb%>" />
	<jsp:setProperty name="addf" property="tdean" value="<%=t_tdean%>" />
	<jsp:setProperty name="addf" property="tregis" value="<%=t_tregis%>" />
	<jsp:setProperty name="addf" property="tauth" value="<%=t_tauth%>" />
	<jsp:setProperty name="addf" property="tauthrank" value="<%=t_tauthrank%>" />