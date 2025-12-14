package Spider2;
import java.awt.*;
public class CrawlerInterface extends Frame {
  TextArea Display = new TextArea();
  Button ClearScr = new Button();

  public CrawlerInterface() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    this.setLayout(null);
    ClearScr.setBounds(new Rectangle(4, 371, 65, 40));
    ClearScr.setLabel("Clear");
    Display.setBounds(new Rectangle(4, 23, 558, 345));
    this.add(Display, null);
    this.add(ClearScr, null);
  }
} 