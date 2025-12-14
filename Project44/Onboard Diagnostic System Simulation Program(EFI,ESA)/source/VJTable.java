import javax.swing.JTable;

public class VJTable extends JTable
{

	public VJTable()
	{ 
		super(); 
	}

	public VJTable(Object[][] rowData, Object[] columnNames)
	{
		super(rowData,columnNames);
	}

	public boolean isCellEditable(int row, int col) {
            if (col < 100) { 
                return false;
            } else {
                return true;
            }
        }

	public Class getColumnClass(int column) {
          Class dataType = super.getColumnClass(column);
          if (column == 0 ) {
            dataType = Double.class;
          }
          return dataType;
        } 

}
