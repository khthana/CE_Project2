import java.io.*;
class RanAccFile2{
	public static void main (String args[]) throws IOException{
 		RandomAccessFile ObjRW = new RandomAccessFile("RanData.txt","rw");
		System.out.println("1ข้อมูลที่อ่านได้ก่อนเพิ่ม -> " + ObjRW.readLine());
 		System.out.println("2ขนาดข้อมูลทั้งหมดก่อนเพิ่ม -> " + ObjRW.length()+"\n");
		ObjRW.seek(82);
		long data = ObjRW.length();
		int Num;
		Num = (int)data - 82;
		byte TEST[] = new byte[Num];
		for(int i = 0; i<Num; i++){
			TEST[i] = ObjRW.readByte();
		}
		ObjRW.seek(82);
		ObjRW.writeBytes("TEST INSERT DATA. ");
		for(int i = 0; i<Num; i++){
			ObjRW.write(TEST[i]);
		}
		ObjRW.seek(0);
		System.out.println("ข้อมูลที่อ่านได้หลังเพิ่ม -> " + ObjRW.readLine());	
		System.out.println("ขนาดข้อมูลทั้งหมดหลังเพิ่ม -> " + ObjRW.length()+"\n");
 	}
 }
