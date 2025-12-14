  package Texteditor;
  import java.awt.*;
  import java.awt.font.*;
  import java.awt.geom.*;
  import java.awt.print.*;

  import java.text.*;
  /**
     * Class: IntroPage <p>
     *
    * This class defines the painter for the cover page by implementing the
    * Printable interface. <p>
   *
    * @author Jean-Pierre Dube <jpdube@videotron.ca>
    * @version 1.0
    * @since 1.0
     * @see Printable
     */
 class IntroPage implements Printable {
   private final static int POINTS_PER_INCH = 72;
     String tx;
      IntroPage(String text)
      {
       tx=text;
      }
      /**
       * Method: print <p>
       *
       * @param g a value of type Graphics
        * @param pageFormat a value of type PageFormat
       * @param page a value of type int
        * @return a value of type int
        */
      public int print (Graphics g, PageFormat pageFormat, int page) {

        //--- Create the Graphics2D object
          Graphics2D g2d = (Graphics2D) g;

          //--- Translate the origin to 0,0 for the top left corner
         g2d.translate (pageFormat.getImageableX (), pageFormat.getImageableY ());

         //--- Set the default drawing color to black
         g2d.setPaint (Color.black);

          //--- Draw a border around the page
          //Rectangle2D.Double border = new Rectangle2D.Double (0,
          //                                                    0,
          //                                                    pageFormat.getImageableWidth (),
          //                                                   pageFormat.getImageableHeight ());
          //g2d.draw (border);

         //--- Print the title

      String titleText = tx;
      AttributedString mStyledText = new AttributedString(titleText);
      Font titleFont = new Font ("dialog", Font.PLAIN, 8);
      g2d.setFont (titleFont);
      System.out.println("intropage");
      Point2D.Float pen = new Point2D.Float();
      AttributedCharacterIterator charIterator = mStyledText.getIterator();
      LineBreakMeasurer measurer = new LineBreakMeasurer(charIterator, g2d.getFontRenderContext());
      float wrappingWidth = (float) pageFormat.getImageableWidth();
      while (measurer.getPosition() < charIterator.getEndIndex()) {
          TextLayout layout = measurer.nextLayout(wrappingWidth);
          pen.y += layout.getAscent();
          float dx = layout.isLeftToRight()? 0 : (wrappingWidth - layout.getAdvance());
          layout.draw(g2d, pen.x + dx, pen.y);
          pen.y += layout.getDescent() + layout.getLeading();
      }
          //--- Compute the horizontal center of the page
          /*FontMetrics fontMetrics = g2d.getFontMetrics ();
          double titleX = (pageFormat.getImageableWidth () / 2) - (fontMetrics.stringWidth (titleText) / 2);
          double titleY = 3 * POINTS_PER_INCH;
          g2d.drawString (titleText, (int) titleX, (int) titleY);
*/
      return (PAGE_EXISTS);
   }
}

