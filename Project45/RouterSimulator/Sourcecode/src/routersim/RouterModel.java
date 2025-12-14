package routersim;
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import javax.swing.*;
import java.lang.*;
import java.util.*;
import java.io.WriteAbortedException;
import java.io.NotSerializableException;
import java.rmi.UnmarshalException;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class RouterModel {

    private Image img;
    private String color;

    public RouterModel() {
      color="none";
    }
    public RouterModel(int type) {
      System.out.println("type"+type);
      switch (type){
        case 1 : img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("bluerouter.gif"));color="red";break;
        case 2 : img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("grayrouter.gif"));color="pupil";break;
        case 3 : img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("greenrouter.gif"));color="green";break;
        case 4 : img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("pupilrouter.gif"));color="gray";break;
        case 5 : img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("redrouter.gif"));color="pink";break;
        case 6 : img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("pinkrouter.gif"));color="blue";break;
        default :img = Toolkit.getDefaultToolkit().getImage(RouterModel.class.getResource("pinkrouter.gif"));color="blue";break;
      }
    }
    public String getColors(){
      return color;
    }
    public Image getImge(){
      return img;
  }
}