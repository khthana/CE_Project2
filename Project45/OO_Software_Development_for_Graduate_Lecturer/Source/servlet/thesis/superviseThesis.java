/**
	@jaikla
*/

package thesis;

import lecturer.*;
import thesis.*;
public class superviseThesis extends Object {
	String lecturerID="";
	int thesisID=0;
	String superviseStatus="";
	
	// -- constractor
	public superviseThesis(){
		lecturerID="";
		thesisID=0;
		superviseStatus="";		
	}
	
	// lecturerID
	public void setLecturerID(String value){
		lecturerID=value;	
	}
	public String getLecturerID(){
		return lecturerID;
	}
	
	// thesisID
	public void setThesisID(int value){
		thesisID=value;	
	}
	public int getThesisID(){
		return thesisID;
	}

	// superviseStatus
	public void setSuperviseStatus(String value){
		superviseStatus=value;	
	}
	public String getSuperviseStatus(){
		return superviseStatus;
	}

}// end Class superviseThesis
