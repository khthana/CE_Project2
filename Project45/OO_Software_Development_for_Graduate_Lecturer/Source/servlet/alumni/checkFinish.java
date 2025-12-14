/**
	@jaikla
*/

package alumni;
public class checkFinish extends Object
{
 
	private String stdID ="";
	private String title="";
	private String name="";
	private String surname="";	
	private String courseName="";
	private String majorName="";
	private String factName="";
	private String deptName="";
	private int thesisID =0;
	private String topic_th="";
	private String topic_en="";
	private String GPA ="";
	private String thesisComplete ="";
	private String alumniStatus="";
   // constructor
   public checkFinish(){
		stdID ="";
		title="";
		name="";
		surname="";
		courseName="";
		majorName="";
		factName="";
		deptName="";
		thesisID =0;
		topic_th="";
		topic_en="";
		GPA ="";
		thesisComplete ="";
   }

	// stdID
	public void setStdID(String value){
	   stdID=value;
   }
   public String getStdID(){
	   return stdID;
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

	// courseName
	public void setCourseName(String value){
	   courseName=value;
	}
	public String getCourseName(){
	   return courseName;
	}
	// majorName
	public void setMajorName(String value){
	   majorName=value;
	}
	public String getMajorName(){
	   return majorName;
	}
	// factName
	public void setFactName(String value){
	   factName=value;
	}
	public String getFactName(){
	   return factName;
	}
	// deptName
	public void setDeptName(String value){
	   deptName=value;
	}
	public String getDeptName(){
	   return deptName;
	}
	
	// thesisID
	public void setThesisID(int value){
		thesisID=value;
	}
	public int getThesisID(){
		return thesisID;
	}
	// topic_th
	public void setTopic_th(String value){
		topic_th=value;
	}
	public String getTopic_th(){
		return topic_th;
	}
	// topic_en
	public void setTopic_en(String value){
		topic_en=value;
	}
	public String getTopic_en(){
		return topic_en;
	}
    // GPA
	public void setGPA(String value){
	   GPA=value;
   }
   public String getGPA(){
	   return GPA;
   }

   // thesisComplete
   public void setThesisComplete(String value){
	   thesisComplete=value;
   }
   public String getThesisComplete(){
	   return thesisComplete;
   }
	// alumniStatus
	public void setAlumniStatus(String value){
	    alumniStatus=value;
   }
   public String getAlumniStatus(){
	   return  alumniStatus;
   }

}// end Class checkFinish
