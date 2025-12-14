<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<TITLE> New Document </TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<%@ page language="java" errorPage="error.jsp"  import="Text.*,java.sql.*,java.util.*,com.jspsmart.upload.*"%>
<jsp:useBean id="op1" class="Text.TextOp" />
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%! public Vector cutter(String str,char ch) {
		int i=0;
		int st=-1;
		String tmp;
		Vector x=new Vector();
		while (i<str.length()){
			if (str.charAt(i)==ch){
				tmp=str.substring(st+1,i); //Cut
				tmp=tmp.trim(); //Delete Space Before and After.
				st=i; //Reset start position
				x.addElement(tmp); //Add
			}
			i++;
		}
		tmp=str.substring(st+1,str.length());
		x.addElement(tmp);
	return x;
	}

	public Vector cutter2(String str,char ch) {
		int i=0;
		int st=-1;
		String tmp;
		Vector x=new Vector();
		while (i<str.length()){
			if (str.charAt(i)==ch){
				if (st==-1) {
					st=i;	//check start position
				}
				else {
					tmp=str.substring(st+1,i); //Cut
					tmp=tmp.trim(); //Delete Space Before and After.
					st=-1; //Reset start position
					x.addElement(tmp); //Add
				}
			}
			i++;
		}
	return x;
	}

	public String cutt(String str,char ch) {
		int i=0;
		boolean df=false;
		int lp=0;
		String tmp=new String();
		while (i<str.length()){
			if (str.charAt(i)==ch){
				if (df==false) {
					tmp=tmp.concat(str.substring(lp,i));
					df=true;
				}
				else {
					df=false;
					lp=i+1;
				}
			}
			i++;
		}
		tmp=tmp.concat(str.substring(lp,str.length()));
	return tmp;
	}
%>
<%
	// Initialization
	mySmartUpload.initialize(pageContext);
	// Upload	
	mySmartUpload.upload();
	// Select  file
	
	Vector vector_sub = new Vector();
	Vector vector_add = new Vector();
	
	String pname = new String();
	String pnumber = new String();
	String author = new String();
	String description = new String();
	String index_old = new String();
	String index_old_cut = new String();
	String index_new = new String();
	String index_new_cut = new String();
	String choose_com = new String();
	String location = new String();
	String size = new String();
	String err = new String();
	java.util.Enumeration e2 = mySmartUpload.getRequest().getParameterNames();
	while (e2.hasMoreElements()) {

		String key = (String)e2.nextElement();
		if(key.equals("choose")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			pnumber = value[0];
		}
		if(key.equals("pname")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			pname = value[0];
		}
		if(key.equals("author")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			author = value[0];
		}
		if(key.equals("description")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			description = value[0];
		}
		if(key.equals("index_old")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			index_old = value[0];
		}
		if(key.equals("index_new")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			index_new = value[0];
		}
		if(key.equals("choose_com")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			choose_com = value[0];
		}
	}
	//out.println("pnumber : "+pnumber+"<br>");
	//out.println("pname : "+pname+"<br>");
	//out.println("author : "+author+"<br>");
	//out.println("description : "+description+"<br>");
	//out.println("index_old : "+index_old+"<br>");
	//out.println("index_new : "+index_new+"<br>");
	//out.println("choose_com : "+choose_com+"<br>");

	// Retreive the current file
	if(choose_com.equals("update")){
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	
		// Save it only if this file exists
		if((pname!=null && pname.length()>0)&&(author!=null && author.length()>0)&&(index_new!=null && index_new.length()>0)){  //ต้องมี ชื่อ ผู้แต่ index term 
			if (!myFile.isMissing()) {
				if(myFile.getFileExt().equals("pdf")){
					myFile.saveAs("/upload/" + myFile.getFileName());
					location=myFile.getFileName();
					Integer tmp =new Integer(myFile.getSize());
					size=tmp.toString();
				}else{
					err="file type error";
				}
			}
		}else{
			err="input not complete";
		}

	if((err==null)||(err.length()==0)){	
	Connection dbconn;
	String msgout = "";
	// Set up database connection
	try {// ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
		String url = "jdbc:odbc:FUZZYIR";
		Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
		dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
		Statement statement = dbconn.createStatement();
		int resultupdate=0;
		String sql1 ="UPDATE PAPER SET PName='"+pname+"' ";
		if((description!=null)&&(description.length()>0)){
			sql1 =sql1+",Description='"+description+"' ";
		}
		sql1 = sql1+",IndexRef='"+index_new+"' ";
		if((location!=null)&&(location.length()>0)&&(size!=null)&&(size.length()>0)){
			sql1 = sql1+",Location='"+location+"' ,FileSize='"+size+"' ";
		}
		sql1=sql1+"where PNumber='"+pnumber+"'";
		statement = dbconn.createStatement();
		statement.executeUpdate(sql1);
		statement.close();
		statement = dbconn.createStatement();
		
		sql1="Delete from AUTHOR where PNumber='"+pnumber+"'";
		statement.executeUpdate(sql1);
		statement.close();
		

		if (author!=null && author.length()>0){
			String wd;
			Vector v;
			v=cutter(author,',');
			int str=0;
			
			while (str<v.size()) {
				
				wd=(String)v.elementAt(str);
					if(wd.length()!=0){
						statement = dbconn.createStatement();
						sql1 = "INSERT INTO AUTHOR(PNumber,AuthorName)  VALUES('"+pnumber+"','"+wd+"')";
						statement = dbconn.createStatement();
						resultupdate = statement.executeUpdate(sql1);
						statement.close();
					}
				str++;
			}
		} 
		statement = dbconn.createStatement();
		sql1="Delete from PAPERKEY where PNumber='"+pnumber+"'";
		statement.executeUpdate(sql1);
		statement.close();

		if (index_new!=null && index_new.length()>0) { 
			String wd;
			Vector v;     //check phase
			v=cutter2(index_new,'"');
			int str=0;
			while (str<v.size()) {
				wd=(String)v.elementAt(str);
					if(wd.length()!=0){
						vector_add.addElement(wd);
						statement = dbconn.createStatement();
						sql1 = "INSERT INTO PAPERKEY(Keyword,PNumber)  VALUES('"+wd+"','"+pnumber+"')";
						resultupdate = statement.executeUpdate(sql1);
						statement.close();
					}
				str++;
			}
			index_new_cut=cutt(index_new,'"');
		} 

		
		
		if (index_new_cut!=null && index_new_cut.length()>0) { 
			String wd;
			int str=0;
			Vector vix=new Vector();
			String tmpo,tmpt;
			int tloop;
			Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
			if (con!=null) {
				Vector stw=op1.SSW(con);
				while((wd=op1.GWord(index_new_cut,str))!=null) {	 //wd is text not porter
					str=op1.getNxt();
					if (op1.ChkSW(wd,stw)==false) { 
						tmpo=op1.Porter(wd);
						tloop=0;
						while(tloop<vix.size()){
							tmpt=(String)vix.elementAt(tloop);
							if (tmpt.compareTo(tmpo)==0) {
								tloop=vix.size()+1;
							}
							tloop++;
						}
						if ((tloop==0) || (tloop==vix.size())) {
							vix.addElement(tmpo);
						}
						//out.println(op1.Porter(wd)+" ");
					}
				} 
				tloop=0;
				while(tloop<vix.size()) {
					statement = dbconn.createStatement();
					tmpo=(String)vix.elementAt(tloop);
					vector_add.addElement(tmpo);
					sql1 = "INSERT INTO PAPERKEY(Keyword,PNumber)  VALUES('"+tmpo+"','"+pnumber+"')";
					statement = dbconn.createStatement();
					resultupdate = statement.executeUpdate(sql1);
					tloop++;
					statement.close();
				}
			}
			String error=op1.Close(con);
			if (error!=null) {%>
				<%="Error : "+error%>
			<%}
		}	
		//out.println(vector_add.toString());
		if (index_old!=null && index_old.length()>0) { 
			String wd;
			Vector v;
			v=cutter2(index_old,'"');
			int str=0;
			while (str<v.size()) {
				wd=(String)v.elementAt(str);
					if(wd.length()!=0){
						vector_sub.addElement(wd);
					}
				str++;
			}
			index_old_cut=cutt(index_old,'"');
		} 

		
		
		if (index_old_cut!=null && index_old_cut.length()>0) { 
			String wd;
			int str=0;
			Vector vix=new Vector();
			String tmpo,tmpt;
			int tloop;
			Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
			if (con!=null) {
				Vector stw=op1.SSW(con);
				while((wd=op1.GWord(index_old_cut,str))!=null) {	 //wd is text not porter
					str=op1.getNxt();
					if (op1.ChkSW(wd,stw)==false) { 
						tmpo=op1.Porter(wd);
						tloop=0;
						while(tloop<vix.size()){
							tmpt=(String)vix.elementAt(tloop);
							if (tmpt.compareTo(tmpo)==0) {
								tloop=vix.size()+1;
							}
							tloop++;
						}
						if ((tloop==0) || (tloop==vix.size())) {
							vix.addElement(tmpo);
						}
						//out.println(op1.Porter(wd)+" ");
					}
				} 
				tloop=0;
				while(tloop<vix.size()) {
					tmpo=(String)vix.elementAt(tloop);
					vector_sub.addElement(tmpo);
					tloop++;
				}
			}
			String error=op1.Close(con);
			if (error!=null) {%>
				<%="Error : "+error%>
			<%}
		}	
		//out.println("vector_add : "+vector_add.toString()+"<br>");
		//out.println("vector_sub : "+vector_sub.toString()+"<br>");
		
		for(int i=0;i<vector_sub.size();i++){
		String keyword=(String)vector_sub.elementAt(i);
		//out.println(keyword+"x");
		Statement statement2 = dbconn.createStatement();
		//out.println("xxxxxxxxx");
		String sql_join ="Select index1,index2,Relate from Relation where Index1='"+keyword+"' or Index2='"+keyword+"'";	
		ResultSet resultset_join = statement2.executeQuery(sql_join);
		while(resultset_join.next()){
			String index_relate=resultset_join.getString("Index1");
			if (index_relate.equals(keyword)){			//กำหนด คู่ความสัมพันธ์ ใน ตาราง Retation
				index_relate=resultset_join.getString("Index2");
			}
			//out.println(index_relate+"y");
			Statement statement3 = dbconn.createStatement();
			String sql_se_keyw="select count(*) from Paperkey where Keyword='"+keyword+"'";
			ResultSet resultset_co_keyw=statement3.executeQuery(sql_se_keyw);
			int co_keyword=0;
			if (resultset_co_keyw.next()){
				co_keyword=resultset_co_keyw.getInt(1);
				//out.println(co_keyword);
			}
			resultset_co_keyw.close();
			statement3.close();

			statement3 = dbconn.createStatement();
			String sql_se_index="select count(*) from Paperkey where Keyword='"+index_relate+"'";
			ResultSet resultset_co_index=statement3.executeQuery(sql_se_index);
			int co_index=0;
			if (resultset_co_index.next()){
				co_index=resultset_co_index.getInt(1);
				//out.println(co_index);
			}
			resultset_co_index.close();
			statement3.close();

			double co_intersec=0;
			statement3 = dbconn.createStatement();
			//out.println("rrrrrrrr");
			String sql_se_intersec="select count(*) from Paperkey where Keyword='"+keyword+"'";
			sql_se_intersec=sql_se_intersec+"or Keyword='"+index_relate+"'";
			sql_se_intersec=sql_se_intersec+"group by PNumber having count(*)=2";
			ResultSet resultset_co_intersec=statement3.executeQuery(sql_se_intersec);
			while(resultset_co_intersec.next()){
				co_intersec++;
			}
			resultset_co_intersec.close();
			statement3.close();
			
			//out.println(co_intersec);
			double culcu=0;
			if((co_keyword+co_index-co_intersec)!=0){
				culcu=(co_intersec/(co_keyword+co_index-co_intersec));
			}
			
			
			String query_update = "UPDATE RELATION SET Relate= "+culcu+" WHERE (Index1='"+keyword+"'" ;
			query_update = query_update+" and Index2='"+index_relate+"') or ";
			query_update = query_update+" (Index1='"+index_relate+"' and Index2='"+keyword+"')";
			statement3 = dbconn.createStatement();
			statement3.executeUpdate(query_update);
			//out.println(query_update);
			statement3.close();
		
		}
		resultset_join.close();
		statement2.close();
	    }
	 //out.println("hello world 1 ");
	 int num_del=0;
	sql1="Select count(*) from Relation where Relate=0";
	
	statement = dbconn.createStatement();
	ResultSet resultset_del = statement.executeQuery(sql1);
	if(resultset_del.next()){
		num_del=resultset_del.getInt(1);
	}
	 if(num_del>0){
		sql1="Delete from Relation where Relate=0";
		statement.executeUpdate(sql1);
	}	
	statement.close();

	//out.println("xxxxxxx  1");
	for(int i=0;i<vector_add.size();i++){
		String keyword=(String)vector_add.elementAt(i);
		//out.println(keyword+"x");
		Statement statement2 = dbconn.createStatement();
		String sql_join ="Select index1,index2,Relate from Relation where Index1='"+keyword+"' or Index2='"+keyword+"'";	
		ResultSet resultset_join = statement2.executeQuery(sql_join);
		while(resultset_join.next()){
			String index_relate=resultset_join.getString("Index1");
			if (index_relate.equals(keyword)){			//กำหนด คู่ความสัมพันธ์ ใน ตาราง Retation
				index_relate=resultset_join.getString("Index2");
			}
			//out.println(index_relate+"y");
			Statement statement3 = dbconn.createStatement();
			String sql_se_keyw="select count(*) from Paperkey where Keyword='"+keyword+"'";
			ResultSet resultset_co_keyw=statement3.executeQuery(sql_se_keyw);
			int co_keyword=0;
			if (resultset_co_keyw.next()){
				co_keyword=resultset_co_keyw.getInt(1);
				//out.println(co_keyword);
			}
			resultset_co_keyw.close();
			statement3.close();
			statement3 = dbconn.createStatement();
			String sql_se_index="select count(*) from Paperkey where Keyword='"+index_relate+"'";
			ResultSet resultset_co_index=statement3.executeQuery(sql_se_index);
			int co_index=0;
			if (resultset_co_index.next()){
				co_index=resultset_co_index.getInt(1);
				//out.println(co_index);
			}
			resultset_co_index.close();
			statement3.close();
			double co_intersec=0;
			
			statement3 = dbconn.createStatement();
			String sql_se_intersec="select count(*) from Paperkey where Keyword='"+keyword+"'";
			sql_se_intersec=sql_se_intersec+"or Keyword='"+index_relate+"'";
			sql_se_intersec=sql_se_intersec+"group by PNumber having count(*)=2";
			ResultSet resultset_co_intersec=statement3.executeQuery(sql_se_intersec);
			while(resultset_co_intersec.next()){
				co_intersec++;
			}
			//out.println(co_intersec);
			double culcu=(co_intersec/(co_keyword+co_index-co_intersec));
			resultset_co_intersec.close();
			statement3.close();
			
			statement3 = dbconn.createStatement();
			String query_update = "UPDATE RELATION SET Relate= "+culcu+" WHERE (Index1='"+keyword+"'" ;
			query_update = query_update+" and Index2='"+index_relate+"') or ";
			query_update = query_update+" (Index1='"+index_relate+"' and Index2='"+keyword+"')";
			statement3 = dbconn.createStatement();
			statement3.executeUpdate(query_update);
			//out.println(query_update);
			statement3.close();
			
		}
		resultset_join.close();
		statement2.close();
		
	    }
		 //out.println("xxxxxxx 2");
		 for(int i=0;i<vector_add.size();i++){
		String keyword1=(String)vector_add.elementAt(i);
		Statement statement2 = dbconn.createStatement();
	
		String sql_key2 ="Select Keyword from Paperkey where PNumber='"+pnumber+"' and Keyword <> '"+keyword1+"'";	
		ResultSet resultset_key2 = statement2.executeQuery(sql_key2);
			//out.println("xxxxxxx iii");
		while(resultset_key2.next()){
			String keyword2=resultset_key2.getString("Keyword");
			//out.println(resultset_key2.getString("Keyword"));
			Statement statement3=dbconn.createStatement();
			String sql_relate="select count(*) from Relation where (Index1='"+keyword1+"'" ;
			sql_relate = sql_relate+" and Index2='"+keyword2+"') or ";
			sql_relate = sql_relate+" (Index1='"+keyword2+"' and Index2='"+keyword1+"')";
			ResultSet resultset_relate = statement3.executeQuery(sql_relate);
			int count=0;
			if (resultset_relate.next()){
				count=Integer.parseInt(resultset_relate.getString(1));
			}
			resultset_relate.close();
			statement3.close();
			//out.println(keyword1+keyword2+count);
			
			if (count==0){     //ยังไม่เคยมีข้อมูลความสัมพันธ์มาก่อน
				Statement statement4=dbconn.createStatement();
				String sql_se_keyw="select count(*) from Paperkey where Keyword='"+keyword1+"'";
				ResultSet resultset_co_keyw=statement4.executeQuery(sql_se_keyw);
				int co_keyword=0;
				if (resultset_co_keyw.next()){
					co_keyword=resultset_co_keyw.getInt(1);
					//out.println(co_keyword);
				}
				resultset_co_keyw.close();
				statement4.close();
				
				statement4 = dbconn.createStatement();
				String sql_se_index="select count(*) from Paperkey where Keyword='"+keyword2+"'";
				ResultSet resultset_co_index=statement4.executeQuery(sql_se_index);
				int co_index=0;
				if (resultset_co_index.next()){
					co_index=resultset_co_index.getInt(1);
					//out.println(co_index);
				}
				resultset_co_index.close();
				statement4.close();

				double co_intersec=0;
				statement4 = dbconn.createStatement();
				//out.println("xxxxxxx 3");
				String sql_se_intersec="select count(*) from Paperkey where Keyword='"+keyword1+"'";
				sql_se_intersec=sql_se_intersec+"or Keyword='"+keyword2+"'";
				sql_se_intersec=sql_se_intersec+"group by PNumber having count(*)=2";
				ResultSet resultset_co_intersec=statement4.executeQuery(sql_se_intersec);
				while(resultset_co_intersec.next()){
					co_intersec++;
				}
				resultset_co_intersec.close();
				statement4.close();
				//out.println(co_intersec);
				
				double culcu=(co_intersec/(co_keyword+co_index-co_intersec));
				//out.println("xxxxxxx  4");
			
				statement4 = dbconn.createStatement();
				resultupdate=0;
				String query_update = "INSERT INTO Relation(Index1,Index2,Relate)  VALUES('"+keyword1+"','"+keyword2+"', "+culcu+")";
				resultupdate = statement4.executeUpdate(query_update);
				statement4.close();
			}
		}
			//out.println("xxxxxxx  5");
	    }

		dbconn.close();
	}
	catch ( ClassNotFoundException cnfex ) 
	{
            // ดักจับกรณีไม่สามารถเรียกใช้งานคลาสสำหรับติดต่อฐานข้อมูลได้
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
	}
	catch ( SQLException sqlex ) 
	{// ดักจับกรณ๊คำสั่ง SQL ผิดพลาด
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(msgout);
      }
      catch ( Exception excp ) 
      {    // ดักจับกรณ๊ทั่วไป
            excp.printStackTrace();
            msgout = excp.toString() ;
      }
	//response.sendRedirect("add_page.jsp");
	}else{
	out.println("error : "+err);//ไม่สามารถใส่ข้อมูลลงฐานข้อมูลได้ เพราะมี error ของข้อมูลบางประการ
	}

}
if(choose_com.equals("delete")){
	//out.println("hello");
	Connection dbconn;
	String msgout = "";
      // Set up database connection
	try {// ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
		String url = "jdbc:odbc:FUZZYIR";
		Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
		dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
		Statement statement = dbconn.createStatement();
		int resultupdate=0;
		String  sql1="Delete from PAPER where PNumber='"+pnumber+"'";
		statement.executeUpdate(sql1);

		sql1 = "Delete from AUTHOR where PNumber='"+pnumber+"'";
		statement.executeUpdate(sql1);
	
		if (index_old!=null && index_old.length()>0) { 
			String wd;
			Vector v;
			v=cutter2(index_old,'"');
			int str=0;
			while (str<v.size()) {
				wd=(String)v.elementAt(str);
					if(wd.length()!=0){
						vector_sub.addElement(wd);
					}
				str++;
			}
			index_old_cut=cutt(index_old,'"');
		} 

		if (index_old_cut!=null && index_old_cut.length()>0) { 
			String wd;
			int str=0;
			Vector vix=new Vector();
			String tmpo,tmpt;
			int tloop;
			Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
			if (con!=null) {
				Vector stw=op1.SSW(con);
				while((wd=op1.GWord(index_old_cut,str))!=null) {	 //wd is text not porter
					str=op1.getNxt();
					if (op1.ChkSW(wd,stw)==false) { 
						tmpo=op1.Porter(wd);
						tloop=0;
						while(tloop<vix.size()){
							tmpt=(String)vix.elementAt(tloop);
							if (tmpt.compareTo(tmpo)==0) {
								tloop=vix.size()+1;
							}
							tloop++;
						}
						if ((tloop==0) || (tloop==vix.size())) {
							vix.addElement(tmpo);
						}
						//out.println(op1.Porter(wd)+" ");
					}
				} 
				tloop=0;
				while(tloop<vix.size()) {
					tmpo=(String)vix.elementAt(tloop);
					vector_sub.addElement(tmpo);
					tloop++;
				}
			}
			String error=op1.Close(con);
			if (error!=null) {%>
				<%="Error : "+error%>
			<%}
		}	
		//out.println(vector_sub.toString());
		sql1 = "Delete from PAPERKEY where PNumber='"+pnumber+"'";
		statement.executeUpdate(sql1);
		statement.close();

		for(int i=0;i<vector_sub.size();i++){
		String keyword=(String)vector_sub.elementAt(i);
		//out.println(keyword+"x");
		Statement statement2 = dbconn.createStatement();
		String sql_join ="Select index1,index2,Relate from Relation where Index1='"+keyword+"' or Index2='"+keyword+"'";	
		ResultSet resultset_join = statement2.executeQuery(sql_join);
		while(resultset_join.next()){
			String index_relate=resultset_join.getString("Index1");
			if (index_relate.equals(keyword)){			//กำหนด คู่ความสัมพันธ์ ใน ตาราง Retation
				index_relate=resultset_join.getString("Index2");
			}
			//out.println(index_relate+"y");
			Statement statement3 = dbconn.createStatement();
			String sql_se_keyw="select count(*) from Paperkey where Keyword='"+keyword+"'";
			ResultSet resultset_co_keyw=statement3.executeQuery(sql_se_keyw);
			int co_keyword=0;
			if (resultset_co_keyw.next()){
				co_keyword=Integer.parseInt(resultset_co_keyw.getString(1));
				//out.println(co_keyword);
			}
			resultset_co_keyw.close();
			statement3.close();
			
			statement3 = dbconn.createStatement();
			String sql_se_index="select count(*) from Paperkey where Keyword='"+index_relate+"'";
			ResultSet resultset_co_index=statement3.executeQuery(sql_se_index);
			int co_index=0;
			if (resultset_co_index.next()){
				co_index=Integer.parseInt(resultset_co_index.getString(1));
				//out.println(co_index);
			}
			resultset_co_index.close();
			statement3.close();

			double co_intersec=0;
			statement3 = dbconn.createStatement();
			String sql_se_intersec="select count(*) from Paperkey where Keyword='"+keyword+"'";
			sql_se_intersec=sql_se_intersec+"or Keyword='"+index_relate+"'";
			sql_se_intersec=sql_se_intersec+"group by PNumber having count(*)=2";
			ResultSet resultset_co_intersec=statement3.executeQuery(sql_se_intersec);
			while(resultset_co_intersec.next()){
				co_intersec++;
			}
			resultset_co_intersec.close();
			statement3.close();
			
			//out.println(co_intersec);
			double culcu=0;
			if((co_keyword+co_index-co_intersec)!=0){
				culcu=(co_intersec/(co_keyword+co_index-co_intersec));
			}
			String query_update = "UPDATE RELATION SET Relate= "+culcu+" WHERE (Index1='"+keyword+"'" ;
			query_update = query_update+" and Index2='"+index_relate+"') or ";
			query_update = query_update+" (Index1='"+index_relate+"' and Index2='"+keyword+"')";
			statement3 = dbconn.createStatement();
			statement3.executeUpdate(query_update);
			//out.println(query_update);
			
		
		}
		resultset_join.close();
		statement2.close();
	    }

		int num_del=0;
		statement = dbconn.createStatement();
		sql1="Select count(*) from Relation where Relate=0";
		ResultSet resultset_del = statement.executeQuery(sql1);
		if(resultset_del.next()){
			num_del=resultset_del.getInt(1);
		}
		resultset_del.close();
		if(num_del>0){
			sql1="Delete from Relation where Relate=0";
			statement.executeUpdate(sql1);
		}	
		statement.close();
		

		dbconn.close();
	}
	catch ( ClassNotFoundException cnfex ) 
	{
            // ดักจับกรณีไม่สามารถเรียกใช้งานคลาสสำหรับติดต่อฐานข้อมูลได้
            //cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
	   err=msgout;
	}
	catch ( SQLException sqlex ) 
	{// ดักจับกรณ๊คำสั่ง SQL ผิดพลาด
            //sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   err=msgout;
      }
      catch ( Exception excp ) 
      {    // ดักจับกรณ๊ทั่วไป
           // excp.printStackTrace();
            msgout = excp.toString() ;
	    err=msgout;
      }
}
%>
<% if (err!=null && err.length()>0) {
		out.println(err);
} else {%>
<%	} %>
<script language="JavaScript">
	opener.location=opener.location.href;
	close();	
</script>
</BODY>
</HTML>
