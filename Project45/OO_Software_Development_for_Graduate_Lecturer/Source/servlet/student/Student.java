package student;

public class Student	  extends Object { 
	private String stdID="";
	private String epre="";
	private String ename="";
	private String efamily="";
	private String tpre="";
	private String tname="";
	private String tfamily="";
	private String password="";
	private String inTerm="";
	private String inYear="";
	private String lecturerID="";
	private String soID="";
	private int coID=0;
	private String courseName="";
	private String factID="";
	private String factName="";
	private String deptID="";
	private String deptName="";
	private String majorID="";
	private String majorName="";
	private String minorID="";
	private String minorName="";
	private String sex="";
	
	public Student(){	// constructor
		stdID="";
		epre="";
		ename="";
		efamily="";
		tpre="";
		tname="";
		tfamily="";
		password="";
		inTerm="";
		inYear="";
		lecturerID="";
		soID="";
		coID=0;
		courseName="";
		factID="";
		factName="";
		deptID="";
		deptName="";
		majorID="";
		majorName="";
		minorID="";
		minorName="";
		sex="";
	}


	// stdID
	public void setStdID(String value){
		stdID= value;
	}
	public String getStdID(){
		return stdID;
	}

	// epre
	public void setEpre(String value){
		epre= value;
	}
	public String getEpre(){
		return epre;
	}

	// ename
	public void setEname(String value){
		ename= value;
	}
	public String getEname(){
		return ename;
	}

	// efamily
	public void setEfamily(String value){
		efamily= value;
	}
	public String getEfamily(){
		return efamily;
	}

	// tpre
	public void setTpre(String value){
		tpre= value;
	}
	public String getTpre(){
		return tpre;
	}

	// tname
	public void setTname(String value){
		tname= value;
	}
	public String getTname(){
		return tname;
	}

	// tfamily
	public void setTfamily(String value){
		tfamily= value;
	}
	public String getTfamily(){
		return tfamily;
	}

	// password
	public void setPassword(String value){
		password= value;
	}
	public String getPassword(){
		return password;
	}

	// inTerm
	public void setInTerm(String value){
		inTerm= value;
	}
	public String getInTerm(){
		return inTerm;
	}

	// inYear
	public void setInYear(String value){
		inYear= value;
	}
	public String getInYear(){
		return inYear;
	}	

	// lecturerID
	public void setLecturerID(String value){
		lecturerID= value;
	}
	public String getLecturerID(){
		return lecturerID;
	}

	// coID
	public void setCoID(int value){
		coID= value;
	}
	public int getCoID(){
		return coID;
	}
	// courseName
	public void setCourseName(String value){
		courseName= value;
	}
	public String getCourseName(){
		return courseName;
	}

	// factID
	public void setFactID(String value){
		factID= value;
	}
	public String getFactID(){
		return factID;
	}
	// factName
	public void setFactName(String value){
		factName= value;
	}
	public String getFactName(){
		return factName;
	}

	// deptID
	public void setDeptID(String value){
		deptID= value;
	}
	public String getDeptID(){
		return deptID;
	}
	// deptName
	public void setDeptName(String value){
		deptName= value;
	}
	public String getDeptName(){
		return deptName;
	}

	// majorID
	public void setMajorID(String value){
		majorID= value;
	}
	public String getMajorID(){
		return majorID;
	}
	// majorName
	public void setMajorName(String value){
		majorName= value;
	}
	public String getMajorName(){
		return majorName;
	}

	// minorID
	public void setMinorID(String value){
		minorID= value;
	}
	public String getMinorID(){
		return minorID;
	}
	// minorName
	public void setMinorName(String value){
		minorName= value;
	}
	public String getMinorName(){
		return minorName;
	}
	
	// sex
	public void setSex(String value){
		sex= value;
	}
	public String getSex(){
		return sex;
	}

} // END CLASS Student 
