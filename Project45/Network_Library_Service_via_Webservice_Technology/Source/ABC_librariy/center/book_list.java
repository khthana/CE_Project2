package center; 
import java.io.*;
public class book_list  implements Serializable 
{ 
    
    private String title;
    private String author;
    private int book_record;
    private String library;
    

    public String getTitle(){return title;}
    
    public String getAuthor(){return author;}
    
    public int getBook_record(){return book_record;}
    
    public String getLibrary(){return library;}
    
    public void setTitle(String t){title = new String(t);}
    
    public void setAuthor(String a){author=new String(a);}
    
    public void setBook_record(int b){book_record=b;}
    
    public void setLibrary(String l){library =new String(l);}
} 
