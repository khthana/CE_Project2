<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> calcutate relation table </TITLE>

</HEAD>

<BODY BGCOLOR="#FFFFFF">
<%@ page language="java" errorPage="error.jsp" %>
<%@  page import="java.sql.*"  %>
<%
	Connection dbconn;
	String msgout = "";
      // Set up database connection
      try 
      {     // ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
            String url = "jdbc:odbc:FUZZY_TEST";
	    Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
            dbconn = DriverManager.getConnection( url );
	    
	    Statement statement = dbconn.createStatement();
	    String p_number="4";  //choose pNumber new
	    
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
			out.println(keyword1+keyword2+count);
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
			
			
				int resultupdate=0;
				String query_update = "INSERT INTO Relation(Index1,Index2,Relate)  VALUES('"+keyword1+"','"+keyword2+"', '"+culcu+"')";
				resultupdate = statement4.executeUpdate(query_update);
			}
		}
	    }
	
	    //String sql_delete="Delete from Relation where Relate=0";
	    //statement.executeUpdate(sql_delete);
%>


<%//		msgout = "Connection successful" ;
	
	dbconn.close();
      }
      catch ( ClassNotFoundException cnfex ) 
      {
            // ดักจับกรณีไม่สามารถเรียกใช้งานคลาสสำหรับติดต่อฐานข้อมูลได้
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
      }
      catch ( SQLException sqlex ) 
      {    // ดักจับกรณ๊คำสั่ง SQL ผิดพลาด
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(sqlex);
      }
      catch ( Exception excp ) 
      {    // ดักจับกรณ๊ทั่วไป
            excp.printStackTrace();
            msgout = excp.toString() ;
      }

%>
</BODY>
</HTML>
