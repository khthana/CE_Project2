<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Add Paper </TITLE>
<%
	String pass_authen= (String)session.getValue("pass_authen");
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("authen.jsp");
	}
%>
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
	String mst=new String();
	String title=new String();
	String author=new String();
	String description=new String();
	String mstcut=new String();
	String location=new String();
	String size=new String();
	String err=new String();
	java.util.Enumeration e2 = mySmartUpload.getRequest().getParameterNames();
	while (e2.hasMoreElements()) {

		String key = (String)e2.nextElement();
		if(key.equals("title")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			title = value[0];
		}
		if(key.equals("author")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			author = value[0];
		}
		if(key.equals("description")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			description = value[0];
		}
		if(key.equals("index")){
			String[] value=mySmartUpload.getRequest().getParameterValues(key);
			mst = value[0];
		}
	}
		
		// Retreive the current file
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	
		// Save it only if this file exists
		if((title!=null && title.length()>0)&&(author!=null && author.length()>0)&&(mst!=null && mst.length()>0)){  //ต้องมี ชื่อ ผู้แต่ index term 
			if (!myFile.isMissing()) {
				if(myFile.getFileExt().equals("pdf")){
					myFile.saveAs("/upload/" + myFile.getFileName());
					location=myFile.getFileName();
					Integer tmp =new Integer(myFile.getSize());
					size=tmp.toString();
				}else{
					err="file type error";
				}
			}else{
				err="file missing";
			}
		}else{
			err="input not complete";
		}
	//out.println("title : "+title+"<br>");
	//out.println("author : "+author+"<br>");
	//out.println("description : "+description+"<br>");
	//out.println("index : "+mst+"<br>");
	//out.println("location : "+location+"<br>");
	//out.println("size : "+size+"<br>");
	//out.println("error : "+err+"<br>");

if((err==null)||(err.length()==0)){	

	Connection dbconn;
	String msgout = "";
      // Set up database connection
	try {// ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
		String url = "jdbc:odbc:FUZZYIR";
		Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
		dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
		Statement statement = dbconn.createStatement();
		int pnumber= 0;
		String sql1="select CountPaper from CPAPER";
		ResultSet  resultset_sql1 = statement.executeQuery(sql1);
		while(resultset_sql1.next()){
			pnumber=resultset_sql1.getInt("CountPaper");
			pnumber++;
			
		}
		
		sql1 = "UPDATE CPAPER SET CountPaper="+pnumber;
		statement = dbconn.createStatement();
		statement.executeUpdate(sql1);
		
		Integer tmp_int =new Integer(pnumber);
		String p_number=tmp_int.toString();
		
		//out.println(p_number+"abce");
		int resultupdate=0;
		sql1 = "INSERT INTO PAPER(PNumber,PName,Description,IndexRef,Location,FileSize)  ";
		sql1=sql1+"VALUES('"+p_number+"','"+title+"', '"+description+"','"+mst+"','"+location+"','"+size+"')";
		statement = dbconn.createStatement();
		resultupdate = statement.executeUpdate(sql1);
		
		if (mst!=null && mst.length()>0) { 
			String wd;
			Vector v;
			v=cutter2(mst,'"');
			int str=0;
			while (str<v.size()) {
				wd=(String)v.elementAt(str);
					if(wd.length()!=0){
						sql1 = "INSERT INTO PAPERKEY(Keyword,PNumber)  VALUES('"+wd+"','"+p_number+"')";
						statement = dbconn.createStatement();
						resultupdate = statement.executeUpdate(sql1);
					}
				str++;
			}
			mstcut=cutt(mst,'"');
		} 

		
		if (mstcut!=null && mstcut.length()>0) { 
			String wd;
			str=0;
			Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
			if (con!=null) {
				Vector stw=op1.SSW(con);
				Vector vix=new Vector();
				String tmp1,tmp2;
				int loop=0;
				while((wd=op1.GWord(mstcut,str))!=null) {	 //wd is text not porter
					str=op1.getNxt();
					if (op1.ChkSW(wd,stw)==false) { 
						tmp1=op1.Porter(wd);
						loop=0;
						while(loop<vix.size()) {
							tmp2=(String)vix.elementAt(loop);
							if (tmp1.compareTo(tmp2)==0) {
								loop=vix.size()+1;
							}
							loop++;
						}
						if (loop>vix.size() || loop==0) {
							vix.addElement(new String(tmp1));
						}
						//out.println(op1.Porter(wd)+" ");

					}
				}
					
				loop=0;
				while(loop<vix.size()) {
					sql1 = "INSERT INTO PAPERKEY(Keyword,PNumber)  VALUES('"+(String)vix.elementAt(loop)+"','"+p_number+"')";
					statement = dbconn.createStatement();
					resultupdate = statement.executeUpdate(sql1);
					loop++;
				}
			}
			String error=op1.Close(con);
			if (error!=null) {%>
				<%="Error : "+error%>
			<%}
		}
	
		if (author!=null && author.length()>0){
			Vector v;
			v=cutter(author,',');
			int str=0;
			while (str<v.size()) {
				
				wd=(String)v.elementAt(str);
					if(wd.length()!=0){
						sql1 = "INSERT INTO AUTHOR(PNumber,AuthorName)  VALUES('"+p_number+"','"+wd+"')";
						statement = dbconn.createStatement();
						resultupdate = statement.executeUpdate(sql1);
						//out.println(wd+"qqqqq<br>");
					}
				str++;
			}
		} 

	    String sql_key_new ="Select Keyword from Paperkey where PNumber='"+p_number+"'" ;
	    ResultSet  resultset_keynew = statement.executeQuery(sql_key_new);
	    while (resultset_keynew.next()){
		String keyword=resultset_keynew.getString("Keyword");
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
			
			String sql_se_index="select count(*) from Paperkey where Keyword='"+index_relate+"'";
			ResultSet resultset_co_index=statement3.executeQuery(sql_se_index);
			int co_index=0;
			if (resultset_co_index.next()){
				co_index=Integer.parseInt(resultset_co_index.getString(1));
				//out.println(co_index);
			}
			
			double co_intersec=0;
			
			String sql_se_intersec="select count(*) from Paperkey where Keyword='"+keyword+"'";
			sql_se_intersec=sql_se_intersec+"or Keyword='"+index_relate+"'";
			sql_se_intersec=sql_se_intersec+"group by PNumber having count(*)=2";
			ResultSet resultset_co_intersec=statement3.executeQuery(sql_se_intersec);
			while(resultset_co_intersec.next()){
				co_intersec++;
			}
			//out.println(co_intersec);
			double culcu=(co_intersec/(co_keyword+co_index-co_intersec));
			
			
			String query_update = "UPDATE RELATION SET Relate= "+culcu+" WHERE (Index1='"+keyword+"'" ;
			query_update = query_update+" and Index2='"+index_relate+"') or ";
			query_update = query_update+" (Index1='"+index_relate+"' and Index2='"+keyword+"')";
			statement3 = dbconn.createStatement();
			statement3.executeUpdate(query_update);
			//out.println(query_update);
			
		
		}
		
	    }
	 
	    sql_key_new ="Select Keyword from Paperkey where PNumber='"+p_number+"'" ;
	    resultset_keynew = statement.executeQuery(sql_key_new);
	    while(resultset_keynew.next()){
		String keyword1=resultset_keynew.getString("Keyword");
		Statement statement2 = dbconn.createStatement();
		String sql_key2 ="Select Keyword from Paperkey where PNumber='"+p_number+"' and Keyword <> '"+keyword1+"'";	
		ResultSet resultset_key2 = statement2.executeQuery(sql_key2);
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
			//out.println(keyword1+keyword2+count);
			if (count==0){     //ยังไม่เคยมีข้อมูลความสัมพันธ์มาก่อน
				Statement statement4=dbconn.createStatement();
				String sql_se_keyw="select count(*) from Paperkey where Keyword='"+keyword1+"'";
				ResultSet resultset_co_keyw=statement4.executeQuery(sql_se_keyw);
				int co_keyword=0;
				if (resultset_co_keyw.next()){
					co_keyword=Integer.parseInt(resultset_co_keyw.getString(1));
					//out.println(co_keyword);
				}
			
				String sql_se_index="select count(*) from Paperkey where Keyword='"+keyword2+"'";
				ResultSet resultset_co_index=statement4.executeQuery(sql_se_index);
				int co_index=0;
				if (resultset_co_index.next()){
					co_index=Integer.parseInt(resultset_co_index.getString(1));
					//out.println(co_index);
				}
			
				double co_intersec=0;
			
				String sql_se_intersec="select count(*) from Paperkey where Keyword='"+keyword1+"'";
				sql_se_intersec=sql_se_intersec+"or Keyword='"+keyword2+"'";
				sql_se_intersec=sql_se_intersec+"group by PNumber having count(*)=2";
				ResultSet resultset_co_intersec=statement4.executeQuery(sql_se_intersec);
				while(resultset_co_intersec.next()){
					co_intersec++;
				}
				//out.println(co_intersec);
				double culcu=(co_intersec/(co_keyword+co_index-co_intersec));
			
			
				resultupdate=0;
				String query_update = "INSERT INTO Relation(Index1,Index2,Relate)  VALUES('"+keyword1+"','"+keyword2+"', '"+culcu+"')";
				resultupdate = statement4.executeUpdate(query_update);
			}
		}
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
	    out.println(msgout);
      }
	//response.sendRedirect("add_page.jsp");
	}else{
	out.println("error : "+err);//ไม่สามารถใส่ข้อมูลลงฐานข้อมูลได้ เพราะมี error ของข้อมูลบางประการ
}
	//response.sendRedirect("add_page.jsp");
%>
</BODY>
</HTML>
