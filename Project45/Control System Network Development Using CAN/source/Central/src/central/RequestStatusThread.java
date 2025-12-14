package central;

/**
Thread that provide Request status from Node in System
*/

class RequestStatusThread extends Thread {

  private HighLayerBuffer highbuffer = new HighLayerBuffer();
  public static IntObject value = new IntObject();
//  public static IntObject sendSequence[] = {new IntObject(), new IntObject(), new IntObject()};  // Check Reply Acknowledge Frame
  private int sum;
  private String str;

  public RequestStatusThread(String s) {
    super(s);
    value.setValue(10);
//    sendSequence[0].setValue(-1);
//    sendSequence[1].setValue(-1);
  }

  public void run() {
    while (true) {
      try {
        Thread.sleep(value.getValue() * 1000);
      }
      catch (Exception e) {}
      MainFrame.statustab.setDeviceStatus(0, 0x00);
      MainFrame.statustab.setDeviceStatus(1, 0x00);
      MainFrame.statustab.setDeviceStatus(2, 0x00);
      MainFrame.statustab.setDeviceStatus(3, 0x00);
      for (int i = 1; i < 4; i++) {
        try {
          MainFrame.sendstatus.sendStatus(i, 0x03, 0x00);                       // Request status from Node
          MainFrame.database.GenCodeWithStatus(i, "Req");
       }
        catch(Exception e) {
          System.out.println("Request Thread throw : " + e);
        }
      }
    }
  }
}