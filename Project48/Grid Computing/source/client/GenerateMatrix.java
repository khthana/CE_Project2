import java.io.*;
import java.util.*;

public class GenerateMatrix
{
	public static void main(String[] args)
	{
		String fileName = args[0];
		int row = Integer.parseInt(args[1]);
		int col = Integer.parseInt(args[2]);
		try
		{
			int num=0; //num for random integer
			Random r = new Random(); //r for random
			FileWriter file = new FileWriter(fileName);  //write to fileName

			for (int i=0;i<row ;i++)
			{
				for (int j=0;j<col ;j++)
				{
					num = r.nextInt(); //random int to num
					num = num % 10;
					if (num<0)
					{
						num = num*-1; //change num - to num +
					}

					String s = Integer.toString(num);
					file.write(s);
					file.write(' ');
				}
				file.write('\n');
			}
			file.close();
		}	
		catch(Exception e)
		{
			System.out.println("Error.");
		}	
	}
}
