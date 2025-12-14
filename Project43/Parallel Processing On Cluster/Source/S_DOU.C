
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define x 10

double deter(double buff[x][x],int R);
int CA,RA,CB,RB;

int main()
{
  read();
  return 0;
}

int read(void)
{
  double buffer1[x][x],sumdet,tmp,buffer[x][x];
   FILE *fp;
   char ch,temp[90];
   int i,j,k,l,is_M2;
  for(l =0;l<90;l++) temp[l] = '&';
   for(i=0; i < x; i++)
    for(j=0; j < x; j++)
	buffer[i][j] = 0;
   if((fp = fopen("list","r")) == NULL)
    {
    puts("cannot open file\n");
    exit(1);
    }
   i=0; j=0;is_M2=0;
   ch = getc(fp);
  while (ch != EOF)
    {
   if (ch != '\n')
      {
	  if (ch != ' ')
	   {
	     k =0;
	     while (ch != ' ' && ch != '\n')
	      {

		temp[k] = ch;
		k++;
		ch = getc(fp);
	      }
	      buffer[i][j]=atof(temp);
	      if (ch == '\n') {
		i++;
		if(is_M2 == 1) CB=j+1;else CA =j+1;
		j=0;
	      }else j++;
	      for(l =0;l<90;l++) temp[l] = '&'; 
	   }
       }
   else
      {
	 ch= getc(fp);
	    j=0;
	    if (ch == '\n') {i++;RA=i-1;is_M2=1;}
	 else {
	      if (ch != ' ')
		{
		  k=0;
		  while (ch != ' '&& ch != '\n')
		    {
		      temp[k] = ch;
		      k++;
		      ch = getc(fp);
		    }
		   buffer[i][j]=atof(temp);
		   if (ch == '\n'){
		     i++;j=0;
		   }else j++;
		   for(l =0;l<90;l++) temp[l] = '&'; 
		}
	     }
       }
     ch=getc(fp);
    }
 RB = i-1-RA;
fclose(fp);
printf("\n\n               ...Calculating Now...\n");
sumdet=deter(buffer,CA);
  printf("\n\n            determinant is %f\n\n",sumdet);
   return 0;
}

int cut(int PR,int PC,double buff[x][x],double buff1[x][x],int R)
{ int k,l,i,j,tmp;
k=-1; l=0;
  for (i=0;  i < x; i++)
   for(j=0;   j < x; j++)
     buff1[i][j]=0;

      for(i=0; i < x; i++) { l=0; if ( i != PR) k++;
	for(j=0;   j < x; j++)
	  if ((i == PR) || (j == PC))  {}
	  else { buff1[k][l]=buff[i][j];
		 l++;   }
	}    j=0;
     while (buff1[0][j] != 0)
	 j++;
     return j;

}

double deter(double buff[x][x],int R)
{ double de[x],buff1[x][x],sdet=0,sps;
  int Co,i,z,j,l,k;
for (z=0; z < x; z++)
  de[z]=0;
  for( i=0; i < R; i++)
  {   sps=1;
      cut(i,0,buff,buff1,R);
      Co = R-1;
       if ((i%2) != 0) sps=-1; else;
    if (Co==2)
      de[i]=sps*buff[i][0]*(buff1[0][0]*buff1[1][1]-buff1[1][0]*buff1[0][1]);
      else de[i]=sps*buff[i][0]*deter(buff1,Co);
  }

for(l=0; l < CA; l++)
   sdet=sdet+de[l];
   return sdet;
}
