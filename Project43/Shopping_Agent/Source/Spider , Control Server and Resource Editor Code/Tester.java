package Spider2;
import java.util.*;
public class Tester implements Runnable{
  RulesEditor control;
  Resource resource;
  Thread t;
  public Tester(RulesEditor control,Resource resource){
    this.control = control;
    Resource newResource;
        newResource = new Resource(resource.tagCount);
        newResource.name = resource.name;
        newResource.url = resource.url;
        newResource.local_site = resource.local_site;
        newResource.end_property = resource.end_property;
        newResource.skip_table_head = resource.skip_table_head;
        Enumeration ea;
        for(int i=0;i<resource.tagCount;i++)
        {
          newResource.skip[i] = resource.skip[i];
          newResource.place[i] = resource.place[i];
          newResource.value[i] = resource.value[i];
          newResource.available[i] = resource.available[i];
          newResource.before[i] = new Vector();
          newResource.after[i] = new Vector();
          newResource.order[i] = resource.order[i];
          ea = resource.before[i].elements();
          while(ea.hasMoreElements())
          {
            newResource.before[i].addElement((Tag)ea.nextElement());
          }
          ea = resource.after[i].elements();
          while(ea.hasMoreElements())
          {
            newResource.after[i].addElement((Tag)ea.nextElement());
          }
          newResource.accept_charactor[i] = resource.accept_charactor[i];
          newResource.cut_off_charactor[i] = resource.cut_off_charactor[i];
          newResource.end_charactor[i] = resource.end_charactor[i];
          newResource.prefix[i] = resource.prefix[i];
          newResource.suffix[i] = resource.suffix[i];
        }
        this.resource = newResource;
    t = new Thread(this);
  }
  public void start()
  {
    t.start();
  }
  public void run(){
    control.TestResource(resource);
  }
}
