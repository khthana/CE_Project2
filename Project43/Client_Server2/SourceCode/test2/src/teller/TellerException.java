package teller;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class TellerException extends Exception {

  public TellerException() {
    super();
  }
  public TellerException(Exception e) {
    super(e.toString());
  }
  public TellerException(String s) {
    super(s);
  }
}