package routersim;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class DrawImg {
  ImageMotion im ;
  public DrawImg(RouterImg rimg)
  {

     ImageMotion.routerImg.addElement(rimg);

      }
  public ImageMotion getrImg()
  {
    return im;
  }
}