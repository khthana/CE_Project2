/*
 * RetailShopTableModel.java
 */
 
package retailShop.utilClass;

import javax.swing.table.AbstractTableModel;

import java.util.Vector;

/** 
 * @author Nopphol Noikaew
 */

public class RetailShopTableModel extends AbstractTableModel 
{
	/**
	 *  class attributes
	 */
	private String[] column = null;		
	private Vector data;
	
	/**
	 *  class constructor
	 * @param col
	 */
	public RetailShopTableModel(String[] col) 
	{ 
		column = col; 
		data = new Vector(); 
	}
	
	/**
	 * add row method
	 * @param obj
	 */
	public void addRow(Object[] obj) 
   {
	   for(int i=0; i < obj.length; i++)
		   data.addElement(obj[i]);
		
	   insertRows();
   }
   
   /**
    * clear row method
    */
	public void clearRow() 
	{ 
		data.clear(); 
	}
   
  /**
   * delete row method
   * @param row
   */	
	public void deleteRow(int row)
	{
		Vector temp = new Vector();
		int r = row * getColumnCount();
		
		for(int i=0; i < data.size(); i++)
			temp.addElement(data.elementAt(i));
				
		data.clear();				
		
		for(int i=0; i < temp.size(); i++)
			if(! ((i >= r) && (i <= r+2 )) )
				data.addElement(temp.elementAt(i));
				
		insertRows();
	}	
	
	/**
	 * get column count method
	 * @return int
	 */
	public int getColumnCount() {		
		return column.length;
	}
	
	/**
	 * get column name method
	 * @param col
	 * @return String
	 */
	public String getColumnName(int col) 
	{	
		 return column[col]; 
	}

	/**
	 * get row count method
	 * @return int
	 */
	public int getRowCount() 
	{		
		return data.size()/getColumnCount();
	}

	/**
	 * get value at method
	 * @param row
	 * @param col
	 * @return Object
	 */
	public Object getValueAt(int row, int col) 
	{		
		return data.elementAt((row * getColumnCount() + col));
	}
	
	/**
	 *  insert row method
	 */
	private void insertRows() 
	{ 
		fireTableRowsInserted(0,(data.size() / getColumnCount())); 
	}
	
	/**
	 * is empty method
	 * @return boolean
	 */
	public boolean isEmpty() {
	 	if((data.size() == 0) || (data.elementAt(0) == ""))
	 		return true;
		return false;
	}
	 
	/**
	 * set value at method
	 * @param row
	 * @param col
	 */
	public void setValueAt(Object obj,int row,int col) {
	 	data.setElementAt(obj,(row * getColumnCount() + col));
	}
}
