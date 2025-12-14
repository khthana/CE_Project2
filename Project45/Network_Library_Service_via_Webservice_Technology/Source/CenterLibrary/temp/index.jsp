<%@ page language="java" import="java.sql.*" errorPage="" %>
<%	
	String username=new String();
	String library=new String();
	String name=new String();
	String session_id=new String();
	//String temp_username=new String()
	//String temp_library=new String();
	int i=0;
	Cookie cookies[];
	Cookie cookie;
	cookies=request.getCookies();
	if(cookies!=null)
	{
		for (i=0;i<cookies.length;i++)
		{
			cookie=cookies[i];
			if ("username".equals(cookie.getName())) {username=cookie.getValue();}
			if ("library".equals(cookie.getName())) {library=cookie.getValue();}
			if ("name".equals(cookie.getName())) {name=cookie.getValue();}
			if ("session_id".equals(cookie.getName())) {session_id=cookie.getValue();}
		}
		try{
			Connection connection;
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://161.246.6.10:3306/center?user=root&password=library&useUnicode=true&characterEncoding=windows-874");
			Statement statement;
			statement=connection.createStatement();
			String sql="select * from logon_status where username = '"+username+"' and session = '"+session_id+"' and library = '"+library+"'";
			System.out.println(sql);
			ResultSet resultset=statement.executeQuery(sql);
			i=0;
			while(resultset.next()){
				i++;
			}
			statement.close();
			connection.close();
		}catch(Exception e){System.out.println(e);}
		System.out.println(i);	
	}
	if(i==1){
	System.out.println("1111");
	String url="http://161.246.6.10:7001/samples/my_web/page_one.jsp?username=+&password=&library=ABC&session=2Gr9VzVzEarCin2iGdiw2Uzfy6AmoVYFXcWkRxuf6CMnd5rh3M51%21790631559%211044835325968&Submit=Submit";
	response.sendRedirect();	
	}else{
		System.out.println("2222");
%>		<jsp:forward page="index01.jsp"/>
<%}%>
