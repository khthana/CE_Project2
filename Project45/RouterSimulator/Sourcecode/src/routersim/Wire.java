package routersim;

import javax.swing.*;
import java.lang.String;
import java.util.Vector;

//-- delete case must return interface name to router

public class Wire {

  private String networkAddress=""; //-- is network address
  private int BW;
  private int Cost;
  private String Wirename;
  private int type;           //-- 1 : ethernet ,  2 : serial , 3 : token
  private int  indexRouter1 = -1, indexRouter2 = -1; //-- index of router
  private String intName1,intName2 ;         //-- interface name for each router
  private int hostIndex = -1; //-- host

  public Wire() {
    Wirename="Wire";
    networkAddress = "0.0.0.0";
    BW=1000;
    Calculate_Cost();
    Cost=getCost();
  }

  public Wire( String name ) {

    Wirename=name ;
    networkAddress = "0.0.0.0";
    BW=1000;
    Calculate_Cost();
    Cost=getCost();

  }

  public void setCost(int cost){
    Cost=cost;
  }

  public int getCost(){
    return Cost;
  }

  public void setWirename(String name){
    Wirename=name;
  }
  public String getWirename(){
    return Wirename;
  }
  public void setIndexRouter( int i , int j ){

    indexRouter1 = i ;
    indexRouter2 = j ;
  }

  public void  setNetworkAddress(String netAdd) {

    networkAddress = netAdd;
  }

  public String getNetworkAddress() {

    return networkAddress;
  }
  public int getIndexRouter1() {

    return indexRouter1;
  }

  public int getIndexRouter2() {

    return indexRouter2;
  }

  public void setIntName( String s , String d ) {

    intName1 = s;
    intName2 = d;
  }

  public String getIntName1() {

    return intName1;
  }

  public String getIntName2() {

    return intName2;
  }

  public int getHostIndex(){

    return hostIndex;
  }

  public void setHostIndex( int i ){

    hostIndex = i;
  }

  public void setType( int t ){

    type = t;
  }
  public void setBW( int bw ){

     BW = bw;

  }
  public int  getBW(){

   return BW;
  }
  public int getType() {

    return type;
  }
  public void Calculate_Cost(){
    Cost = 100/BW;
    setCost(Cost);
  }
}