#include "24Image.h"
#include "2Image.h"
#include <afxwin.h>
#include <iostream.h>
//#include <system.h>

#include "util.h"

void main(){
	//int i=801;

	CString path1;
	CString path2;
	CString filename;
	C24Image pic;
	CColor col;
	C2Image Nor,Nor2;//
	CRect big;

	double b,r,g;
	int Wd,Ht;
	long sum=0;
	CPoint peakPt;
	
	for(int i=801;i<=811;i++)
		for(int j=1;j<=10;j++){
		path1.Format(".//picture/%d-%d.bmp",i,j);//Source file
		
		cout<<path1<<endl;	
		pic.GetData(path1);
		
		Wd=pic.bmiHeader.biWidth;Ht=pic.bmiHeader.biHeight;
		Nor.Setdata (Wd,Ht);Nor2.Setdata (Wd,Ht);
		
		big=CRect(800,800,0,0);
		int sumX[640]={0},sumY[480]={0};

		for (int x=0;x<Wd;x++){
			for(int y=0;y<Ht ;y++){
			
				col=pic.GetPixel (x,y);
				r=col.Rpixel;	r=r/(col.Bpixel +col.Gpixel +col.Rpixel );
				g=col.Gpixel;	g=g/(col.Bpixel +col.Gpixel +col.Rpixel );
				b=col.Bpixel;	b=b/(col.Bpixel +col.Gpixel +col.Rpixel );
			
				if(b>=0.4 && b>g && b>r)	Nor.SetPixel (x,y,0);
					else Nor.SetPixel (x,y,1);
				if (b-r>0.2 && b-g>0.2 &&b>0.4/*&&col.Bpixel <200*/) {
					Nor2.SetPixel (x,y,0);
					sumX[x]++;	sumY[y]++;
					if(x<big.left) big.left=x;
					if(x>big.right ) big.right=x;
					if(y<big.top) big.top=y;
					if(y>big.bottom) big.bottom=y;
				}
				else Nor2.SetPixel (x,y,1);
			}//end for y
		}//end for x
		peakPt=Template(big,Nor2,sumX,sumY);
	//	peakPt=CPoint(0,0);
		
		if(peakPt!=CPoint(0,0))	{
			AdjustT(big,Nor,peakPt.x,peakPt.y );
			for(int x=0;x<Wd;x++)
			{
				sumX[x]=0;
				 for (int y=0;y<Ht;y++){
					 if(x==0) sumY[y]=0;
				  sumX[x]++;	sumY[y]++;
				  if(!big.PtInRect (CPoint(x,y)))Nor.SetPixel (x,y,1);
			  }
			}
		}
		else{
			for(int x=0;x<Wd;x++){
				sumX[x]=0;
		      for (int y=0;y<Ht;y++){
				   if(x==0) sumY[y]=0;
				  sumX[x]++;	sumY[y]++;
				  if(!big.PtInRect (CPoint(x,y)))Nor.SetPixel (x,y,1);
			  }
			}
		}

		if (big.left<0)big.left=0;
		if(big.top<0)big.top=0;
		if(big.right >=Wd)big.right =Wd-1;
		if(big.bottom >=Ht)big.bottom =Ht-1;
///////////////////////////////Template matching//////////////////////////////////
				
	Recog(big,Nor,sumX,sumY);

	

	
	}

}//end main


const int Twd=48,Tht=64;///Template width & Height

int matching(C2Image no){
	C24Image Tpro;

	CString path,pro;
	path.Format(".//picture/numbers/");
	
	int ret,retB;
	double sum,peak;
	int pa,pc;
	peak=0;
	
	int all;
	for(int i=0;i<10;i++){
		//if(i==1) i++;////////No matching no1
		pro.Format(path+"E%d.bmp",i);
		Tpro.GetData (pro);
		sum=0;all=0;
		for(int x=0;x<=Twd;x++)
			for(int y=0;y<=Tht;y++){
				/*pa=Tpro.GetRed (x,y)/255;
				
				pc=no.GetPixel(x,y);
				if(pa==pc) sum++;*/
				if(Tpro.GetRed (x,y)<10 ){
					all++;
					if(no.GetPixel(x,y)==0)	sum++;
					
				}
			
			}
			if(sum/all>=peak) {//all
			//	if(peak>0) mama<<ret<<" ,	"<<peak<<"		"<<endl;//muk
				peak=sum/all;//all;
				ret=i;
			}
		
	}
	
//	mama<<ret<<" ,	"<<peak<<"		"<<endl;
	return ret;
}

/*###########################################################################*/

int *strobeX,*strobeY,*lineX,*lineY;
int matching16(CRect rect){//no==5 or no==6 or no==8
	///rect that bounds number and no that was previously recognize
	if(strobeX[2]<90&&strobeX[3]<90) return 5;
	else if(strobeY[13]>=90) return 8;
	return 6;
	
}

int strobes(CRect bound,C2Image& pic,int size){

	double sum=0;
	strobeX=new int[size*size];
	strobeY=new int[size*size];
	//int [size][size]={0};
	lineX=new int[size+1];
	lineY=new int[size+1];
	int i,j,x,y;
	for( i=0;i<size+1;i++){
		lineX[i]=bound.left +((bound.Size ().cx )*(i*100/size))/100;
		lineY[i]=bound.top  +((bound.Size ().cy )*(i*100/size))/100;
	}

	int last=255;

	//ganX
	for(j=0;j<size;j++){
		for(y=lineY[j];y<lineY[j+1];y++){
		last=255;
		for(i=0;i<size;i++){ //each block of the table 2*2
			if(y==lineY[j]) strobeX[i*size+j]=0;
			for(x=lineX[i];x<lineX[i+1];x++){
						if(last==255){//if last=white
						if(pic.GetPixel(x,y)==0){//and if this=blue
							strobeX[i*size+j]++;
							last=0;
						}else last=255;
					}else if(pic.GetPixel(x,y)==0) last=0;
					else last=255;
				}
			}
		}
	}




	//Inverse Strobe

		for(j=0;j<size;j++){
		for(y=lineY[j];y<lineY[j+1];y++){
		last=255;
		for(i=size-1;i>=0;i--){ //each block of the table 2*2
			if(y==lineY[j]) strobeY[i*size+j]=0;
			for(x=lineX[i+1];x>lineX[i];x--){
						if(last==255){//if last=white
						if(pic.GetPixel(x,y)==0){//and if this=blue
							strobeY[i*size+j]++;
							last=0;
						}else last=255;
					}else if(pic.GetPixel(x,y)==0) last=0;
					else last=255;
				}
			}
		}
	}



	for(i=0;i<size;i++)
		for(j=0;j<size;j++){
			strobeX[i*size+j]=strobeX[i*size+j]*100/(lineY[j+1]-lineY[j]);
			strobeY[i*size+j]=strobeY[i*size+j]*100/(lineY[i+1]-lineY [i]);
		
	}


	//write file
		//mumu.open(path2+filename+".txt",ios::out);
	
/*		for(j=0;j<size;j++){
			for(i=0;i<size;i++){
				momo<<strobeX[i*size+j]<<" ";
			}
			momo<<"     ";
			for(i=0;i<size;i++){
				momo<<strobeY[i*size+j]<<" ";
			}
			momo<<endl;
		}
		//mumu.close();*/



	sum=sum/(bound.Size ().cx);
return matching16(bound);
}
int check1(CRect no,int pre,int aft){//check if this is 1 
	/* Parameter 1.no,rectangle that cover that number 
				2. the leftmost of the previous number
		and		3. aft,if previous number is 1 then aft is 1(default is 0)
				*/

	if( no.left -pre>=(aft*5)+7 &&no.Size ().cx<30&&no.Size().cy<50) 
	return 1;
	
	return 0;

}

int slip(int x, int sumX[], int right){
	int i,stop=x+5;
	int lowest=sumX[x];
	int lowestPos=x;
	bool flag=true;
	
	//if(right==1) stop=x+25;

	/////Find lowest pos
	for(i=x-10;i<=x+10;i++){
		if(sumX[i]<lowest ){
			lowest=sumX[i];
			lowestPos=i;
		}
	}
	
	///Adjust the position
	
	if(right) {
		i=lowestPos+1;
		while (sumX[i]<=lowest) {
			lowestPos=i;
			i++;
		}
	}
	else{
		i=lowestPos-1;
		while (sumX[i]<=lowest) {
			lowestPos=i;
			i--;
		}
	}
			
	return lowestPos;
}

				

void Recog(CRect big,C2Image &Source,int sumX[],int sumY[]){

	int Wd=Source.bmiHeader .biWidth ;		int Ht=Source.bmiHeader .biHeight ;
	int h,k;
	int startflag=0,foundflag=0;
	int linkX,linkY;
	int sum=0;
	int start,stop,gap;

	int tsx=3;
	CRect No[3];

	C2Image	sumpic;
	sumpic=Source;
	int ret1,ret2;
	C2Image Tnow(Twd,Tht);
	

	while(big.Size ().cx>180) {//too wide===> trim it
		for(int x=big.left ;x<=big.right ;x++)		
			if(sumX[x]<tsx){	
					for(int y=big.top ;y<=big.bottom ;y++)
					sumpic.SetPixel (x,y,1);
			}
			tsx++;
			big=CRect(800,800,0,0);
			for (x=0;x<Wd;x++){
				sumX[x]=0;
				for (int y=0;y<Ht;y++){
					if(x==0) sumY[y]=0;
			      	if(sumpic.GetPixel(x,y)==0){
							sumX[x]++;
							sumY[y]++;
							if(x<big.left) big.left=x;
							if(x>big.right ) big.right=x;
							if(y<big.top) big.top=y;
							if(y>big.bottom) big.bottom=y;
					}
				}
			}
	}

	int space,startx=big.left ;
	space=0;
	startflag=0;
	
	int thick;//thick of black spot
	int sx,sy;
	sx=2; sy=2;
	int thickA,thickB;//Thick before and after space 
		

	/////////////Scan for sx pixel long
	for(int y=big.top ;y<=big.bottom ;y++){
		thick=0;
		for(int x=big.left ;x<=big.right ;x++)	{
			if(sumpic.GetPixel(x,y) ==1|| x==big.right ){
				if(thick<=sx){
					if(sumpic.GetPixel (x,y)==0){
						thick++;
						x++;
					}
					for(int h=x-thick;h<x;h++){
							sumpic.SetPixel (h,y,1);
							sumX[h]--;
							sumY[y]--;
					
					}
				}

				thick=0;
			}
			else thick++;
		}
	}

		/////////////Scan for sy pixel long

		for(int x=big.left ;x<=big.right ;x++)	{
			thick=0;
			for(y=big.top ;y<=big.bottom ;y++){	
				if(sumpic.GetPixel(x,y)==1 || y==big.bottom  ){
					if(thick<=sy){
						if(sumpic.GetPixel (x,y)==0){
							thick++;
							y++;
						}
						for(int k=y-thick;k<y;k++){
								sumpic.SetPixel (x,k,1);
								sumY[k]--;
								sumX[x]--;
						}
					}

					thick=0;
				}
				else thick++;
			}
		}

		CRect T=big;
			big=CRect(800,800,0,0);
				for(x=T.left ;x<=T.right ;x++)	{	
						sumX[x]=0;
						for(y=T.top ;y<=T.bottom ;y++){	
							if(x==0) sumY[y]=0;
				      	if(sumpic.GetPixel(x,y)==0){
							sumX[x]++;
							sumY[y]++;
							if(x<big.left) big.left=x;
							if(x>big.right ) big.right=x;
							if(y<big.top) big.top=y;
							if(y>big.bottom) big.bottom=y;
						}
						}
			}
				startflag=0; space=0;
				
/////////********************************////////////////////	

			for(x=big.left ;x<=big.right ;x++)	{	
				if(sumX[x]>0){
					startflag=1;
					if(space>35 ) {
						sumX[x]=0;
						//space++;
					
						if(x-space-big.left <80)  {
							for(int xt=big.left ;xt<x-space;xt++) sumX[xt]=0;
							big.left =x;
						}	
						else if(big.right -x <80)  {
							for(int xt=x ;xt<big.right ;xt++) sumX[xt]=0;
							big.right =x-space-1;
							break;
						}

						
					}
					else space=0;

					
				}
				else {
					//if(sumX[x-1]>0) space=0;
					startx=x+1;
					if(startflag) space++;
					
				}
			}
			
				////Check if 2-rim made a boundary wrong
		int F=0,B=0;
			int spaceF=0,spaceB=0;
			sum=0;

			for(int d=0;d<=10;d++){
				if(sumX[big.left +d] ==0)spaceF++;
				else sum+=sumX[big.left+d];
				if(sumX[big.right -d] ==0)spaceB++;

				if(spaceF==2) {
					if(sum>50) break;
					x=big.left +d;
				/*	for(x=big.left ;x<=big.left +d-spaceF;x++)
						for(y=big.top ;y<=big.bottom ;y++){
							if(sumpic.GetPixel (x,y)==0){
								sumpic.SetPixel (x,y,1);
									sumY[y]--;
									sumX[x]--;
							}
						}

						for(x=big.left  +d-spaceF;sumX[x]==0;x++){
						}*/
						while (sumX[x]==0) x++;
						big.left =x;
					break;
				}
					if(spaceB==2) {
						x=big.right-d;
					/*	for(x=big.right ;x>=big.right-d+spaceB ;x--)
							for(y=big.top ;y<=big.bottom ;y++){
					
							if(sumpic.GetPixel (x,y)==0){
								sumpic.SetPixel (x,y,1);
									sumY[y]--;
									sumX[x]--;
							}
						}
					for(x=big.right ;sumX[x]==0 ;x--){
						}*/
					while (sumX[x]==0) x--;
					big.right= x;
					break;
					}
				
			
			}				

//////////////////**********************************////////////////////////////////
	// Get X bound			 
			No[0].left = big.left;
			No[0].right= slip(big.left + ((big.right-big.left)*1/3),sumX,0);
			No[1].left = slip(big.left + ((big.right-big.left)*1/3),sumX,1);
			No[1].right= slip(big.left + ((big.right-big.left)*2/3),sumX,0);
			No[2].left = slip(big.left + ((big.right-big.left)*2/3),sumX,1);
			No[2].right= big.right;
		
			////////////////find the top-bottom of each No

			for(x=0;x<3;x++){
			startflag=0;
			for(h=big.top ;h<=big.bottom ;h++){
				for(int k=No[x].left ;k<=No[x].right ;k++){
					if(sumpic.GetPixel(k,h)==0){
						if(!startflag) {No[x].top =h; startflag=1;}
						No[x].bottom =h;
					}
				}
			}
		}

	
			int t;
			int change=0;
			if(No[2].Size ().cy>80){
				t=No[2].top ;
				No[2].top=No[2].bottom -80;
				change=1;
				for(h=t;h<=No[2].top ;h++)
				  for(int k=No[2].left ;k<=No[2].right ;k++){
					  if(sumpic.GetPixel(k,h)==0){
						  sumX[k]--;sumY[h]--;
					  }
				
				  }
				
				startflag=0;
				t=No[2].top ;
			  for(h=t ;h<=No[2].bottom ;h++){
				for(int k=No[2].left ;k<=No[2].right ;k++){
					if(sumpic.GetPixel(k,h)==0){
						if(!startflag) {No[2].top =h; startflag=1;}
						//No[x].bottom =h;
					}
				}
				
			}
			}
			

	//adjust top of each position to No3.top must be in the highest position
		for(x=1;x>=0;x--)
			if(No[x].top <No[x+1].top ) {
				startflag=0;
				t=No[x].top ;
				change=1;
				No[x].top =No[x+1].top +1;
				
				for(h=t;h<=No[x].top ;h++){
				  for(int k=No[x].left ;k<=No[x].right ;k++){
					  if(sumpic.GetPixel(k,h)==0){
						  sumX[k]--;sumY[h]--;
					  }
				
				  }
				}
				t=No[x].top ;
			  for(h=t ;h<=No[x].bottom ;h++){
				for(k=No[x].left ;k<=No[x].right ;k++){
					if(sumpic.GetPixel(k,h)==0){
						if(!startflag) {No[x].top =h; startflag=1;}
						//No[x].bottom =h;
					}
				}
			
			}
			}
			
		if(change){
				for(x=0;x<3;x++){
					startflag=0;
					t=No[x].left;
					for(k=t ;k<=No[x].right ;k++){
						for(h=No[x].top  ;h<=No[x].bottom ;h++){
				
							if(sumpic.GetPixel(k,h)==0){
								if(!startflag) {No[x].left =k; startflag=1;}
							}
						}
			
					}
				}
			}
		

			ret1=check1(No[1],No[0].right );//check if number1
			double ratioX,ratioY;
			int xx,yy;
			
		
			
				ratioX=No[2].Size ().cx;
				ratioX/=Twd;
					ratioY=No[2].Size ().cy ;
					ratioY/=Tht;
					for(x=0;x<Twd;x++)
						for(y=0;y<Tht;y++){
							
							xx=x*ratioX+0.5+No[2].left ;
							yy=y*ratioY+0.5+No[2].top ;
							int a =Source.GetPixel (xx,yy);
							Tnow.SetPixel (x,y,a);
							
						}
						
					ret2=matching(Tnow);

					//cout<<"a	"<<ret2<<"	";
					if(ret2==1 ||ret2==7) {
						if(check1(No[2],No[1].right ,ret1)==1)//check if number1
							ret2=1;
						else ret2=7;
					}
			
			
			int a=0;


			if(ret2==5||ret2==6||ret2==8){

				
				ret2=strobes(No[2],sumpic,4);
			}
			
			///////////////////////////////////Color the edge
			int minX=70,minY=70;
			int maxX=0,maxY=0;
			for(int l=0;l<3;l++){
				for(k=No[l].left;k<=No[l].right;k++){
					sumpic.SetPixel(k ,No[l].top,0);
					sumpic.SetPixel(k ,No[l].bottom,0);
					for(h=No[l].top;h<No[l].bottom;h++){
						sumpic.SetPixel(No[l].left,h,0);
						sumpic.SetPixel(No[l].right,h,0);
					}
				}
				for(h=l+1;h<3;h++){
					if(abs(No[l].Size ().cx-No[h].Size().cx)>maxX) maxX=abs(No[l].Size ().cx-No[h].Size().cx);
					if(abs(No[l].Size ().cx-No[h].Size().cx)<minX) minX=abs(No[l].Size ().cx-No[h].Size().cx);
					if(abs(No[l].Size ().cy-No[h].Size().cy)>maxY) maxY=abs(No[l].Size ().cy-No[h].Size().cy);
					if(abs(No[l].Size ().cy-No[h].Size().cy)<minY) minY=abs(No[l].Size ().cy-No[h].Size().cy);
				}
				
			}
			 Source=sumpic;
			 cout<<ret1<<"	"<<ret2<<endl;

}


void AdjustT(CRect &big,C2Image &Nor,int maxX,int maxY){

int space=0,scanY=0;
int startflag=0;

int sumX[640],sumY[480];
C2Image sumpic/*(640,480)*/;

	
	int Wd=Nor.bmiHeader .biWidth ;		int Ht=Nor.bmiHeader .biHeight ;
	sumpic.Setdata (Wd,Ht);
	for(int x=0;x<Wd;x++){
		sumX[x]=0;
		scanY=0; space=0; startflag=0;

		for(int y=maxY;y>=0;y--){///higher than maxY
			if(x==0) sumY[y]=0; //reset sumY
			if(big.PtInRect (CPoint(x,y))){
				if(Nor.GetPixel (x,y)==0){
 						if(!startflag){
							if(x<maxX+40){
								if(maxY-y<=15){
									startflag=1;
								}
							}//end if(x<maxX)
							else if(maxY-y<=70){
										startflag=1;
							}
					
						}//if (!startflag)
						
						if(startflag){
							if(/*y-maxY<60 ||*/ space <25){
								if(x<maxX && maxY-y>20)  sumpic.SetPixel (x,y,1);
								else{
										sumpic.SetPixel (x,y,0);
										sumX[x]++;sumY[y]++;
										space=0;
									}
							}//if(space <25)
							else sumpic.SetPixel (x,y,1);
						}//end if(start flag)
						else sumpic.SetPixel (x,y,1);
								
				}//if(Nor.GetPixel (x,y)==0)
							
				else {// Nor==1
						sumpic.SetPixel (x,y,1);
						if(startflag)	space++;
				}
			}//end PtInRect
			else sumpic.SetPixel (x,y,1);
		}//for y


	}//for x
		///End Upper  Section*///////

		////////Start Lower Section///////////////////////////

			for(x=0;x<Wd;x++){
				sumX[x]=0;
				scanY=0; space=0; startflag=0;

				for(int y=maxY+1;y<Ht;y++){
						if(x==0) sumY[y]=0;
 					if(big.PtInRect (CPoint(x,y))){
							if(Nor.GetPixel (x,y)==0){
 								if(!startflag){
									if(x<maxX+40){
										if(y-maxY<=75){
											startflag=1;
										}
									}//if(x<maxX)
									else //x after maxX
									if(y-maxY<=40){
										startflag=1;
									}

								}//if(!startflag)
								if(startflag){
									if(space <50) {
										if(maxX<x && y-maxY>80) sumpic.SetPixel (x,y,1);
										else{
											sumpic.SetPixel (x,y,0);
											sumX[x]++;sumY[y]++;
											space=0;
										}
									}//end if(space<40)
									else sumpic.SetPixel (x,y,1);
								}//end startflag
								else sumpic.SetPixel (x,y,1);
								
							}//end if(Nor.GetPixel (x,y)==0)
							
							
							else {// Nor==1
								sumpic.SetPixel (x,y,1);
								if(startflag)	space++;
							}
						}//end PtInRect

						else sumpic.SetPixel (x,y,1);
					}//for y
				}//for x
	Nor=sumpic;
}
CPoint Template(CRect &big,C2Image Nor2a,int sumX[],int sumY[]){
	

//	C2Image sumpic(640,480,256);


	int startflag=0;
	int sum=0;
	int h,k;
	C24Image window;
	window.GetData (".//picture/Numbers/8-1.bmp");
	
	CRect win;
	int wWd,wHt;
	wWd=window.bmiHeader .biWidth ;	wHt=window.bmiHeader .biHeight ;
	int Wd,Ht;
	Wd=Nor2a.bmiHeader .biWidth ;	Ht=Nor2a.bmiHeader .biHeight ;
	int sumx,sumy;
	int wc,pc;		//color from window and Source picture
	int max=0,maxX=0,maxY=0;		//max point
	int linkY=0;
	CPoint maxPt(0,0);



	if(big.Size().cx >160 || big.Size ().cy>120) {
		
			int check;
			for(int x=0;x<Wd ;x++){
				for(int y=0 ;y<Ht ;y++){
					sum=0;
					
					if(x<Wd-wWd && big.PtInRect (CPoint(x+20,y+20)) && y<Ht-wHt){
																						
						/********************///Checking for thickness	End*****///////
							win=CRect(x,y,x+wWd,y+wHt);
						if((Nor2a.GetPixel (win.CenterPoint ())==0)){
								sum=0;
								for(h=0;h<wWd;h++){
									
										for(k=0;k<wHt;k++){
											wc=window.GetRed(h,k)/255;
											pc=Nor2a.GetPixel(x+h,y+k);
												if(pc==0&&wc==0)	sum++;
																			
										}//close k
									}//clode for h
								}//close if
						}//close if x<Wd-wWd && big.PtInRect (CPoint(x+20,y+20)) && y<Ht-wHt
						
						
						sum=sum*255/(wWd*wHt);
						if(sum>max){
							max=sum;
							maxPt=CPoint(x,y);
						}
					//	sumpic.SetPixel (win.CenterPoint ().x ,maxY=win.CenterPoint ().y,sum);
					}//for y
				//	cout<<x<<endl;
			}//for x
				/////////////////Adjust Big//////////////
				if(maxPt.y-120>big.top )big.top =maxPt.y-100; 
					else big.top-=20;
				if(maxPt.y+140<big.bottom) big.bottom=maxPt.y+120;
					else big.bottom+=20;
				if(maxPt.x-110>big.left )big.left =maxPt.x-100; 
					else big.left-=10;
				if(maxPt.x+170<big.right) big.right=maxPt.x+160;
					else big.right+=10;
				
		
			return maxPt;
	}////if big
			big.InflateRect (20,20,20,20 );
			return CPoint (0,0);//smaller than rect.........return 0

}