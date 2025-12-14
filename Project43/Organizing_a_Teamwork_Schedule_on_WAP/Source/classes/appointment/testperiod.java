package appointment;
import java.util.*;
class testperiod
{
	public static void main(String[] args) 
	{
		period p1 = new period(new timers(2,0),new timers(4,0));
		period p2 = new period(new timers(2,0),new timers(4,0));
		period p3 = new period(new timers(6,0),new timers(8,0));
		period p4 = new period(new timers(2,0),new timers(4,0));
		period p5 = new period(new timers(2,0),new timers(8,0));
		period p6 = new period(new timers(11,0),new timers(15,0));
		period p9 = new period();
		p9=	p1.intersectionreturn(p2);	
		p9.printperiod();
		System.out.println("");
		p1.intersection(p2);
		System.out.print(p1.gettimerstart().gethour());
		System.out.println(p1.gettimerstart().getminute());
		System.out.print(p1.gettimerend().gethour());
		System.out.println(p1.gettimerend().getminute());

	}
}
