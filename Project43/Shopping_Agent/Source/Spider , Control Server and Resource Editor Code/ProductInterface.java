package Spider2;

import java.awt.*;

public class ProductInterface extends Frame {
  TextArea ProductDisplay = new TextArea();

  public ProductInterface() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    ProductDisplay.setBounds(new Rectangle(4, 23, 457, 292));
    this.setLayout(null);
    this.add(ProductDisplay, null);
  }
} 