import javax.swing.JTable;

public class CJTable extends JTable
{

	public CJTable()
	{ 
		super(); 
	}

	public CJTable(Object[][] rowData, Object[] columnNames)
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


}
