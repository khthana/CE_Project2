/**
	@jaikla
*/

package scholarship;

import scholarship.*;
public class thesisScholarship extends paperScholarship
{
   private int money;
   
   // constructor
   public thesisScholarship(){	    
		money = 0;
   }

   // amountMoney     
   public void setMoney(int value){
		money=value;
   }
   public int getMoney(){
		return money;
   }
}
