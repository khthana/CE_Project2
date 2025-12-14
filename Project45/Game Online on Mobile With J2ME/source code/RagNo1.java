/*
 * Rag1.java
 *
 * Created on 17 กุมภาพันธ์ 2003, 14:23 น.
 */

import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.io.*;
import java.io.*;
import java.lang.*;
import javax.microedition.rms.*;

/**
 *
 * @author  Jo
 * @version
 */
public class RagNo1 extends MIDlet implements CommandListener{
    private StreamConnectionNotifier streamConnectionNotifier;
    private StreamConnection streamConnection;
    private OutputStream outputStream = null;
    private DataOutputStream dataOutputStream = null;
    private InputStream inputStream = null;
    private DataInputStream dataInputStream = null;
    private String connectString = "serversocket://:";
    private String connectServer = "socket://161.246.6.7:9000";
    private String ownerAddress = null;//"localhost";
    private String ownerPort = null;//"9001";
    String idreal = null;//"1"; 
    private StringBuffer result;
    private StringItem resultField;
    private Display display;
    public String stringpoint;
    public String stringpoint1;
    public String stringpoint2;
    public String point[] = new String[10];
    public Integer ia;
    public Integer ib;
    int actorX = 0;//7;
    int actorY = 0;//8;
    int zoom = 0;
    int screenX = 0;//actorX - 2;//block
    int screenY = 0;//actorY - 2;//block
    int temp;
    int id;
    int receiveactorX;
    int receiveactorY;
    int ab;
    char act ;//= null;//'a';
    char Map[][] = new char[100][80];
    int score = 0;
    int level = (score/5) + 1;
    int fullblood = 20;
    int blood = 20;
    int ncol = 5;//edit
    int nrow = 5;//edit
    int width = 95;
    int height = 100;
    int startX = 1;
    int startY = 1;
    int deltaX = width/ncol; 
    int deltaY = height/nrow;
    String monster_all;
    int pos_x[] = new int[20];
    int pos_y[] = new int[20];
    int sendoption = 0;
    int item[] = new int[20];
    int regis =0;
    private List list;
    private Command okCommand = new Command("OK",Command.OK,1);
    private Command backCommand = new Command("Back",Command.BACK,1);
    private Command selectCommand = new Command("SELECT",Command.OK,1);
    private Command exitCommand = new Command("Exit",Command.BACK,1);
    private String[] option = {"Register","Play"};
    //private Display display;
    private TextField textfield;
    private TextBox textbox;
    private Form mains;
    private Form intimain;
    RecordStore rs = null;
    static final String REC_STORE = "db1_2";
    String myport;
    int p = 0;
    private String exitString;
    int exit = 0;

///////////////////////////////////////////////////////////////////////////////      
    public RagNo1(){
        deleteRecStore();// don't foeget delete
        list = new List("Register",List.IMPLICIT,option,null);
        list.addCommand(selectCommand);
        list.addCommand(exitCommand);
        list.setCommandListener(this);
        display = Display.getDisplay(this);
        //createmap();
        //sendip();
        //send();
    }
///////////////////////////////////////////////////////////////////////////////    
    public void startApp() {
        display.setCurrent(list);
        //new Thread(new RagNo1.Mythread(1)).start();
        //new Thread(new RagNo1.Mythread(2)).start();
    }
    
    public void pauseApp() {
    }
    
    public void destroyApp(boolean unconditional) {
        list = null;
        exitCommand = null;
        selectCommand = null;
        display = null;
    }
    
    public void commandAction(Command co,Displayable di)
    {
        if(di==list && co==selectCommand)
        {
            openRecStore();
            p = readRecords();
            System.out.println(option[((List)di).getSelectedIndex()]);
            if(option[((List)di).getSelectedIndex()]=="Register")
            {
                if(regis!=1)
                {
                    mains = new Form("send");
                    textfield = new TextField("Enter Your IP Address",null,19,TextField.ANY);
                    mains.append(textfield);                
                    mains.addCommand(backCommand);
                    mains.addCommand(okCommand);
                    mains.setCommandListener(this);
                    display.setCurrent(mains);
                    regis = 1;
                } 
                /*else
                    display.setCurrent(list);*/
            }
            else if(option[list.getSelectedIndex()]=="Play" && regis == 1)
            {
                exit = 0;
                zoom = 0;
                blood = 20; 
                for(int j=0;j<20;j++)
                    item[j] = 0;
                for (int j=0;j<10;j++)
                    point[j] = null;
                ////////////////////////////////////////////////////////////
                sendid();
                receive_my();
                screenX = actorX - 2;
                screenY = actorY - 2;
                display = Display.getDisplay(this);
                //createmap();
                new Thread(new RagNo1.Mythread(1)).start();
                //new Thread(new RagNo1.Mythread(2)).start();
                ColorTestCanvas a = new RagNo1.ColorTestCanvas();
                a.repaint();
                System.out.println("now***********************************now");
                System.out.println(stringpoint);
            }            
            closeRecStore();
            
        }
        else if(co==okCommand)
        {
            ownerAddress = textfield.getString();
            System.out.println("onwerAddress : "+ownerAddress);
            int po = 0;
            for (int k=0;k<ownerAddress.length();k++){
                if (ownerAddress.substring(k,k+1).compareTo(":")==0){
                   po = k+1;
                   k = ownerAddress.length();
                }
            }
            System.out.println(po);
            myport = ownerAddress.substring(po);
            System.out.println("myport : "+myport);
            sendip();
            receive_reg();
            display.setCurrent(list);
        }
        else if(co==backCommand)
        {
            display.setCurrent(list);
        }
        else if(co==exitCommand)
        {
            destroyApp(true);
            notifyDestroyed();
        }
    }
///////////////////////////////////////////////////////////////////////
    public void openRecStore()
    {
        try
        {
            rs = RecordStore.openRecordStore(REC_STORE,true);
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    public void closeRecStore()
    {
        try
        {
            rs.closeRecordStore();
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    public void deleteRecStore()
    {
        if(RecordStore.listRecordStores() != null)
        {
            try
            {
                RecordStore.deleteRecordStore(REC_STORE);
            }
            catch(Exception e)
            {
                db(e.toString());
            }
        }
    }

    public void writeRecord(String str)
    {
        byte[] rec = str.getBytes();
        try
        {
            rs.addRecord(rec,0,rec.length);
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    public int readRecords()
    {
        try
        {
            byte[] recData = new byte[50];
            int len;
            int p = rs.getNumRecords();
            for(int i=1;i<=rs.getNumRecords();i++)
            {
                len = rs.getRecord(i,recData,0);
                System.out.println("Record #" +i+ ": " + new String(recData,0,len));
                System.out.println("------------------------------");
            }
            
                
        }
        catch(Exception e)
        {
            db(e.toString());
        }
        return p;
    }

    private void db(String str)
    {
        System.out.println("Msg: " + str);
    }
///////////////////////////////////////////////////////////////////////
    public void createmap(){
        for (int i=0;i<100;i++){
                for (int j=0;j<80;j++){
                    Map[i][j] = 'o';
                }
            }
            
            //set block position
            for (int i=0;i<100;i++){
                for (int j=0;j<80;j++){
                    if (((i % 5)==0)&&((j % 5)==0)){
                        Map[i][j] = 'n';
                    }
                }
            }
           
           //Map[50][40] = 'g';
            
            //top wall and buttom wall
            for (int i=0;i<100;i++){
                Map[i][0] = 'm';
                Map[i][79] = 'm';
            }
            //left wall and riht wall
            for (int j=0;j<80;j++){
                Map[0][j] = 'm';
                Map[99][j] = 'm';
            }
                   
            //initial actor position
            Map[actorX][actorY] = act;
    }
//////////////////////////////////////////////////////////////////////    
    public void receive()
    {
        try {
            streamConnectionNotifier = (StreamConnectionNotifier) Connector.open(connectString+myport);
            streamConnection = streamConnectionNotifier.acceptAndOpen();
                       
            inputStream = streamConnection.openInputStream();
            dataInputStream = new DataInputStream(inputStream);     
            
            int inputChar;
            result = new StringBuffer();
            while ((inputChar = dataInputStream.read()) != -1) {
                if (inputChar != 0){
                    result.append((char) inputChar);
                }//end if
            }//end while
            stringpoint = result.toString();
            System.out.println("receive : "+stringpoint);
            int len = stringpoint.length();
            if (len == 12){
                Killed_mon();
            } else if (len == 7){
                Get_item();
            } else if (len == 6){
                Killed_actor();
            } else if (len == 2){
                out();
            } else {//8        
                StringToInt();
                keeppoint();
            }
            ColorTestCanvas a = new RagNo1.ColorTestCanvas();
            a.repaint();
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector : receive :" + e);
        } finally { 
            try {
                if (dataInputStream != null)
                    dataInputStream.close();
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null)
                    dataOutputStream.close();
            } catch (Exception ignored) {}
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (Exception ignored) {}
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null)
                    streamConnection.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null)
                    streamConnectionNotifier.close();
            } catch (Exception ignored) {}
        }
        new Thread(new RagNo1.Mythread(2)).start();
    }
//////////////////////////////////////////////////////////////////////////////
    public void receive_reg()//มีแต่ id
    {
        try {
            streamConnectionNotifier = (StreamConnectionNotifier) Connector.open(connectString+myport);
            streamConnection = streamConnectionNotifier.acceptAndOpen();
                       
            inputStream = streamConnection.openInputStream();
            dataInputStream = new DataInputStream(inputStream);                        
            int inputChar;
            result = new StringBuffer();
            while ((inputChar = dataInputStream.read()) != -1) {
                if (inputChar != 0){
                    result.append((char) inputChar);
                }//end if
            }//end while
            stringpoint = result.toString();
            System.out.println("=============================");
            System.out.println(stringpoint);
            idreal = stringpoint;
            /*actorX = Integer.parseInt(stringpoint.substring(3,5));
            actorY = Integer.parseInt(stringpoint.substring(5,7));
            stringpoint = stringpoint.substring(3);
               if (stringpoint == "100")
                   act = 'a';
               else if (stringpoint == "101")
                   act = 'b';
               else if (stringpoint == "102")
                   act = 'c';
               else if (stringpoint == "103")
                   act = 'd';
               else if (stringpoint == "104")
                   act = 'e';
               else if (stringpoint == "105")
                   act = 'f';
               else if (stringpoint == "106")
                   act = 'g';
               else if (stringpoint == "107")
                   act = 'h';
               else if (stringpoint == "108")
                   act = 'i';
               else if (stringpoint == "109")
                   act = 'j';
               else if (stringpoint == "110")
                   act = 'k';
               else if (stringpoint == "111")
               act = 'l';*/
            openRecStore();
            writeRecord(idreal);
            closeRecStore();
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector");
        } finally {
            try {
                if (dataInputStream != null)
                    dataInputStream.close();
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null)
                    dataOutputStream.close();
            } catch (Exception ignored) {}
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (Exception ignored) {}
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null)
                    streamConnection.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null)
                    streamConnectionNotifier.close();
            } catch (Exception ignored) {}
        }
    }
//////////////////////////////////////////////////////////////////////////////
    public void receive_my()
    {
        try {
            streamConnectionNotifier = (StreamConnectionNotifier) Connector.open(connectString+myport);
            streamConnection = streamConnectionNotifier.acceptAndOpen();
                       
            inputStream = streamConnection.openInputStream();
            dataInputStream = new DataInputStream(inputStream);                        
            int inputChar;
            result = new StringBuffer();
            while ((inputChar = dataInputStream.read()) != -1) {
                if (inputChar != 0){
                    result.append((char) inputChar);
                }//end if
            }//end while
            stringpoint = result.toString();
            System.out.println("************=============================**************");
            System.out.println(stringpoint);
            //idreal = stringpoint;
            System.out.println(idreal);
            String my_point = stringpoint.substring(stringpoint.length()-7,stringpoint.length()-3);
            actorX = Integer.parseInt(my_point.substring(0,2));
            actorY = Integer.parseInt(my_point.substring(2,4));
            act = 'a';
            String my_score = stringpoint.substring(stringpoint.length()-3,stringpoint.length());
            score = Integer.parseInt(my_score);
            stringpoint = stringpoint.substring(0,stringpoint.length()-7);
            System.out.println("monster--------------------------------monster");
            System.out.println(stringpoint);
            monster_all = stringpoint;
            keep_mon();
            System.out.println(actorX+" : "+actorY);
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector");
        } finally {
            try {
                if (dataInputStream != null)
                    dataInputStream.close();
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null)
                    dataOutputStream.close();
            } catch (Exception ignored) {}
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (Exception ignored) {}
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null)
                    streamConnection.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null)
                    streamConnectionNotifier.close();
            } catch (Exception ignored) {}
        }
        new Thread(new RagNo1.Mythread(2)).start();
        //new Thread(new RagNo1.Mythread(2)).start();
    }
//////////////////////////////////////////////////////////////////////////////
    public void sendid()
    {
      try {
            streamConnection = (StreamConnection) Connector.open(connectServer);
            outputStream = streamConnection.openOutputStream(); 
            dataOutputStream = new DataOutputStream(outputStream);
            //IntToString();start not have
            dataOutputStream.writeChars(idreal);
            System.out.println("idididididididididididididid");
            System.out.println(idreal);
            dataOutputStream.flush();
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector server : sendip");
        } finally {
            try {
                if (dataInputStream != null){
                    dataInputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null){
                    dataOutputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (inputStream != null){
                    inputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (outputStream != null){
                    outputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null){
                    streamConnection.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null){
                    streamConnectionNotifier.close();}
            } catch (Exception ignored) {}
        }
    }
//////////////////////////////////////////////////////////////////////////////    
    public void sendip()
    {
      try {
            streamConnection = (StreamConnection) Connector.open(connectServer);
            outputStream = streamConnection.openOutputStream(); 
            dataOutputStream = new DataOutputStream(outputStream);
            //IntToString();start not have
            dataOutputStream.writeChars(ownerAddress);/*owner is insert ip and port + ":" + ownerPort + stringpoint*/
            System.out.println("sendip : "+ownerAddress);
            dataOutputStream.flush();
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector server : sendip");
        } finally {
            try {
                if (dataInputStream != null){
                    System.out.println("finally:1");
                    dataInputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null){
                    dataOutputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (inputStream != null){
                    inputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (outputStream != null){
                    outputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null){
                    streamConnection.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null){
                    streamConnectionNotifier.close();}
            } catch (Exception ignored) {}
        }
    }
//////////////////////////////////////////////////////////////////////////////////////    
    public void send()
    {
      try {
            streamConnection = (StreamConnection) Connector.open(connectServer);
            outputStream = streamConnection.openOutputStream(); 
            dataOutputStream = new DataOutputStream(outputStream);
            IntToString();
            if (sendoption == 0) {
                System.out.println("send : "+stringpoint);
                dataOutputStream.writeChars(stringpoint);
                dataOutputStream.flush();
            } else if(sendoption == 1){
                System.out.println("sendkill : " + "1" + stringpoint);
                dataOutputStream.writeChars("1"+stringpoint);
                dataOutputStream.flush();
            } else if(sendoption == 2){
                System.out.println("sendkeepitem : "+"2"+stringpoint);
                dataOutputStream.writeChars("2"+stringpoint);
                dataOutputStream.flush();
            } else if(sendoption == 3){
                System.out.println("sendkillactor : "+"3"+stringpoint);
                dataOutputStream.writeChars("3"+stringpoint);
                dataOutputStream.flush();
            }
            
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector server : send");
        } finally {
            try {
                if (dataInputStream != null){
                    dataInputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null){
                    dataOutputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (inputStream != null){
                    inputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (outputStream != null){
                    outputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null){
                    streamConnection.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null){
                    streamConnectionNotifier.close();}
            } catch (Exception ignored) {}
        }
    }
///////////////////////////////////////////////////////////////////////////////
    public void sendexit()
    {
        String strscore = null;
        if (score < 10)
            strscore = "00" + Integer.toString(score);//00s
        else if (score < 100)
            strscore = "0" + Integer.toString(score);//0ss
        else strscore = Integer.toString(score);//sss
        exitString = "0"+idreal+strscore;
      try {
            streamConnection = (StreamConnection) Connector.open(connectServer);
            outputStream = streamConnection.openOutputStream(); 
            dataOutputStream = new DataOutputStream(outputStream);
            //IntToString();
            dataOutputStream.writeChars(exitString);
            System.out.println("score : "+score);
            dataOutputStream.flush();
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector server : sendexit");
        } finally {
            try {
                if (dataInputStream != null){
                    dataInputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null){
                    dataOutputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (inputStream != null){
                    inputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (outputStream != null){
                    outputStream.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null){
                    streamConnection.close();}
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null){
                    streamConnectionNotifier.close();}
            } catch (Exception ignored) {}
        }
    }
    
   public void IntToString(){
////////// put action in stringpoint ////////////////
       if (act == 'a')
           stringpoint = "100";
       else if (act == 'b')
           stringpoint = "101";
       else if (act == 'c')
           stringpoint = "102";
       else if (act == 'd')
           stringpoint = "103";
       else if (act == 'e')
           stringpoint = "104";
       else if (act == 'f')
           stringpoint = "105";
       else if (act == 'g')
           stringpoint = "106";
       else if (act == 'h')
           stringpoint = "107";
       else if (act == 'i')
           stringpoint = "108";
       else if (act == 'j')
           stringpoint = "109";
       else if (act == 'k')
           stringpoint = "110";
       else if (act == 'l')
           stringpoint = "111";
       ////////////////////////////////////////////////
       if (actorX < 10){
           stringpoint1 = "0";
           stringpoint1 = stringpoint1.concat(ia.toString(actorX));
       } else stringpoint1 = ia.toString(actorX);
       if (actorY < 10){
           stringpoint2 = "0";
           stringpoint2 = stringpoint2.concat(ib.toString(actorY));
       } else stringpoint2 = ib.toString(actorY);
        stringpoint = stringpoint.concat(stringpoint1);
        stringpoint = stringpoint.concat(stringpoint2);
        stringpoint = stringpoint.concat(idreal);
    }//close IntToString
/////////////////////////////////////////////////////////////////////////////////    
    public void StringToInt(){
        ab =  ia.parseInt(stringpoint);
        temp = ab/10;
        id = ab%10;
     }
/////////////////////////////////////////////////////////////////////////////////    
    public void keeppoint(){
        point[id] = stringpoint;      
        System.out.println("Keeppoint : "+stringpoint);
    }
/////////////////////////////////////////////////////////////////////////////////    
    public void keep_mon()
    {
        int p = 0,t=0;
        while(p<monster_all.length())
        {
            String one = monster_all.substring(p,p+2);
            pos_x[t] = Integer.parseInt(one);
            String two = monster_all.substring(p+2,p+4);
            pos_y[t] = Integer.parseInt(two);
            p = p+4;
            t++;
            //System.out.println(pos_x[1]);
        }
    }
////////////////// Killed_mon ///////////////////////////////////12
    public void Killed_mon(){
        Integer integerpoint = null;
        String id_kill = stringpoint.substring(stringpoint.length()-1);
        String stringmon_xy = stringpoint.substring(0,6);
        int mon_kill = integerpoint.parseInt(stringmon_xy);
        System.out.println("mon_xy = "+stringmon_xy);
        String stringitem_xy = stringpoint.substring(6,11);
        System.out.println("stringitem_xy = "+stringitem_xy);
        int item_xy = integerpoint.parseInt(stringitem_xy);
        int new_mon_x = mon_kill/10000; 
        int new_mon_y = (mon_kill/100)%100;
        int id_mon_kill = mon_kill%100;
        if (id_kill.compareTo(idreal) == 0)
            score = score + 1;
        pos_x[id_mon_kill] = new_mon_x;
        pos_y[id_mon_kill] = new_mon_y;
         for (int k=0;k<20;k++)
            if (item[k] == 0)
            {
                item[k] = item_xy;  
                k = 20;
            }
    }
  
/////////////////// Get_item ///////////////////////////////////
    public void Get_item() {
        Integer integerpoint = null;
        String id_keep = stringpoint.substring(stringpoint.length()-1);
        String stringitem_xy = stringpoint.substring(0,6);
        int item_xy = integerpoint.parseInt(stringitem_xy);
        System.out.println("item_xy = "+item_xy);;
        int item_x = item_xy/10000; 
        int item_y = (item_xy/100)%100;
        int id_item = item_xy%100;
        String new_position = null;
        
        if (id_keep.compareTo(idreal) == 0){
             if((item[id_item]%10) < 5)
                score = score + 2;
            else 
                blood = fullblood;
            actorX = item_x;
            actorY = item_y;
            //send();
        } else {
            System.out.println(point[Integer.parseInt(id_keep)]);
            new_position = point[Integer.parseInt(id_keep)].substring(0,3);
            System.out.println(new_position);
            new_position = new_position.concat(stringitem_xy.substring(0,4));
            System.out.println(new_position);
            new_position = new_position.concat(id_keep);
            System.out.println("new_position : "+new_position);
            point[Integer.parseInt(id_keep)] = new_position;
        }
        stringitem_xy = stringitem_xy.substring(0,4);
        for (int k=0;k<20;k++){
            int intitem_xy = Integer.parseInt(stringitem_xy);
            if (item[k]/10 == intitem_xy){
                System.out.println("item["+k+"] : "+item[k]);
                item[k] = 0;
                k = 20;
            }
        }
        Map[item_x][item_y] = 'o';  //this line not use
    }
  
 ///////////////// Kill_actor ///////////////////////////////////////
    public void Killed_actor(){
        Integer integerpoint = null;
        String id_kill = stringpoint.substring(stringpoint.length()-1);
        String id_killed = stringpoint.substring(4,5);
        String stringactor_xy = stringpoint.substring(0,4);
        int actor_xy = integerpoint.parseInt(stringactor_xy);
        System.out.println("actor_xy = "+actor_xy);
        
        if (id_kill.compareTo(idreal) == 0)
            score = score + 1;
        if (id_killed.compareTo(idreal) == 0){
            if(level == 1)
                blood = blood - 5;
            else if(level <= 5)
                blood = blood - 3;
            else blood = blood - 1;
        }
    }
 //////////////////////////////////  out  ///////////////////////////////////
    public void out(){
        point[Integer.parseInt(stringpoint.substring(stringpoint.length()-1))] = null;
    }
 ////////////////////////////////////////////////////////////////////////////  
    class Mythread implements Runnable {
        int ch;
        public Mythread(int n)
        {
            ch = n;
        }
        public void run()
        {
                if(ch == 1)
                {
                     /*ColorTestCanvas b = new RagNo1.ColorTestCanvas();
                     b.repaint();*/
                     display.setCurrent(new ColorTestCanvas());
                }
                else if(ch == 2)
                {   
                    if (exit == 0){                 
                        receive();    
                        if (exit == 0){
                            display.setCurrent(new ColorTestCanvas());
                        }
                    }
                }
                /*else if(ch == 3)
                {
                    send();
                    display.setCurrent(new ColorTestCanvas());
                }*/
        }
    }//close class Mythread
    
    class ColorTestCanvas extends Canvas implements CommandListener {
        Image wall;
        Image font0;
        Image font1;
        Image back0;
        Image back1;
        Image left0;
        Image left1;
        Image right0;
        Image right1;
        Image block;
        Image fence;
        Image anermy;
        Image itempic1;
        Image itempic2;
        private List lists;
        private Command selectCommand = new Command("SELECT",Command.OK,1);
        private Command backCommand = new Command("BACK",Command.BACK,1);
        private String[] options={"Exit Game"};
                       
        public ColorTestCanvas(){
           try {
               if (zoom == 0) {
                wall = Image.createImage("/../picture/ny/block_19_20.png");
                font0 = Image.createImage("/../picture/actor/front0_19_20.png");
                font1 = Image.createImage("/../picture/actor/front1_19_20.png");
                back0 = Image.createImage("/../picture/actor/back0_19_20.png");
                back1 = Image.createImage("/../picture/actor/back1_19_20.png");
                left0 = Image.createImage("/../picture/actor/left0_19_20.png");
                left1 = Image.createImage("/../picture/actor/left1_19_20.png");
                right0 = Image.createImage("/../picture/actor/right0_19_20.png");
                right1 = Image.createImage("/../picture/actor/right1_19_20.png");
                block = Image.createImage("/../picture/ny/trees_19_20.png");
                fence = Image.createImage("/../picture/actor/dab_19_20.png");
                anermy = Image.createImage("/../picture/ny/anermy_19_20.png");
                itempic1 = Image.createImage("/../picture/ny/item1_19_20.png");
                itempic2 = Image.createImage("/../picture/ny/item2_19_20.png");
               }
               else {
                wall = Image.createImage("/../picture/ny/block_5.png"); 
                font0 = Image.createImage("/../picture/actor/front0_5.png");
                font1 = Image.createImage("/../picture/actor/front1_5.png");
                back0 = Image.createImage("/../picture/actor/back0_5.png");
                back1 = Image.createImage("/../picture/actor/back1_5.png");
                left0 = Image.createImage("/../picture/actor/left0_5.png");
                left1 = Image.createImage("/../picture/actor/left1_5.png");
                right0 = Image.createImage("/../picture/actor/right0_5.png");
                right1 = Image.createImage("/../picture/actor/right1_5.png");
                block = Image.createImage("/../picture/ny/trees_5.png");
                fence = Image.createImage("/../picture/actor/dab_5.png");
                anermy = Image.createImage("/../picture/ny/anermy_5.png");
                itempic1 = Image.createImage("/../picture/ny/item1_5.png");
                itempic2 = Image.createImage("/../picture/ny/item2_5.png");
               }
            } catch (Exception e){}
        }
        
        public void paint(Graphics g){
            try {
               if (zoom == 0) {
                wall = Image.createImage("/../picture/ny/block_19_20.png");
                font0 = Image.createImage("/../picture/actor/front0_19_20.png");
                font1 = Image.createImage("/../picture/actor/front1_19_20.png");
                back0 = Image.createImage("/../picture/actor/back0_19_20.png");
                back1 = Image.createImage("/../picture/actor/back1_19_20.png");
                left0 = Image.createImage("/../picture/actor/left0_19_20.png");
                left1 = Image.createImage("/../picture/actor/left1_19_20.png");
                right0 = Image.createImage("/../picture/actor/right0_19_20.png");
                right1 = Image.createImage("/../picture/actor/right1_19_20.png");
                block = Image.createImage("/../picture/ny/trees_19_20.png");
                fence = Image.createImage("/../picture/actor/dab_19_20.png");
                anermy = Image.createImage("/../picture/ny/anermy_19_20.png");
                itempic1 = Image.createImage("/../picture/ny/item1_19_20.png");
                itempic2 = Image.createImage("/../picture/ny/item2_19_20.png");
               }
               else {
                wall = Image.createImage("/../picture/ny/block_5.png");
                font0 = Image.createImage("/../picture/actor/front0_5.png");
                font1 = Image.createImage("/../picture/actor/front1_5.png");
                back0 = Image.createImage("/../picture/actor/back0_5.png");
                back1 = Image.createImage("/../picture/actor/back1_5.png");
                left0 = Image.createImage("/../picture/actor/left0_5.png");
                left1 = Image.createImage("/../picture/actor/left1_5.png");
                right0 = Image.createImage("/../picture/actor/right0_5.png");
                right1 = Image.createImage("/../picture/actor/right1_5.png");
                block = Image.createImage("/../picture/ny/trees_5.png");
                fence = Image.createImage("/../picture/actor/dab_5.png");
                anermy = Image.createImage("/../picture/ny/anermy_5.png");
                itempic1 = Image.createImage("/../picture/ny/item1_5.png");
                itempic2 = Image.createImage("/../picture/ny/item2_5.png");
               }
            } catch (Exception e){}
            System.out.println("paint "+receiveactorX+" "+receiveactorY);
            
            createmap();
            //Map[actorX][actorY] = 'a';  // set new position actor
            for(int j=0;j<10;j++){
                if(point[j] != null){
                    Integer integerpoint = null;
                    int intpoint = 0;
                    int ac;
                    intpoint =  integerpoint.parseInt(point[j]);
                    intpoint = intpoint/10;         //aaxxyy
                    ac = intpoint/10000;             //aa
                    intpoint = intpoint%10000;       //xxyy
                    receiveactorX = intpoint/100;   //xx
                    receiveactorY = intpoint%100;   //yy
//////////////// set action to map with Map /////////////////////////////                    
                    if (ac == 100)
                        Map[receiveactorX][receiveactorY] = 'a';
                    else if (ac == 101)
                        Map[receiveactorX][receiveactorY] = 'b';
                    else if (ac == 102)
                        Map[receiveactorX][receiveactorY] = 'c';
                    else if (ac == 103)
                        Map[receiveactorX][receiveactorY] = 'd';
                    else if (ac == 104)
                        Map[receiveactorX][receiveactorY] = 'e';
                    else if (ac == 105)
                        Map[receiveactorX][receiveactorY] = 'f';
                    else if (ac == 106)
                        Map[receiveactorX][receiveactorY] = 'g';
                    else if (ac == 107)
                        Map[receiveactorX][receiveactorY] = 'h';
                    else if (ac == 108)
                        Map[receiveactorX][receiveactorY] = 'i';
                    else if (ac == 109)
                        Map[receiveactorX][receiveactorY] = 'j';
                    else if (ac == 110)
                        Map[receiveactorX][receiveactorY] = 'k';
                    else if (ac == 111)
                        Map[receiveactorX][receiveactorY] = 'l';
                    
                    System.out.println("Map["+receiveactorX+"]["+receiveactorY+"] = "+Map[receiveactorX][receiveactorY]);
                }
            }            
            /////////////set monster//////////////////
            for(int k=0;k<20;k++)
            {
                Map[pos_x[k]][pos_y[k]] = 'z';
            }
            //////////////set item/////////////////////
            for(int k=0;k<20;k++)
            {   
                if(item[k] != 0){
                    if ((item[k]%10) <5) 
                        Map[item[k]/1000][(item[k]%1000)/10] = 't';
                    else Map[item[k]/1000][(item[k]%1000)/10] = 'u';
                }
            }
            
                g.setColor(0xCCFFCC);
                g.fillRect(1,1,width,height);
                for (int i=0;i<5+(zoom*(zoom*15-1));i++){
                    for (int j=0;j<5+(zoom*15);j++){
                        int x = (i*deltaX) + startX;
                        int y = (j*deltaY) + startY;
                        if (Map[i+screenX][j+screenY] == 'a'){  //font 
                            g.drawImage(font0,x,y,0);                        
                        } else if(Map[i+screenX][j+screenY] == 'b'){  //font walk
                            g.drawImage(font1,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'c'){  //font fence
                            g.drawImage(fence,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'd'){  //back 
                            g.drawImage(back0,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'e'){  //back walk
                            g.drawImage(back1,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'f'){  //back fence
                            g.drawImage(fence,x,y,0);    
                        } else if(Map[i+screenX][j+screenY] == 'g'){  //right 
                            g.drawImage(right0,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'h'){  //right walk
                            g.drawImage(right1,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'i'){  //right fence
                            g.drawImage(fence,x,y,0);    
                        } else if(Map[i+screenX][j+screenY] == 'j'){  //left
                            g.drawImage(left0,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'k'){  //left walk
                            g.drawImage(left1,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'l'){  //left fence
                            g.drawImage(fence,x,y,0);    
                        } else if(Map[i+screenX][j+screenY] == 'm'){  //wall
                            g.drawImage(wall,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'n'){  //block
                            g.drawImage(block,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 't'){  //item
                            g.drawImage(itempic1,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'u'){  //item2
                            g.drawImage(itempic2,x,y,0);
                        } else if(Map[i+screenX][j+screenY] == 'z'){  //block
                            g.drawImage(anermy,x,y,0);
                        }
                    }
                }
                String drawstring = "("+actorX+","+actorY+")";
                String HP = "HP";
                level = (score/5) + 1;
                String strscore = "score : " + score;//edit
                fullblood = 20 + ((level-1)*2);
                //if (zoom == 0){
                    g.setColor(0xFF0000);
                    g.drawString(HP,59-((level-1)*2),0,0);
                    g.drawRect(73-((level-1)*2),5,fullblood+1,5);
                    g.fillRect(74-((level-1)*2),5,blood,5);
                    g.setColor(0x00FF00);
                    g.drawString(strscore,0,0,0);
                    g.setColor(0x33AAFF);
                    g.drawString(drawstring,61,86,0);                    
                //}
               
                if (blood == 0){
                    g.setColor(0x000000);
                    g.fillRect(0,0,width+1,height+1);
                    g.setColor(0xFF0000);
                    g.drawString("YOU DIE",30,45,0);
                    sendexit();
                    exit = 1;
                    display.setCurrent(list);
                }
          
        }//close paint()
        
        public void keyPressed(int keycode) {
            
            switch(getGameAction(keycode)) {
                //down
                case Canvas.DOWN:
                    if ((Map[actorX][actorY] == 'a')||(Map[actorX][actorY] == 'b')){
                        if (Map[actorX][actorY+1]== 'o'){
                            if (zoom == 0){
                                if (actorY <= 1 || actorY >= 77){
                                    screenY = screenY;
                                } else {
                                    screenY = screenY + 1;
                                }      
                                
                            } else {
                                if (actorY <= 9 || actorY >= 70){
                                    screenY = screenY;
                                } else {
                                    screenY = screenY + 1;
                                }
                            }
                            if (Map[actorX][actorY] != 'a')    
                                    act = 'a';
                            else act = 'b';
                            Map[actorX][actorY] = 'o';
                            actorY = actorY + 1;
                        } else if((Map[actorX][actorY+1]== 't')||(Map[actorX][actorY+1]== 'u'))
                            sendoption = 2;
                    } else act = 'a';
                        
                    Map[actorX][actorY] = act;
                  
                        
                    //paint(Graphics g);
                    repaint();
                    //new Thread(new RagNo1.Mythread(3)).start();
                    //send();
                    break;
                                     
                //up
                case Canvas.UP:
                    if ((Map[actorX][actorY] == 'd')||(Map[actorX][actorY] == 'e')){
                        if (Map[actorX][actorY-1]== 'o'){
                            if (zoom == 0){
                                if (actorY <= 2 || actorY >= 77){
                                    screenY = screenY;
                                } else {
                                    screenY = screenY - 1;
                                }     
                            } else {
                                if (actorY <= 10 || actorY >= 71){
                                    screenY = screenY;
                                } else {
                                    screenY = screenY - 1;
                                } 
                            }
                            if (Map[actorX][actorY] != 'd')    
                                act = 'd';
                            else act = 'e';    
                            Map[actorX][actorY] = 'o';
                            actorY = actorY - 1;
                        } else if((Map[actorX][actorY-1]== 't')||(Map[actorX][actorY-1]== 'u'))
                            sendoption = 2;
                    } else act = 'd';
                    
                    Map[actorX][actorY] = act;
                    repaint();
                    //new Thread(new RagNo1.Mythread(3)).start();
                    //send();
                    break;
                               
                //left
                case Canvas.LEFT:
                    if ((Map[actorX][actorY] == 'j')||(Map[actorX][actorY] == 'k')){
                        if (Map[actorX-1][actorY]== 'o'){
                            if (zoom == 0){
                                if (actorX <= 2 || actorX >= 98){
                                    screenX = screenX;
                                } else {
                                    screenX = screenX - 1;
                                }    
                            } else {
                                if (actorX <= 10 || actorX >= 91){
                                    screenX = screenX;
                                } else {
                                    screenX = screenX - 1;
                                }
                            }
                            if (Map[actorX][actorY] != 'j')    
                                act = 'j';
                            else act = 'k';    
                            Map[actorX][actorY] = 'o';
                            actorX = actorX - 1;
                        } else if((Map[actorX-1][actorY]== 't')||(Map[actorX-1][actorY]== 'u'))
                            sendoption = 2;
                    } else act = 'j';
                    
                    Map[actorX][actorY] = act;
                    repaint();
                    //new Thread(new RagNo1.Mythread(3)).start();
                    //send();
                    break;
                                  
                // right
                case Canvas.RIGHT:
                    if ((Map[actorX][actorY] == 'g')||(Map[actorX][actorY] == 'h')){
                        if (Map[actorX+1][actorY]== 'o'){
                            if (zoom == 0){
                                if (actorX <= 1 || actorX >= 97){
                                    screenX = screenX;
                                } else {
                                screenX = screenX + 1;
                                }   
                            } else {
                                if (actorX <= 9 || actorX >= 90){
                                    screenX = screenX;
                                } else {
                                    screenX = screenX + 1;
                                }
                            }
                            if (Map[actorX][actorY] != 'g')    
                                act = 'g';
                            else act = 'h';
                            Map[actorX][actorY] = 'o';
                            actorX = actorX + 1;
                        } else if((Map[actorX+1][actorY]== 't')||(Map[actorX+1][actorY]== 'u'))
                            sendoption = 2;
                    } else act = 'g';
                    
                    Map[actorX][actorY] = act;
                    repaint();
                    //new Thread(new RagNo1.Mythread(3)).start();
                    //send();
                    break;
                
                case Canvas.KEY_NUM5:
                    System.out.println("Key num 5");
                    break;
                    
                case Canvas.FIRE:
                    if ((Map[actorX][actorY] == 'a')||(Map[actorX][actorY] == 'b'))
                        act = 'c';
                    if ((Map[actorX][actorY] == 'd')||(Map[actorX][actorY] == 'e'))
                        act = 'f';
                    if ((Map[actorX][actorY] == 'g')||(Map[actorX][actorY] == 'h'))
                        act = 'i';
                    if ((Map[actorX][actorY] == 'j')||(Map[actorX][actorY] == 'k'))
                        act = 'l';
                    Map[actorX][actorY] = act;
                    repaint();
                    //send();
                    break;
                
                case Canvas.GAME_A:
                    if (blood < fullblood)
                        blood = blood + 1;
                    repaint();
                    break;
             
                case Canvas.GAME_B:
                    if (blood > 0)
                        blood = blood - 1;                        
                    repaint();
                    break;
                    
                case Canvas.GAME_C:
                    System.out.println("c");
                    lists = new List("Option",List.IMPLICIT,options,null);
                    //add commands
                    lists.addCommand(selectCommand);
                    lists.addCommand(backCommand);
                    lists.setCommandListener(this);
                    display.setCurrent(lists);
                    break;
                    
                case Canvas.GAME_D:  //zoom out
                    if (zoom == 0){
                        zoom = 1;
                        deltaX = 5;
                        deltaY = 5;
                        if (actorX <= 10)
                            screenX = 0;
                        else if (actorX >= 89)
                            screenX = 81;
                        else
                            screenX = actorX - 10;
                        if (actorY <= 10) 
                            screenY = 0;
                        else if (actorY >= 69)
                            screenY = 60;
                        else 
                            screenY = actorY - 10;                    
                    } else {
                        zoom = 0;
                        deltaX = 19;
                        deltaY = 20;
                        if (actorX <= 2 )
                            screenX = 0;
                        else if (actorX >= 97 )
                            screenX = 95;
                        else 
                            screenX = actorX - 2;
                        if (actorY <= 2)
                            screenY = 0;
                        else if (actorY >= 77)
                            screenY = 75;
                        else 
                            screenY = actorY - 2;
                    }
                    repaint();
                    break;
                    
                case Canvas.KEY_POUND:
                    break;
                
                case Canvas.KEY_STAR:
                    System.out.println("star");
                    
                    break;
                    
                default:
               
            }//close switch
        }//close keypress
        
        public void keyReleased(int keycode){
            switch(getGameAction(keycode)){
                case Canvas.DOWN:
                    if (sendoption == 2){
                        send();
                        sendoption = 0;
                    } else send();
                    break;
                
                case Canvas.UP:
                    if (sendoption == 2){
                        send();
                        sendoption = 0;
                    } else send();
                    break;
                
                case Canvas.LEFT:
                    if (sendoption == 2){
                        send();
                        sendoption = 0;
                    } else send();
                    break;
                 
                case Canvas.RIGHT:
                    if (sendoption == 2){
                        send();
                        sendoption = 0;
                    } else send();
                    break;
                    
                case Canvas.FIRE:
                    if (Map[actorX][actorY] == 'c'){
                        if(Map[actorX][actorY+1] == 'z')
                            sendoption = 1; // kill monster
                        else if ((Map[actorX][actorY+1] == 'a')||(Map[actorX][actorY+1] == 'b')
                                ||(Map[actorX][actorY+1] == 'd')||(Map[actorX][actorY+1] == 'e')
                                ||(Map[actorX][actorY+1] == 'g')||(Map[actorX][actorY+1] == 'h')
                                ||(Map[actorX][actorY+1] == 'j')||(Map[actorX][actorY+1] == 'k'))
                            sendoption = 3; // kill actor
                        act = 'a';
                    } else if (Map[actorX][actorY] == 'f'){
                        if(Map[actorX][actorY-1] == 'z')// kill monster
                            sendoption = 1;
                        else if ((Map[actorX][actorY-1] == 'a')||(Map[actorX][actorY-1] == 'b')
                                ||(Map[actorX][actorY-1] == 'd')||(Map[actorX][actorY-1] == 'e')
                                ||(Map[actorX][actorY-1] == 'g')||(Map[actorX][actorY-1] == 'h')
                                ||(Map[actorX][actorY-1] == 'j')||(Map[actorX][actorY-1] == 'k'))
                            sendoption = 3; // kill actor
                        act = 'd';
                    } else if (Map[actorX][actorY] == 'i'){
                        if(Map[actorX+1][actorY] == 'z')
                            sendoption = 1;
                        else if ((Map[actorX+1][actorY] == 'a')||(Map[actorX+1][actorY] == 'b')
                                ||(Map[actorX+1][actorY] == 'd')||(Map[actorX+1][actorY] == 'e')
                                ||(Map[actorX+1][actorY] == 'g')||(Map[actorX+1][actorY] == 'h')
                                ||(Map[actorX+1][actorY] == 'j')||(Map[actorX+1][actorY] == 'k'))
                            sendoption = 3; // kill actor
                        act = 'g';
                    } else if (Map[actorX][actorY] == 'l'){
                        if(Map[actorX-1][actorY] == 'z')
                            sendoption = 1;
                        else if ((Map[actorX-1][actorY] == 'a')||(Map[actorX-1][actorY] == 'b')
                                ||(Map[actorX-1][actorY] == 'd')||(Map[actorX-1][actorY] == 'e')
                                ||(Map[actorX-1][actorY] == 'g')||(Map[actorX-1][actorY] == 'h')
                                ||(Map[actorX-1][actorY] == 'j')||(Map[actorX-1][actorY] == 'k'))
                            sendoption = 3; // kill actor
                        act = 'j';
                    }
                    Map[actorX][actorY] = act;
                    repaint();
                    send();
                    sendoption = 0;
                    
                    break;
                    
                default:
            }
        }
        public void commandAction(Command c,Displayable d)
        {
            if(d==lists && c==selectCommand)
           {
               System.out.println(options[((List)d).getSelectedIndex()]);
               if(options[((List)d).getSelectedIndex()]=="Exit Game")
               {
                   sendexit();
                   exit = 1;
                   display.setCurrent(list);
               }
           }
           else if(d==lists && c==backCommand)
           {
               System.out.println("back");
               repaint();
               send();
           }
        }
    }//close class ColorTestCanvas
    
}//close class RagNo1

