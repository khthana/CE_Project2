package central;

import java.util.Date;

/**
Provide Time on Status Tab
*/

class TimeThread extends Thread {

  private static String timenow;

  TimeThread(String s) {
    super(s);
  }
  public void run() {
    while (true)
    {
      Date now = new Date();
      timenow = now.toString();
      timenow = timenow.substring(11, 19);
      if (!timenow.equals(StatusTab.currenttime))
        StatusTab.currenttime = timenow;
      MainFrame.statustab.repaint();
      try {
        sleep(200);
      }
      catch(Exception e) {
      }
    }
  }
}