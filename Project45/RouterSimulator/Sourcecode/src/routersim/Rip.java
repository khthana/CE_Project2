package routersim;
import java.util.*;

public class Rip extends Thread implements java.io.Serializable{
  Router r;
  boolean recieve;
  static String output="";
  Vector vrip;
  Rip (Router r){
    this.r = r;
    vrip = new Vector();
    recieve = false;

  }
  public void setRecieve(boolean b){
    recieve = b;
  }
  public boolean getRecieve(){
    return recieve;
  }
  public void run(){

    System.out.println(r.getName()+" : "+ this.r.getName()+" is start thread");
    if (NewRouter.singleMode){
      try{
       // sleep(5000);
        Router rturn = (Router)NewRouter.vRouter.elementAt(NewRouter.getsenderNumber());
        if (rturn.getName().equals(this.r.getName())){
          r.sendRoutingTable();
        }//is turn
        else{
         System.out.println(r.getName()+"::"+rturn.getName());
        }
      }
      catch (Exception e){
//        System.out.println("Not have any turn\n"+e);
      }
    }//singlemode
    else{

         System.out.println("sending routing table\n");
         r.sendRoutingTable();
      try{
        sleep(13000);
        //sleep(this.r.getTime());
      }
      catch (Exception e){
      }
      this.run();
    }
//    else{
//      this.suspend();
//      System.out.println(this.r.getName()+" : " +this.r.getName()+" is suspend");
//    }
  }

  public boolean inVector(){
    boolean found=false;
    int a=0;
    while ((!found)&&(a < vrip.size())&&(vrip.size() > 0)){
      Router r2 = (Router)vrip.elementAt(a);
      if(this.r.getName().equals(r2.getName())){
        found = true;
        return found;
      }
      a++;
    }
    return found;
  }
    //-------------Send Table--------------------//
  public void sendRoutingTable(){
//    Interface isend=null,irecieve=null;
    if (vrip.size() > this.r.getVInt().size()){
      vrip.removeAllElements();
    }//remove all vector
//    System.out.println("*********vrip of "+ this.r.getName()+" *****************");
    for (int a=0; a < vrip.size(); a++){
      Router r = (Router)vrip.elementAt(a);
//      System.out.print(this.r.getName()+" : "+r.getName()+"  ");
    }
//    System.out.println("----------step----------------");
    for(int a=0; a < NewRouter.vRouter.size(); a++){
      Router r = (Router)NewRouter.vRouter.elementAt(a);
      //not send to itself
      if ((!r.getName().equalsIgnoreCase(this.getName()))&&(r.getFlag() == 'r')){
        if (NewRouter.singleMode){
        //in single  mode never send to r
          if(!this.inVector()){
            for(int x=0; x < r.getVInt().size(); x++){
              Interface i1 = (Interface)r.getVInt().elementAt(x);
              for(int y=0; y < this.r.getVInt().size(); y++){
                Interface i2 = (Interface)this.r.getVInt().elementAt(y);
                if ((i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))&&(!i1.getStatus().equalsIgnoreCase("down"))&&(!i2.getStatus().equalsIgnoreCase("down"))){
                    this.vrip.addElement(r);
                    System.out.println(this.r.getName()+" : "+ r.getName()+" receive from "+this.r.getName());
                    recieveRoutingTable(r,this.r,i1,i2);
                }//end if
              }//end for
            }//end for
          }//just send
        }//single mode
        else{
          for(int x=0; x < r.getVInt().size(); x++){
            Interface i1 = (Interface)r.getVInt().elementAt(x);
            for(int y=0; y < this.r.getVInt().size(); y++){
              Interface i2 = (Interface)this.r.getVInt().elementAt(y);
              if ((i1.getNetAddress().equalsIgnoreCase(i2.getNetAddress()))&&(!i1.getStatus().equalsIgnoreCase("down"))&&(!i2.getStatus().equalsIgnoreCase("down"))){
                vrip.addElement(r);
                System.out.println(this.r.getName()+" : "+ r.getName()+" receive1 from "+this.r.getName());

                recieveRoutingTable(r,this.r,i1,i2);
              }//end if
            }//end for
          }//just send
        }//not single mode
      }//end if same router
    }//end for
  }
  //-------------Recieve Table------------------//
  public void recieveRoutingTable(Router reciever,Router sender,Interface irecieve,Interface isend){

      //-------------Find Destination that not have in router-----------------//
      for (int i=0; i < sender.getVrt().size(); i++){
        //Routing table of router that send routing to ...
        RoutingTable rt1 = (RoutingTable)sender.getVrt().elementAt(i);
        //Routing table of router that recieve from ...
        RoutingTable rt2 =null;
        boolean found = false;
        for(int j=0; j < reciever.getVrt().size(); j++){
          rt2 = (RoutingTable)reciever.getVrt().elementAt(j);
          if (rt1.getIpDestination().equalsIgnoreCase(rt2.getIpDestination())){
            found = true;
            //if gw is router that send routing table
            if(rt2.getInterface().equals(isend)){
  //            this.getVrt().removeElementAt(j);
              if(rt1.getMatrice() < 15){
                rt2.setMatrice(rt1.getMatrice()+1);
              }
              else {
                rt2.setMatrice(16);
              }
            }
            else if((((rt1.getMatrice() + 1) < rt2.getMatrice())&&((!rt2.getGateway().equalsIgnoreCase("0.0.0.0"))))||(rt2.getMatrice() == 16)){
  //            rt2 = (RoutingTable)this.getVrt().elementAt(j);
  //            this.getVrt().removeElementAt(j);
              if (rt1.getMatrice() < 15){
                rt2.setMatrice(rt1.getMatrice()+1);
              }
              else {
                rt2.setMatrice(16);
              }
              rt2.setGateway(isend.getIpAddress());
              rt2.setInterface(isend);
            }
          }//end if
        }//end for
        if (!found){
          rt1.addRouting(reciever,isend);
        }
      }//end for
/*    }//recieve*/
  }//end recieveRoutingTable

}