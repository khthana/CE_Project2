package central;

/**
Provide Sequence Number
*/

class SequenceCounter {

  private int count;

  public SequenceCounter() {
    count = -1;
  }

  public void setSequence(int sequence) throws Exception {
    if (sequence < 256 && sequence > -1)
      count = sequence;
    else
      throw new CANException("Invalid sequence");
  }

  public int getSequence() {                                                    // increment sequence number and get
    ++count;
    count &= 0xff;
    return count;
  }

  public int getSequenceComp() {
    return count;
  }

}