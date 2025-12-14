package Spider2;

public class Task {
  public String taskName;
  public int[] time;
  public boolean Running;
  public Task(String name) {
    time = new int[3];
    for(int i=0;i<3;i++)
    {
      time[i] = 0;
    }
    taskName = name;
    Running = false;
  }
} 