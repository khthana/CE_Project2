package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */
import javax.swing.JScrollPane;


public class Scrollpane2 implements java.io.Serializable{
  Frame3 mainF;
  public Scrollpane2() {
      jinit();
    }
  public void jinit(){

  }
  public void SetScrollpane(Frame3 f3)
  {
     mainF = f3;

  }
  public Frame3 getScrollpane()
  {
     return mainF;

  }

}