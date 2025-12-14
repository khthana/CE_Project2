package appointment;
import java.util.*;
public class setofperiod 
{
	Vector v;
	setofperiod()
	{
		v = new Vector();
	}
	public void addperiod(period p)
	{
		v.addElement(p);
	}
	public void addperiod(timers ts,timers te)
	{
		period p = new period(ts,te);
		v.addElement(p);
	}
	public setofperiod minus(setofperiod s)
	{
		Vector vv = v;
		period p = new period();
		period p1 = new period();
		period p2 = new period();
			
		for (int i=0 ;i < s.v.size() ; i++)
		{
			setofperiod ss = new setofperiod();
			for (int j=0; j < vv.size(); j++)
			{
				p1 = (period)vv.elementAt(j);
				p2 = (period)s.v.elementAt(i);
				//System.out.println("at"+j);
				//p1.printperiod();//System.out.print(" ------ ");
				//p2.printperiod();//System.out.print("->");
				if (p1.gettimerstart().lessthan(p2.gettimerstart()) && p2.gettimerstart().lessthan(p1.gettimerend()) && p1.gettimerend().lesseqthan(p2.gettimerend()) )
				{
					//System.out.print("antleft");
					p = new period(p1.gettimerstart(),p2.gettimerstart());
					//p.printperiod();//System.out.println("");
					ss.addperiod(p);
				} else {
					if (p2.gettimerstart().lesseqthan(p1.gettimerstart()) && p1.gettimerstart().lessthan(p2.gettimerend()) && p2.gettimerend().lessthan(p1.gettimerend()) )
					{
					//System.out.print("antlright");
						p = new period(p2.gettimerend(),p1.gettimerend());
					//p.printperiod();//System.out.println("");
						ss.addperiod(p);
					} else {
						if (p1.gettimerstart().lessthan(p2.gettimerstart()) && p2.gettimerend().lessthan(p1.gettimerend()) )
						{
					//System.out.print("antsep");
							p = new period(p1.gettimerstart(),p2.gettimerstart());
					//p.printperiod();//System.out.print(" U ");
							ss.addperiod(p);
							p = new period(p2.gettimerend(),p1.gettimerend());
					//p.printperiod();//System.out.println("");
							ss.addperiod(p);
						} else {
							if (p2.gettimerend().lesseqthan(p1.gettimerstart()) || p1.gettimerend().lesseqthan(p2.gettimerstart()) )
							{
					//System.out.print("antnotthing");
								p = new period(p1.gettimerstart(),p1.gettimerend());
					//p.printperiod();//System.out.println("");
								ss.addperiod(p);
							}
						}
					}
				}
			}
			vv = ss.v;
		}
		setofperiod sss = new setofperiod();
		sss.v = vv;
		return sss;
	}
	public setofperiod intersection(setofperiod s)
	{
		setofperiod ss = new setofperiod();
		period p = new period();
		for (int i=0 ;i < v.size() ; i++)
		{
			for (int j=0; j < s.v.size(); j++)
			{
				p = (period)((period)v.elementAt(i)).intersectionreturn((period)s.v.elementAt(j));
				//((period)v.elementAt(i)).printperiod();
				//System.out.print(" ^ ");
				//((period)s.v.elementAt(j)).printperiod();
				//System.out.print("->");
				p.printperiod();
				//System.out.println("");
				if (!p.emptyset())
				{
					ss.addperiod(p);
				}
				
			}
		}
		return ss;
	}
	public int size()
	{
		return v.size();
	}
	public void printset()
	{
		for (int i=0;i < v.size() ;i++ )
		{
			System.out.print("("+((period)v.elementAt(i)).gettimerstart().gethour()+":");
			System.out.print(((period)v.elementAt(i)).gettimerstart().getminute()+"-");
			System.out.print(((period)v.elementAt(i)).gettimerend().gethour()+":");
			System.out.print(((period)v.elementAt(i)).gettimerend().getminute()+")");
		}
		System.out.println("");
	}
}
