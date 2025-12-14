<html>
<head>
<title> FUZZZZZZY SEARCH </title>
<Style>
a:link { Color:blue; TEXT-DECORATION: none }
a:visited { Color:blue; TEXT-DECORATION: none } 
a:hover { Color:red; TEXT-DECORATION: none }
a:active { TEXT-DECORATION: none }

</Style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%!
	public class Vector_segma{
		Vector vector_fuzzy_segma = new Vector();
		Vector vector_fuzzy_co_segma = new Vector();
		int num=0;

		public void putVectorElement(String tmp1,Double tmp2){
			vector_fuzzy_segma.addElement(tmp1);
			vector_fuzzy_co_segma.addElement(tmp2);
			num=num+1;
		}
		
		public void setVectorElementAtCo(Double tmp1,int i){
			vector_fuzzy_co_segma.setElementAt(tmp1,i);
		}
		
		public int getVectorSize(){
			return num;
		}
		
		public String getVectorSegma(int i){
			return (String)vector_fuzzy_segma.elementAt(i);
		}
		
		public Double getVectorSegmaCo(int i){
			return (Double)vector_fuzzy_co_segma.elementAt(i);
		}
		
		public void removeVector(int i){
			vector_fuzzy_segma.removeElementAt(i);
			vector_fuzzy_co_segma.removeElementAt(i);
			num=num-1;
		}
		
		public void vectorQuicksort(){
			recursive_quick_sort(0,num-1);
		}
		private void recursive_quick_sort(int low,int high){
			int pivot_position;
			if(low<high){
				pivot_position = partition(low,high);
				recursive_quick_sort(low,pivot_position-1);
				recursive_quick_sort(pivot_position+1,high);
			}
		}

		private int partition(int low,int high){
			Double pivot;
			int i,last_small;
			swap(low,(low+high)/2);
			pivot = (Double)vector_fuzzy_co_segma.elementAt(low);
			last_small = low;
			for (i=low+1;i<=high;i++){
				Double tmp=(Double)vector_fuzzy_co_segma.elementAt(i);
				if(tmp.doubleValue()>pivot.doubleValue()){
					last_small = last_small +1;
					swap(last_small,i);
				}
			}
			swap(low,last_small);
			return last_small;
		}
		private void swap(int low,int high){
			Double tmp1;
			String tmp2;
			tmp1 = (Double)vector_fuzzy_co_segma.elementAt(low);
			tmp2 = (String)vector_fuzzy_segma.elementAt(low);
			vector_fuzzy_co_segma.setElementAt((Double)vector_fuzzy_co_segma.elementAt(high),low);
			vector_fuzzy_segma.setElementAt((String)vector_fuzzy_segma.elementAt(high),low);
			vector_fuzzy_co_segma.setElementAt(tmp1,high);
			vector_fuzzy_segma.setElementAt(tmp2,high);
		}
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
//function
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

	public String rmd(String str){
		for (int i=0;i<str.length();i++){
			if (str.charAt(i)=='\"'){
				if (i<str.length()) {
					str=str.substring(0,i)+"&quot"+str.substring(i+1,str.length());
				}
				else {
					str=str.substring(0,i)+"&quot";
				}
			}
		}
		return str;
	}
%>
<SCRIPT LANGUAGE="JavaScript">
	function cl(tx) {
		tx.value="";
		tx.select();
	}
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" background="pic/background.jpg">
<%@ page language="java" errorPage="error.jsp"  import="Text.*,java.sql.*,java.util.*"%> 
<jsp:useBean id="op1" class="Text.TextOp" /> <%

	String from_page = request.getParameter("from_page");
	//out.println(from_page); 
	if(from_page==null){
		from_page = "normal_page";
	}
	String mst_and=new String();
	String operation=new String();
	String mst_or=new String();
	String mst_not=new String();
	if (from_page.equals("adv_search")){ 
		mst_and = request.getParameter("st_and");
		operation = request.getParameter("operation");
		mst_or = request.getParameter("st_or");
		mst_not = request.getParameter("st_not");
	}else{
		mst_and = request.getParameter("str");
	}
	if(mst_and!=null&&mst_and.length()>0){
		mst_and=rmd(mst_and);
	}
	Vector vector_query = new Vector();

	Vector vector_query_and = new Vector();		//»ÃÐ¡ÒÈãªé object vector
	Vector vector_query_or = new Vector();
	Vector vector_query_not = new Vector();
	
	Vector vector_fuzzy_and = new Vector();
	Vector vector_fuzzy_co_and = new Vector();
	Vector vector_fuzzy_amount_and = new Vector();

	
	Vector vector_fuzzy_or = new Vector();
	Vector vector_fuzzy_co_or = new Vector();
	Vector vector_fuzzy_amount_or = new Vector();

	
	Vector vector_fuzzy_not = new Vector();
	Vector vector_fuzzy_co_not = new Vector();
	Vector vector_fuzzy_amount_not = new Vector();

	Vector_segma segma = new Vector_segma();
%> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="17%"><img src="pic/logo_min.jpg" width="163" height="101"></td>
          <td width="83%">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#3333FF"> 
                <td>
                  <div align="center"><font color="#FFFF33"><b>FUZZZZZZY SEARCH</b></font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p><font size="-1">Please Enter Text</font><br>
</p>
<form name="form1" method="get" action="search.jsp">
  <div align="center">
  	<% if (mst_and==null && mst_and.length()==0) {%>
    <input type="text" name="str" size="75" maxlength="100">
	<% }else {%>
		<%if (from_page.equals("normal_search")){//á¡éãËéË¹èÍÂÁÑ¹ÁÕà¤Ã×èÍ§ËÁÒÂ¤Ó¾Ù´àÅÂÁÒäÁè¤Ãº
		%>
			<input type="text" name="str" size="75" maxlength="100" value="<%=mst_and%>">
    <%}else{%> 
    <input type="text" name="str" size="75" maxlength="100" >
    <%}%> <% } %> <a href="adv_search.jsp"><font size="-2">Advance search</font> 
    </a> 
    <input type="hidden" name="from_page" value="normal_search">
    <br>
    <input type="submit" name="Submit" value="Submit">
    <input type="button" name="Reset" value="Reset" onClick="cl((this.form).str)">
  </div>
</form>
<br>
<b><br>
<br>
<%
	boolean search=false;
	if (mst_and!=null && mst_and.length()>0) { 
		search=true;
		String wd2;
		Vector v;
		v=cutter2(mst_and,'"');
		int str2=0;
		while (str2<v.size()) {
			wd2=(String)v.elementAt(str2);
			if(wd2.length()!=0){
				vector_query_and.addElement(wd2);
				vector_query.addElement(wd2);
			}
			str2++;
		}
		String mst_temp = new String();
		mst_temp=cutt(mst_and,'"');
	
%> <%	if (mst_temp!=null && mst_temp.length()>0) { %> <%		String wd;
		int str=0;
%> <%
		
		Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
		if (con!=null) {
			 while((wd=op1.GWord(mst_temp,str))!=null) {	 //wd is text not porter
				vector_query.addElement(wd);
				str=op1.getNxt();
				if (op1.SSW(wd,con)==0) { 
					vector_query_and.addElement(op1.Porter(wd));
				%> <%
				}
			} 
		}
		String error=op1.Close(con);
		if (error!=null) {%> <%="Error : "+error%> <%}%> <%} %> <%}%> 
		<%	if (mst_or!=null && mst_or.length()>0) { 
		search=true;
		String wd2;
		Vector v;
		v=cutter2(mst_or,'"');
		int str2=0;
		while (str2<v.size()) {
			wd2=(String)v.elementAt(str2);
			if(wd2.length()!=0){
				vector_query_or.addElement(wd2);
				vector_query.addElement(wd2);
			}
			str2++;
		}
		String mst_temp = new String();
		mst_temp=cutt(mst_or,'"');
	
%> <%	if (mst_temp!=null && mst_temp.length()>0) { %> <%		String wd;
		int str=0;
%> <%
		
		Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
		if (con!=null) {
			 while((wd=op1.GWord(mst_temp,str))!=null) {	 //wd is text not porter
				vector_query.addElement(wd);
				str=op1.getNxt();
				if (op1.SSW(wd,con)==0) { 
					vector_query_or.addElement(op1.Porter(wd));
				%> <%
				}
			} 
		}
		String error=op1.Close(con);
		if (error!=null) {%> <%="Error : "+error%> <%}%> <%}%> <%} %> 
		<%	if (mst_not!=null && mst_not.length()>0) { 
		search=true;
		String wd2;
		Vector v;
		v=cutter2(mst_not,'"');
		int str2=0;
		while (str2<v.size()) {
			wd2=(String)v.elementAt(str2);
			if(wd2.length()!=0){
				vector_query_not.addElement(wd2);
				vector_query.addElement(wd2);
			}
			str2++;
		}
		String mst_temp = new String();
		mst_temp=cutt(mst_not,'"');
	
%> <%	if (mst_temp!=null && mst_temp.length()>0) { %> <%		String wd;
		int str=0;
%> <%
		
		Connection con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir");
		if (con!=null) {
			 while((wd=op1.GWord(mst_temp,str))!=null) {	 //wd is text not porter
				vector_query.addElement(wd);
				str=op1.getNxt();
				if (op1.SSW(wd,con)==0) { 
					vector_query_not.addElement(op1.Porter(wd));
				%> <%
				}
			} 
		}
		String error=op1.Close(con);
		if (error!=null) {%> <%="Error : "+error%> <%}%> <%} %> <%}%> <%
	//out.println("vector_query"+vector_query.toString());
%> </b> <%
	java.util.Date x=new java.util.Date();

	Connection dbconn;
	String msgout = "";
	// Set up database connection
	try 
	{     // ÊèÇ¹µÔ´µèÍ¡Ñº°ÒÒ¹¢éÍÁÙÅ â´Â¡ÒÃãªé JDBC-ODBC
		String url = "jdbc:odbc:FUZZYIR";
		Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
		dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
		Statement statement1 = dbconn.createStatement();
		int query_amount_and = vector_query_and.size();
//**************** AND *****************************
	if(vector_query_and.size()!=0){
		Vector vector_relate_and = new Vector();
		Vector vector_relate_co_and = new Vector();
		Vector vector_relate_query_and = new Vector();
		for (int i=0;i<vector_query_and.size();i++){
			//out.println(vector_query.elementAt(i)+"is a value : "+i);
			String query=(String)vector_query_and.elementAt(i);
			String sql1="select PNumber from Paperkey where keyword='"+query+"'";
			ResultSet  resultset_sql1 = statement1.executeQuery(sql1);		//select extract keyword 
			while(resultset_sql1.next()){
				vector_relate_and.addElement(resultset_sql1.getString("PNumber"));
				vector_relate_query_and.addElement(query);
				vector_relate_co_and.addElement(new Double(0));
			}
			sql1="select * from Relation where Index1='"+query+"' or Index2='"+query+"'";
			resultset_sql1 = statement1.executeQuery(sql1);
			while(resultset_sql1.next()){
				String st_relate=resultset_sql1.getString("Index1");
				if(st_relate.equals(query)){
					st_relate=resultset_sql1.getString("Index2");
				}
				//out.println(st_relate);
				double co_relate=resultset_sql1.getDouble("Relate");
				//out.println(co_relate);
				String sql2="select PNumber from Paperkey where Keyword='"+st_relate+"'";
				Statement statement2 = dbconn.createStatement();
				ResultSet resultset_sql2 = statement2.executeQuery(sql2);
				//out.println(st_relate);
				while(resultset_sql2.next()){
					int boo=1;
					int j=0;
					String p_num=resultset_sql2.getString("PNumber");
					//out.println(p_num);
					while((boo==1)&&(j<vector_relate_and.size())){
						if((vector_relate_and.elementAt(j).equals(p_num)) && (vector_relate_query_and.elementAt(j).equals(query))){		//ÁÕ¢éÍÁÙÅÍÂÙèáÅéÇ
							boo=0;
							Double tmp=(Double)vector_relate_co_and.elementAt(j);
							double temp= tmp.doubleValue() * (1-co_relate);
							vector_relate_co_and.setElementAt(new Double (temp),j);
							//out.println(vector_relate_co_and.toString()+query+"<br>");
						}
						j++;
					}
					if (boo==1){		//ÂÑ§äÁèÁÕ¢éÍÁÙÅ
						vector_relate_and.addElement(p_num);
						vector_relate_query_and.addElement(query);
						double temp=(1-co_relate);
						vector_relate_co_and.addElement(new Double(temp));
						//out.println(vector_relate_co_and.toString()+query+"<br>");
					}
				}
			}
		}
		
		for(int i=0;i<vector_relate_co_and.size();i++){
			Double tmp=(Double)vector_relate_co_and.elementAt(i);
			double temp= (1-tmp.doubleValue());
			vector_relate_co_and.setElementAt(new Double (temp),i);
			//out.println(vector_relate_co.toString()+query+"<br>");
		}

		for(int i=0;i<vector_relate_and.size();i++){
			int boo=1;
			int j = 0;
			String p_num=(String)vector_relate_and.elementAt(i);
			Double relate_co_temp = (Double)vector_relate_co_and.elementAt(i);
			//out.println("p_num"+p_num);
			while((boo==1)&&(j<vector_fuzzy_and.size())){
				if(vector_fuzzy_and.elementAt(j).equals(p_num)){
					boo=0;
					Double tmp = (Double)vector_fuzzy_co_and.elementAt(j);
					double temp = (tmp.doubleValue()*relate_co_temp.doubleValue());
					vector_fuzzy_co_and.setElementAt(new Double (temp),j);
					Integer co = (Integer)vector_fuzzy_amount_and.elementAt(j);
					int co2 = co.intValue()+1;
					vector_fuzzy_amount_and.setElementAt(new Integer(co2),j);
				}
				j++;
			}
			if(boo==1){
				vector_fuzzy_and.addElement(p_num);
				vector_fuzzy_co_and.addElement(relate_co_temp);
				vector_fuzzy_amount_and.addElement(new Integer(1));
			}

		}
		if(operation.length()!=0){
			for(int i = 0;i<vector_fuzzy_and.size();i++){
				Integer tmp = (Integer)vector_fuzzy_amount_and.elementAt(i);
				if(tmp.intValue()!=query_amount_and){
					vector_fuzzy_and.removeElementAt(i);
					vector_fuzzy_co_and.removeElementAt(i);
					vector_fuzzy_amount_and.removeElementAt(i);
					i--;
				}
			}
		}
	}
//************** END AND ******************************/		
		
		
//*********** OR ***************************************
	if(vector_query_or.size()!=0){
		Vector vector_relate_or = new Vector();
		Vector vector_relate_co_or = new Vector();
		Vector vector_relate_query_or = new Vector();
		for (int i=0;i<vector_query_or.size();i++){
			//out.println(vector_query.elementAt(i)+"is a value : "+i);
			String query=(String)vector_query_or.elementAt(i);
			String sql1="select PNumber from Paperkey where keyword='"+query+"'";
			ResultSet  resultset_sql1 = statement1.executeQuery(sql1);		//select extract keyword 
			while(resultset_sql1.next()){
				vector_relate_or.addElement(resultset_sql1.getString("PNumber"));
				vector_relate_query_or.addElement(query);
				vector_relate_co_or.addElement(new Double(0));
			}
			sql1="select * from Relation where Index1='"+query+"' or Index2='"+query+"'";
			resultset_sql1 = statement1.executeQuery(sql1);
			while(resultset_sql1.next()){
				String st_relate=resultset_sql1.getString("Index1");
				if(st_relate.equals(query)){
					st_relate=resultset_sql1.getString("Index2");
				}
				//out.println(st_relate);
				double co_relate=resultset_sql1.getDouble("Relate");
				//out.println(co_relate);
				String sql2="select PNumber from Paperkey where Keyword='"+st_relate+"'";
				Statement statement2 = dbconn.createStatement();
				ResultSet resultset_sql2 = statement2.executeQuery(sql2);
				//out.println(st_relate);
				while(resultset_sql2.next()){
					int boo=1;
					int j=0;
					String p_num=resultset_sql2.getString("PNumber");
					//out.println(p_num);
					while((boo==1)&&(j<vector_relate_or.size())){
						if((vector_relate_or.elementAt(j).equals(p_num)) && (vector_relate_query_or.elementAt(j).equals(query))){		//ÁÕ¢éÍÁÙÅÍÂÙèáÅéÇ
							boo=0;
							Double tmp=(Double)vector_relate_co_or.elementAt(j);
							double temp= tmp.doubleValue() * (1-co_relate);
							vector_relate_co_or.setElementAt(new Double (temp),j);
							//out.println(vector_relate_co_or.toString()+query+"<br>");
						}
						j++;
					}
					if (boo==1){		//ÂÑ§äÁèÁÕ¢éÍÁÙÅ
						vector_relate_or.addElement(p_num);
						vector_relate_query_or.addElement(query);
						double temp=(1-co_relate);
						vector_relate_co_or.addElement(new Double(temp));
						//out.println(vector_relate_co_or.toString()+query+"<br>");
					}
				}
			}
		}
		
		for(int i=0;i<vector_relate_co_or.size();i++){
			Double tmp=(Double)vector_relate_co_or.elementAt(i);
			double temp= (1-tmp.doubleValue());
			vector_relate_co_or.setElementAt(new Double (temp),i);
			//out.println(vector_relate_co.toString()+query+"<br>");
		}
		
		for(int i=0;i<vector_relate_or.size();i++){
			int boo=1;
			int j = 0;
			String p_num=(String)vector_relate_or.elementAt(i);
			Double relate_co_temp = (Double)vector_relate_co_or.elementAt(i);
			//out.println("p_num"+p_num);
			while((boo==1)&&(j<vector_fuzzy_or.size())){
				if(vector_fuzzy_or.elementAt(j).equals(p_num)){
					boo=0;
					Double tmp = (Double)vector_fuzzy_co_or.elementAt(j);
					double temp = (tmp.doubleValue()*(1-relate_co_temp.doubleValue()));
					vector_fuzzy_co_or.setElementAt(new Double (temp),j);
					Integer co = (Integer)vector_fuzzy_amount_or.elementAt(j);
					int co2 = co.intValue()+1;
					vector_fuzzy_amount_or.setElementAt(new Integer(co2),j);
				}
				j++;
			}
			if(boo==1){
				vector_fuzzy_or.addElement(p_num);
				double tmp_or=1-relate_co_temp.doubleValue();
				vector_fuzzy_co_or.addElement(new Double(tmp_or));
				vector_fuzzy_amount_or.addElement(new Integer(1));
			}

		}

		for(int i=0;i<vector_fuzzy_co_or.size();i++){
			Double tmp=(Double)vector_fuzzy_co_or.elementAt(i);
			double temp= (1-tmp.doubleValue());
			vector_fuzzy_co_or.setElementAt(new Double (temp),i);
			//out.println(vector_relate_co_or.toString()+query+"<br>");
		}
	}
//*********** END OR *********************************/

//********** NOT ***********************************
	if(vector_query_not.size()!=0){
		Vector vector_relate_not = new Vector();
		Vector vector_relate_co_not = new Vector();
		Vector vector_relate_query_not = new Vector();
		for (int i=0;i<vector_query_not.size();i++){
			//out.println(vector_query.elementAt(i)+"is a value : "+i);
			String query=(String)vector_query_not.elementAt(i);
			String sql1="select PNumber from Paperkey where keyword='"+query+"'";
			ResultSet  resultset_sql1 = statement1.executeQuery(sql1);		//select extract keyword 
			while(resultset_sql1.next()){
				vector_relate_not.addElement(resultset_sql1.getString("PNumber"));
				vector_relate_query_not.addElement(query);
				vector_relate_co_not.addElement(new Double(0));
			}
			sql1="select * from Relation where Index1='"+query+"' or Index2='"+query+"'";
			resultset_sql1 = statement1.executeQuery(sql1);
			while(resultset_sql1.next()){
				String st_relate=resultset_sql1.getString("Index1");
				if(st_relate.equals(query)){
					st_relate=resultset_sql1.getString("Index2");
				}
				//out.println(st_relate);
				double co_relate=resultset_sql1.getDouble("Relate");
				//out.println(co_relate);
				String sql2="select PNumber from Paperkey where Keyword='"+st_relate+"'";
				Statement statement2 = dbconn.createStatement();
				ResultSet resultset_sql2 = statement2.executeQuery(sql2);
				//out.println(st_relate);
				while(resultset_sql2.next()){
					int boo=1;
					int j=0;
					String p_num=resultset_sql2.getString("PNumber");
					//out.println(p_num);
					while((boo==1)&&(j<vector_relate_not.size())){
						if((vector_relate_not.elementAt(j).equals(p_num)) && (vector_relate_query_not.elementAt(j).equals(query))){		//ÁÕ¢éÍÁÙÅÍÂÙèáÅéÇ
							boo=0;
							Double tmp=(Double)vector_relate_co_not.elementAt(j);
							double temp= tmp.doubleValue() * (1-co_relate);
							vector_relate_co_not.setElementAt(new Double (temp),j);
							//out.println(vector_relate_co_not.toString()+query+"<br>");
						}
						j++;
					}
					if (boo==1){		//ÂÑ§äÁèÁÕ¢éÍÁÙÅ
						vector_relate_not.addElement(p_num);
						vector_relate_query_not.addElement(query);
						double temp=(1-co_relate);
						vector_relate_co_not.addElement(new Double(temp));
						//out.println(vector_relate_co_not.toString()+query+"<br>");
					}
				}
			}
		}
		
		for(int i=0;i<vector_relate_co_not.size();i++){
			Double tmp=(Double)vector_relate_co_not.elementAt(i);
			double temp= (1-tmp.doubleValue());
			vector_relate_co_not.setElementAt(new Double (temp),i);
			//out.println(vector_relate_co.toString()+query+"<br>");
		}
		
		for(int i=0;i<vector_relate_not.size();i++){
			int boo=1;
			int j = 0;
			String p_num=(String)vector_relate_not.elementAt(i);
			Double relate_co_temp = (Double)vector_relate_co_not.elementAt(i);
			//out.println("p_num"+p_num);
			while((boo==1)&&(j<vector_fuzzy_not.size())){
				if(vector_fuzzy_not.elementAt(j).equals(p_num)){
					boo=0;
					Double tmp = (Double)vector_fuzzy_co_not.elementAt(j);
					double temp = (tmp.doubleValue()*(1-relate_co_temp.doubleValue()));
					vector_fuzzy_co_not.setElementAt(new Double (temp),j);
					//Integer co = (Integer)vector_fuzzy_amount_not.elementAt(j);
					//int co2 = co.intValue()+1;
					//vector_fuzzy_amount_not.setElementAt(new Integer(co2),j);
				}
				j++;
			}
			if(boo==1){
				vector_fuzzy_not.addElement(p_num);
				double tmp_or=1-relate_co_temp.doubleValue();
				vector_fuzzy_co_not.addElement(new Double(tmp_or));
				//vector_fuzzy_amount_not.addElement(new Integer(1));
			}

		}
		
		
		String sql_not="select Pnumber from PAPER";
		ResultSet resultset_not = statement1.executeQuery(sql_not);	
		while(resultset_not.next()){
			String p_num=resultset_not.getString("Pnumber");
			//out.println(p_num);
			int boo=1;
			int j=0;
			while ((boo==1) && (j<vector_fuzzy_not.size())){
				if(vector_fuzzy_not.elementAt(j).equals(p_num)){
					boo=0;
					Double tmp = (Double)vector_fuzzy_co_not.elementAt(j);
					if(tmp.doubleValue()==0){
						vector_fuzzy_co_not.removeElementAt(j);
						vector_fuzzy_not.removeElementAt(j);
					}
				}
				j++;
			}
			if(boo==1){
				vector_fuzzy_co_not.addElement(new Double(1));
				vector_fuzzy_not.addElement(p_num);
			}
		}
	}	
//********* END NOT ****************************
		
		
		//out.println("<br>");
		//out.println("vector_fuzzy_co : "+vector_fuzzy_co.toString());
/*		
		for(int i=0;i<vector_fuzzy.size();i++){
			Double tmp1=(Double)vector_fuzzy_co.elementAt(i);
			Integer tmp2=(Integer)vector_fuzzy_amount.elementAt(i);
			double tmp3=(tmp1.doubleValue()*tmp2.intValue()*tmp2.intValue()*100)/(query_amount*query_amount);
			//out.println("tmp3 : "+tmp3);
			vector_fuzzy_co.setElementAt(new Double (tmp3),i);
		}
*/		
/*
		for(int i=0;i<vector_fuzzy.size();i++){
			Double tmp1=(Double)vector_fuzzy_co.elementAt(i);
			//Integer tmp2=(Integer)vector_fuzzy_amount.elementAt(i);
			double tmp3=(tmp1.doubleValue()*100);
			//out.println("tmp3 : "+tmp3);
			vector_fuzzy_co.setElementAt(new Double (tmp3),i);
		}
*/		
/*/-----------------------------
		out.println("*****AND********");
		out.println("vector_query_and : "+vector_query_and.toString());
		out.println("<br>");
		out.println("vector_fuzzy_and : "+vector_fuzzy_and.toString());
		out.println("<br>");
		out.println("vector_fuzzy_co_and : "+vector_fuzzy_co_and.toString());
		out.println("<br>");
		out.println("vector_fuzzy_amount_and : "+vector_fuzzy_amount_and.toString());
		out.println("<br><br><br>");
		out.println("***** OR ********");
		out.println("vector_query_or : "+vector_query_or.toString());
		out.println("<br>");
		out.println("vector_fuzzy_or : "+vector_fuzzy_or.toString());
		out.println("<br>");
		out.println("vector_fuzzy_co_or : "+vector_fuzzy_co_or.toString());
		out.println("<br>");
		out.println("vector_fuzzy_amount_or : "+vector_fuzzy_amount_or.toString());
		out.println("<br><br><br>");
		out.println("***** NOT ********");
		out.println("vector_query_not : "+vector_query_not.toString());
		out.println("<br>");
		out.println("vector_fuzzy_not : "+vector_fuzzy_not.toString());
		out.println("<br>");
		out.println("vector_fuzzy_co_not : "+vector_fuzzy_co_not.toString());
		out.println("<br>");
		out.println("vector_fuzzy_amount_not : "+vector_fuzzy_amount_not.toString());
		out.println("<br><br><br>");


//-----------------------*/
	//out.println(operation+"<br>");
	if(operation.length()!=0){
		if(operation.equals("and")){
			if((vector_query_and.size()==0)&&(vector_query_or.size()!=0)){
				for(int i=0;i<vector_fuzzy_or.size();i++){
					String tmp1 = (String)vector_fuzzy_or.elementAt(i);
					Double tmp2 = (Double)vector_fuzzy_co_or.elementAt(i);
					segma.putVectorElement(tmp1,tmp2);
				}
			}
			if((vector_query_and.size()!=0)&&(vector_query_or.size()==0)){
				for(int i=0;i<vector_fuzzy_and.size();i++){
					String tmp1 = (String)vector_fuzzy_and.elementAt(i);
					Double tmp2 = (Double)vector_fuzzy_co_and.elementAt(i);
					segma.putVectorElement(tmp1,tmp2);
				}
			}
			if((vector_query_and.size()!=0)&&(vector_query_or.size()!=0)){
				for(int i = 0;i < vector_fuzzy_and.size();i++){
					int boo = 0;
					int j = 0;
					while ((boo==0)&&(j<vector_fuzzy_or.size())){
						String tmp1 = (String)vector_fuzzy_and.elementAt(i);
						String tmp2 = (String)vector_fuzzy_or.elementAt(j);
						if(tmp1.equals(tmp2)){
							boo=1;
							//vector_fuzzy_segma.addElement(tmp1);
							Double co1 = (Double)vector_fuzzy_co_and.elementAt(i);
							Double co2 = (Double)vector_fuzzy_co_or.elementAt(j);
							double tmp_co = co1.doubleValue()*co2.doubleValue();
							//vector_fuzzy_co_segma.addElement(new Double(tmp_co));
							segma.putVectorElement(tmp1,new Double(tmp_co));
						}
						j++;
					}
				}
			}
			if((vector_query_and.size()==0)&&(vector_query_or.size()==0)&&(vector_query_not.size()!=0)){
				for(int i=0;i<vector_fuzzy_not.size();i++){
					String tmp1 = (String)vector_fuzzy_not.elementAt(i);
					Double tmp2 = (Double)vector_fuzzy_co_not.elementAt(i);
					segma.putVectorElement(tmp1,tmp2);
				}
			}
			if((vector_query_not.size()!=0) && ((vector_query_and.size()!=0) || (vector_query_or.size()!=0))){
				for(int i = 0;i < segma.getVectorSize();i++){
					int boo = 0;
					int j = 0;
					while((boo==0)&&(j<vector_fuzzy_not.size())){
						String tmp1 = segma.getVectorSegma(i);
						String tmp2 = (String)vector_fuzzy_not.elementAt(j);
						if(tmp1.equals(tmp2)){
							boo=1;
							Double co1 = segma.getVectorSegmaCo(i);
							Double co2 = (Double)vector_fuzzy_co_not.elementAt(j);
							double tmp_co = co1.doubleValue()*co2.doubleValue();
							//vector_fuzzy_co_segma.setElementAt(new Double(tmp_co),i);
							segma.setVectorElementAtCo(new Double(tmp_co),i);
						}
						j++;
					}
					if(boo==0){
						segma.setVectorElementAtCo(new Double(0),i);
					}
				}
			}
			for(int i = 0;i<segma.getVectorSize();i++){
				Double tmp = segma.getVectorSegmaCo(i);
				if(tmp.doubleValue()==0){
					segma.removeVector(i);
					i--;
				}
			}
		}
		if(operation.equals("or")){
			if((vector_query_and.size()==0)&&(vector_query_or.size()!=0)){
				for(int i=0;i<vector_fuzzy_or.size();i++){
					String tmp1 = (String)vector_fuzzy_or.elementAt(i);
					Double tmp2 = (Double)vector_fuzzy_co_or.elementAt(i);
					segma.putVectorElement(tmp1,tmp2);
				}
				
			}
			if((vector_query_and.size()!=0)&&(vector_query_or.size()==0)){
				for(int i=0;i<vector_fuzzy_and.size();i++){
					String tmp1 = (String)vector_fuzzy_and.elementAt(i);
					Double tmp2 = (Double)vector_fuzzy_co_and.elementAt(i);
					segma.putVectorElement(tmp1,tmp2);
				}
				
			}
			if((vector_query_and.size()!=0)&&(vector_query_or.size()!=0)){
				for(int i = 0;i < vector_fuzzy_and.size();i++){
					int boo = 0;
					int j = 0;
					while ((boo==0)&&(j<vector_fuzzy_or.size())){
						String tmp1 = (String)vector_fuzzy_and.elementAt(i);
						String tmp2 = (String)vector_fuzzy_or.elementAt(j);
						if(tmp1.equals(tmp2)){
							boo=1;
							//vector_fuzzy_segma.addElement(tmp1);
							Double co1 = (Double)vector_fuzzy_co_and.elementAt(i);
							Double co2 = (Double)vector_fuzzy_co_or.elementAt(j);
							double tmp_co = (1-co1.doubleValue())*(1-co2.doubleValue());
							//vector_fuzzy_co_segma.addElement(new Double(tmp_co));
							segma.putVectorElement(tmp1,new Double(tmp_co));
						}
						j++;
					}
					if(boo==0){
						String tmp1 = (String)vector_fuzzy_and.elementAt(i);
						Double tmp2 = (Double)vector_fuzzy_co_and.elementAt(i);
						double tmp3 = 1-tmp2.doubleValue();
						//vector_fuzzy_segma.addElement(tmp1);
						//vector_fuzzy_co_segma.addElement(new Double(tmp3));
						segma.putVectorElement(tmp1,new Double(tmp3));
					}
				}	
				for(int i = 0;i<vector_fuzzy_or.size();i++){
					int boo = 0;
					int j = 0;
					while((boo==0)&&(j<segma.getVectorSize())){
						String tmp1 = (String)vector_fuzzy_or.elementAt(i);
						String tmp2 = segma.getVectorSegma(j);
						if(tmp1.equals(tmp2)){
							boo=1;
						}
						j++;
					}
					if(boo==0){
						String tmp1 = (String)vector_fuzzy_or.elementAt(i);
						Double tmp2 = (Double)vector_fuzzy_co_or.elementAt(i);
						double tmp3 = 1-tmp2.doubleValue();
						//vector_fuzzy_segma.addElement(tmp1);
						//vector_fuzzy_co_segma.addElement(new Double(tmp3));
						segma.putVectorElement(tmp1,new Double(tmp3));
					}
				}
				for(int i = 0;i<segma.getVectorSize();i++){
					Double tmp1 = segma.getVectorSegmaCo(i);
					double tmp2 = 1-tmp1.doubleValue();
					//vector_fuzzy_co_segma.setElementAt(new Double(tmp2),i);
					segma.setVectorElementAtCo(new Double(tmp2),i);
				}
			}
			if((vector_query_and.size()==0)&&(vector_query_or.size()==0)){
				for(int i=0;i<vector_fuzzy_not.size();i++){
					String tmp1 = (String)vector_fuzzy_not.elementAt(i);
					Double tmp2 = (Double)vector_fuzzy_co_not.elementAt(i);
					segma.putVectorElement(tmp1,tmp2);
				}
			}
			if((vector_query_not.size()!=0) && ((vector_query_and.size()!=0) || (vector_query_or.size()!=0))){
				for(int i = 0;i < segma.getVectorSize();i++){
					int boo = 0;
					int j = 0;
					while((boo==0)&&(j<vector_fuzzy_not.size())){
						String tmp1 = segma.getVectorSegma(i);
						String tmp2 = (String)vector_fuzzy_not.elementAt(j);
						if(tmp1.equals(tmp2)){
							boo=1;
							Double co1 = segma.getVectorSegmaCo(i);
							Double co2 = (Double)vector_fuzzy_co_not.elementAt(j);
							double tmp_co = co1.doubleValue()*co2.doubleValue();
							//vector_fuzzy_co_segma.setElementAt(new Double(tmp_co),i);
							segma.setVectorElementAtCo(new Double(tmp_co),i);
						}
						j++;
					}
					if(boo==0){
						segma.setVectorElementAtCo(new Double(0),i);
					}
				}
			}
			for(int i = 0;i<segma.getVectorSize();i++){
				Double tmp = segma.getVectorSegmaCo(i);
				if(tmp.doubleValue()==0){
					segma.removeVector(i);
					i--;
				}
			}
			
		}
		
	}else{
		//out.println("hahahaha");
		for(int i=0;i<vector_fuzzy_and.size();i++){
			String st01 = (String)vector_fuzzy_and.elementAt(i);
			Double tmp1=(Double)vector_fuzzy_co_and.elementAt(i);
			Integer tmp2=(Integer)vector_fuzzy_amount_and.elementAt(i);
			double tmp3=(tmp1.doubleValue()*tmp2.intValue()*tmp2.intValue()*100)/(query_amount_and*query_amount_and);
			//out.println("paper number : "+st01+"member ship : "+tmp3+"<br>");
			//vector_fuzzy_segma.addElement(st01);
			//vector_fuzzy_co_segma.addElement(new Double(tmp3));
			segma.putVectorElement(st01,new Double(tmp3));
		}
	}
	segma.vectorQuicksort();
	//for(int i=0;i<segma.getVectorSize();i++){
	//	out.println(segma.getVectorSegma(i)+"  "+segma.getVectorSegmaCo(i)+"<br>");
	//}
	if(segma.getVectorSize()>0){%> <font size="-1" color="#3333FF">Result : <%out.println(segma.getVectorSize()+" Record(s)<br><br>");%></font> 


<%for(int i=0;i<segma.getVectorSize();i++){
			String sqlshow="select * from PAPER where PNumber='"+segma.getVectorSegma(i)+"'";
			ResultSet resultset_show = statement1.executeQuery(sqlshow);
			%> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <%while(resultset_show.next()){%> 
  <tr> 
    <td><b>Title : </b><font size="-1" > <%out.println(resultset_show.getString("PName"));%></font></td>
  </tr>
  <tr> 
    <td><b>Abstract : </b><font size="-2" > <%out.println(resultset_show.getString("Description"));%></font></td>
  </tr>
  <tr> 
    <td><b>Author : </b><font size="-2" ><%String sqlauthor="select * from AUTHOR where PNumber='"+segma.getVectorSegma(i)+"'";
		Statement statement2 = dbconn.createStatement();
		ResultSet resultset_author = statement2.executeQuery(sqlauthor);
		while(resultset_author.next()){
			out.println(resultset_author.getString("AuthorName")+" , ");
		}
%></font></td>
  </tr>
  <tr> 
    <td><a href=../upload/<%=resultset_show.getString("Location")%>><font size="-2">Download</font></a><font size="-2"><%out.println("  size : "+resultset_show.getString("FileSize"));%></font></td>
  </tr>
  <tr> 
    <td><font size="-2" color="red"><%
	out.println(segma.getVectorSegmaCo(i)+"%");
    %></font></td> 
  </tr>
</table>
&nbsp; 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td></td>
  </tr>
  <%}%>
</table>
		<%}
	}
	
%> <%//		msgout = "Connection successful" ;
	
	dbconn.close();
	if(search==true){
		long time=x.getTime();
		x=new java.util.Date();
		time=x.getTime()-time;
		out.println("Time is : "+time);
	}
      }
      catch ( ClassNotFoundException cnfex ) 
      {
            // ´Ñ¡¨Ñº¡Ã³ÕäÁèÊÒÁÒÃ¶àÃÕÂ¡ãªé§Ò¹¤ÅÒÊÊÓËÃÑºµÔ´µèÍ°Ò¹¢éÍÁÙÅä´é
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;
	    out.println(msgout);
      }
      catch ( SQLException sqlex ) 
      {    // ´Ñ¡¨Ñº¡Ã³ê¤ÓÊÑè§ SQL ¼Ô´¾ÅÒ´
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(msgout);
      }
      catch ( Exception excp ) 
      {    // ´Ñ¡¨Ñº¡Ã³ê·ÑèÇä»
            excp.printStackTrace();
            msgout = excp.toString() ;
	    out.println(msgout);
      }
%> 
</body>
</html>