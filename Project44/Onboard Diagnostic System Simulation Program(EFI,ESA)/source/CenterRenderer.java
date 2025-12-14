 import java.text.NumberFormat;
  import javax.swing.table.DefaultTableCellRenderer;
  import java.awt.Color;

  public class CenterRenderer extends DefaultTableCellRenderer {

    public CenterRenderer() {
      super();
      setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
	  setBackground(new Color(0xcccccc));
	}

  public void setValue(Object value) {
      super.setValue(value);
    } 

  } 
