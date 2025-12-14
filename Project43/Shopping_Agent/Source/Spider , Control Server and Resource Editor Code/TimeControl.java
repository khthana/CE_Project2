package Spider2;
import java.util.*;
public class TimeControl implements Runnable{
  ControlServer control;
  Thread timeThread;
  public TimeControl(ControlServer control) {
    this.control = control;
    timeThread = new Thread(this);
  }
  public void start(){
    timeThread.start();
  }
  public void run(){
    Integer temp;
    String tmpStr;
    while(true){
      temp = new Integer(Calendar.getInstance().get(Calendar.HOUR_OF_DAY));
      if(temp.intValue()<10) tmpStr = "0"+temp.toString();else tmpStr = temp.toString();
      control.ServerI.hourLabel.setText(tmpStr);
      temp = new Integer(Calendar.getInstance().get(Calendar.MINUTE));
      if(temp.intValue()<10) tmpStr = "0"+temp.toString();else tmpStr = temp.toString();
      control.ServerI.minLabel.setText(tmpStr);
      temp = new Integer(Calendar.getInstance().get(Calendar.SECOND));
      if(temp.intValue()<10) tmpStr = "0"+temp.toString();else tmpStr = temp.toString();
      control.ServerI.secLabel.setText(tmpStr);
      Task task;
      Enumeration en = control.task.elements();
      boolean spiderRunning,searchOfflineRunning;
      spiderRunning = false;
      searchOfflineRunning = false;
      while(en.hasMoreElements()){
        //if(!control.Running[i])
          task = (Task)en.nextElement();
          if((task.taskName.compareTo("Run Spider")==0)&&(task.Running))
          {
            spiderRunning = true;
          }
          if((task.taskName.startsWith("Search Offline"))&&(task.Running))
          {
            searchOfflineRunning = true;
          }
      }
      en = control.task.elements();
      while(en.hasMoreElements()){
          task = (Task)en.nextElement();
          {
          if((task.time[0]==Calendar.getInstance().get(Calendar.HOUR_OF_DAY))&&(task.time[1]==Calendar.getInstance().get(Calendar.MINUTE))
            &&(task.time[2]==Calendar.getInstance().get(Calendar.SECOND)))
            {
              control.ServerI.status.append("Doing :"+task.taskName+"\n");
              if((task.taskName.compareTo("Run Spider")==0))
              {
                if(!spiderRunning)
                {
                  task.Running = true;
                  control.runSpider(task);

                }else
                control.ServerI.status.append("There was one Spider Running.\n");
              }else
              if(task.taskName.startsWith("Search Offline"))
              {
                if(!searchOfflineRunning)
                {
                  task.Running = true;
                  control.SearchOffline(task);
                }
                else control.ServerI.status.append("Can't run the same task in same time.\n");
              }
            }
        }
      }
    }
  }
} 