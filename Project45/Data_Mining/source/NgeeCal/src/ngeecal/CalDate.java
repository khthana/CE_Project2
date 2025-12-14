package ngeecal;

import java.sql.Date;

public class CalDate {
  Date today;
  Date d3;

  public CalDate() {
  }
  // refer method cal date
 public Date calDateDifference(int du, java.util.Date d1){
   try{
       long x = 1000;
       d3 = d3.valueOf("2000-01-01");
       x = x*60*60*24;
       d3.setTime(d1.getTime()- du*x);
       return d3;
   }
   catch( Exception e ){
     System.out.println(e);
     return d3;
   }
 }
 // refer cal duration
 public int calDuration(java.util.Date d2, java.util.Date d1){
    int x = 1000;
       x = x * 60 * 60 * 24;
    return (int) ((d2.getTime() - d1.getTime())   / (x));
  }
 public String calDateIncrease(int du, java.util.Date d1){
   try{
       long x = 1000;
       d3 = d3.valueOf("2000-01-01");
       x = x*60*60*24;
       d3.setTime(d1.getTime()+ du*x);
       return d3.toString();
   }
   catch( Exception e ){
     System.out.println(e);
     return d3.toString();
   }
 }
}