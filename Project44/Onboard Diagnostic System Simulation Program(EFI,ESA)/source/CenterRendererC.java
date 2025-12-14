  import javax.swing.table.DefaultTableCellRenderer;
  import java.awt.Color;
  import java.awt.Font;
  
  public class CenterRendererC extends DefaultTableCellRenderer {

    public CenterRendererC() {
      super();
      setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
	  setBackground(new Color(0xffffff));
	}

  public void setValue(Object value) {
      super.setValue(value);
    } 

  } 
