package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

//-- Control access list commandn

public class AccessList implements java.io.Serializable {

  private String number = "" ;          //-- 1 - 199
  private String condition = "" ;   //-- permit | deny
  private String source = "" ;      //-- xxx.xxx.xxx.xxx or any
  private String destination = "";
  private String sourceWildcard = "" ;    //-- xxx.xxx.xxx.xxx
  private String desWildcard = "";
  private String protocal = "";     //-- tcp , udp , icmp , other
  private String operator1 = "";
  private String operator2 = "";
  private String port1 = "";
  private String port2 = "";

  public AccessList(){
  }

  public String getProtocal(){

    return protocal;
  }

  public void setProtocal( String s ){

    protocal = s;
  }

  public String getAccessType(){

    String s = "";
    if( Integer.parseInt(number) <= 100 ) s = " Standard IP access list ";
    else s = " Extened IP access list ";

    return s;
  }

  public void setNumber( String n ) {

    number = n;
  }

  public void setCondition( String n ) {

    condition = n ;
  }

  public void setSource( String n ){

    source = n;
  }

  public void setDestination( String n ) {

    destination = n;
  }

  public void setSourceWildCard( String n ){

    sourceWildcard = n;
  }

  public void setDesWildCard( String n ){

    desWildcard = n;
  }

  public void setOperator1( String n ){

    operator1 = n;
  }

  public void setOperator2( String n ){

    operator2 = n;
  }

  public void setPort1( String n ){

    port1 = n;
  }

  public void setPort2( String n ){

    port2 = n;
  }

  public String getOperator1(){

    return operator1;
  }

  public String getOperator2(){

    return operator2;
  }

  public String getPort1(){

    return port1;
  }

  public String getPort2(){

    return port2;
  }

  public String getNumber(){

    return number;
  }

  public String getCondition(){

    return condition;
  }

  public String getSource(){

    return source;
  }

  public String getDestination(){

    return destination;
  }

  public String getSourceWildCard(){

    return sourceWildcard;
  }

  public String getDesWildCard(){

    return desWildcard;
  }

  public String getAccessList(){

    String statment = "" ;

    if( !protocal.equalsIgnoreCase("") ){
      //-- protocal access-list with or without wildcard ( Extened IP , TCP , UDP )
      statment = "access-list" + number + " " + condition + " " + protocal + " " + source + " " ;

      if( !sourceWildcard.equalsIgnoreCase("") )
        statment += sourceWildcard + " ";

      if( !operator1.equalsIgnoreCase("") )
        statment += operator1 + " " + port1 + " ";

      statment += destination + " ";

      if( !desWildcard.equalsIgnoreCase("") )
        statment += sourceWildcard + " ";

      if( !operator2.equalsIgnoreCase("") )
        statment += operator2 + " " + port2 + " ";

    }
    else{
      //--standard  access-list with or without wildcard
      statment = "access-list " + number + " " + condition + " " + source + " " ;

      if( !sourceWildcard.equalsIgnoreCase("") )
        statment += sourceWildcard;
    }
    return statment ;

  }

  public String getShow() {

    String statment = "" ;

    if( !protocal.equalsIgnoreCase("") ){
      //-- show Extened IP access list
      statment = "          " + condition + " " + protocal + " " + source + " " ;

      if( !sourceWildcard.equalsIgnoreCase("") )
        statment += sourceWildcard + " ";

      if( !operator1.equalsIgnoreCase("") )
        statment += operator1 + " " + port1 + " ";

      statment += destination + " ";

      if( !desWildcard.equalsIgnoreCase("") )
        statment += sourceWildcard + " ";

      if( !operator2.equalsIgnoreCase("") )
        statment += operator2 + " " + port2 + " ";
    }
    else{

      //-- show standard IP access list
      statment = "          " + condition + " " + source + " " ;
      if( !sourceWildcard.equalsIgnoreCase("") )
        statment += sourceWildcard;
    }
    return statment ;

  }
}
