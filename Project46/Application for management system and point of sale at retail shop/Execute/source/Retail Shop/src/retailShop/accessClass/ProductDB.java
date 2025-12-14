/*
 * ProductDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.Product;
import retailShop.businessClass.ProductGroupL1;
import retailShop.businessClass.ProductGroupL2;
import retailShop.businessClass.Supplier;
import retailShop.utilClass.ThaiUtilities;

/**
 * @author Nopphol Noikaew
 */

public class ProductDB extends RetailShopDB {
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductDB(String driver,String url,String username,String password) {
		super(driver,url,username,password);
	}
	
	/**
	 * delete product method
	 * @param name
	 */
	public void deleteProduct(String name) {
		String barcode = null;		
		String query = queryRetrieveBarcodeProduct(name);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				barcode = rs.getString("barcode");
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		query = queryDeleteProduct(barcode);
		updateDB(query);
	}	

	/**
	 * insert product method
	 * @param product
	 */
	public void insertProduct(Product product) {
		String query = queryInsertProduct(product,
			new ProductGroupL1().retrieveIdProductGroupL1(
			product.getNameProductGroupL1()),
			new ProductGroupL2().retrieveIdProductGroupL2(
			new ProductGroupL1().retrieveIdProductGroupL1(
			product.getNameProductGroupL1()),product.getNameProductGroupL2()));
		updateDB(query);
		
		query = queryInsertProductInSupplier(
			new Supplier().retrieveIdSupplierFromName(
			ThaiUtilities.Unicode2ASCII(product.getNameSupplier())),
			product.getBarcode(),product.getQuantity());
		updateDB(query);
	}
	
	/**
	 * retrieve name product method
	 * @param barcode
	 * @return String
	 */
	public String retrieveNameProduct(String barcode) {
		int count = 0;				
		String query = querySearchProductFromBarcode(barcode);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		if(count == 0)
			return new String("Not found");
		
		String name = null;
		query = queryRetrieveNameProduct(barcode);
		rs = queryDB(query);
		
		try {
			while(rs.next())
				name = rs.getString("name");			
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return name;
	}
	
	/**
	 * retrieve product from barcode method
	 * @param barcode
	 * @return Product
	 */
	public Product retrieveProductFromBarcode(String barcode) {
		Product product  = new Product();		
		String query = queryRetrieveProductFromBarcode(barcode);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next()) {
				product.setBarcode(barcode);
				product.setName(rs.getString("name"));
				product.setUnit(rs.getString("unit"));
				product.setNumMin(rs.getInt("nummin"));
				product.setNumMax(rs.getInt("nummax"));				
				product.setAvgCost(rs.getDouble("avgcost"));
				product.setSalePrice(rs.getDouble("saleprice"));
				product.setDiscount(rs.getDouble("discount"));	
				product.setQuantity(retrieveQuantityProduct(barcode));			
				product.setNameProductGroupL1(
					new ProductGroupL1().retrieveNameProductGroupL1(
					rs.getInt("idProductGroupL1")));
				product.setNameProductGroupL2(
					new ProductGroupL2().retrieveNameProductGroupL2(
					rs.getInt("idProductGroupL1"),rs.getInt("idProductGroupL2")));								
				product.setNameSupplier(
					new Supplier().retrieveNameSupplier(
					new Supplier().retrieveIdSupplierFromBarcode(barcode)));
			}
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}		
		
		return product;
	}	
	
	/**
	 * retrieve product from name method
	 * @param name
	 * @return Product
	 */
	public Product retrieveProductFromName(String name) {
		Product product = new Product();		
		String query = queryRetrieveProductFromName(name);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
			{
				product.setBarcode(rs.getString("barcode"));
				product.setName(name);
				product.setUnit(rs.getString("unit"));
				product.setNumMin(rs.getInt("nummin"));
				product.setNumMax(rs.getInt("nummax"));				
				product.setAvgCost(rs.getDouble("avgcost"));
				product.setSalePrice(rs.getDouble("saleprice"));
				product.setDiscount(rs.getDouble("discount"));			
				product.setQuantity(retrieveQuantityProduct(rs.getString("barcode")));	
				product.setNameProductGroupL1(
					new ProductGroupL1().retrieveNameProductGroupL1(
					rs.getInt("idProductGroupL1")));
				product.setNameProductGroupL2(
					new ProductGroupL2().retrieveNameProductGroupL2(
					rs.getInt("idProductGroupL1"),rs.getInt("idProductGroupL2")));								
				product.setNameSupplier(
					new Supplier().retrieveNameSupplier(
					new Supplier().retrieveIdSupplierFromBarcode(rs.getString("barcode"))));
			}
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}		
		
		return product;
	}

	/**
	 * retrieve products method
	 * @param idProductGroupL2
	 * @return Product[]
	 */
	public Product[] retrieveProducts(int idProductGroupL1,int idProductGroupL2) {
		int count = 0;		
		String query = queryCountProduct(idProductGroupL1,idProductGroupL2);
		ResultSet rs = queryDB(query); 
		
		try {
			while(rs.next())
				count = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		Product[] products = new Product[count];
		query = queryRetrieveNameProducts(idProductGroupL1,idProductGroupL2);
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next())
			{
				Product product = new Product();				
				product.setName(rs.getString("name"));				
				products[i] = product;	
			}	
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}	
		
		return products;
	}
	
	/**
	 * search product from barcode method
	 * @param barcode
	 * @return boolean
	 */
	public boolean searchProductFromBarcode(String barcode) {
		int found = 0;
		String query = querySearchProductFromBarcode(barcode);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				found = rs.getInt("num");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		if(found == 0)
			return false;
		else
			return true;
	}
	
	/**
	 * @param product
	 */
	public void updateProduct(Product product) {
		int idProductGroupL1 = 0;
		int idProductGroupL2 = 0;		 
		String query = queryRetrieveIdProductGroupL1L2(
			product.getNameProductGroupL2());
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next()) {
				idProductGroupL1 = rs.getInt("idProductGroupL1");
				idProductGroupL2 = rs.getInt("idProductGroupL2");
			}
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		query = queryUpdateProduct(product,idProductGroupL1,idProductGroupL2);
		updateDB(query);
		
		query = queryUpdateProductInSupplier(
			new Supplier().retrieveIdSupplierFromName(
			ThaiUtilities.Unicode2ASCII(product.getNameSupplier())),
			product.getBarcode(),product.getQuantity());
		updateDB(query);		
	}

	/**
	 * query count product method
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @return String
	 */
	private String queryCountProduct(int idProductGroupL1, int idProductGroupL2) {
		return "SELECT COUNT(*) AS num FROM product WHERE idProductGroupL1=" 
			+ idProductGroupL1 + " AND idProductGroupL2=" + idProductGroupL2;
	}
	
	/**
	 * query delete product method
	 * @param barcode
	 * @return String
	 */
	private String queryDeleteProduct(String barcode) {
		return "DELETE FROM product WHERE barcode='" + barcode + "'";
	}
	
	/**
	 * query insert product method
	 * @param product
	 * @return String
	 */
	private String queryInsertProduct(
		Product product,int idProductGroupL1,int idProductGroupL2) {
		return "INSERT INTO product (barcode, name, unit, nummin, nummax, " +			"avgCost, salePrice, discount, idProductGroupL1, idProductGroupL2) " +			"VALUES ('" + product.getBarcode() + "', '" + product.getName() + 
			"', '" + product.getUnit() + "', " + product.getNumMin() + 
			", " + product.getNumMax() + ", " + product.getAvgCost() + ", " +
			product.getSalePrice() + ", " + product.getDiscount() + ", " + 
			idProductGroupL1 + ", " + idProductGroupL2 + ")";
	}
	
	/**
	 * query insert product in supplier method
	 * @param idSupplier
	 * @param barcode
	 * @param quantity
	 * @return String
	 */
	private String queryInsertProductInSupplier(
		int idSupplier,String barcode,int quantity) {
		return "INSERT INTO productinsupplier (idSupplier, barcode, quantity) " +			"VALUES (" + idSupplier + ", '" + barcode + "', " + quantity + ")";		
	}
	
	/**
	 * query retrieve barcode product method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveBarcodeProduct(String name) {
		return "SELECT barcode FROM product WHERE name='" + name + "'";
	}
	
	/**
	 * query retrieve id product group level 1 and level 2 method
	 * @param nameProductGroupL2
	 * @return String
	 */
	private String queryRetrieveIdProductGroupL1L2(String nameProductGroupL2) {
		return "SELECT idProductGroupL1,idProductGroupL2 FROM productGroupL2 " +			"WHERE name='" + nameProductGroupL2 + "'";
	}
	
	/**
	 * query retrieve name product method
	 * @param barcode
	 * @return String
	 */
	private String queryRetrieveNameProduct(String barcode) {
		return "SELECT name FROM product WHERE barcode='" + barcode + "'";
	}
	
	/**
	 * query retrieve name products method
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @return String
	 */
	private String queryRetrieveNameProducts(
		int idProductGroupL1, int idProductGroupL2) {
		return "SELECT name FROM product WHERE idProductGroupL1=" + 
			idProductGroupL1 + " AND idProductGroupL2=" + idProductGroupL2;
	}
	
	/**
	 * query retrieve product from barcode method
	 * @param barcode
	 * @return String
	 */
	private String queryRetrieveProductFromBarcode(String barcode) {
		return "SELECT name,unit,nummin,nummax,avgcost,saleprice," +
			"discount,idProductGroupL1,idProductGroupL2 FROM product " +			"WHERE barcode='" + barcode + "'";
	}
	
	/**
	 * query retrieve product from name method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveProductFromName(String name) {
		return "SELECT barcode,unit,nummin,nummax,avgcost,saleprice," +
			"discount,idProductGroupL1,idProductGroupL2 FROM product WHERE name='" + 
			name + "'";
	}
	
	/**
	 * query retrieve quantity product method
	 * @param barcode
	 * @return String
	 */
	private String queryRetrieveQuantityProduct(String barcode) {
		return "SELECT quantity FROM productInSupplier WHERE barcode='"	+ barcode + 
			"'";
	}

	/**
	 * query search product from barcode method
	 * @param barcode
	 * @return String
	 */
	private String querySearchProductFromBarcode(String barcode) {
		return "SELECT COUNT(*) AS num FROM product WHERE barcode='" + barcode + 
			"'";
	}
	
	/**
	 * query update product method
	 * @param product
	 * @param idProductGroupL1
	 * @param idProductGroupL2
	 * @return String
	 */
	private String queryUpdateProduct(
		Product product,int idProductGroupL1,int idProductGroupL2) {
		return "UPDATE product SET name='" + product.getName() + 
			"', unit='" + product.getUnit() + "', numMin=" + product.getNumMin() +
			", numMax=" + product.getNumMax() + ", avgCost=" + product.getAvgCost() +
			", saleprice=" + product.getSalePrice() + ", discount="	+ 
			product.getDiscount() +	", idProductGroupL1=" + idProductGroupL1 + 
			", idProductGroupL2="	+ idProductGroupL2 + " WHERE barcode='" + 
			product.getBarcode() + "'";
	}
	
	/**
	 * query update product in supplier method
	 * @param idSupplier
	 * @param barcode
	 * @param quantity
	 * @return String
	 */
	private String queryUpdateProductInSupplier(
		int idSupplier,String barcode,int quantity) {
		return "UPDATE productinsupplier SET quantity=" + quantity + 
			" WHERE idSupplier=" + idSupplier + " AND barcode='" +
			barcode + "'";
	}
	
	/**
	 * retrieve quantity product method
	 * @param barcode
	 * @return int
	 */
	private int retrieveQuantityProduct(String barcode) {
		int quantity = 0;		
		String query = queryRetrieveQuantityProduct(barcode);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				quantity = rs.getInt("quantity");
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return quantity;
	}
}
