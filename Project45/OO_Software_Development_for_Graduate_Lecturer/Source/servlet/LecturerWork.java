import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import lecturer.Lecturer;
import myutil.thaiLanguage;
import myutil.htmlTemplate;
import myutil.server;

public class LecturerWork extends HttpServlet
{
	private Lecturer myLecturer = new Lecturer();
	private String url = "";
	private String user = "";
	private String passwd = "";
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	private String faculty="";
	private String department="";
    private String major="";
    private String teach_faculty1="";
    private String teach_course1="";
    private String teach_major1="";
    private String teach_faculty2="";
    private String teach_course2="";
    private String teach_major2="";
    private String teach_faculty3="";
    private String teach_course3="";
    private String teach_major3="";
	private String column1="";
	private String value1="";

	public void connectDB(PrintWriter out){
		try{			
			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
			//out.println("class for name ok");			//test
			con = DriverManager.getConnection(url,user,passwd);
			//out.println("con Driver ok");			//test
		}
		catch (ClassNotFoundException e){out.println(e.getMessage());return;}
		catch (SQLException e){out.println(e.getMessage());return;}
		catch (Exception e){out.println(e.getMessage());return;}
	}

	public void closeDB(){
		try{
			con.close( );
        }catch (SQLException e){System.err.print(e.getMessage());return;}
	}

	// --- รับข้อมูลอาจารย์จาก web
	public void getLecturerInfo(HttpSession session,HttpServletRequest request,HttpServletResponse response,PrintWriter out)throws Exception{
		String day="";
		String month="";
		String year="";
		String address="";
		String province="";
		String zipcode="";
		String[] expertise={"","","",""}; // ------ array
		String academic_affiliation="";
		String academic_affi_other="";

		column1="";
		value1="";
		if((!(request.getParameter("lecturerID").trim().equals("")))&&((request.getParameter("lecturerID").trim())!=null)){
				myLecturer.setLecturerID(thaiLanguage.MS874ToUnicode(request.getParameter("lecturerID").trim()));
				column1=column1+"LECTURER#,";
				value1=value1+"'"+myLecturer.getLecturerID()+"',";
		}
		if((!(request.getParameter("title_th").equals("non")))&&((request.getParameter("title_th"))!=null)){
				myLecturer.setTitle_th(thaiLanguage.MS874ToUnicode(request.getParameter("title_th")));
				column1=column1+"TITLE_TH,";
				value1=value1+"'"+myLecturer.getTitle_th()+"',";
		}
	    if((!(request.getParameter("name_th").equals("")))&&((request.getParameter("name_th"))!=null)){
				myLecturer.setName_th(thaiLanguage.MS874ToUnicode(request.getParameter("name_th")));
				column1=column1+"NAME_TH,";
				value1=value1+"'"+myLecturer.getName_th()+"',";
		}
	    if((!(request.getParameter("surname_th").equals("")))&&((request.getParameter("surname_th"))!=null)){
				myLecturer.setSurname_th(thaiLanguage.MS874ToUnicode(request.getParameter("surname_th")));
				column1=column1+"SURNAME_TH,";
				value1=value1+"'"+myLecturer.getSurname_th()+"',";
		}
	    if((!(request.getParameter("title_en").equals("non")))&&((request.getParameter("title_en"))!=null)){
				myLecturer.setTitle_en(thaiLanguage.MS874ToUnicode(request.getParameter("title_en")));
				column1=column1+"TITLE_EN,";
				value1=value1+"'"+myLecturer.getTitle_en()+"',";
		}
	   if((!(request.getParameter("name_en").equals("")))&&((request.getParameter("name_en"))!=null)){
				myLecturer.setName_en(thaiLanguage.MS874ToUnicode(request.getParameter("name_en")));
				column1=column1+"NAME_EN,";
				value1=value1+"'"+myLecturer.getName_en()+"',";
	   }
	   if((!(request.getParameter("surname_en").equals("")))&&((request.getParameter("surname_en"))!=null)){
				myLecturer.setSurname_en(thaiLanguage.MS874ToUnicode(request.getParameter("surname_en")));
				column1=column1+"SURNAME_EN,";
				value1=value1+"'"+myLecturer.getSurname_en()+"',";
	   }
	    if((!(request.getParameter("sex").equals("")))&&((request.getParameter("sex"))!=null)){
				myLecturer.setSex(thaiLanguage.MS874ToUnicode(request.getParameter("sex")));
				column1=column1+"SEX,";
				value1=value1+"'"+myLecturer.getSex()+"',";
		}
		//out.println(" pass x1"); // for test

		//------------------------
	    if((!(request.getParameter("birthdate").equals("")))&&((request.getParameter("birthdate"))!=null))
				day=request.getParameter("birthdate");		
	    if((!(request.getParameter("birthmonth").equals("")))&&((request.getParameter("birthmonth"))!=null))
				month=request.getParameter("birthmonth");
	    if((!(request.getParameter("birthyear").equals("")))&&((request.getParameter("birthyear"))!=null)){
				year=request.getParameter("birthyear");
				myLecturer.setBirthday(day+"/"+month+"/"+year);
				column1=column1+"BIRTHDAY,";
				value1=value1+"'"+myLecturer.getBirthday()+"',";
				//out.println("birthday : "+myLecturer.getBirthday()+"year : "+year);		//for test
		}
		//------------------------
	  		//out.println(" pass x2"); // for test

		//------------------------	  
		//------------------------
		
		//out.println(" pass x3"); // for test

	    if((!(request.getParameter("contact_address")).equals(""))&&((request.getParameter("contact_address"))!=null)){
				myLecturer.setContactAddress(thaiLanguage.MS874ToUnicode(request.getParameter("contact_address")));
				column1=column1+"CONTACTADDRESS,";
				value1=value1+"'"+myLecturer.getContactAddress()+"',";
		}
	    if((!(request.getParameter("telephone")).equals(""))&&((request.getParameter("telephone"))!=null)){
				myLecturer.setTelephone(thaiLanguage.MS874ToUnicode(request.getParameter("telephone")));
				column1=column1+"TELEPHONE,";
				value1=value1+"'"+myLecturer.getTelephone()+"',";
		}
	    if((!(request.getParameter("fax")).equals(""))&&((request.getParameter("fax"))!=null)){
				myLecturer.setFax(thaiLanguage.MS874ToUnicode(request.getParameter("fax")));
				column1=column1+"FAX,";
				value1=value1+"'"+myLecturer.getFax()+"',";
		}
	    if((!(request.getParameter("email")).equals(""))&&((request.getParameter("email"))!=null)){
				myLecturer.setEmail(thaiLanguage.MS874ToUnicode(request.getParameter("email")));
				column1=column1+"EMAIL,";
				value1=value1+"'"+myLecturer.getEmail()+"',";
		}
	    if((!(request.getParameter("url")).equals(""))&&((request.getParameter("url"))!=null)){
				myLecturer.setUrl(thaiLanguage.MS874ToUnicode(request.getParameter("url")));
				column1=column1+"URL,";
				value1=value1+"'"+myLecturer.getUrl()+"',";
		}


				//out.println(" pass x4"); // for test

		
		//------------------------
	    if((!(request.getParameter("academicaffiliation")).equals(""))&&((request.getParameter("academicaffiliation"))!=null))
				academic_affiliation=request.getParameter("academicaffiliation");
		if(academic_affiliation.equals("other")){
		    if((!(request.getParameter("academic_affi_other")).equals(""))&&((request.getParameter("academic_affi_other"))!=null))
				academic_affiliation=request.getParameter("academic_affi_other");
		}
		myLecturer.setAcademicAffiliation(thaiLanguage.MS874ToUnicode(academic_affiliation));
		column1=column1+"ACADEMICAFFILIATION,";
		value1=value1+"'"+myLecturer.getAcademicAffiliation()+"',";	
		//------------------------
		if((!(request.getParameter("adminposition")).equals(""))&&((request.getParameter("adminposition"))!=null)){
				myLecturer.setAdminPosition(thaiLanguage.MS874ToUnicode(request.getParameter("adminposition")));	
				column1=column1+"ADMINPOSITION,";
				value1=value1+"'"+myLecturer.getAdminPosition()+"',";		}

	    if((!(request.getParameter("qualification")).equals(""))&&((request.getParameter("qualification"))!=null)){
		        myLecturer.setQualification(thaiLanguage.MS874ToUnicode(request.getParameter("qualification")));
				column1=column1+"QUALIFICATION,";
				value1=value1+"'"+myLecturer.getQualification()+"',";	
		}
	    if((!(request.getParameter("experience")).equals(""))&&((request.getParameter("experience"))!=null)){
				myLecturer.setExperience(thaiLanguage.MS874ToUnicode(request.getParameter("experience")));
				column1=column1+"EXPERIENCE,";
				value1=value1+"'"+myLecturer.getExperience()+"',";	
		}
		//out.println(" pass x5"); // for test

		//------------------------
	    if((!(request.getParameter("expertise1")).equals(""))&&((request.getParameter("expertise1"))!=null)){
				myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise1")),0);
		}
	    if((!(request.getParameter("expertise2")).equals(""))&&((request.getParameter("expertise2"))!=null)){
				 myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise2")),1);
		}
	    if((!(request.getParameter("expertise3")).equals(""))&&((request.getParameter("expertise3"))!=null)){
			myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise3")),2);
		}
	    if((!(request.getParameter("expertise4")).equals(""))&&((request.getParameter("expertise4"))!=null)){
				 myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise4")),3);
		}
		//out.println(" pass x6/2"); // for test
			
		//------------------------

		
		if((!(request.getParameter("B_Year")).equals(""))&&((request.getParameter("B_Year"))!=null)){
				myLecturer.setB_year(thaiLanguage.MS874ToUnicode(request.getParameter("B_Year")));
				column1=column1+"B_YEAR,";
				value1=value1+"'"+myLecturer.getB_year()+"',";	
		}
		if((!(request.getParameter("B_Institute")).equals(""))&&((request.getParameter("B_Institute"))!=null)){
				myLecturer.setB_institute(thaiLanguage.MS874ToUnicode(request.getParameter("B_Institute")));
				column1=column1+"B_INSTITUTE,";
				value1=value1+"'"+myLecturer.getB_institute()+"',";	
		}
	    if((!(request.getParameter("B_Major")).equals(""))&&((request.getParameter("B_Major"))!=null)){
				myLecturer.setB_major(thaiLanguage.MS874ToUnicode(request.getParameter("B_Major")));
				column1=column1+"B_MAJOR,";
				value1=value1+"'"+myLecturer.getB_major()+"',";	
		}
	    if((!(request.getParameter("B_Degree")).equals(""))&&((request.getParameter("B_Degree"))!=null)){
				myLecturer.setB_degree(thaiLanguage.MS874ToUnicode(request.getParameter("B_Degree")));
				column1=column1+"B_DEGREE,";
				value1=value1+"'"+myLecturer.getB_degree()+"',";	
		}
	     if((!(request.getParameter("M_Year")).equals(""))&&((request.getParameter("M_Year"))!=null)){
				myLecturer.setM_year(thaiLanguage.MS874ToUnicode(request.getParameter("M_Year")));
				column1=column1+"M_YEAR,";
				value1=value1+"'"+myLecturer.getM_year()+"',";	
		}
		if((!(request.getParameter("M_Institute")).equals(""))&&((request.getParameter("M_Institute"))!=null)){
				myLecturer.setM_institute(thaiLanguage.MS874ToUnicode(request.getParameter("M_Institute")));
				column1=column1+"M_INSTITUTE,";
				value1=value1+"'"+myLecturer.getM_institute()+"',";	
		}
	    if((!(request.getParameter("M_Major")).equals(""))&&((request.getParameter("M_Major"))!=null)){
				myLecturer.setM_major(thaiLanguage.MS874ToUnicode(request.getParameter("M_Major")));
				column1=column1+"M_MAJOR,";
				value1=value1+"'"+myLecturer.getM_major()+"',";	
		}
	    if((!(request.getParameter("M_Degree")).equals(""))&&((request.getParameter("M_Degree"))!=null)){
				myLecturer.setM_degree(thaiLanguage.MS874ToUnicode(request.getParameter("M_Degree")));
				column1=column1+"M_DEGREE,";
				value1=value1+"'"+myLecturer.getM_degree()+"',";	
		}
	    if((!(request.getParameter("D_Year")).equals(""))&&((request.getParameter("D_Year"))!=null)){
				myLecturer.setD_year(thaiLanguage.MS874ToUnicode(request.getParameter("D_Year")));
				column1=column1+"D_YEAR,";
				value1=value1+"'"+myLecturer.getD_year()+"',";	
		}
		if((!(request.getParameter("D_Institute")).equals(""))&&((request.getParameter("D_Institute"))!=null)){
				myLecturer.setD_institute(thaiLanguage.MS874ToUnicode(request.getParameter("D_Institute")));
				column1=column1+"D_INSTITUTE,";
				value1=value1+"'"+myLecturer.getD_institute()+"',";	
		}
	    if((!(request.getParameter("D_Major")).equals(""))&&((request.getParameter("D_Major"))!=null)){
				myLecturer.setD_major(thaiLanguage.MS874ToUnicode(request.getParameter("D_Major")));
				column1=column1+"D_MAJOR,";
				value1=value1+"'"+myLecturer.getD_major()+"',";	
		}
	    if((!(request.getParameter("D_Degree")).equals(""))&&((request.getParameter("D_Degree"))!=null)){
				myLecturer.setD_degree(thaiLanguage.MS874ToUnicode(request.getParameter("D_Degree")));
				column1=column1+"D_DEGREE,";
				value1=value1+"'"+myLecturer.getD_degree()+"',";	
		}
	     if((!(request.getParameter("O_Year")).equals(""))&&((request.getParameter("O_Year"))!=null)){
				myLecturer.setO_year(thaiLanguage.MS874ToUnicode(request.getParameter("O_Year")));
				column1=column1+"O_YEAR,";
				value1=value1+"'"+myLecturer.getO_year()+"',";	
		}
		if((!(request.getParameter("O_Institute")).equals(""))&&((request.getParameter("O_Institute"))!=null)){
				myLecturer.setO_institute(thaiLanguage.MS874ToUnicode(request.getParameter("O_Institute")));
				column1=column1+"O_INSTITUTE,";
				value1=value1+"'"+myLecturer.getO_institute()+"',";	
		}
	    if((!(request.getParameter("O_Major")).equals(""))&&((request.getParameter("O_Major"))!=null)){
				myLecturer.setO_major(thaiLanguage.MS874ToUnicode(request.getParameter("O_Major")));
				column1=column1+"O_MAJOR,";
				value1=value1+"'"+myLecturer.getO_major()+"',";
		}
	    if((!(request.getParameter("O_Degree")).equals(""))&&((request.getParameter("O_Degree"))!=null)){
				myLecturer.setO_degree(thaiLanguage.MS874ToUnicode(request.getParameter("O_Degree")));
				column1=column1+"O_DEGREE,";
				value1=value1+"'"+myLecturer.getO_degree()+"',";
		}
		//out.println(" pass x7"); // for test
	    if((!(request.getParameter("member_status")).equals(""))&&((request.getParameter("member_status"))!=null)){
				myLecturer.setMemberStatus(thaiLanguage.MS874ToUnicode(request.getParameter("member_status")));
				column1=column1+"MEMBERSTATUS,";
				value1=value1+"'"+myLecturer.getMemberStatus()+"',";	
		} 
		if(request.getParameter("mastercourse")!=null){		// M TEACH COURSE
				myLecturer.setM_teachCourse("Y");
				column1=column1+"M_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getM_teachCourse()+"',";
		} 
		else{
				myLecturer.setM_teachCourse("N");				
				column1=column1+"M_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getM_teachCourse()+"',";
		}
	   //ut.println(" pass x8"); // for test
		if(request.getParameter("doctorcourse")!=null){		// D TEACH COURSE
				myLecturer.setD_teachCourse("Y");
				column1=column1+"D_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getD_teachCourse()+"',";
		}
		else{
				myLecturer.setD_teachCourse("N");
				column1=column1+"D_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getD_teachCourse()+"',";
		}
	    if(request.getParameter("masterexam")!=null){		// M EXAMTHESIS
				myLecturer.setM_examThesis("Y");
				column1=column1+"M_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getM_examThesis()+"',";
		}
		else{
				myLecturer.setM_examThesis("N");
				column1=column1+"M_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getM_examThesis()+"',";
		}
	    if(request.getParameter("doctorexam")!=null){		// D EXAMTHESIS
				myLecturer.setD_examThesis("Y");
				column1=column1+"D_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getD_examThesis()+"',";
		}
		else{
				myLecturer.setD_examThesis("N");
				column1=column1+"D_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getD_examThesis()+"',";
		}
	    if(request.getParameter("masterthesis")!=null){		// M SUPERVISE THESIS
				myLecturer.setM_superviseThesis("Y");
				column1=column1+"M_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getM_superviseThesis()+"',";
		}
		else{
				myLecturer.setM_superviseThesis("N");
				column1=column1+"M_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getM_superviseThesis()+"',";
		}
	    if(request.getParameter("doctorthesis")!=null){
				myLecturer.setD_superviseThesis("Y");
				column1=column1+"D_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getD_superviseThesis()+"',";				
		}
		else{
				myLecturer.setD_superviseThesis("N");
				column1=column1+"D_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getD_superviseThesis()+"',";				
		}
		// -- faculty 

	    if((!(request.getParameter("faculty")).equals("00"))&&((request.getParameter("faculty"))!=null)){
				myLecturer.setFaculty(thaiLanguage.MS874ToUnicode(request.getParameter("faculty")));
				column1=column1+"FACT#,";
				value1=value1+"'"+myLecturer.getFaculty()+"',";	
		}
	    if((!(request.getParameter("department")).equals("00"))&&((request.getParameter("department"))!=null)){
				myLecturer.setDepartment(thaiLanguage.MS874ToUnicode(request.getParameter("department")));	 
				column1=column1+"DEPT#,";
				value1=value1+"'"+myLecturer.getDepartment()+"',";	
		}
		if((!(request.getParameter("major")).equals("00"))&&((request.getParameter("major"))!=null)){
			myLecturer.setMajor(thaiLanguage.MS874ToUnicode(request.getParameter("major")));
			column1=column1+"MAJOR#,";
			value1=value1+"'"+myLecturer.getMajor()+"',";	
		}

		//----------------- course teaching
		if((!(request.getParameter("teach_faculty1")).equals("00"))&&((request.getParameter("teach_faculty1"))!=null)){
    			myLecturer.setTeachFaculty1(request.getParameter("teach_faculty1"));				
		}
	    if((!(request.getParameter("teach_major1")).equals("00"))&&((request.getParameter("teach_major1"))!=null)){
				myLecturer.setTeachMajor1(request.getParameter("teach_major1"));				
		}
	    if((!(request.getParameter("teach_course1")).equals("00"))&&((request.getParameter("teach_course1"))!=null)){
				myLecturer.setTeachCourse1(Integer.parseInt(request.getParameter("teach_course1")));
		}
	    if((!(request.getParameter("teach_faculty2")).equals("00"))&&((request.getParameter("teach_faculty2"))!=null)){
    			myLecturer.setTeachFaculty2(request.getParameter("teach_faculty2"));
		}
		 if((!(request.getParameter("teach_major2")).equals("00"))&&((request.getParameter("teach_major2"))!=null)){
				myLecturer.setTeachMajor2(request.getParameter("teach_major2"));
		}
	    if((!(request.getParameter("teach_course2")).equals("00"))&&((request.getParameter("teach_course2"))!=null)){
				myLecturer.setTeachCourse2(Integer.parseInt(request.getParameter("teach_course2")));
		}	  
	    if((!(request.getParameter("teach_faculty3")).equals("00"))&&((request.getParameter("teach_faculty3"))!=null)){
    			myLecturer.setTeachFaculty3(request.getParameter("teach_faculty3"));
				//column1=column1+"TEACHFACULTY3,";
				//value1=value1+"'"+myLecturer.getTeachFaculty3()+"',";
		}
	    if((!(request.getParameter("teach_major3")).equals("00"))&&((request.getParameter("teach_major3"))!=null)){
				myLecturer.setTeachMajor3(request.getParameter("teach_major3"));
				//column1=column1+"TEACHMAJOR3,";
				//value1=value1+"'"+myLecturer.getTeachMajor3()+"',";
		}
	    if((!(request.getParameter("teach_course3")).equals("00"))&&((request.getParameter("teach_course3"))!=null)){
				myLecturer.setTeachCourse3(Integer.parseInt(request.getParameter("teach_course3")));
				//column1=column1+"TEACHCOURSE3,";
				//value1=value1+""+myLecturer.getTeachCourse3()+",";
		}	  


	}// end getlecturerInfo
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// --- รับข้อมูล update อาจารย์จาก web
	public void getLecturerUpdate(HttpSession session,HttpServletRequest request,HttpServletResponse response,PrintWriter out)throws Exception{
		String day="";
		String month="";
		String year="";
		String address="";
		String province="";
		String zipcode="";
		String[] expertise={"","","",""}; // ------ array
		String academic_affiliation="";
		String academic_affi_other="";
		column1="";
		value1="";
		
		if(request.getParameter("lecturerID")!=null){
				myLecturer.setLecturerID(request.getParameter("lecturerID").trim());
		}
		if(request.getParameter("title_th")!=null){
				myLecturer.setTitle_th(thaiLanguage.MS874ToUnicode(request.getParameter("title_th")));				
		}
		else{
				myLecturer.setTitle_th("");
		}
		column1=column1+"TITLE_TH,";
		value1=value1+"'"+myLecturer.getTitle_th()+"',";
		//
	    if(request.getParameter("name_th")!=null){
				myLecturer.setName_th(thaiLanguage.MS874ToUnicode(request.getParameter("name_th")));				
		}
		else{
				myLecturer.setName_th("");
		}
		column1=column1+"NAME_TH,";
		value1=value1+"'"+myLecturer.getName_th()+"',";
		//
	    if(request.getParameter("surname_th")!=null){
				myLecturer.setSurname_th(thaiLanguage.MS874ToUnicode(request.getParameter("surname_th")));				
		}
		else{
				myLecturer.setSurname_th("");
		}
		column1=column1+"SURNAME_TH,";
		value1=value1+"'"+myLecturer.getSurname_th()+"',";
		//
	    if(request.getParameter("title_en")!=null){
				myLecturer.setTitle_en(thaiLanguage.MS874ToUnicode(request.getParameter("title_en")));
		}
		else{
				myLecturer.setTitle_en("");
		}
		column1=column1+"TITLE_EN,";
		value1=value1+"'"+myLecturer.getTitle_en()+"',";
		//
	   if(request.getParameter("name_en")!=null){
				myLecturer.setName_en(thaiLanguage.MS874ToUnicode(request.getParameter("name_en")));				
	   }
	   else{
				myLecturer.setName_en("");
	   }
		column1=column1+"NAME_EN,";
		value1=value1+"'"+myLecturer.getName_en()+"',";
		//
	   if(request.getParameter("surname_en")!=null){
				myLecturer.setSurname_en(thaiLanguage.MS874ToUnicode(request.getParameter("surname_en")));				
	   }
	   else{
				myLecturer.setSurname_en("");
	   }
		column1=column1+"SURNAME_EN,";
		value1=value1+"'"+myLecturer.getSurname_en()+"',";
	   //
	    if(request.getParameter("sex")!=null){
				myLecturer.setSex(thaiLanguage.MS874ToUnicode(request.getParameter("sex")));				
		}
		else{
				myLecturer.setSex("");
		}
		column1=column1+"SEX,";
		value1=value1+"'"+myLecturer.getSex()+"',";
		//
		//out.println(" pass x1"); // for test

		//------------------------
	    if(request.getParameter("birthdate")!=null)
				day=request.getParameter("birthdate");		
	    if(request.getParameter("birthmonth")!=null)
				month=request.getParameter("birthmonth");
	    if(request.getParameter("birthyear")!=null){
				year=request.getParameter("birthyear");
				myLecturer.setBirthday(day+"/"+month+"/"+year);
				column1=column1+"BIRTHDAY,";
				value1=value1+"'"+myLecturer.getBirthday()+"',";
				//out.println("birthday : "+myLecturer.getBirthday()+"year : "+year);		//for test
		}
		//------------------------
	  		//out.println(" pass x2"); // for test

		//------------------------	  
		//------------------------
		
		//out.println(" pass x3"); // for test

	    if(request.getParameter("contact_address")!=null){
				myLecturer.setContactAddress(thaiLanguage.MS874ToUnicode(request.getParameter("contact_address")));
				column1=column1+"CONTACTADDRESS,";
				value1=value1+"'"+myLecturer.getContactAddress()+"',";
		}
	    if(request.getParameter("telephone")!=null){
				myLecturer.setTelephone(thaiLanguage.MS874ToUnicode(request.getParameter("telephone")));
				column1=column1+"TELEPHONE,";
				value1=value1+"'"+myLecturer.getTelephone()+"',";
		}
	    if(request.getParameter("fax")!=null){
				myLecturer.setFax(thaiLanguage.MS874ToUnicode(request.getParameter("fax")));
				column1=column1+"FAX,";
				value1=value1+"'"+myLecturer.getFax()+"',";
		}
	    if(request.getParameter("email")!=null){
				myLecturer.setEmail(thaiLanguage.MS874ToUnicode(request.getParameter("email")));
				column1=column1+"EMAIL,";
				value1=value1+"'"+myLecturer.getEmail()+"',";
		}
	    if(request.getParameter("url")!=null){
				myLecturer.setUrl(thaiLanguage.MS874ToUnicode(request.getParameter("url")));
				column1=column1+"URL,";
				value1=value1+"'"+myLecturer.getUrl()+"',";
		}


				//out.println(" pass x4"); // for test

		
		//------------------------
	    if(request.getParameter("academicaffiliation")!=null)
				academic_affiliation=request.getParameter("academicaffiliation");
		if(academic_affiliation.equals("other")){
		    if(request.getParameter("academic_affi_other")!=null)
				academic_affiliation=request.getParameter("academic_affi_other");
		}
		myLecturer.setAcademicAffiliation(thaiLanguage.MS874ToUnicode(academic_affiliation));
		column1=column1+"ACADEMICAFFILIATION,";
		value1=value1+"'"+myLecturer.getAcademicAffiliation()+"',";	
		//------------------------
		if(request.getParameter("adminposition")!=null){
				myLecturer.setAdminPosition(thaiLanguage.MS874ToUnicode(request.getParameter("adminposition")));	
				column1=column1+"ADMINPOSITION,";
				value1=value1+"'"+myLecturer.getAdminPosition()+"',";		
		}

	    if(request.getParameter("qualification")!=null){
		        myLecturer.setQualification(thaiLanguage.MS874ToUnicode(request.getParameter("qualification")));
				column1=column1+"QUALIFICATION,";
				value1=value1+"'"+myLecturer.getQualification()+"',";	
		}
	    if(request.getParameter("experience")!=null){
				myLecturer.setExperience(thaiLanguage.MS874ToUnicode(request.getParameter("experience")));
				column1=column1+"EXPERIENCE,";
				value1=value1+"'"+myLecturer.getExperience()+"',";	
		}
		//out.println(" pass x5"); // for test

		//------------------------
	    if(request.getParameter("expertise1")!=null){
				myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise1")),0);
		}
	    if(request.getParameter("expertise2")!=null){
				 myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise2")),1);
		}
	    if(request.getParameter("expertise3")!=null){
			 myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise3")),2);
		}
	    if(request.getParameter("expertise4")!=null){
				myLecturer.setExpertise(thaiLanguage.MS874ToUnicode(request.getParameter("expertise4")),3);
		}
		//out.println(" pass x6/2"); // for test
			
		//------------------------

		
		if(request.getParameter("B_Year")!=null){
				myLecturer.setB_year(thaiLanguage.MS874ToUnicode(request.getParameter("B_Year")));
				column1=column1+"B_YEAR,";
				value1=value1+"'"+myLecturer.getB_year()+"',";	
		}
		if(request.getParameter("B_Institute")!=null){
				myLecturer.setB_institute(thaiLanguage.MS874ToUnicode(request.getParameter("B_Institute")));
				column1=column1+"B_INSTITUTE,";
				value1=value1+"'"+myLecturer.getB_institute()+"',";	
		}
	    if(request.getParameter("B_Major")!=null){
				myLecturer.setB_major(thaiLanguage.MS874ToUnicode(request.getParameter("B_Major")));
				column1=column1+"B_MAJOR,";
				value1=value1+"'"+myLecturer.getB_major()+"',";	
		}
	    if(request.getParameter("B_Degree")!=null){
				myLecturer.setB_degree(thaiLanguage.MS874ToUnicode(request.getParameter("B_Degree")));
				column1=column1+"B_DEGREE,";
				value1=value1+"'"+myLecturer.getB_degree()+"',";	
		}
	     if(request.getParameter("M_Year")!=null){
				myLecturer.setM_year(thaiLanguage.MS874ToUnicode(request.getParameter("M_Year")));
				column1=column1+"M_YEAR,";
				value1=value1+"'"+myLecturer.getM_year()+"',";	
		}
		if(request.getParameter("M_Institute")!=null){
				myLecturer.setM_institute(thaiLanguage.MS874ToUnicode(request.getParameter("M_Institute")));
				column1=column1+"M_INSTITUTE,";
				value1=value1+"'"+myLecturer.getM_institute()+"',";	
		}
	    if(request.getParameter("M_Major")!=null){
				myLecturer.setM_major(thaiLanguage.MS874ToUnicode(request.getParameter("M_Major")));
				column1=column1+"M_MAJOR,";
				value1=value1+"'"+myLecturer.getM_major()+"',";	
		}
	    if(request.getParameter("M_Degree")!=null){
				myLecturer.setM_degree(thaiLanguage.MS874ToUnicode(request.getParameter("M_Degree")));
				column1=column1+"M_DEGREE,";
				value1=value1+"'"+myLecturer.getM_degree()+"',";	
		}
	    if(request.getParameter("D_Year")!=null){
				myLecturer.setD_year(thaiLanguage.MS874ToUnicode(request.getParameter("D_Year")));
				column1=column1+"D_YEAR,";
				value1=value1+"'"+myLecturer.getD_year()+"',";	
		}
		if(request.getParameter("D_Institute")!=null){
				myLecturer.setD_institute(thaiLanguage.MS874ToUnicode(request.getParameter("D_Institute")));
				column1=column1+"D_INSTITUTE,";
				value1=value1+"'"+myLecturer.getD_institute()+"',";	
		}
	    if(request.getParameter("D_Major")!=null){
				myLecturer.setD_major(thaiLanguage.MS874ToUnicode(request.getParameter("D_Major")));
				column1=column1+"D_MAJOR,";
				value1=value1+"'"+myLecturer.getD_major()+"',";	
		}
	    if(request.getParameter("D_Degree")!=null){
				myLecturer.setD_degree(thaiLanguage.MS874ToUnicode(request.getParameter("D_Degree")));
				column1=column1+"D_DEGREE,";
				value1=value1+"'"+myLecturer.getD_degree()+"',";	
		}
	     if(request.getParameter("O_Year")!=null){
				myLecturer.setO_year(thaiLanguage.MS874ToUnicode(request.getParameter("O_Year")));
				column1=column1+"O_YEAR,";
				value1=value1+"'"+myLecturer.getO_year()+"',";	
		}
		if(request.getParameter("O_Institute")!=null){
				myLecturer.setO_institute(thaiLanguage.MS874ToUnicode(request.getParameter("O_Institute")));
				column1=column1+"O_INSTITUTE,";
				value1=value1+"'"+myLecturer.getO_institute()+"',";	
		}
	    if(request.getParameter("O_Major")!=null){
				myLecturer.setO_major(thaiLanguage.MS874ToUnicode(request.getParameter("O_Major")));
				column1=column1+"O_MAJOR,";
				value1=value1+"'"+myLecturer.getO_major()+"',";
		}
	    if(request.getParameter("O_Degree")!=null){
				myLecturer.setO_degree(thaiLanguage.MS874ToUnicode(request.getParameter("O_Degree")));
				column1=column1+"O_DEGREE,";
				value1=value1+"'"+myLecturer.getO_degree()+"',";
		}
		//out.println(" pass x7"); // for test
	    if(request.getParameter("member_status")!=null){
				myLecturer.setMemberStatus(thaiLanguage.MS874ToUnicode(request.getParameter("member_status")));
				column1=column1+"MEMBERSTATUS,";
				value1=value1+"'"+myLecturer.getMemberStatus()+"',";	
		} 
		if(request.getParameter("mastercourse")!=null){		// M TEACH COURSE
				myLecturer.setM_teachCourse("Y");
				column1=column1+"M_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getM_teachCourse()+"',";
		} 
		else{
				myLecturer.setM_teachCourse("N");	
				column1=column1+"M_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getM_teachCourse()+"',";
		}
	   //ut.println(" pass x8"); // for test
		if(request.getParameter("doctorcourse")!=null){		// D TEACH COURSE
				myLecturer.setD_teachCourse("Y");
				column1=column1+"D_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getD_teachCourse()+"',";
		}
		else{
				myLecturer.setD_teachCourse("N");
				column1=column1+"D_TEACHCOURSE,";
				value1=value1+"'"+myLecturer.getD_teachCourse()+"',";
		}
	    if(request.getParameter("masterexam")!=null){		// M EXAMTHESIS
				myLecturer.setM_examThesis("Y");
				column1=column1+"M_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getM_examThesis()+"',";
		}
		else{
				myLecturer.setM_examThesis("N");
				column1=column1+"M_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getM_examThesis()+"',";
		}
	    if(request.getParameter("doctorexam")!=null){		// D EXAMTHESIS
				myLecturer.setD_examThesis("Y");
				column1=column1+"D_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getD_examThesis()+"',";
		}
		else{
				myLecturer.setD_examThesis("N");
				column1=column1+"D_EXAMTHESIS,";
				value1=value1+"'"+myLecturer.getD_examThesis()+"',";
		}
	    if(request.getParameter("masterthesis")!=null){		// M SUPERVISE THESIS
				myLecturer.setM_superviseThesis("Y");
				column1=column1+"M_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getM_superviseThesis()+"',";
		}
		else{
				myLecturer.setM_superviseThesis("N");
				column1=column1+"M_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getM_superviseThesis()+"',";
		}
	    if(request.getParameter("doctorthesis")!=null){
				myLecturer.setD_superviseThesis("Y");
				column1=column1+"D_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getD_superviseThesis()+"',";				
		}
		else{
				myLecturer.setD_superviseThesis("N");
				column1=column1+"D_SUPERVISETHESIS,";
				value1=value1+"'"+myLecturer.getD_superviseThesis()+"',";				
		}
		// -- faculty 

	    if(!(request.getParameter("faculty")).equals("00")){
				myLecturer.setFaculty(thaiLanguage.MS874ToUnicode(request.getParameter("faculty")));
				column1=column1+"FACT#,";
				value1=value1+"'"+myLecturer.getFaculty()+"',";	
		}
		else{
				myLecturer.setFaculty("");
				column1=column1+"FACT#,";
				value1=value1+"'"+myLecturer.getFaculty()+"',";	
		}
	    if(!(request.getParameter("department")).equals("00")){
				myLecturer.setDepartment(thaiLanguage.MS874ToUnicode(request.getParameter("department")));	 
				column1=column1+"DEPT#,";
				value1=value1+"'"+myLecturer.getDepartment()+"',";	
		}
		else{
				myLecturer.setDepartment("");	 
				column1=column1+"DEPT#,";
				value1=value1+"'"+myLecturer.getDepartment()+"',";	
		}
		if(!(request.getParameter("major")).equals("00")){
			myLecturer.setMajor(thaiLanguage.MS874ToUnicode(request.getParameter("major")));
			column1=column1+"MAJOR#,";
			value1=value1+"'"+myLecturer.getMajor()+"',";	
		}
		else{
			myLecturer.setMajor("");
			column1=column1+"MAJOR#,";
			value1=value1+"'"+myLecturer.getMajor()+"',";
		}

		//----------------- course teaching
		if(!(request.getParameter("teach_faculty1")).equals("00")){
    			myLecturer.setTeachFaculty1(request.getParameter("teach_faculty1"));
		}
		else{
				myLecturer.setTeachFaculty1("");
		}
		//
	    if(!(request.getParameter("teach_major1")).equals("00")){
				myLecturer.setTeachMajor1(request.getParameter("teach_major1"));				
		}
		else{
				myLecturer.setTeachMajor1("");				
		}
		//
	    if(!(request.getParameter("teach_course1")).equals("00")){
				myLecturer.setTeachCourse1(Integer.parseInt(request.getParameter("teach_course1")));
		}
		else{
				myLecturer.setTeachCourse1(0);
		}
		//
	    if(!(request.getParameter("teach_faculty2")).equals("00")){
    			myLecturer.setTeachFaculty2(request.getParameter("teach_faculty2"));
		}
		else{
    			myLecturer.setTeachFaculty2("");
		}
		//
		 if(!(request.getParameter("teach_major2")).equals("00")){
				myLecturer.setTeachMajor2(request.getParameter("teach_major2"));
		}
		else{
				myLecturer.setTeachMajor2("");
		}
		//
	    if(!(request.getParameter("teach_course2")).equals("00")){
				myLecturer.setTeachCourse2(Integer.parseInt(request.getParameter("teach_course2")));
		}	
		else{
				myLecturer.setTeachCourse2(0);
		}
		//
	    if(!(request.getParameter("teach_faculty3")).equals("00")){
    			myLecturer.setTeachFaculty3(request.getParameter("teach_faculty3"));
		}
		else{
    			myLecturer.setTeachFaculty3("");
		}
	    if(!(request.getParameter("teach_major3")).equals("00")){
				myLecturer.setTeachMajor3(request.getParameter("teach_major3"));
		}
		else{
				myLecturer.setTeachMajor3("");
		}
	    if(!(request.getParameter("teach_course3")).equals("00")){
				myLecturer.setTeachCourse3(Integer.parseInt(request.getParameter("teach_course3")));
		}
		else{
				myLecturer.setTeachCourse3(0);
		}
		/// --------------------------- set Lecturer data ---------------------------------------------

	}// end getLecturerUpdate
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	public void printData(Lecturer lec,PrintWriter out){  // --- ใช้ตรวสอบข้อมูลที่รับเข้ามา
		out.println("<%@ page contentType=\"text/html; charset=windows-874\"%>"+
				"<html>\n"+
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">"+
				"<body>\n");
				out.println("lecturerID="+lec.getLecturerID()+"<br>");
				out.println("title_th="+lec.getTitle_th()+"<br>");
				out.println("name_th="+lec.getName_th()+"<br>");
				out.println("lastname_th="+lec.getSurname_th()+"<br>");
				out.println("title_en="+lec.getTitle_en()+"<br>");
				out.println("name_en="+lec.getName_en()+"<br>");
	            out.println("lastname_en="+lec.getSurname_en()+"<br>");
	            out.println("sex="+lec.getSex()+"<br>");
	            out.println("birthdate="+lec.getBirthday()+"<br>");
	            out.println("contact_address="+lec.getContactAddress()+"<br>");
	            out.println("telephone="+lec.getTelephone()+"<br>");
	            out.println("fax="+lec.getFax()+"<br>");
	            out.println("email="+lec.getEmail()+"<br>");
	            out.println("l_url="+lec.getUrl()+"<br>");
	            out.println("academic_affiliation="+lec.getAcademicAffiliation()+"<br>");
	            out.println("admin Position="+lec.getAdminPosition()+"<br>");
                out.println("qualification="+lec.getQualification()+"<br>");
	            out.println("experience="+lec.getExperience()+"<br>");
	
				///out.println(""+expert.length);// for test
				
				for(int i =0;i<6;i++){
					if(!lec.getExpertise(i).equals("")){
						out.println("expertise"+i+"="+lec.getExpertise(i)+"<br>");
					}					
				}
	
                out.println("B_institute="+lec.getB_institute()+"<br>");
	            out.println("B_year="+lec.getB_year()+"<br>");
	            out.println("B_major="+lec.getB_major()+"<br>");
	            out.println("B_degree="+lec.getB_degree()+"<br>");
                out.println("M_institute="+lec.getM_institute()+"<br>");
	            out.println("M_year="+lec.getM_year()+"<br>");
	            out.println("M_major="+lec.getM_major()+"<br>");
	            out.println("M_degree="+lec.getM_degree()+"<br>");
                out.println("D_institute="+lec.getD_institute()+"<br>");
	            out.println("D_year="+lec.getD_year()+"<br>");
	            out.println("D_major="+lec.getD_major()+"<br>");
	            out.println("D_degree="+lec.getD_degree()+"<br>");
                out.println("O_institute="+lec.getO_institute()+"<br>");
	            out.println("O_year="+lec.getO_year()+"<br>");
	            out.println("O_major="+lec.getO_major()+"<br>");
	            out.println("O_degree="+lec.getO_degree()+"<br>");
	            out.println("member_status="+lec.getMemberStatus()+"<br>");
	            out.println("masterprogram="+lec.getM_teachCourse()+"<br>");
	            out.println("doctorprogram="+lec.getD_teachCourse()+"<br>");
	            out.println("masterexam="+lec.getM_examThesis()+"<br>");
	            out.println("doctorexam="+lec.getD_examThesis()+"<br>");
	            out.println("masterthesis="+lec.getM_superviseThesis()+"<br>");
	            out.println("doctorthesis="+lec.getD_superviseThesis()+"<br>");

	            out.println("faculty_th="+lec.getFaculty()+"<br>");
	            out.println("department_th="+lec.getDepartment()+"<br>");
                out.println("major_th="+ lec.getMajor()+"<br>");
                out.println("teach_faculty1="+lec.getTeachFaculty1()+"<br>");
                out.println("teach_course1="+lec.getTeachCourse1()+"<br>");
                out.println("teach_major1="+lec.getTeachMajor1()+"<br>");
                out.println("teach_faculty2="+lec.getTeachFaculty2()+"<br>");
                out.println("teach_course2="+lec.getTeachCourse2()+"<br>");
                out.println("teach_major2="+ lec.getTeachMajor2()+"<br>");
                out.println("teach_faculty3="+lec.getTeachFaculty3()+"<br>");
                out.println("teach_course3="+lec.getTeachCourse3()+"<br>");
				out.println("teach_major3="+lec.getTeachMajor3()+"<br>");
				out.println("</body></html>");

	} /// end printData
	
	// --- insert ข้อมูลอาจารย์ ลง database
	public boolean addLecturer(HttpSession session,HttpServletRequest request,HttpServletResponse response,PrintWriter out)throws Exception{
		//printData(myLecturer,out);  /// ใช้ทดสอบ เพื่อดูข้อมูล

		// ตรวจสอบรหัสว่ามีอยู่หรือไม่
		String sql = "SELECT * FROM LECTURER WHERE LECTURER# ='"+myLecturer.getLecturerID()+"'";
		// out.println(sql);		//  test
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../addlecturer.jsp\" class=\"pathlink2\">เพิ่มข้อมูลอาจารย์บัณฑิต</a>","เพิ่มข้อมูลอาจารย์บัณฑิต"));
			out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถเพิ่มข้อมูลอาจารย์ได้ เนื่องจากรหัสอาจารย์ที่ระบุ มีอยู่แล้ว</font>"));
			out.println("<form action=\"../addlecturer.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
							   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"</form>\n");								
			out.println(htmlTemplate.getEnd());
			rs.close();
			closeDB();
			return false;
		}
		rs.close();
		closeDB();
		
		
		// insert to table lecturer
		connectDB(out);		
		String sqlCommand = "INSERT INTO LECTURER("+column1.substring(0,column1.length()-1)+")\n values("+value1.substring(0,value1.length()-1)+")";
		///out.println(sqlCommand);			// test
				
		PreparedStatement pstmt;		
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
				if(myLecturer.getTeachCourse1()!=0){
					pstmt = con.prepareStatement("INSERT INTO COURSETEACHING(LECTURER#,CO#) "+
																			"VALUES('"+myLecturer.getLecturerID()+"',"+myLecturer.getTeachCourse1()+")" );
					pstmt.executeUpdate();
				}
				if(myLecturer.getTeachCourse2()!=0){
					pstmt = con.prepareStatement("INSERT INTO COURSETEACHING(LECTURER#,CO#) "+
																			"VALUES('"+myLecturer.getLecturerID()+"',"+myLecturer.getTeachCourse2()+")" );
					pstmt.executeUpdate();
				}
				if(myLecturer.getTeachCourse3()!=0){
					pstmt = con.prepareStatement("INSERT INTO COURSETEACHING(LECTURER#,CO#) "+
																			"VALUES('"+myLecturer.getLecturerID()+"',"+myLecturer.getTeachCourse3()+")" );
					pstmt.executeUpdate();
				}
				
				for (int i = 0;i<6;i++ ){
					if(!myLecturer.getExpertise(i).equals("")){
						pstmt = con.prepareStatement("INSERT INTO LECTUREREXPERTISE(LECTURER#,EXPERTISE)"+
																			"VALUES('"+myLecturer.getLecturerID()+"','"+myLecturer.getExpertise(i)+"')" );
						pstmt.executeUpdate();
					}
				}
				closeDB();
				column1="";
				value1="";	
				return true;

	}// --- end insert ข้อมูลอาจารย์ ลง database

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	public void deleteLecturer(String sql,PrintWriter out) throws Exception{		// ลบข้อมูล
		
		connectDB(out);		
		PreparedStatement pstmt;		
		pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();
	}	// end deleteLecturer
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException
	{
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		
		if(request.getParameter("inslecturer") != null){		// เพิ่มข้อมูลอาจารย์บัณฑิต
			try{
				//  out.println("pass 1");	 // for test
				getLecturerInfo(session,request,response,out);
				if(!addLecturer(session,request,response,out))
					return;
				else{
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../addlecturer.jsp\" class=\"pathlink2\">เพิ่มข้อมูลอาจารย์บัณฑิต</a>","เพิ่มข้อมูลอาจารย์บัณฑิต"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">เพิ่มข้อมูลอาจารย์บัณฑิตเรียบร้อยแล้ว</font>"));
						out.println("<br><form action=\"../addlecturer.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());						
				}
			}
			catch(SQLException e){out.println("SQLException : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception : "+e.getMessage());return;}			
		}
		else if(request.getParameter("cancel") != null)	{			// ยกเลิกเพิ่มข้อมูลอาจารย์บัณฑิต
			try{
				response.sendRedirect("../addlecturer.jsp");
			}catch(Exception e){out.println("sendRedirect Error"+e.getMessage());return;}
		}
		else if(request.getParameter("selectID") != null){			 //เลือกข้อมูลอาจารย์บัณฑิตที่จะแก้ไข
			String lecturerID = request.getParameter("lecturerID");
			session.setAttribute("lecturerID",lecturerID);
			response.sendRedirect("../editlecturer.jsp");
		}
		else if(request.getParameter("editlecturer") != null){			 //แก้ไขข้อมูลอาจารย์บัณฑิต
			out.println("edit");
			String sql = "";
			

			try{
					getLecturerUpdate(session,request,response,out);
					// -------------------------  ตรวจสอบว่ามีข้อมูลอาจารย์อยู่หรือไม่
						sql = "SELECT * FROM LECTURER WHERE LECTURER# ='"+myLecturer.getLecturerID()+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(!rs.next()){
							session.removeAttribute("lecturerID");
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../editlecturer.jsp\" class=\"pathlink2\">แก้ไขข้อมูลอาจารย์บัณฑิต</a>","แก้ไขข้อมูลอาจารย์บัณฑิต"));
							out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถแก้ไขข้อมูลได้ เนื่องจากรหัสอาจารย์ที่ระบุ ไม่มีอยู่ในฐานข้อมูล</font>"));
							out.println("<form action=\"../editlecturer.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							rs.close();
							closeDB();
							return;
						}
						rs.close();
						closeDB();
						//-------------
					out.println(thaiLanguage.UnicodeToMS874("UPDATE LECTURER SET("+column1.substring(0,column1.length()-1)+") VALUES("+value1.substring(0,value1.length()-1)+") WHERE LECTURER#='"+myLecturer.getLecturerID()+"'\n"));
					out.println(thaiLanguage.UnicodeToMS874("UPDATE COURSETEACHING SET(CO#) "+
																			"VALUES("+myLecturer.getTeachCourse1()+") WHERE LECTURER#='"+myLecturer.getLecturerID()+"'\n" ));
					out.println(thaiLanguage.UnicodeToMS874("UPDATE COURSETEACHING SET(CO#) "+
																			"VALUES("+myLecturer.getTeachCourse2()+") WHERE LECTURER#='"+myLecturer.getLecturerID()+"'\n" ));
					out.println(thaiLanguage.UnicodeToMS874("UPDATE COURSETEACHING SET(CO#) "+
																			"VALUES("+myLecturer.getTeachCourse3()+") WHERE LECTURER#='"+myLecturer.getLecturerID()+"'\n" ));
					
				for (int i = 0;i<6;i++ ){
					if(!myLecturer.getExpertise(i).equals("")){
						out.println("UPDATE LECTUREREXPERTISE SET(EXPERTISE)"+
																			"VALUES('"+myLecturer.getExpertise(i)+"') WHERE LECTURER#='"+myLecturer.getLecturerID()+"'\n");
					}
				}
			}
			catch(SQLException e){out.println("SQLException : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception : "+e.getMessage());return;}			
		}
		else if(request.getParameter("deletelecturer") != null){			// ลบข้อมูลอาจารย์บัณฑิต
			if(request.getParameter("lecturerID") != null){
					String lecturerID = request.getParameter("lecturerID");
					String sql="";
					try{

						// -------------------------  ตรวจสอบว่ามีข้อมูลอาจารย์อยู่หรือไม่
						sql = "SELECT * FROM LECTURER WHERE LECTURER# ='"+lecturerID+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(!rs.next()){
							session.removeAttribute("lecturerID");
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../editlecturer.jsp\" class=\"pathlink2\">แก้ไขข้อมูลอาจารย์บัณฑิต</a>&nbsp;>>&nbsp;<font class=\"pathlink2\">ลบข้อมูลอาจารย์บัณฑิต</font>","ลบข้อมูลอาจารย์บัณฑิต"));
							out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถลบข้อมูลอาจารย์ได้ เนื่องจากรหัสอาจารย์ที่ระบุ ไม่มีอยู่ในฐานข้อมูล</font>"));
							out.println("<form action=\"../editlecturer.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");
							out.println(htmlTemplate.getEnd());
							rs.close();
							closeDB();
							return;
						}
						rs.close();
						closeDB();
						//-------------

						sql ="DELETE FROM LECTUREREXPERTISE WHERE LECTURER# ='"+lecturerID+"'";
						deleteLecturer(sql,out);
						sql ="DELETE FROM COURSETEACHING WHERE LECTURER# ='"+lecturerID+"'";
						deleteLecturer(sql,out);
						sql ="DELETE FROM LECTURER WHERE LECTURER# ='"+lecturerID+"'";
						deleteLecturer(sql,out);
						out.println(htmlTemplate.getStart("ข้อมูลอาจารย์บัณฑิต","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../editlecturer.jsp\" class=\"pathlink2\">แก้ไขข้อมูลอาจารย์บัณฑิต</a>&nbsp;>>&nbsp;ลบข้อมูลอาจารย์บัณฑิต","ลบข้อมูลอาจารย์บัณฑิต"));
						out.println( thaiLanguage.UnicodeToMS874("<br><br><font class=\"insfont\" style=\"font:16px\">ลบข้อมูลอาจารย์บัณฑิตเรียบร้อยแล้ว</font><br>\n"+
											"<form action=\"../lecturerinfo.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>"));
						out.println(htmlTemplate.getEnd());
					}
					catch(SQLException e){out.print("delete SQLException : "+e.getMessage());return;}
					catch(Exception e){out.print("delete Exception : "+e.getMessage());return;}
			}
			else{
				response.sendRedirect("../editlecturer.jsp");		
			}
		}
		else if(request.getParameter("editcancel") != null){			// ยกเลิก
			session.removeAttribute("lecturerID");
			response.sendRedirect("../editlecturer.jsp");
		}
	} // end dopost
}	//  end class