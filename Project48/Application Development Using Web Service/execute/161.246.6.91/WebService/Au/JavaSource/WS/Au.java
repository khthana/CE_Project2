/*
 * Created on Feb 19, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package WS;
import ConnectDB.*;
import Type.*;
import java.util.*;
/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Au {
	
	public boolean reservation(int ClassID, String Email, String Name, String Surname, String PhoneNo)
	{
		ClassRoom Cla = ClassRoom.find(ClassID);
		if(Cla == null)
			return false;
		if(Cla.getAvailableSeat() == 0)
			return false;
		Booker user = Booker.find(Email);
		if(user == null)
		{
			user = new Booker( Email, Name, Surname, PhoneNo);
			if(!user.add())
				return false;
		}
		Booking booking = new Booking(0, ClassID, Email, false, null);
		if(!booking.add())
			return false;
		Cla.setAvailableSeat(Cla.getAvailableSeat() -1);
		if(!Cla.update())
			return false;
		return true;
	}	
	
	public String getCourseAll()
	{
		ClassRoom c = new ClassRoom();
		return c.getAll();
	}
	
	public String getCourse(String Subject, int Period)
	{
		return ClassRoom.findCourse(Subject, Period);
	}
	
	public boolean buyClass(int ClassID, String Email, String ReceiveID)
	{
		if(Booking.receiveIsExist(ReceiveID))
			return false;
		Vector booking = Booking.findForBuy(ClassID, Email);
		if(booking.size() == 0)
			return false;
		for(int i = 0 ; i < booking.size() ; i++)
		{
			Booking book = (Booking)booking.get(i);
			book.setPatStatus(ReceiveID);
			book.update();
		}
		return true;
	}
	
	public String getCourseFromEmail(String Email)
	{
		return ClassRoom.findCourse(Email);
	}
	
	public boolean cancel(int ClassID, String Email)
	{
		Vector booking = Booking.findForBuy(ClassID, Email);
		if(booking.size() == 0)
			return false;
		Booking book = (Booking)booking.get(0);
		ClassRoom cla = ClassRoom.find(ClassID);
		book.setCancel(true);
		cla.setAvailableSeat(cla.getAvailableSeat()+1);
		if(!book.update())
			return false;
		if(!cla.update())
			return false;
		return true;
	}

}
