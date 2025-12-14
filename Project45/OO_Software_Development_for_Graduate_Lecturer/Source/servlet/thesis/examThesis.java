/**
	@jaikla
*/

package thesis;

import student.Student;
import lecturer.Lecturer;
import thesis.Thesis;
public class examThesis extends Object
{
	private Student std;
	private String stdFactName="";
	private String stdDeptName="";
	private String stdMajorName="";
	private String stdCourseName="";
	private Thesis thesis;
	private String examDate="";
	private String examTime="";
	private String examResult="";
	private String examLocation="";
	private Lecturer examLecturer1;
	private String LFactName1="";
	private String LdeptName1="";
	private Lecturer examLecturer2;
	private String LFactName2="";
	private String LdeptName2="";
	private Lecturer examLecturer3;
	private String LFactName3="";
	private String LdeptName3="";
	private Lecturer examLecturer4;
	private String LFactName4="";
	private String LdeptName4="";
	private Lecturer examLecturer5;
	private String LFactName5="";
	private String LdeptName5="";
	private Lecturer examLecturer6;
	private String LFactName6="";
	private String LdeptName6="";
	private String complete="";
	public examThesis(){
			std=new Student();
			thesis = new Thesis();
			examDate="";
			examTime="";
			examResult="";
			examLocation="";
			examLecturer1=new Lecturer();
			LFactName1="";
			LdeptName1="";
			examLecturer2=new Lecturer();
			LFactName2="";
			LdeptName2="";
			examLecturer3=new Lecturer();
			LFactName3="";
			LdeptName3="";
			examLecturer4=new Lecturer();
			LFactName4="";
			LdeptName4="";
			examLecturer5=new Lecturer();
			LFactName5="";
			LdeptName5="";
			examLecturer6=new Lecturer();
			LFactName6="";
			LdeptName6="";
			complete="";
	}

// #########   Student ##########
	// stdID
	public void setStdID(String value){
		std.setStdID(value);
	}
	public String getStdID(){
		return std.getStdID();
	}
	// stdTittle
	public void setStdTitle(String value){
		std.setTpre(value);
	}
	public String getStdTitle(){
		return std.getTpre();
	}
	// stdName
	public void setStdName(String value){
		std.setTname(value);
	}
	public String getStdName(){
		return std.getTname();
	}
	// stdSurname
	public void setStdSurname(String value){
		std.setTfamily(value);
	}
	public String getStdSurname(){
		return std.getTfamily();
	}
	// stdFactID
	public void setStdFactID(String value){
		std.setFactID(value);
	}
	public String getStdFactID(){
		return std.getFactID();
	}
	// stdFactName
	public void setStdFactName(String value){
		stdFactName=value;
	}
	public String getStdFactName(){
		return stdFactName;
	}
	// stdDeptID
	public void setStdDeptID(String value){
		std.setDeptID(value);
	}
	public String getStdDeptID(){
		return std.getDeptID();
	}
	// stdDeptName
	public void setStdDeptName(String value){
		stdDeptName=value;
	}
	public String getStdDeptName(){
		return stdDeptName;
	}
	// stdMajorID
	public void setMajorID(String value){
		std.setMajorID(value);
	}
	public String getMajorID(){
		return std.getMajorID();
	}
	// stdMajorName
	public void setStdMajorName(String value){
		stdMajorName=value;
	}
	public String getStdMajorName(){
		return stdMajorName;
	}
	// stdCourseID
	public void setStdCourseID(int value){
		std.setCoID(value);
	}
	public int getStdCourseID(){
		return std.getCoID();
	}
	// stdCourseName
	public void setStdCourseName(String value){
		stdCourseName=value;
	}
	public String getStdCourseName(){
		return stdCourseName;
	}
//########## thesis ##############
	// thesisID
	public void setThesisID(int value){
		thesis.setThesisID(value);
	}
	public int getThesisID(){
		return thesis.getThesisID();
	}
	//	academicYear
	public void setAcademicYear(String value){
		thesis.setAcademicYear(value);
	}
	public String getAcademicYear(){
		return thesis.getAcademicYear();
	}	

	// topic_th
	public void setTopic_th(String value){
		thesis.setTopic_th (value);
	}
	public String getTopic_th(){
		return thesis.getTopic_th();
	}

	// topic_en
	public void setTopic_en(String value){
		thesis.setTopic_en(value);
	}
	public String getTopic_en(){
		return thesis.getTopic_en();
	}

	// approveDate
	public void setApproveDate(String value){
		thesis.setApproveDate(value);
	}
	public String getApproveDate(){
		return thesis.getApproveDate();
	}

	//	thesisFactID
	public void setThesisFactID(String value){
		thesis.setFactID(value);
	}
	public String getThesisFactID(){
		return thesis.getFactID();
	}

	//	 superLecturerID
	public void setSuperID(String value){
		thesis.setSuperID(value);
	}
	public String getSuperID(){
		return thesis.getSuperID();
	}
	// superAcademicAffiliation
	public void setSuperAcademicAffiliation(String value){
		thesis.setSuperAcademicAffiliation(value);
	}
	public String getSuperAcademicAffiliation(){
		return thesis.getSuperAcademicAffiliation();
	}
	// superName
	public void setSuperName(String value){
		thesis.setSuperName(value);
	}
	public String getSuperName(){
		return thesis.getSuperName();
	}
	// superSurName
	public void setSuperSurname(String value){
		thesis.setSuperSurname(value);
	}
	public String getSuperSurname(){
		return thesis.getSuperSurname();
	}

	//	 join1ID
	public void setJoin1ID(String value){
		thesis.setJoin1ID(value);
	}
	public String getJoin1ID(){
		return thesis.getJoin1ID();
	}
	// join1AcademicAffiliation
	public void setJoin1AcademicAffiliation(String value){
		thesis.setJoin1AcademicAffiliation(value);
	}
	public String getJoin1AcademicAffiliation(){
		return thesis.getJoin1AcademicAffiliation();
	}
	// join1Name
	public void setJoin1Name(String value){
		thesis.setJoin1Name(value);
	}
	public String getJoin1Name(){
		return thesis.getJoin1Name();
	}
	// join1SurName
	public void setJoin1Surname(String value){
		thesis.setJoin1Surname(value);
	}
	public String getJoin1Surname(){
		return thesis.getJoin1Surname();
	}
	//	 join2ID
	public void setJoin2ID(String value){
		thesis.setJoin2ID(value);
	}
	public String getJoin2ID(){
		return thesis.getJoin2ID();
	}
	// join2AcademicAffiliation
	public void setJoin2AcademicAffiliation(String value){
		thesis.setJoin2AcademicAffiliation(value);
	}
	public String getJoin2AcademicAffiliation(){
		return thesis.getJoin2AcademicAffiliation();
	}
	// join2Name
	public void setJoin2Name(String value){
		thesis.setJoin2Name(value);
	}
	public String getJoin2Name(){
		return thesis.getJoin2Name();
	}
	// join2SurName
	public void setJoin2Surname(String value){
		thesis.setJoin2Surname(value);
	}
	public String getJoin2Surname(){
		return thesis.getJoin2Surname();
	}

// ############ examLecturer ######################
	// Lecturer examLecturer1;
	public void setExamLecturer1ID(String value){
			examLecturer1.setLecturerID(value);
	}
	public String getExamLecturer1ID(){
			return examLecturer1.getLecturerID();
	}
	// examLAcademicAffiliation1
	public void setExamLAcademicAffiliation1(String value){
		examLecturer1.setAcademicAffiliation(value);
	}
	public String getExamLAcademicAffiliation1(){
		return examLecturer1.getAcademicAffiliation();
	}
	// examLName1
	public void setExamLName1(String value){
		examLecturer1.setName_th(value);
	}
	public String getExamLName1(){
		return examLecturer1.getName_th();
	}
	// examLSurname1
	public void setExamLSurname1(String value){
		examLecturer1.setSurname_th(value);
	}
	public String getExamLSurname1(){
		return examLecturer1.getSurname_th();
	}
	// LFactID1
	public void setLFactID1(String value){
		examLecturer1.setFaculty(value);
	}
	public String getLFactID1(){
			return examLecturer1.getFaculty();
	}
	// LFactName1
	public void setLFactName1(String value){
			LFactName1=value;
	}
	public String getLFactName1(){
			return LFactName1;
	}
	// LDeptID1
	public void setLDeptID1(String value){
		examLecturer1.setDepartment(value);
	}
	public String getLDeptID1(){
			return examLecturer1.getDepartment();
	}
	// LdeptName1
	public void setLDeptName1(String value){
			LdeptName1=value;
	}
	public String getLDeptName1(){
			return LdeptName1;
	}

	// Lecturer examLecturer2;
	public void setExamLecturer2ID(String value){
			examLecturer2.setLecturerID(value);
	}
	public String getExamLecturer2ID(){
			return examLecturer2.getLecturerID();
	}
	// examLAcademicAffiliation2
	public void setExamLAcademicAffiliation2(String value){
		examLecturer2.setAcademicAffiliation(value);
	}
	public String getExamLAcademicAffiliation2(){
		return examLecturer2.getAcademicAffiliation();
	}
	// examLName2
	public void setExamLName2(String value){
		examLecturer2.setName_th(value);
	}
	public String getExamLName2(){
		return examLecturer2.getName_th();
	}
	// examLSurname2
	public void setExamLSurname2(String value){
		examLecturer2.setSurname_th(value);
	}
	public String getExamLSurname2(){
		return examLecturer2.getSurname_th();
	}
	// LFactID2
	public void setLFactID2(String value){
		examLecturer2.setFaculty(value);
	}
	public String getLFactID2(){
			return examLecturer2.getFaculty();
	}
	// LFactName2
	public void setLFactName2(String value){
			LFactName2=value;
	}
	public String getLFactName2(){
			return LFactName2;
	}
	// LDeptID2
	public void setLDeptID2(String value){
		examLecturer2.setDepartment(value);
	}
	public String getLDeptID2(){
			return examLecturer2.getDepartment();
	}
	// LDeptName2
	public void setLDeptName2(String value){
			LdeptName2=value;
	}
	public String getLDeptName2(){
			return LdeptName2;
	}

	// Lecturer examLecturer3;
	public void setExamLecturer3ID(String value){
			examLecturer3.setLecturerID(value);
	}
	public String getExamLecturer3ID(){
			return examLecturer3.getLecturerID();
	}
	// examLAcademicAffiliation3
	public void setExamLAcademicAffiliation3(String value){
		examLecturer3.setAcademicAffiliation(value);
	}
	public String getExamLAcademicAffiliation3(){
		return examLecturer3.getAcademicAffiliation();
	}
	// examLName3
	public void setExamLName3(String value){
		examLecturer3.setName_th(value);
	}
	public String getExamLName3(){
		return examLecturer3.getName_th();
	}
	// examLSurname3
	public void setExamLSurname3(String value){
		examLecturer3.setSurname_th(value);
	}
	public String getExamLSurname3(){
		return examLecturer3.getSurname_th();
	}
	// LFactID3
	public void setLFactID3(String value){
		examLecturer3.setFaculty(value);
	}
	public String getLFactID3(){
			return examLecturer3.getFaculty();
	}
	// LFactName3
	public void setLFactName3(String value){
			LFactName3=value;
	}
	public String getLFactName3(){
			return LFactName3;
	}
	// LDeptID3
	public void setLDeptID3(String value){
		examLecturer3.setDepartment(value);
	}
	public String getLDeptID3(){
			return examLecturer3.getDepartment();
	}
	// LDeptName3
	public void setLDeptName3(String value){
			LdeptName3=value;
	}
	public String getLDeptName3(){
			return LdeptName3;
	}

	// Lecturer examLecturer4;
	public void setExamLecturer4ID(String value){
			examLecturer4.setLecturerID(value);
	}
	public String getExamLecturer4ID(){
			return examLecturer4.getLecturerID();
	}
	// examLAcademicAffiliation4
	public void setExamLAcademicAffiliation4(String value){
		examLecturer4.setAcademicAffiliation(value);
	}
	public String getExamLAcademicAffiliation4(){
		return examLecturer4.getAcademicAffiliation();
	}
	// examLName4
	public void setExamLName4(String value){
		examLecturer4.setName_th(value);
	}
	public String getExamLName4(){
		return examLecturer4.getName_th();
	}
	// examLSurname4
	public void setExamLSurname4(String value){
		examLecturer4.setSurname_th(value);
	}
	public String getExamLSurname4(){
		return examLecturer4.getSurname_th();
	}
	// LFactID4
	public void setLFactID4(String value){
		examLecturer4.setFaculty(value);
	}
	public String getLFactID4(){
			return examLecturer4.getFaculty();
	}
	// LFactName4
	public void setLFactName4(String value){
			LFactName4=value;
	}
	public String getLFactName4(){
			return LFactName4;
	}
	// LDeptID4
	public void setLDeptID4(String value){
		examLecturer4.setDepartment(value);
	}
	public String getLDeptID4(){
			return examLecturer4.getDepartment();
	}
	// LdeptName4
	public void setLDeptName4(String value){
			LdeptName4=value;
	}
	public String getLDeptName4(){
			return LdeptName4;
	}

	// Lecturer examLecturer5;
	public void setExamLecturer5ID(String value){
			examLecturer5.setLecturerID(value);
	}
	public String getExamLecturer5ID(){
			return examLecturer5.getLecturerID();
	}
	// examLAcademicAffiliation5
	public void setExamLAcademicAffiliation5(String value){
		examLecturer5.setAcademicAffiliation(value);
	}
	public String getExamLAcademicAffiliation5(){
		return examLecturer5.getAcademicAffiliation();
	}
	// examLName5
	public void setExamLName5(String value){
		examLecturer5.setName_th(value);
	}
	public String getExamLName5(){
		return examLecturer5.getName_th();
	}
	// examLSurname5
	public void setExamLSurname5(String value){
		examLecturer5.setSurname_th(value);
	}
	public String getExamLSurname5(){
		return examLecturer5.getSurname_th();
	}
	// LFactID5
	public void setLFactID5(String value){
		examLecturer5.setFaculty(value);
	}
	public String getLFactID5(){
			return examLecturer5.getFaculty();
	}
	// LFactName5
	public void setLFactName5(String value){
			LFactName5=value;
	}
	public String getLFactName5(){
			return LFactName5;
	}
	// LDeptID5
	public void setLDeptID5(String value){
		examLecturer5.setDepartment(value);
	}
	public String getLDeptID5(){
			return examLecturer5.getDepartment();
	}
	// LdeptName5
	public void setLDeptName5(String value){
			LdeptName5=value;
	}
	public String getLDeptName5(){
			return LdeptName5;
	}

	// Lecturer examLecturer6;
	public void setExamLecturer6ID(String value){
			examLecturer6.setLecturerID(value);
	}
	public String getExamLecturer6ID(){
			return examLecturer6.getLecturerID();
	}
	// examLAcademicAffiliation6
	public void setExamLAcademicAffiliation6(String value){
		examLecturer6.setAcademicAffiliation(value);
	}
	public String getExamLAcademicAffiliation6(){
		return examLecturer6.getAcademicAffiliation();
	}
	// examLName6
	public void setExamLName6(String value){
		examLecturer6.setName_th(value);
	}
	public String getExamLName6(){
		return examLecturer6.getName_th();
	}
	// examLSurname6
	public void setExamLSurname6(String value){
		examLecturer6.setSurname_th(value);
	}
	public String getExamLSurname6(){
		return examLecturer6.getSurname_th();
	}
	// LFactID6
	public void setLFactID6(String value){
		examLecturer6.setFaculty(value);
	}
	public String getLFactID6(){
			return examLecturer6.getFaculty();
	}
	// LFactName6
	public void setLFactName6(String value){
			LFactName6=value;
	}
	public String getLFactName6(){
			return LFactName6;
	}
	// LDeptID6
	public void setLDeptID6(String value){
		examLecturer6.setDepartment(value);
	}
	public String getLDeptID6(){
			return examLecturer6.getDepartment();
	}
	// LDeptName6
	public void setLDeptName6(String value){
			LdeptName6=value;
	}
	public String getLDeptName6(){
			return LdeptName6;
	}

//###########  result  ######################

	// examDate
	public void setExamDate(String value){
		examDate = value;
	}
	public String getExamDate(){
		return examDate;
	}
	// examTime
	public void setExamTime(String value){
		examTime= value;
	}
	public String getExamTime(){
		return examTime;
	}
	// examResult
	public void setExamResult(String value){
		examResult = value;
	}
	public String getExamResult(){
		return examResult;
	}

	// examLocation
	public void setExamLocation(String value){
		examLocation = value;
	}
	public String getExamLocation(){
		return examLocation;
	}
	// complete
	public void setComplete(String value){
		complete = value;
	}
	public String getComplete(){
		return complete;
	}
} // end class examThesis
