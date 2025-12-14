  package Texteditor;
  import java.awt.*;
  import java.awt.font.*;
  import java.awt.geom.*;
  import java.awt.print.*;


  public class Example2  {


     //--- Private instances declarations
     private final static int POINTS_PER_INCH = 72;


     /**
     * Constructor: Example2 <p>
      *
     */
    public static void go(String text) {

      //--- Create a new PrinterJob object
       PrinterJob printJob = PrinterJob.getPrinterJob ();

    //--- Create a new book to add pages to
       Book book = new Book ();

      //--- Add the cover page using the default page format for this print job
      book.append (new IntroPage (text), printJob.defaultPage ());
       System.out.println("example");
      //--- Add the document page using a landscape page format
      PageFormat documentPageFormat = new PageFormat ();
       documentPageFormat.setOrientation (PageFormat.PORTRAIT);
     //book.append (new Document (), documentPageFormat);

      //--- Tell the printJob to use the Book as the Pageable object
     printJob.setPageable (book);

       //--- Show the print dialog box. If the user clicks the
      //--- print button, we then proceed to print, else we cancel
       //--- the process.
     if (printJob.printDialog()) {
          try {
             printJob.print();
          } catch (Exception PrintException) {
            PrintException.printStackTrace();
         }
       }
    }





 } // Example2

