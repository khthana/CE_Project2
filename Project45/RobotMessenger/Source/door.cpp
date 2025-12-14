#include "24Image.h"
#include "2Image.h"
#include <iostream.h>
const bool R=true;
const bool L=false;

void main(){
		double b,r,g;
		int Wd,Ht;
		C24Image  pic;
		C2Image pic2;
		CString path1,path2;
		int avgR,avgL;
		int all;
		bool sideflag;
		int x,y;
			int sum;

	for(int i=1;i<=7;i++){
		path1.Format("D:/Project/bitmap/KK/path%d.bmp",i);//Source file
		path2.Format("D:/Project/bitmap/KK/Y/path%dN.bmp",i);//destination file
		
		pic.GetData (path1);
		Wd=pic.bmiHeader .biWidth ;Ht=pic.bmiHeader .biHeight;
		pic2.Setdata (Wd,Ht);
		avgR=0; avgL=0;
		for( y=0 ;y<Ht;y++)
			for( x=0;x<Wd;x++){
				if(y<30){
					if(x<20) avgL+=pic.GetGreen(x,y);
					else if(x>=Wd-20) avgR+=pic.GetGreen(x,y);
				}
				r=pic.GetRed (x,y);g=pic.GetGreen (x,y);b=pic.GetBlue (x,y);
				all=r+b+g;
				r/=all;	g/=all;	b/=all;
				if(r>0.4) pic2.SetPixel (x,y,0);
				else	pic2.SetPixel (x,y,1);
				

		}
		if(avgR>avgL) sideflag=L;
		else sideflag=R;

	

		if(sideflag){//sideflag==R
			for( x=Wd-1;x>=Wd-50;x--){
				sum=0;
				for(y=50;y<70;y++){
					if(pic2.GetPixel (x,y)==0) sum++;
				
					
				}
				if(sum>10) break;
			}
		}
		else{
			for(x=0;x<50;x++){
				sum=0;
				for(y=50;y<70;y++){
					if(pic2.GetPixel (x,y)==0) sum++;
				
				}
				if(sum>10) break;
			}
		}
		if(x==Wd-51 ||x==50) x=0;
		cout<<path1<<"	"<<sideflag<<"	"<<x<<endl;
		pic2.WriteToFile (path2);
	}


			
}