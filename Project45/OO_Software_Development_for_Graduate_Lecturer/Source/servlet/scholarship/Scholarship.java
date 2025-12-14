/**
	@jaikla
*/

package scholarship;

import scholarship.*;
public class Scholarship extends thesisScholarship
{
   private int numberScholarship;
   private String duration;
   
   public Scholarship(){
		numberScholarship = 0;
		duration = "";
   }

	// numberScholarship
	public void setNumberScholarship(int value){
		numberScholarship=value;    
	}
	public int getNumberScholarship(){
		return numberScholarship;
	}	

	// duration
	public void setDuration(String value){
		duration=value;    
	}
	public String getDuration(){
		return duration;
	}   
	
}// end Class AcademicScholarShip
