package stocktrade;

import java.sql.*;

public class Database implements AccessDatabase{
  // refer connection
  Connection connection;
  // refer preparestatement
  private PreparedStatement sqlLineData;
  private PreparedStatement sqlAvgPrice;
  // refer constructor
  public Database() {
  }
  // refer method connect database
  public void connect() throws Exception{

    String driver ="sun.jdbc.odbc.JdbcOdbcDriver";
    String url    ="jdbc:odbc:Stock";
    System.out.print("ngee:)");
    Class.forName( driver );

    connection = DriverManager.getConnection(url);
    connection.setAutoCommit(true);

   sqlLineData = connection.prepareStatement("select DATENAME(hour,day_trade), "+
                                              "DATENAME(minute,day_trade),"+
                                              "DATENAME(second,day_trade),"+
                                              "price_last,volume,price_prior "+
                                              "from Intraday "+
                                              "where stock_code = ? "+
                                              "and day_trade >= ? "+
                                              "and day_trade <= ? "+
                                              "order by day_trade ASC ", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);

    sqlAvgPrice = connection.prepareStatement("select exec_price from Intraday "+
                                              "where symbol = ? "+
                                              "and id =  "+
                                              "( select max(id) "+
                                              "from stockentry "+
                                              "where symbol = ? "+
                                              " )", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);


  }
  // refer method get data intrady
  public ResultSet getDataIntraday( String min, String max, String stock_code )
      throws Exception{
    try{
      sqlLineData.setString(1,stock_code);
      sqlLineData.setString(2,min);
      sqlLineData.setString(3,max);
      ResultSet rs = sqlLineData.executeQuery();
      if( rs != null ){
        return rs;
      }else return null;
   }
   catch( SQLException sqlException ){
     System.out.print("vol ");
       System.out.println(sqlException);
       return null;
    }

  }
  // refer find price start
  public float getAvgPrice( String stock_code )
      throws Exception{
    float avg = 10f;
    try{
       sqlAvgPrice.setString(1,stock_code);
       sqlAvgPrice.setString(2,stock_code);
       ResultSet rs = sqlAvgPrice.executeQuery();
       if( rs.next() )
         avg = rs.getFloat(1);
       return avg;
    }
    catch( SQLException sqlException ){
      System.out.println("avgprice ");
        System.out.println(sqlException);
        return 10f;
    }
  }


  // refer method close connect database
  public void close(){
    try{
      sqlLineData.close();
      sqlAvgPrice.close();
      connection.close();
    }
    catch( Exception e ){
      System.out.println(e);
    }
  }

  // refer method get data intrady
  public ResultSet getPredict( String stock_code )
      throws Exception{
    String stock="";
    try{
      if( stock_code.equals("B-LAND") ){
        stock = "B_LAND";
      }
      else stock = stock_code;
      PreparedStatement sq;
      sq = connection.prepareStatement("select z_close,deciss2,pred,ema_9,ema_25, "+
                                        "ema_75,rsi,k,d,macd,sig from "+stock+" "+
                                        "where day_trade = "+
                                        "( select max(day_trade) from "+stock+" ) ", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
      ResultSet rs = sq.executeQuery();
      if( rs != null ){
        return rs;
      }else return null;
   }
   catch( SQLException sqlException ){
     System.out.print("vol ");
       System.out.println(sqlException);
       return null;
    }

  }

  //
  public int getRealPred( String stock_code )
      throws Exception{
    String stock="";
    try{
      if( stock_code.equals("B-LAND") ){
        stock = "B_LAND";
      }
      else stock = stock_code;
      PreparedStatement sq;
      sq = connection.prepareStatement("select deciss from Intraday "+
                                       "where stock_code = '"+stock_code+"' "+
                                       "and day_trade = "+
                                       "( select max(day_trade) "+
                                       "from Intraday "+
                                       "where stock_code = '"+stock_code+"' "+
                                       " ) ", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
      ResultSet rs = sq.executeQuery();
      if( rs.next() ){
        return rs.getInt(1);
      }else return 0;
   }
   catch( SQLException sqlException ){
     System.out.print("Real Pred ");
       System.out.println(sqlException);
       return 0;
    }
  }
  public ResultSet getNgee(  )
      throws Exception{
    String stock="";
    try{
      PreparedStatement sq;
      sq = connection.prepareStatement("select stock_code from NGEE order by stock_code ASC ", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
      ResultSet rs = sq.executeQuery();
      if( rs != null ){
        return rs;
      }
      else return null;
   }
   catch( SQLException sqlException ){
     System.out.print("Real Pred ");
       System.out.println(sqlException);
       return null;
    }
  }
  public int getDD( String stock_code )
      throws Exception{
    String stock="";
    try{
      if( stock_code.equals("B-LAND") ){
        stock = "B_LAND";
      }
      else stock = stock_code;
      PreparedStatement sq;
      sq = connection.prepareStatement("select deciss2 "+
                                        "from "+stock+" "+
                                        "where day_trade = "+
                                        "( select max(day_trade) from "+stock+" ) ", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
      ResultSet rs = sq.executeQuery();
      if( rs.next() ){
        return rs.getInt(1);
      }
      else return 0;
   }
   catch( SQLException sqlException ){
     System.out.print("interest ");
       System.out.println(sqlException);
       return 0;
    }
  }
}