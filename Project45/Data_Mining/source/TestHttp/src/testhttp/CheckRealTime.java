package testhttp;

import java.util.Vector;

public class CheckRealTime {

  VecStock vec = VecStock.getVecStock();

  public CheckRealTime() {
  }
  public int checkReal( int pos, float z_open, float z_last,
                        float z_prior, float buy_vol,
                        float sell_vol ){

    try{
        if(
            (z_last < z_prior)&&( sell_vol > buy_vol )&&(z_last < z_open)
          ){
          return -1;
        }
        else  if(
            (z_last > z_prior)&&( sell_vol < buy_vol )
          ){
          return 1;
        }
        else return 0;
    }
    catch( Exception e ){
      return 0;
    }
  }
}