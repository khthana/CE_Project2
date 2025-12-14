/*
 * ProductSetDB.java
 */
 
package retailShop.accessClass;

import java.sql.ResultSet;
import java.sql.SQLException;

import retailShop.businessClass.Product;
import retailShop.businessClass.ProductSet;

/**
 * @author Nopphol Noikaew
 */

public class ProductSetDB extends RetailShopDB {
	/**
	 * class constructor
	 * @param driver
	 * @param url
	 * @param username
	 * @param password
	 */
	public ProductSetDB(
		String driver,
		String url,
		String username,
		String password) {
		super(driver, url, username, password);
	}	
	
	/**
	 * delete product set method
	 * @param name
	 */
	public void deleteProductSet(String name) {
		String barcode = null;
		String query = queryRetrieveBarcodeProductSet(name);
		ResultSet rs = queryDB(query);
		try {
			while(rs.next())
				barcode = rs.getString("barcode");
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		query = queryDeleteProductSet(barcode);
		updateDB(query);
		
		query = queryDeleteProductInProductSet(barcode);
		updateDB(query);
	}

	/**
	 * insert product set method
	 * @param productSet
	 */
	public void insertProductSet(ProductSet productSet) {
		String query = queryInsertProductSet(productSet);
		updateDB(query);
		
		for(int i=0; i < productSet.getProduct().length; i++) {
			query = queryInsertProductInProductSet(
				productSet.getBarcode(),productSet.getProduct()[i].getBarcode(),
				productSet.getProduct()[i].getQuantity());
			updateDB(query);
		}	
	}
	
	/**
	 * retrieve product set from barcode method
	 * @param barcode
	 * @return ProductSet
	 */
	public ProductSet retrieveProductSetFromBarcode(String barcode) {
		ProductSet productSet = new ProductSet();
		String query = queryRetrieveProductSetFromBarcode(barcode);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next()) {
				productSet.setBarcode(barcode);
				productSet.setName(rs.getString("name"));
				productSet.setQuantity(rs.getInt("quantity"));
				productSet.setSalePrice(rs.getDouble("salePrice"));
			}
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return productSet;
	}

	/**
	 * retrieve product set method
	 * @param name
	 * @return ProductSet
	 */
	public ProductSet retrieveProductSet(String name) {
		ProductSet productSet = new ProductSet();		
		String query = queryRetrieveProductSet(name);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
			{
				productSet.setBarcode(rs.getString("barcode"));
				productSet.setName(name);
				productSet.setQuantity(rs.getInt("quantity"));
				productSet.setSalePrice(rs.getFloat("saleprice"));
				productSet.setProduct(retrieveProductInProductSets(rs.getString("barcode")));
			}				
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return productSet;
	}
	
	/**
	 * retrieve product sets method
	 * @return ProductSet[]
	 */
	public ProductSet[] retrieveProductSets() {
		int count = 0;		
		String query = queryCountProductSet();
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");		
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		ProductSet[] productSets = new ProductSet[count];		
		query = queryRetrieveNameProductSet();
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next())
			{
				ProductSet productSet = new ProductSet();								
				productSet.setName(rs.getString("name"));				
				productSets[i] = productSet;
			}
		} catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return productSets;
	}	
	
	/**
	 * @param barcode
	 * @return
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
	 * query count product in product set method
	 * @param barcodeProductSet
	 * @return String
	 */
	private String queryCountProductInProductSet(String barcodeProductSet) {
		return "SELECT COUNT(*) AS num FROM productInProductSet " +
			"WHERE barcodeProductSet='" + barcodeProductSet + "'";
	}
	
	/**
	 * query count product set method
	 * @return String
	 */
	private String queryCountProductSet() {
		return "SELECT COUNT(*) AS num FROM productSet";
	}
	
	/**
	 * query delete product in product set method
	 * @param barcode
	 * @return String
	 */
	private String queryDeleteProductInProductSet(String barcode) {
		return "DELETE FROM productInProductSet WHERE barcodeProductSet='"
			+ barcode + "'";
	}

	/**
	 * query delete product set method
	 * @param barcode
	 * @return String
	 */
	private String queryDeleteProductSet(String barcode) {
		return "DELETE FROM productset WHERE barcode='" + barcode + "'";
	}
	
	/**
	 * query insert product in product set method
	 * @param productSet
	 * @param product
	 * @return String
	 */
	private String queryInsertProductInProductSet(
		String barcodeProductSet,String barcodeProduct,int quantity) {
		return "INSERT INTO productinproductset (" +			"barcodeProductSet,barcodeProduct,quantity) VALUES ('" + 
			barcodeProductSet + "', '"	+ barcodeProduct + "', " + quantity + ")";
	}

	/**
	 * query insert product set method
	 * @param productSet
	 * @return String
	 */
	private String queryInsertProductSet(ProductSet productSet) {
		return "INSERT INTO productset (barcode,name,quantity,saleprice) " +
			"VALUES ('" + productSet.getBarcode() + "', '" + productSet.getName() 
			+ "', " + productSet.getQuantity() + ", " + productSet.getSalePrice() 
			+ ")";
	}

	/**
	 * query retrieve barcode product set method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveBarcodeProductSet(String name) {
		return "SELECT barcode FROM productset WHERE name='" + name + "'";
	}
	
	/**
	 * query retrieve name product set method
	 * @return String
	 */
	private String queryRetrieveNameProductSet() {
		return "SELECT name FROM productSet";
	}
	
	/**
	 * query retrieve product from barcode product set method
	 * @param barcodeProductSet
	 * @return String
	 */
	private String queryRetrieveProductFromBarcodeProductSet(
		String barcodeProductSet) {
		return "SELECT barcodeProduct,quantity FROM productInProductSet " +
			"WHERE barcodeProductSet='" + barcodeProductSet + "'";
	}
	
	/**
	 * query retrieve product set from barcode method
	 * @param barcode
	 * @return String
	 */
	private String queryRetrieveProductSetFromBarcode(String barcode) {
		return "SELECT name,quantity,salePrice FROM productSet WHERE " +			"barcode='" + barcode + "'";
	}
	
	/**
	 * query retrieve product set method
	 * @param name
	 * @return String
	 */
	private String queryRetrieveProductSet(String name) {
		return "SELECT barcode,quantity,saleprice FROM productSet " +			"WHERE name='" + name + "'";
	}
	
	/**
	 * query search product from barcode method
	 * @param barcode
	 * @return String
	 */
	private String querySearchProductFromBarcode(String barcode) {
		return "SELECT COUNT(*) AS num FROM productSet WHERE barcode='" + barcode + 
			"'";
	}
	
	/**
	 * retrieve product in product set method
	 * @param barcode
	 * @return Product[]
	 */
	private Product[] retrieveProductInProductSets(String barcodeProductSet) {
		int count = 0;		
		String query = queryCountProductInProductSet(barcodeProductSet);
		ResultSet rs = queryDB(query);
		
		try {
			while(rs.next())
				count = rs.getInt("num");		
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		Product[] products = new Product[count];		
		query = queryRetrieveProductFromBarcodeProductSet(barcodeProductSet);
		rs = queryDB(query);
		
		try {
			rs.first(); // กำหนดให้ resultset กลับไปที่ตำแหน่งแรก			
			for(int i=0; i < count; i++ , rs.next())
			{
				Product product = new Product();				
				product.setBarcode(rs.getString("barcodeProduct"));
				product.setQuantity(rs.getInt("quantity"));
				product.setName(
					new Product().retrieveNameProduct(rs.getString("barcodeProduct")));				
				products[i] = product;	
			}
		}  catch(SQLException ex) {
			// print error message
			System.out.println(ex.getMessage());
		}
		
		return products;
	}
}
