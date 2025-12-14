package stocktrade;

public class DataException extends Exception {

private Exception exception;
  public DataException( String message ){
    super( message );
  }
  public DataException( Exception exception ){
    exception = this.exception;
  }

  public void printStackTrace(){
    exception.printStackTrace();
  }
}