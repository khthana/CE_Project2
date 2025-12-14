import java.sql.*;
class ManagePO{
  public static void main(String argv[]) throws Exception
  {
    out(showPO()+"\n******\n");
/*    int quantity,id;
    quantity = -0;
    id = 10002;
    out(""+updatePO(id,quantity));
    out("\n******\n"+showPO());*/
  }

  static public String showPO(){
    String output="";
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
      Statement s = c.createStatement();
      ResultSet r = s.executeQuery("select * from PO");
      while (r.next())
        output+=(r.getInt(1) + ";" + r.getString(2) + ";" + r.getString(3) + ";" + r.getFloat(4) + ";" + r.getInt(5))+"\n";
      s.close();
      c.close();
    }catch(Exception e){out(""+e);}
    return output;
  }

  static public boolean updatePO(int id,int quantity)
  {
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
      Statement s = c.createStatement();
      ResultSet r = s.executeQuery("select * from PO");
      int oldQuantity=-1,newQuantity;
      while(r.next()){
        if(r.getInt("ID")==id){
          oldQuantity=r.getInt("quantity");
        }
      }
      out(""+id);
      out("OLD QTY:"+oldQuantity);
      if (oldQuantity<=0) return false;
      newQuantity=oldQuantity+quantity;
      out("NEW QTY:"+newQuantity);
      if (newQuantity<0) return false;
      s.executeUpdate("update PO set QUANTITY = \"" + newQuantity +"\" where id = \"" + id +"\"");
      s.close();
      c.close();
      return true;
    }catch(Exception e){out(""+e);}
    return false;
  }

  public static void out(String x){System.out.println(x);}

}