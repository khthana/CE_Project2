/**
	@jaikla
*/
package scholarship;

import student.*;
import scholarship.*;
public class paperScholarshipOffer extends ScholarshipOffer
{
	
	private int money;

	// ------ Constructor
	public paperScholarshipOffer(){		
		money =0;
	}

	// Money 
	public void setMoney(int value){
		money = value;
	}
	public long getMoney (){
		return money;
	}			

}//end class paperScholarshipOffer

