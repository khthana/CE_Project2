/**
	@jaikla
*/

package alumni;
public class Alumni extends Object
{
   private String academicYear ="";
   private String alumniID ="";
   private String title ="";
   private String name ="";
   private String surname ="";
   private String sex ="";
   private String factID="";
   private String factName ="";
   private int courseID=0;
   private String courseName="";
   private String deptID = "";
   private String deptName ="";
   private String majorID="";
   private String majorName ="";
   private int thesisID=0;
   private String researchType ="";
   private String researchTopic_th ="";
   private String researchTopic_en ="";
   private String superID="";
   private String superAcademicAffiliation ="";
   private String superName ="";
   private String superSurname ="";
   private String join1ID="";
   private String join1AcademicAffiliation ="";
   private String join1name ="";
   private String join1Surname ="";
   private String join2ID="";
   private String join2AcademicAffiliation ="";
   private String join2name ="";
   private String join2Surname ="";
   private String birthday ="";
   private String oldBaechelorDegree ="";
   private String oldBaechelorIntitute ="";
   private String oldBaechelorYear ="";
   private String oldMasterDegree ="";
   private String oldMasterIntitute ="";
   private String oldMasterYear ="";
   private String paper ="";
   private String award ="";
   private String experience ="";
   private String work ="";
   private String officeAddress ="";
   private String officeTelephone ="";
   private String address ="";
   private String telephone ="";
   private String email ="";

   // constructor
   public Alumni(){
			academicYear="";
			alumniID ="";
            title ="";
            name ="";
            surname ="";
            sex ="";
			factID="";
            factName ="";
			courseID = 0;
			courseName="";
			deptID="";
            deptName ="";
			majorID="";
            majorName ="";
			thesisID=0;
            researchType ="";
            researchTopic_th ="";
            researchTopic_en ="";
            superAcademicAffiliation ="";
            superName ="";
            superSurname ="";
            join1AcademicAffiliation ="";
            join1name ="";
            join1Surname ="";
            join2AcademicAffiliation ="";
            join2name ="";
            join2Surname ="";
            birthday ="";
            oldBaechelorDegree ="";
            oldBaechelorIntitute ="";
            oldBaechelorYear ="";
            oldMasterDegree ="";
            oldMasterIntitute ="";
            oldMasterYear ="";
            paper ="";
            award ="";
            experience ="";
            work ="";
            officeAddress ="";
            officeTelephone ="";
            address ="";
            telephone ="";
			email ="";
   }
    // academicYear
	public void setAcademicYear(String value){
	   academicYear=value;
   }
   public String getAcademicYear(){
	   return academicYear;
   }

   // alumniID
   public void setAlumniID(String value){
	   alumniID=value;
   }
   public String getAlumniID(){
	   return alumniID;
   }

   // title
   public void setTitle(String value){
	   title=value;
   }
   public String getTitle(){
	   return title;
   }

   // name
   public void setName(String value){
	   name=value;
   }
   public String getName(){
	   return name;
   }

   // surname
   public void setSurname(String value){
	   surname=value;
   }
   public String getSurname(){
	   return surname;
   }

   // sex
   public void setSex(String value){
	   sex=value;
   }
   public String getSex(){
	   return sex;
   }

	 // factID
   public void setFactID(String value){
	   factID=value;
   }
   public String getFactID(){
	   return factID;
   }
   // factName
   public void setFactName(String value){
	   factName=value;
   }
   public String getFactName(){
	   return factName;
   }

    // courseID
	public void setCourseID(int value){
	   courseID=value;
	 }
	 public int getCourseID(){
	   return courseID;
	}
   // courseName
	public void setCourseName(String value){
	   courseName=value;
	 }
	 public String getCourseName(){
	   return courseName;
	}

	// deptID
   public void setDeptID(String value){
	   deptID =value;
   }
   public String getDeptID(){
	   return deptID;
   }
   // deptName 
   public void setDeptName (String value){
	   deptName =value;
   }
   public String getDeptName (){
	   return deptName ;
   }

	 // majorID
   public void setMajorID(String value){
	   majorID =value;
   }
   public String getMajorID(){
	   return majorName ;
   }
   // majorName
   public void setMajorName(String value){
	   majorName =value;
   }
   public String getMajorName(){
	   return majorName ;
   }

	// thesisID
   public void setThesisID(int value){
	   thesisID =value;
   }
   public int getThesisID(){
	   return thesisID;
   }

   // researchType
   public void setResearchType(String value){
	   researchType =value;
   }
   public String getResearchType(){
	   return researchType;
   }

   // researchTopic_th
   public void setResearchTopic_th(String value){
	  researchTopic_th=value;
   }
   public String getResearchTopic_th(){
	   return researchTopic_th;
   }

   // researchTopic_en
   public void setResearchTopic_en(String value){
	 researchTopic_en=value;
   }
   public String getResearchTopic_en(){
	   return researchTopic_en;
   }
	
	// superID
   public void setSuperID(String value){
	  superID=value;
   }
   public String getSuperID(){
	   return superID;
   }

   // superAcademicAffiliation
   public void setSuperAcademicAffiliation(String value){
	  superAcademicAffiliation=value;
   }
   public String getSuperAcademicAffiliation(){
	   return superAcademicAffiliation;
   }

   // superName
   public void setSuperName(String value){
	  superName=value;
   }
   public String getSuperName(){
	   return superName;
   }

   // superSurname
   public void setSuperSurname(String value){
	  superSurname=value;
   }
   public String getSuperSurname(){
	   return superSurname;
   }//--

  // join1ID
   public void setJoin1ID(String value){
	  join1ID=value;
   }
   public String getJoin1ID(){
	   return join1ID;
   }

	// join1AcademicAffiliation
   public void setJoin1AcademicAffiliation(String value){
	  join1AcademicAffiliation=value;
   }
   public String getJoin1AcademicAffiliation(){
	   return join1AcademicAffiliation;
   }

   //  join1name
   public void setJoin1Name(String value){
		join1name=value;
   }
   public String getJoin1Name(){
	   return  join1name;
   }

   // join1Surname
   public void setJoin1Surname(String value){
	  join1Surname=value;
   }
   public String getJoin1Surname(){
	   return join1Surname;
   }//--

	// join2ID
   public void setJoin2ID(String value){
	  join2ID=value;
   }
   public String getJoin2ID(){
	   return join2ID;
   }

   // join2AcademicAffiliation
   public void setJoin2AcademicAffiliation(String value){
	  join2AcademicAffiliation=value;
   }
   public String getJoin2AcademicAffiliation(){
	   return join2AcademicAffiliation;
   }

   //  join1name
   public void setJoin2Name(String value){
		join2name=value;
   }
   public String getJoin2Name(){
	   return  join2name;
   }

   // join2Surname
   public void setJoin2Surname(String value){
	  join2Surname=value;
   }
   public String getJoin2Surname(){
	   return join2Surname;
   }//--

   // birthday 
   public void setBirthday (String value){
		birthday =value;
   }
   public String getBirthday (){
	   return birthday ;
   }

   // oldBaechelorDegree
   public void setOldBaechelorDegree(String value){
		oldBaechelorDegree =value;
   }
   public String getOldBaechelorDegree(){
	   return oldBaechelorDegree ;
   }

   // oldBaechelorIntitute
   public void setOldBaechelorIntitute(String value){
		oldBaechelorIntitute=value;
   }
   public String getOldBaechelorIntitute(){
	   return oldBaechelorIntitute;
   }
 
    //  oldBaechelorYear
   public void setOldBaechelorYear(String value){
		 oldBaechelorYear=value;
   }
   public String getOldBaechelorYear(){
	   return oldBaechelorYear;
   }//--

   // oldMasterDegree
   public void setOldMasterDegree(String value){
		oldMasterDegree =value;
   }
   public String getOldMasterDegree (){
	   return oldMasterDegree ;
   }

   // oldMasterIntitute
   public void setOldMasterIntitute(String value){
		oldMasterIntitute=value;
   }
   public String getOldMasterIntitute(){
	   return oldMasterIntitute;
   }
 
    //  oldBaechelorYear
   public void setOldMasterYear(String value){
		 oldMasterYear=value;
   }
   public String getOldMasterYear(){
	   return oldMasterYear;
   }//--

    //  paper
   public void setPaper(String value){
		 paper=value;
   }
   public String getPaper(){
	   return paper;
   }

    //  award
   public void setAward(String value){
		 award=value;
   }
   public String getAward(){
	   return award;
   }

    //  experience
   public void setExperience(String value){
		 experience=value;
   }
   public String getExperience(){
	   return experience;
   }

    //  work
   public void setWork(String value){
		 work=value;
   }
   public String getWork(){
	   return work;
   }

    //  officeAddress
   public void setOfficeAddress(String value){
		 officeAddress=value;
   }
   public String getOfficeAddress(){
	   return officeAddress;
   }

    // officeTelephone
   public void setOfficeTelephone(String value){
		 officeTelephone=value;
   }
   public String getOfficeTelephone(){
	   return officeTelephone;
   }

    // address
   public void setAddress(String value){
		 address=value;
   }
   public String getAddress(){
	   return address;
   }

    // telephone
   public void setTelephone(String value){
		 telephone=value;
   }
   public String getTelephone(){
	   return telephone;
   }

    // email
   public void setEmail(String value){
		 email=value;
   }
   public String getEmail(){
	   return email;
   }

}// end Class Alumni
