public class timers
{
	int hour;
	int minute;
	timers(){}
	timers(int a,int b)
	{
		hour = a;
		minute = b;
	}
	public void seteq(timers t)
	{
		hour = t.hour;
		minute = t.minute;
	}
	public void addtime(timers t)
	{
		hour = hour + t.hour;
		minute = minute + t.minute;
		if (minute >= 60)
		{
			minute = minute - 60;
			hour = hour + 1;
		}
	}
	public void subtime(timers t)
	{
		if (minute < t.minute)
		{
			minute = minute + 60 - t.minute;
			hour = hour - 1 - t.hour;
		}else{
			minute = minute - t.minute;
			hour = hour - t.hour;
		}
	}
	public boolean moreeqthan(timers t) {
		if (hour > t.hour)
		{
			return true;
		}
		if ( (hour == t.hour) && (minute >= t.minute) )
		{
			return true;
		}
		return false;
	}
	
	public boolean morethan(timers t) {
		if (hour > t.hour)
		{
			return true;
		}
		if ( (hour == t.hour) && (minute > t.minute) )
		{
			return true;
		}
		return false;
	}
	public boolean lesseqthan(timers t) {
		if (hour < t.hour)
		{
			return true;
		}
		if ( (hour == t.hour) && (minute <= t.minute) )
		{
			return true;
		}
		return false;
	}
	public boolean lessthan(timers t) {
		if (hour < t.hour)
		{
			return true;
		}
		if ( (hour == t.hour) && (minute < t.minute) )
		{
			return true;
		}
		return false;
	}
	public void printtimers()
	{
		System.out.println(hour+":"+minute);
	}
	public int gethour() {
		return hour;
	}
	public int getminute() {
		return minute;
	}
}
