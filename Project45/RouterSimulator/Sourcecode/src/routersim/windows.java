package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

import java.lang.Thread;
import java.lang.String;
public class windows extends Thread{
static  String Rname;
static int Model = 0;
     windows(String name,int model)
        {
       setRname(name);
       setModel(model);
        }
        public void run(){
          try {
                       }
              catch(Exception e) {
                e.printStackTrace();
              }

        }
        public void setRname (String name)
        {
          Rname = name;
        }
        public void setModel (int  model)
        {
          Model = model;
        }
        public String getRname(){
                return Rname;
        }

}
