package routersim;

import java.util.*;

public class Table {
  private Vector rtable = new Vector();
  private char flag;
  //------------------Set Flag-----------------------//
  public void setFlag(char s){
    flag = s;
  }
  public char getFlag(){
    return flag;
  }
  public void setrTable(RoutingTable rt){
    rtable.addElement(rt);
  }
  public Vector getrTable(){
    return rtable;
  }
  public void sendRoutingTable(Router r){

  }
  public void recieveRoutingTable(Vector v){
  }
  //constructor
  public Table() {
    flag = 'c';
  }
}