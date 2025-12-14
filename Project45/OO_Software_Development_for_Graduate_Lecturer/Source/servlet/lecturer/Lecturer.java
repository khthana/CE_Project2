/**
	@jaikla
*/

package lecturer;

import java.lang.Object;
public class Lecturer  extends Object
{
	private String lecturerID="";
	private String title_th="";
	private String name_th="";
	private String surname_th="";
	private String title_en="";
	private String name_en="";
	private String surname_en="";
	private String sex="";
	private String birthday="";
	private String adminPosition="";
	private String contactAddress="";
	private String telephone="";
	private String fax="";
	private String email="";
	private String url="";
	private String academicAffiliation="";
	private String qualification="";
	private String experience="";
	private String[] expertise;		// -- array
	private String B_institute="";
	private String B_year="";
	private String B_major="";
	private String B_degree="";
	private String M_institute="";
	private String M_year="";
	private String M_major="";
	private String M_degree="";
	private String D_institute="";
	private String D_year="";
	private String D_major="";
	private String D_degree="";
	private String O_institute="";
	private String O_year="";
	private String O_major="";
	private String O_degree="";
	private String memberStatus="";
	private String M_teachCourse="";
	private String M_examThesis="";
	private String M_superviseThesis="";
	private String D_teachCourse="";
	private String D_examThesis="";
	private String D_superviseThesis="";
	private String faculty="";
	private String factName="";
	private String department="";
	private String deptName="";
	private String major="";
	private String majorName="";
	private String teachFaculty1="";
	private int teachCourse1=0;
	private String teachMajor1="";
	private String teachFaculty2="";
	private int teachCourse2=0;
	private String teachMajor2="";
	private String teachFaculty3="";
	private int teachCourse3=0;
	private String teachMajor3="";
	public Lecturer(){
	         lecturerID="";
	         title_th="";
	         name_th="";
	         surname_th="";
	         title_en="";
	         name_en="";
	         surname_en="";
	         sex="";
	         birthday="";
	         adminPosition="";
	         contactAddress="";
	         telephone="";
	         fax="";
	         email="";
	         url="";
	         academicAffiliation="";
	         qualification="";
	         experience="";
	         expertise=new String[6];		// -- array
			 expertise[0]="";
			 expertise[1]="";
			 expertise[2]="";
			 expertise[3]="";
			 expertise[4]="";
			 expertise[5]="";
	         B_institute="";
	         B_year="";
	         B_major="";
	         B_degree="";
	         M_institute="";
	         M_year="";
	         M_major="";
	         M_degree="";
	         D_institute="";
	         D_year="";
	         D_major="";
	         D_degree="";
	         O_institute="";
	         O_year="";
	         O_major="";
	         O_degree="";
	         memberStatus="";
	         M_teachCourse="";
	         M_examThesis="";
	         M_superviseThesis="";
	         D_teachCourse="";
	         D_examThesis="";
	         D_superviseThesis="";
	         faculty="";
			 factName="";
	         department="";
			 deptName="";
	         major="";
			 majorName="";
	         teachFaculty1="";
	         teachCourse1=0;
	         teachMajor1="";
	         teachFaculty2="";
	         teachCourse2=0;
	         teachMajor2="";
	         teachFaculty3="";
	         teachCourse3=0;
	         teachMajor3="";
	}
	// lecturerID
	public void setLecturerID(String value) {
		lecturerID=value;
	}	
	public String getLecturerID(){
		return lecturerID;
	}
	
	// title_th
	public void setTitle_th(String value){
		title_th=value;	
	}
	public String getTitle_th(){
		return title_th;
	}

	// name_th
	public void setName_th(String value){
		name_th=value;
	}
	public String getName_th(){
		return name_th;
	}

	//  surname_th
	public void setSurname_th(String value){
		surname_th=value;
	}
	public String getSurname_th(){
		return surname_th;
	}

	// title_en
	public void setTitle_en(String value){
		title_en=value;	
	}
	public String getTitle_en(){
		return title_en;
	}

	// name_en
	public void setName_en(String value){
		name_en=value;
	}
	public String getName_en(){
		return name_en;
	}

	//  surname_en
	public void setSurname_en(String value){
		surname_en=value;
	}
	public String getSurname_en(){
		return surname_en;
	}

	// sex
	public void setSex(String value){
		sex=value;
	}
	public String getSex(){
		return sex;
	}

	// birthday
	public void setBirthday(String value){
		birthday=value;
	}
	public String getBirthday(){
		return birthday;
	}

	// adminPostion
	public void setAdminPosition(String value){
		adminPosition=value;
	}
	public String getAdminPosition(){
		return adminPosition;
	}

	// contactAddress
	public void setContactAddress(String value){
		contactAddress=value;
	}
	public String getContactAddress(){
		return contactAddress;
	}

	// telephone
	public void setTelephone(String value){
		telephone=value;
	}
	public String getTelephone(){
		return telephone;
	}

	// fax 
	public void setFax(String value){
		fax=value;
	}
	public String getFax(){
		return fax;
	}

	// email
	public void setEmail(String value){
		email=value;
	}
	public String getEmail(){
		return email;
	}

	// url
	public void setUrl(String value){
		url=value;
	}
	public String getUrl(){
		return url;
	}

	// academicAffiliation
	public void setAcademicAffiliation(String value){
		academicAffiliation=value;
	}
	public String getAcademicAffiliation(){
		return academicAffiliation;
	}

	// qualification
	public void setQualification(String value){
		qualification=value;
	}
	public String getQualification(){
		return qualification;
	}

	// experience
	public void setExperience(String value){
		experience=value;
	}
	public String getExperience(){
		return experience;
	}

	// expertise
	public void setExpertise(String value,int index){
		expertise[index]=value;		
	}
	public String getExpertise(int index){
		return expertise[index];
	}

	// B_institute
	public void setB_institute(String value){
		B_institute=value;
	}
	public String getB_institute(){
		return B_institute;
	}

	// B_year
	public void setB_year(String value){
		B_year=value;
	}
	public String getB_year(){
		return B_year;
	}

	// B_major
	public void setB_major(String value){
		B_major=value;
	}
	public String getB_major(){
		return B_major;
	}

	// B_degree
	public void setB_degree(String value){
		B_degree=value;
	}
	public String getB_degree(){
		return B_degree;
	}//--

	// M_institute
	public void setM_institute(String value){
		M_institute=value;
	}
	public String getM_institute(){
		return M_institute;
	}

	// M_year
	public void setM_year(String value){
		M_year=value;
	}
	public String getM_year(){
		return M_year;
	}

	// M_major
	public void setM_major(String value){
		M_major=value;
	}
	public String getM_major(){
		return M_major;
	}

	// M_degree
	public void setM_degree(String value){
		M_degree=value;
	}
	public String getM_degree(){
		return M_degree;
	}//--

	// D_institute
	public void setD_institute(String value){
		D_institute=value;
	}
	public String getD_institute(){
		return D_institute;
	}

	// D_year
	public void setD_year(String value){
		D_year=value;
	}
	public String getD_year(){
		return D_year;
	}

	// D_major
	public void setD_major(String value){
		D_major=value;
	}
	public String getD_major(){
		return D_major;
	}

	// D_degree
	public void setD_degree(String value){
		D_degree=value;
	}
	public String getD_degree(){
		return D_degree;
	}//--

	// O_institute
	public void setO_institute(String value){
		O_institute=value;
	}
	public String getO_institute(){
		return O_institute;
	}

	// B_year
	public void setO_year(String value){
		O_year=value;
	}
	public String getO_year(){
		return O_year;
	}

	// O_major
	public void setO_major(String value){
		O_major=value;
	}
	public String getO_major(){
		return O_major;
	}

	// O_degree
	public void setO_degree(String value){
		O_degree=value;
	}
	public String getO_degree(){
		return O_degree;
	}

	// memberStatus
	public void setMemberStatus(String value){
		memberStatus=value;
	}
	public String getMemberStatus(){
		return memberStatus;
	}

	// M_teachCourse
	public void setM_teachCourse(String value){
		M_teachCourse=value;
	}
	public String getM_teachCourse(){
		return M_teachCourse;
	}

	// M_examThesis
	public void setM_examThesis(String value){
		M_examThesis=value;
	}
	public String getM_examThesis(){
		return M_examThesis;
	}

	// M_superviseThesis
	public void setM_superviseThesis(String value){
		M_superviseThesis=value;
	}
	public String getM_superviseThesis(){
		return M_superviseThesis;
	}//--

	// D_teachCourse
	public void setD_teachCourse(String value){
		D_teachCourse=value;
	}
	public String getD_teachCourse(){
		return D_teachCourse;
	}

	// D_examThesis
	public void setD_examThesis(String value){
		D_examThesis=value;
	}
	public String getD_examThesis(){
		return D_examThesis;
	}

	// M_superviseThesis
	public void setD_superviseThesis(String value){
		D_superviseThesis=value;
	}
	public String getD_superviseThesis(){
		return D_superviseThesis;
	}

	// faculty
	public void setFaculty(String  value){
		faculty=value;
	}
	public String getFaculty(){
		return faculty;
	}
	
	// factName
	public void setFactName(String  value){
		factName=value;
	}
	public String getFactName(){
		return factName;
	}

	// department
	public void setDepartment(String value){
		department=value;
	}
	public String getDepartment(){
		return department;
	}
	
	// deptName
	public void setDeptName(String value){
		deptName=value;
	}
	public String getDeptName(){
		return deptName;
	}

	// major
	public void setMajor(String value){
		major=value;
	}
	public String getMajor(){
		return major;
	}

	// majorName
	public void setMajorName(String value){
		majorName=value;
	}
	public String getMajorName(){
		return majorName;
	}


	// teachFaculty1
	public void setTeachFaculty1(String  value){
		teachFaculty1=value;
	}
	public String getTeachFaculty1(){
		return teachFaculty1;
	}
	
	// teachCourse1
	public void setTeachCourse1(int value){
		teachCourse1=value;
	}
	public int getTeachCourse1(){
		return teachCourse1;
	}

	// teachMajor1
	public void setTeachMajor1(String value){
		teachMajor1=value;
	}
	public String getTeachMajor1(){
		return teachMajor1;
	}

	// teachFaculty2
	public void setTeachFaculty2(String  value){
		teachFaculty2=value;
	}
	public String getTeachFaculty2(){
		return teachFaculty2;
	}
	
	// teachCourse2
	public void setTeachCourse2(int value){
		teachCourse2=value;
	}
	public int getTeachCourse2(){
		return teachCourse2;
	}

	// teachMajor2
	public void setTeachMajor2(String value){
		teachMajor2=value;
	}
	public String getTeachMajor2(){
		return teachMajor2;
	}

	// teachFaculty3
	public void setTeachFaculty3(String  value){
		teachFaculty3=value;
	}
	public String getTeachFaculty3(){
		return teachFaculty3;
	}
	
	// teachCourse3
	public void setTeachCourse3(int value){
		teachCourse3=value;
	}
	public int getTeachCourse3(){
		return teachCourse3;
	}

	// teachMajor3
	public void setTeachMajor3(String value){
		teachMajor3=value;
	}
	public String getTeachMajor3(){
		return teachMajor3;
	}
}//end Class Lecturer