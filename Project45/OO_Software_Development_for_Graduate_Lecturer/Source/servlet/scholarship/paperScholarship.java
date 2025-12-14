/**
	@jaikla
*/

package scholarship;
public class paperScholarship extends Object
{
	private int scholarshipID;
	private String academicYear;
	private String name;
	private String provider;
	private String[] condition = new String[10];
	private String type;
	private String date;


	//  constructor
	public paperScholarship(){
		scholarshipID=0;
		academicYear="";
		name="";
		provider ="";		
		date="";
		type="";
		condition[0]="";
		condition[1]="";
		condition[2]="";
		condition[3]="";
		condition[4]="";
		condition[5]="";
		condition[6]="";
		condition[7]="";
		condition[8]="";
		condition[9]="";

	}

	// scholarshipID
	public void setScholarshipID(int value){
		scholarshipID=value;
	}
	public int getScholarshipID(){
		return scholarshipID;
	}

	// academicYear
	public void setAcademicYear(String value){
		academicYear=value;
	}
	public String getAcademicYear(){
		return academicYear;
	}

	// name
	public void setName(String value){
		name=value;
	}
	public String getName(){
		return name;
	}

	// provider
	public void setProvider(String value){
		provider=value;
	}
	public String getProvider(){
		return provider;
	}

	// date
	public void setDate(String value){
		date=value;
	}
	public String getDate(){
		return date;
	}	
	//	type;
	public void setType(String value){
		type=value;
	}
	public String getType(){
		return type;
	}	

	// condition
	public void setCondition(String[] value){
		for(int i=0;i<value.length;i++){			
			condition[i]=value[i];
		}
	}
	public String[] getCondition(){
		return condition;
	}
	public void setCondition(String value,int index){
		condition[index] = value;
	}
	public String getCondition(int index){
		return condition[index];
	}


}// end class paperScholarship
