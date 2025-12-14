package testhttp;

import java.util.Vector;
import java.sql.*;

public class VecStock {

  AccessDatabase database = Database.getDatabase();
  public static Vector conStock = new Vector();
  public static Vector conTra   = new Vector();
  private static VecStock vec = new VecStock();
  // refer static get Instance from class Database
  public static VecStock getVecStock(){
    return vec;
  }
  private VecStock() {
    int j =0;
    String stock = "";
    try{
      conStock = database.findStockName();
      for( int i=0;i<conStock.size();i++ ){
        stock = conStock.elementAt(i).toString();

        if( stock.equals("B-LAND") ){
          stock = "B_LAND";
        }
        j = database.findNgeeDec( stock );
        conTra.addElement( new Integer(j) );
      }
    }
    catch( Exception e ){
    }
  }
}