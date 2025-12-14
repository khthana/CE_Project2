package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

public class Util {
	//Convert String of binary -> Integer
	public static int bin2int(String bin){
		int sum = 0;
		int times;
		int temp;
		for(int i=0;i<bin.length();i++){
			if(bin.charAt(i) == '1'){
				times = bin.length() - i - 1;
				temp = 1;
				for(int j=0;j<times;j++){
					temp = temp*2;
				}
				sum = sum+temp;
			}
		}
		return sum;
	}

	//Convert integer to String of binary
	public static String int2bin(int i,int wantLength){
		int temp = i;
		String output = new String("");

		while(temp != 0){
			if((temp % 2) == 1){
				output = "1"+output;
				temp = temp/2;
			} else{
				output = "0"+output;
				temp = temp/2;
			  }
		}
		if(output.length() >= wantLength){
			output = output.substring(output.length()-wantLength);
			return output;
		} 
		wantLength = wantLength-output.length();
		for(int w=0;w < wantLength;w++){
			output = "0"+output;
		}
		return output;
	}
}