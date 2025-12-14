package routersim;
import java.util.*;

public class Cdp {
  private int timer;
  private int holdTime;
  private int holdTimePacket;
  //--Function---//
  public void setTimer(int t){
    if ((t > 4)&&(t < 901)){
      timer = t;
    }
  }
  public int getTimer(){
    return timer;
  }
  //------hold time-----//
  public void setHoldTime(int t){
    holdTime = t;
  }
  public int getHoldTime(){
    return holdTime;
  }
  //-----hold time packet--//
  public int getHoldTimePacket(){
    return holdTimePacket;
  }
  public Cdp() {
    timer = 90;
    holdTime = 180;
    Random r = new Random();
    float f = r.nextFloat();
    while ((f < 0.15)||(f > 0.18)){
      f = r.nextFloat();
    }
    holdTimePacket = (int)(f*1000);
  }
}