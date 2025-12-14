package appointment;
class testschedulec 
{
	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
		schedulec sc = new schedulec("b",2001,9,2,9,0,10,0);
		System.out.println(sc.overlap());
	}
}
