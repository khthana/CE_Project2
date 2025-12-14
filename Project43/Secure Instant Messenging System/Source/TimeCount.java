import java.util.*;
public class TimeCount
{
  Date  tc;
  long  baseTime=0;
  long  count=0;
  long  checkTime;

  TimeCount(long checkTime)
  {
     this.checkTime =checkTime;
     reset();
  }

  public boolean timeOut()
  {
      tc=new Date();
      count=tc.getTime();
      count=count-baseTime;
      if(count<checkTime){return false;}
      else{return true;}
  }

  public void reset()
  {
      tc=new Date();
      baseTime=tc.getTime ();
  }
}
