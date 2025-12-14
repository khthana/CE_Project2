package appointment;
import java.util.*;
class test 
{
	public static void main(String[] args) 
	{
		setofperiod s1 = new setofperiod();
		setofperiod s2 = new setofperiod();
		setofperiod s3 = new setofperiod();
		period p1 = new period(new timers(10,0),new timers(12,0));
		period p2 = new period(new timers(5,0),new timers(8,0));
		period p3 = new period(new timers(10,0),new timers(15,0));
		period p4 = new period(new timers(9,0),new timers(11,30));
		period p5 = new period(new timers(4,0),new timers(8,0));
		period p6 = new period(new timers(9,0),new timers(15,0));
		System.out.println("antant");
		s1.addperiod(p1);
		//s1.addperiod(p2);
		//s1.addperiod(p3);
		s2.addperiod(p4);
		//s2.addperiod(p5);
		//s2.addperiod(p6);
		s3 = s1.intersection(s2);
		s3.printset();
		//s1.printset();
		//s2.printset();
		//s3.printset();

		/*
		System.out.print(p1.gettimerstart().gethour());
		System.out.println(p1.gettimerstart().getminute());
		System.out.print(p1.gettimerend().gethour());
		System.out.println(p1.gettimerend().getminute());
		*/
	}
}
