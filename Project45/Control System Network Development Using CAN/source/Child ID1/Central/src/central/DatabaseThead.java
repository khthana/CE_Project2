package central;

import java.util.Date;

/**

 */

class DatabaseThread extends Thread{

  private HighLayerBuffer highbuffer;
  private String str;
  private String time;
  private String day;

  public DatabaseThread(String s) {
    super(s);
  }

  public void run() {
    while (true)
    {
      try {
        highbuffer = MainFrame.RAx[3].getShareData();
      }
      catch(Exception e) {
      }

//      System.out.println(time);
//      System.out.println(highbuffer.getID() + "ok" + time + day);
//      MainFrame.database.Insert(Integer.toString(highbuffer.getID()), "Ack" , time, day);
    }
  }
}