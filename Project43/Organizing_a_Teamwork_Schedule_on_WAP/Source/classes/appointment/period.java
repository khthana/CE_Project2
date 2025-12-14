package appointment;
public class period 
{
	timers ts = new timers();
	timers te = new timers();
	period()
	{
		ts = new timers(24,0);
		te = new timers(24,0);
	}
	period(timers tss,timers tee)
	{
		ts.seteq(tss);
		te.seteq(tee);
	}
	public void intersection(period p) 
	{
		if (p.ts.lesseqthan(ts) && ts.lesseqthan(p.te) && p.te.lesseqthan(te))
		{
			te.seteq(p.te);
		} else {
			if (ts.lesseqthan(p.ts) && p.ts.lesseqthan(te) && te.lesseqthan(p.te))
			{
				ts.seteq(p.ts);
			} else {
				if (p.ts.lesseqthan(ts) && te.lesseqthan(p.te))
				{
					//notthing
				} else {
					if (ts.lesseqthan(p.ts) && p.te.lessthan(te))
					{
						ts.seteq(p.ts);
						te.seteq(p.te);
					} else {
						te = new timers(24,0);
						ts = new timers(24,0);
					}
				}
			}
		}
	}
	public period intersectionreturn(period p) 
	{
		period rp = new period();
		if (p.ts.lesseqthan(ts) && ts.lesseqthan(p.te) && p.te.lesseqthan(te))
		{
			//System.out.print(ts.gethour());
			rp.ts.seteq(ts);
			//System.out.print(rp.ts.gethour());
			rp.te.seteq(p.te);
		} else {
			if (ts.lesseqthan(p.ts) && p.ts.lesseqthan(te) && te.lesseqthan(p.te))
			{
				//System.out.print("2");
				rp.ts.seteq(p.ts);
				rp.te.seteq(te);
			} else {
				if (p.ts.lesseqthan(ts) && te.lesseqthan(p.te))
				{
					//System.out.print("3");
					rp.te.seteq(te);
					rp.ts.seteq(ts);
				} else {
					if (ts.lesseqthan(p.ts) && p.te.lesseqthan(te))
					{
						//System.out.print("4");
						rp.ts.seteq(p.ts);
						rp.te.seteq(p.te);
					} else {
						rp.te = new timers(24,0);
						rp.ts = new timers(24,0);
					}
				}
			}
		}
		return rp;
	}

	public timers amount()
	{
		timers t = new timers();
		t .seteq(te);
		t.subtime(ts);
		return t;
		
	}
		
	public boolean emptyset()
	{
		if (ts.gethour() == 24)
		{
			return true;
		}
		return false;
	}
	public void printperiod()
	{
		System.out.print(ts.gethour()+":"+ts.getminute()+"-"+te.gethour()+":"+te.getminute());
	}
	public timers gettimerstart()
	{
		return ts;
	}
	public timers gettimerend()
	{
		return te;
	}
}
