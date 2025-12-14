/**
	@jaikla
*/

package scholarship;

import scholarship.*;
import student.*;
public class ScholarshipOffer extends Object
{
	private Student std;
	private Scholarship schship;
	private String date;
	private String academicYear;
	private int money=0;

	// ------ Constructor
	public ScholarshipOffer( ){
		std = new Student();
		schship = new Scholarship();		
		date="";
		academicYear="";
		money=0;
	}

	// date
	public void setOfferDate(String value){
		date=value;
	}
	public String getOfferDate(){
		return date;
	}
	// academicYear
	public void setOfferAcademicYear(String value){
		academicYear=value;
	}
	public String getOfferAcademicYear(){
		return academicYear;
	}
	
	// money
	public void setOfferMoney(int value){
		money=value;
	}
	public int getOfferMoney(){
		return money;
	}

	// StdID
	public void setStdID(String value){
		 std.setStdID(value);
	}
	public String getStdID(){
		return std.getStdID();
	}	
	// StdTitle
	public void setStdTitle(String value){
		 std.setTpre(value);
	}
	public String getStdTitle(){
		return std.getTpre();
	}
	// StdName
	public void setStdName(String value){
		 std.setTname(value);
	}
	public String getStdName(){
		return std.getTname();
	}
	
	// StdSurname
	public void setStdSurname(String value){
		 std.setTfamily(value);
	}
	public String getStdSurname(){
		return std.getTfamily();
	}

	// StdCourseID
	public void setStdCourseID(int value){
		 std.setCoID(value);
	}
	public int getStdCourseID(){
		return std.getCoID();
	}
	// StdCourse
	public void setStdCourseName(String value){
		 std.setCourseName(value);
	}
	public String getStdCourseName(){
		return std.getCourseName();
	}
	
	// StdFactID
	public void setStdFactID(String value){
		 std.setFactID(value);
	}
	public String getStdFactID(){
		return std.getFactID();
	}
	// StdFactName
	public void setStdFactName(String value){
		 std.setFactName(value);
	}
	public String getStdFactName(){
		return std.getFactName();
	}
	
	// StdDeptID
	public void setStdDeptID(String value){
		 std.setDeptID(value);
	}
	public String getStdDeptID(){
		return std.getDeptID();
	}
	// StdDeptName
	public void setStdDeptName(String value){
		 std.setDeptName(value);
	}
	public String getStdDeptName(){
		return std.getDeptName();
	}

	// StdMajorID
	public void setStdMajorID(String value){
		 std.setMajorID(value);
	}
	public String getStdMajorID(){
		return std.getMajorID();
	}
	// StdMajorName
	public void setStdMajorName(String value){
		 std.setMajorName(value);
	}
	public String getStdMajorName(){
		return std.getMajorName();
	}
	
	// ScholarshipID
	public void setScholarshipID(int value){
		schship.setScholarshipID(value);
	}
	public int getScholarshipID(){
		return schship.getScholarshipID();
	}
	// ScholarshipName
	public void setScholarshipName(String value){
		 schship.setName(value);
	}
	public String getScholarshipName(){
		return schship.getName();
	}
	// ScholarshipType
	public void setScholarshipType(String value){
		 schship.setType(value);
	}
	public String getScholarshipType(){
		return schship.getType();
	}
	// ScholarshipYear
	public void setScholarshipYear(String value){
		 schship.setAcademicYear(value);
	}
	public String getScholarshipYear(){
		return schship.getAcademicYear();
	}
	// NumberScholarship
	public void setNumberScholarship(int value){
		 schship.setNumberScholarship(value);
	}
	public int getNumberScholarship(){
		return schship.getNumberScholarship();
	}
	// ScholarshipMoney
	public void setScholarshipMoney(int value){
		 schship.setMoney(value);
	}
	public int getScholarshipMoney(){
		return schship.getMoney();
	}
	// ScholarshipDuration
	public void setScholarshipDuration(String value){
		 schship.setDuration(value);
	}
	public String getScholarshipDuration(){
		return schship.getDuration();
	}

}// end Class scholarshipOffer
