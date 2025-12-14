import java.io.*;
class WriteData{
	public static void main(String[] args) throws IOException{
 FileInputStream ReadData = new FileInputStream("test1.txt");
 FileOutputStream WriteData = new FileOutputStream("test2.txt");
 int c;
 while((c = ReadData.read())!=-1){
 WriteData.write(c);
 }
		ReadData.close();
		WriteData.close();
	}
}
