/**
	@jaikla
*/

package thesis;
import student.Student;
import lecturer.Lecturer;
public class Thesis extends Object
{
	private int thesisID=0;
	private String academicYear="";
	private String topic_th="";
	private String topic_en="";
	private String approveDate="";
	private String factID="";	
	private Student std;
	private Lecturer superLecturer;
	private Lecturer join1;
	private Lecturer join2;

	public Thesis(){
		thesisID=0;
		academicYear="";
		topic_th="";
		topic_en="";
		approveDate="";
		factID="";
		std = new Student();
		superLecturer = new Lecturer();
		join1 = new Lecturer();
		join2 = new Lecturer(); 
	}

	// thesisID
	public void setThesisID(int value){
		thesisID = value;
	}
	public int getThesisID(){
		return thesisID;
	}

	//	academicYear
	public void setAcademicYear(String value){
		academicYear=value;
	}
	public String getAcademicYear(){
		return academicYear;
	}	

	// topic_th
	public void setTopic_th(String value){
		topic_th = value;
	}
	public String getTopic_th(){
		return topic_th;
	}

	// topic_en
	public void setTopic_en(String value){
		topic_en = value;
	}
	public String getTopic_en(){
		return topic_en;
	}

	// approveDate
	public void setApproveDate(String value){
		approveDate = value;
	}
	public String getApproveDate(){
		return approveDate;
	}

	//	factID
	public void setFactID(String value){
		factID=value;
	}
	public String getFactID(){
		return factID;
	}

	//	 stdID
	public void setStdID(String value){
		std.setStdID(value);
	}
	public String getStdID(){
		return std.getStdID();
	}

	//	 superID
	public void setSuperID(String value){
		superLecturer.setLecturerID(value);
	}
	public String getSuperID(){
		return superLecturer.getLecturerID();
	}
	// superAcademicAffiliation
	public void setSuperAcademicAffiliation(String value){
		superLecturer.setAcademicAffiliation(value);
	}
	public String getSuperAcademicAffiliation(){
		return superLecturer.getAcademicAffiliation();
	}
	// superName
	public void setSuperName(String value){
		superLecturer.setName_th(value);
	}
	public String getSuperName(){
		return superLecturer.getName_th();
	}
	// superSurname
	public void setSuperSurname(String value){
		superLecturer.setSurname_th(value);
	}
	public String getSuperSurname(){
		return superLecturer.getSurname_th();
	}

	//	 join1ID
	public void setJoin1ID(String value){
		join1.setLecturerID(value);
	}
	public String getJoin1ID(){
		return join1.getLecturerID();
	}
	// join1AcademicAffiliation
	public void setJoin1AcademicAffiliation(String value){
		join1.setAcademicAffiliation(value);
	}
	public String getJoin1AcademicAffiliation(){
		return join1.getAcademicAffiliation();
	}
	// join1Name
	public void setJoin1Name(String value){
		join1.setName_th(value);
	}
	public String getJoin1Name(){
		return join1.getName_th();
	}
	// join1Surname
	public void setJoin1Surname(String value){
		join1.setSurname_th(value);
	}
	public String getJoin1Surname(){
		return join1.getSurname_th();
	}
	//	 join2ID
	public void setJoin2ID(String value){
		join2.setLecturerID(value);
	}
	public String getJoin2ID(){
		return join2.getLecturerID();
	}
	// join2AcademicAffiliation
	public void setJoin2AcademicAffiliation(String value){
		join2.setAcademicAffiliation(value);
	}
	public String getJoin2AcademicAffiliation(){
		return join2.getAcademicAffiliation();
	}
	// join2Name
	public void setJoin2Name(String value){
		join2.setName_th(value);
	}
	public String getJoin2Name(){
		return join2.getName_th();
	}
	// join2Surname
	public void setJoin2Surname(String value){
		join2.setSurname_th(value);
	}
	public String getJoin2Surname(){
		return join2.getSurname_th();
	}
}// end class Thesis
