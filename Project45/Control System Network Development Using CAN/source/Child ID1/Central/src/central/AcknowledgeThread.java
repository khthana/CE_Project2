package central;

/*
 Provide Acknowledge Frame
 */

class AcknowledgeThread
    extends Thread {

  private HighLayerBuffer highbuffer;
  public static IntObject sequence[] = { new IntObject(), new IntObject(), new IntObject()}; // keep last Sequence number for Node 1 ,Node 2 and Node 3

  public AcknowledgeThread(String str) {
    super(str);
  }

  public void run() {
    while (true) {
      try {
        highbuffer = MainFrame.RAx[1].getShareData();                           // RAx number 4 for only Acknowledge Thread
        if (highbuffer.getID() == 1 || highbuffer.getID() == 2 || highbuffer.getID() == 3) {
          if ( (highbuffer.getFlag() & 0x40) == 0x40) {
//            if ((highbuffer.getData().charAt(1) == 0) || (highbuffer.getData().charAt(1) == 1) || (highbuffer.getData().charAt(1) == 3) || (highbuffer.getData().charAt(1) == 4)) {
//              MainFrame.sendstatus.sendStatus(highbuffer.getID(), 0x02, sequence[highbuffer.getID() - 1].getValue());
//            }
          }
          else if ( (highbuffer.getFlag() & 0x40) == 0x00) {
            if ( (highbuffer.getFlag() & 0x80) == 0x00) {                       // Acknowledge Data Frame
              MainFrame.sendstatus.sendStatus(highbuffer.getID(), 0x02, sequence[highbuffer.getID() - 1].getValue());
            }
          }
        }
      }
      catch (Exception e) {
        System.out.println("Acknowledge Thread throw : " + e);
      }
    }
  }

  public void setAndCheckAck(int ID, int acknum) {
    if (ID == 1 || ID == 2 || ID == 3) {
      if ((acknum - (sequence[ID - 1].getValue())) == 1) {
        sequence[ID - 1].setValue(acknum);
      }
      else {
        MainFrame.messagestatus.setText(MainFrame.messagestatus.getText() + "Bad Sequence Number Message ID " + (ID | 0x80 ) + "\n" + "Replace " + (sequence[ID - 1].getValue() + 1) + " With " + acknum + "\n");
        sequence[ID - 1].setValue(acknum);
      }
    }
  }
}