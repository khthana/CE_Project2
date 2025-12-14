import java.util.*;
class GregorianC  extends GregorianCalendar
{
	public void SetT(long g)
	{
		setTimeInMillis(g);
	}
	public long GetT()
	{
		return getTimeInMillis();
	}
}
