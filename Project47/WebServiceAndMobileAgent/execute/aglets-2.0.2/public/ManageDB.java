import java.sql.*;
class ManageDB {
  public static void main(String argv[]) throws Exception
  {
    out(showComputer()+"\n******\n");
    int quantity,id;
    quantity = +0;
    id = 3;
    out(""+updateComputer(id,quantity));
    out("\n******\n"+showComputer());
  }

  static public String showComputer(){
    String output="";
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
      Statement s = c.createStatement();
      ResultSet r = s.executeQuery("select * from COMPUTER");
      while (r.next())
        output+=(r.getInt(1) + "," + r.getString(2) + "," + r.getString(3) + "," + r.getString(4) + "," + r.getString(5) + "," + r.getString(6)+ "," + r.getInt(7)+ "," + r.getInt(8)+ "," + r.getString(9))+"\n";
      s.close();
      c.close();
    }catch(Exception e){out(""+e);}
    return output;
  }

  static public boolean updateComputer(int id,int quantity)
  {
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
      Statement s = c.createStatement();
      ResultSet r = s.executeQuery("select * from COMPUTER");
      int oldQuantity=-1,newQuantity;
      while(r.next()){
        if(r.getInt("ID")==id){
          oldQuantity=r.getInt("quantity");
        }
      }
      out("OLD QTY:"+oldQuantity);
      if (oldQuantity<=0) return false;
      newQuantity=oldQuantity+quantity;
      out("NEW QTY:"+newQuantity);
      if (newQuantity<0) return false;
      s.executeUpdate("update COMPUTER set QUANTITY = \"" + newQuantity +"\" where id = \"" + id +"\"");
      s.close();
      c.close();
      return true;
    }catch(Exception e){out(""+e);}
    return false;
  }

  static public void delete(int id) throws Exception
  {
    Class.forName("com.mysql.jdbc.Driver");
    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
    Statement s = c.createStatement();
    s.executeUpdate("delete from computer where id = " + "\"" + id + "\"");
    s.close();
    c.close();
  }

  static public void search(String word) throws Exception
  {
    Class.forName("com.mysql.jdbc.Driver");
    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
    Statement s = c.createStatement();
    ResultSet r1 = s.executeQuery("select * from computer where id like '%" + word + "%'");
    while (r1.next())
      System.out.println(r1.getInt(1) + "," + r1.getString(2) + "," + r1.getString(3) + "," + r1.getString(4) + "," + r1.getString(5) + "," + r1.getString(6)+ "," + r1.getInt(7)+ "," + r1.getInt(8)+ "," + r1.getString(9));

    ResultSet r2 = s.executeQuery("select * from computer where Brand like '%" + word + "%'");
    while (r2.next())
      System.out.println(r2.getInt(1) + "," + r2.getString(2) + "," + r2.getString(3) + "," + r2.getString(4) + "," + r2.getString(5) + "," + r2.getString(6)+ "," + r2.getInt(7)+ "," + r2.getInt(8)+ "," + r2.getString(9));

    ResultSet r3 = s.executeQuery("select * from computer where Model like '%" + word + "%'");
    while (r3.next())
      System.out.println(r3.getInt(1) + "," + r3.getString(2) + "," + r3.getString(3) + "," + r3.getString(4) + "," + r3.getString(5) + "," + r3.getString(6)+ "," + r3.getInt(7)+ "," + r3.getInt(8)+ "," + r3.getString(9));

    ResultSet r4 = s.executeQuery("select * from computer where CPU like '%" + word + "%'");
    while (r4.next())
      System.out.println(r4.getInt(1) + "," + r4.getString(2) + "," + r4.getString(3) + "," + r4.getString(4) + "," + r4.getString(5) + "," + r4.getString(6)+ "," + r4.getInt(7)+ "," + r4.getInt(8)+ "," + r4.getString(9));

    ResultSet r5 = s.executeQuery("select * from computer where Ram like '%" + word + "%'");
    while (r5.next())
      System.out.println(r5.getInt(1) + "," + r5.getString(2) + "," + r5.getString(3) + "," + r5.getString(4) + "," + r5.getString(5) + "," + r5.getString(6)+ "," + r5.getInt(7)+ "," + r5.getInt(8)+ "," + r5.getString(9));

    ResultSet r6 = s.executeQuery("select * from computer where HDD like '%" + word + "%'");
    while (r6.next())
      System.out.println(r6.getInt(1) + "," + r6.getString(2) + "," + r6.getString(3) + "," + r6.getString(4) + "," + r6.getString(5) + "," + r6.getString(6)+ "," + r6.getInt(7)+ "," + r6.getInt(8)+ "," + r6.getString(9));

    ResultSet r7 = s.executeQuery("select * from computer where Price like '%" + word + "%'");
    while (r7.next())
      System.out.println(r7.getInt(1) + "," + r7.getString(2) + "," + r7.getString(3) + "," + r7.getString(4) + "," + r7.getString(5) + "," + r7.getString(6)+ "," + r7.getInt(7)+ "," + r7.getInt(8)+ "," + r7.getString(9));

    ResultSet r8 = s.executeQuery("select * from computer where quantity like '%" + word + "%'");
    while (r8.next())
      System.out.println(r8.getInt(1) + "," + r8.getString(2) + "," + r8.getString(3) + "," + r8.getString(4) + "," + r8.getString(5) + "," + r8.getString(6)+ "," + r8.getInt(7)+ "," + r8.getInt(8)+ "," + r8.getString(9));

    ResultSet r9 = s.executeQuery("select * from computer where Link like '%" + word + "%'");
    while (r9.next())
      System.out.println(r9.getInt(1) + "," + r9.getString(2) + "," + r9.getString(3) + "," + r9.getString(4) + "," + r9.getString(5) + "," + r9.getString(6)+ "," + r9.getInt(7)+ "," + r9.getInt(8)+ "," + r9.getString(9));
    s.close();
    c.close();
  }
  public static void out(String x){System.out.println(x);}
}