package src;
// this file contains "what to send to sub machine to complete devided jobs"
import src.Client;
import src.Data;

import org.gridforum.ogsi.OGSIServiceGridLocator;
import org.gridforum.ogsi.Factory;
import org.gridforum.ogsi.LocatorType;
import org.globus.ogsa.utils.GridServiceFactory;

import org.globus.progtutorial.stubs.MatrixService.service.MatrixServiceGridLocator;
import org.globus.progtutorial.stubs.MatrixService.MatrixPortType;

import java.net.URL;

public class Subjob extends Thread {
  private int row;
  private int col;
  private int [] m1;
  private int [] m2;
  private int length;
  private int value;
  private int url;

  public Subjob(int a, int b, int u) {
    row = a;
    col = b;
    length = Data.getNumOfCol_m1();
    m1 = new int[length];
    m1 = Data.getRow_m1(row);
    length = Data.getNumOfRow_m2();
    m2 = new int[length];
    m2 = Data.getCol_m2(col);
    url = u;
  }
	public int resultvalue()
{
	return value;
}
	public int resultrow()
{
	return row;
}
	public int resultcol()
{
	return col;
}
  public void run () {
    // use remote call
    try {
      // set URL for send subjob to each machine using Grid Service Handler (use from client.java)
      URL GSH;
      if (url ==1){
        GSH = new java.net.URL("http://test1:8080/ogsa/services/progtutorial/core/first/MatrixFactoryService");
      } else if (url ==2 ){
        GSH = new java.net.URL("http://test2:8080/ogsa/services/progtutorial/core/first/MatrixFactoryService");
      } else if (url ==3 ){
	GSH = new java.net.URL("http://test3:8080/ogsa/services/progtutorial/core/first/MatrixFactoryService");
      } else if (url ==4 ){
	GSH = new java.net.URL("http://test4:8080/ogsa/services/progtutorial/core/first/MatrixFactoryService");
      } else if (url ==5 ){
	GSH = new java.net.URL("http://test5:8080/ogsa/services/progtutorial/core/first/MatrixFactoryService");
      } else{
        GSH = new java.net.URL("http://test6:8080/ogsa/services/progtutorial/core/first/MatrixFactoryService");
      };

      // get a reference to the MatricService Factory
      OGSIServiceGridLocator gridLocator = new OGSIServiceGridLocator();
      Factory factory = gridLocator.getFactoryPort(GSH);
      GridServiceFactory matrixFactory = new GridServiceFactory(factory);

      // create a new MatrixService instance
      LocatorType locator = matrixFactory.createService();
      MatrixServiceGridLocator matrixLocator = new MatrixServiceGridLocator();
      MatrixPortType Matrix = matrixLocator.getMatrixServicePort(locator);

      // Call remote method 'multiplyMatrix'
            Matrix.multiplyMatrix(m1, m2, length);
       value = 0;
      do{
        value = Matrix.getValue();
      }while (value == 0);

      // set array result
      Data.set_m3(row,col,value);

      // destroy instance
      Matrix.destroy();

    }catch(Exception e) {
      System.out.println("ERROR!");
      e.printStackTrace();
    }
  }
}
