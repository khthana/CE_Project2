package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */
import java.util.Vector;

public class RouterInterface {
  static Vector name = new Vector();
  static Vector interfaces = new Vector();

  public RouterInterface() {
    for(int i=0;i<NewRouter.vRouter.size();i++)
    {
      int Maxr=0;
      Router r =(Router)NewRouter.vRouter.elementAt(i);
      name.addElement( new String(r.getName()));
      int j=i;
      Maxr = r.getMaxEth()+r.getMaxSerial()+r.getMaxToken();
      while(j<Maxr)
      {
       Interface inf =(Interface)r.getVInt().elementAt(j);
       interfaces.addElement( new String(inf.getNameInt()));
       j++;
      }//end while

    }// end for
  }
}