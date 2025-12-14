/*
 * CreateTable.java
 */
 
package retailShop.tableClass;

/**
 * @author Nopphol Noikaew
 */

public class CreateTable {
		
	public static void main(String[] args) {			
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/retailshop";
		String username = "root";
		String password = "root";
		
		ContactorTable contactorTable = 
			new ContactorTable(driver,url,username,password);
		contactorTable.create();
		
		EmployeeTable employeeTable = 
			new EmployeeTable(driver,url,username,password);
		employeeTable.create();
			
		OrderListTable orderListTable = 
			new OrderListTable(driver,url,username,password);
		orderListTable.create();
		
		PositionOfEmployeeTable positionOfEmployeeTable = 
			new PositionOfEmployeeTable(driver,url,username,password);
		positionOfEmployeeTable.create();
		
		PositionTable positionTable =
			new PositionTable(driver,url,username,password);
		positionTable.create();
		
		ProductGroupL1Table productGroupL1Table =
			new ProductGroupL1Table(driver,url,username,password);
		productGroupL1Table.create();
		
		ProductGroupL2Table productGroupL2Table =
			new ProductGroupL2Table(driver,url,username,password);
		productGroupL2Table.create();
		
		ProductInOrderListTable productInOrderListTable =
			new ProductInOrderListTable(driver,url,username,password);
		productInOrderListTable.create();
		
		ProductInProductSetTable productInProductSetTable =
			new ProductInProductSetTable(driver,url,username,password);
		productInProductSetTable.create();
		
		ProductInSaleListTable productInSaleListTable = 
			new ProductInSaleListTable(driver,url,username,password);
		productInSaleListTable.create();
		
		ProductInSupplierTable productInSupplierTable =
			new ProductInSupplierTable(driver,url,username,password);
		productInSupplierTable.create();
		
		ProductInTransferInListTable productInTransferInListTable =
			new ProductInTransferInListTable(driver,url,username,password);
		productInTransferInListTable.create();
		
		ProductInTransferOutListTable productInTransferOutListTable =
			new ProductInTransferOutListTable(driver,url,username,password);
		productInTransferOutListTable.create();
		
		ProductSetTable productSetTable =
			new ProductSetTable(driver,url,username,password);
		productSetTable.create();
		
		ProductTable productTable =
			new ProductTable(driver,url,username,password);
		productTable.create();
		
		RetailShopSystemTable retailShopSystemTable =
			new RetailShopSystemTable(driver,url,username,password);
		retailShopSystemTable.create();
		
		SaleListTable saleListTable = 
			new SaleListTable(driver,url,username,password);
		saleListTable.create();
		
		SupplierTable supplierTable =
			new SupplierTable(driver,url,username,password);
		supplierTable.create();
		
		SystemOfPositionTable systemOfPositionTable =
			new SystemOfPositionTable(driver,url,username,password);
		systemOfPositionTable.create();
		
		TransferInListTable transferInListTable = 
			new TransferInListTable(driver,url,username,password);
		transferInListTable.create();
		
		TransferOutListTable transferOutListTable = 
			new TransferOutListTable(driver,url,username,password);
		transferOutListTable.create();			
	}	
	
}
