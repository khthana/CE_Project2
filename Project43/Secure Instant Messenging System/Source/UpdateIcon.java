import javax.swing.*;
import javax.swing.table.*;

public class UpdateIcon extends Thread
{
      int time;
      MainFrame f;

      UpdateIcon(int time,MainFrame f)
      {
          this.time=time;
          this.f=f;
          this.start();
      }

      public void run()
      {
        while(true)
        {
        try{
            this.sleep(time);
            f.onlineTable.repaint();
            f.secureTable.repaint();
            f.offlineTable.repaint();
            f.awaitTable.repaint();
            f.notinTable.repaint();
        }
        catch(Exception e){System.out.println(e);}
        }
      }

}