#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#define x 10

double deter(double buff[x][x],int R);
int CA,CB,RA,RB;
int loop1,extra1;

main(int argc,char** argv) 
{
  int i,j,l,rank,size,dest,worker,n,extra,R,loop,task,numworker,Co,k,check,sign=4;
  FILE *fp;
  char ch,temp[90];
  double buffer[x][x],e[x][x],sdet,buff1[x][x],sd[x],det,result[x][x],start,stop;
  MPI_Status status;
  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rank);
  MPI_Comm_size(MPI_COMM_WORLD,&size);



/*-------------Master---------------*/

  if (rank == 0)
  {     
	start=MPI_Wtime();
	sign=first(temp,fp,buffer,sign);
	    switch(sign) {
            case 1:printf("\n          Operation Addition...\n\n");;break;
	    case 2:printf("\n          Operation Subtraction...\n \n");;break;
            case 3:printf("\n          Operation Multiple...\n\n");;break;
            default:printf("\n          Operation Determinant...\n\n");}

        printf("           Calculating Now...\n\n");

  	task=CA; numworker=size-1;
  	loop=task/numworker;
  	extra=task%numworker;

    i=1;
     while (i <= loop) 
     {  
        if (i==1) n=0; else n=(i-1)*numworker;
    
    for(dest=1; dest <= numworker; dest++)
       {  
            MPI_Send(&sign,1,MPI_INT,dest,10,MPI_COMM_WORLD);
            switch(sign) {
            case 1:check=sendAdd(buffer,dest,n,loop,extra);break;
	    case 2:check=sendAdd(buffer,dest,n,loop,extra);break;
            case 3:check=sendmulti(buffer,dest,n,loop,extra);break;
            default:check=sendDet(Co,buff1,dest,n,buffer,loop,extra);
	}
        n++;
       }
        if (i==1) l=0; 
            else l=(i-1)*numworker;
   
   for(dest=1; dest <= numworker; dest++)
       {    

            switch(sign) {
            case 1:check=M_RecvAdd(result,dest,l,&status);break;
	    case 2:check=M_RecvAdd(result,dest,l,&status);break;
            case 3:check=M_RecvMulti(result,dest,l,&status);break;
            default:check=M_RecvDet(sd,dest,l,&status);
	}	
         l++;
       }
      i++; 
     } /*end while*/


/*-----------------extra process of master-------------------*/

  if (extra > 0) 
   {
     n=loop*numworker;
     for(dest=1; dest <= extra; dest++)
       {    MPI_Send(&sign,1,MPI_INT,dest,10,MPI_COMM_WORLD);
            switch(sign) {
            case 1:check=sendAdd(buffer,dest,n,loop,extra);break;
	    case 2:check=sendAdd(buffer,dest,n,loop,extra);break;
            case 3:check=sendmulti(buffer,dest,n,loop,extra);break;
            default:check=sendDet(Co,buff1,dest,n,buffer,loop,extra);
	}
          n++; 
        }
      if (i==1) l=0; 
      else l=(i-1)*numworker;
     for(dest=1; dest <= extra; dest++)
       {  
            switch(sign) {
            case 1:check=M_RecvAdd(result,dest,l,&status);break;
	    case 2:check=M_RecvAdd(result,dest,l,&status);break;
            case 3:check=M_RecvMulti(result,dest,l,&status);break;
            default:check=M_RecvDet(sd,dest,l,&status);
	}	
          l++;
       } 
      } 
 if (sign==4) {
 for(i =0; i<CA; i++)
  { if ((i%2) == 1) sd[i]=-1*sd[i];
    sd[i]=sd[i]*buffer[i][0]; 
 
  }
 for(i =0; i<CA; i++)
  det=det+sd[i];
  printf("\n\n        determinant is %f\n\n",det); }
 else
 for(i=0;i < RA;i++)
  { printf("\n");
  for(j=0; j < CB; j++)
      printf("%3.2f ",result[i][j]);
      } printf("\n\n");
 stop=MPI_Wtime();
  printf("           Response Time = %f\n\n",stop-start);
}
/*---------------------------------------------*/

/*-------------------Slave---------------------*/
  if (rank > 0) 
  { i=1; 
  while (i <= loop+1)
   {  
    if (i == loop+1)
      if (rank <= extra) { 
	MPI_Recv(&sign,1,MPI_INT,0,10,MPI_COMM_WORLD,&status);
            switch(sign) {
            case 1:check=slaveAdd(status);break;
	    case 2:check=slaveSub(status);break;
            case 3:check=slavemulti(&status);break;
            default:check=slaveDet(&status);
	}	}
      else ;
   else { 
	MPI_Recv(&sign,1,MPI_INT,0,10,MPI_COMM_WORLD,&status);
            switch(sign) {
            case 1:check=slaveAdd(status);break;
	    case 2:check=slaveSub(status);break;
            case 3:check=slavemulti(&status);break;
            default:check=slaveDet(&status);
       } 
     }
     loop=loop1; extra=extra1;
    i++;
    }
   }
MPI_Finalize();
}

       
int cut(int PR,int PC,double buff[x][x],double buff1[x][x],int size)
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
     return size-1;

}


double deter(double buff[x][x],int R)
{ double sdet=0,de[x],buff1[x][x];
  int Co,i,z,j,l,k,sps;
for (z=0; z < x; z++)
  de[z]=0;
  for( i=0; i < R; i++)
  {   sps=1;
      cut(i,0,buff,buff1,R);
      Co=R-1;
       if ((i%2) != 0) sps=-1; else;
    if (Co==2)
      de[i]=sps*buff[i][0]*(buff1[0][0]*buff1[1][1]-buff1[1][0]*buff1[0][1]);
      else de[i]=sps*buff[i][0]*deter(buff1,Co);
  }
for(l=0; l < x; l++)
   sdet=sdet+de[l];
   return sdet;
}

int sendDet(int Co,double buff1[x][x],int dest,int n,double buffer[x][x],int loop,int extra)
{
        Co=cut(n,0,buffer,buff1,CA);
        MPI_Send(&Co,1,MPI_INT,dest,10,MPI_COMM_WORLD);  
        MPI_Send(&buff1[0][0],x*x,MPI_DOUBLE,dest,10,MPI_COMM_WORLD);
        MPI_Send(&loop,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
        MPI_Send(&extra,1,MPI_INT,dest,10,MPI_COMM_WORLD);  
        return 1;
}

int M_RecvDet(double sd[x],int dest,int l,MPI_Status status)
{
         MPI_Recv(&sd[l],1,MPI_DOUBLE,dest,10,MPI_COMM_WORLD,&status); 
         return 1;
}

int slaveDet(MPI_Status status)
{  int R;
   double sdet,e[x][x];      
         MPI_Recv(&R,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
         MPI_Recv(&e[0][0],x*x,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
         MPI_Recv(&loop1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
         MPI_Recv(&extra1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status);

                sdet=deter(e,R);

         MPI_Send(&sdet,1,MPI_DOUBLE,0,10,MPI_COMM_WORLD); 
         return 1;
}

int sendAdd(double buffer[x][x],int dest,int n,int loop,int extra)
{ 
        MPI_Send(&CA,1,MPI_INT,dest,10,MPI_COMM_WORLD);
        MPI_Send(&CB,1,MPI_INT,dest,10,MPI_COMM_WORLD);
        MPI_Send(&buffer[n][0],CA,MPI_DOUBLE,dest,10,MPI_COMM_WORLD); 
        MPI_Send(&buffer[n+RA+1][0],CB,MPI_DOUBLE,dest,10,MPI_COMM_WORLD);  
        MPI_Send(&loop,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
        MPI_Send(&extra,1,MPI_INT,dest,10,MPI_COMM_WORLD);  
        return 1;
}

int M_RecvAdd(double result[x][x],int dest,int l,MPI_Status status)
{
         MPI_Recv(&result[l][0],CA,MPI_DOUBLE,dest,10,MPI_COMM_WORLD,&status); 
         return 1;
}

int slaveAdd(MPI_Status status)
{      double d[x],e[x];
       int l; 
       MPI_Recv(&CA,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&CB,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&d[0],CA,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&e[0],CB,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&loop1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&extra1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status);


                for(l=0; l <= CA; l++)
                    d[l]=d[l]+e[l];

        MPI_Send(&d[0],CA,MPI_DOUBLE,0,10,MPI_COMM_WORLD); 
        return 1;
}

int slaveSub(MPI_Status status)
{      double d[x],e[x];
       int l; 
       MPI_Recv(&CA,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&CB,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&d[0],CA,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&e[0],CB,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&loop1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&extra1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status);


                for(l=0; l <= CA; l++)
                    d[l]=d[l]-e[l];

        MPI_Send(&d[0],CA,MPI_DOUBLE,0,10,MPI_COMM_WORLD); 
        return 1;
}

int sendmulti(double buffer[x][x],int dest,int n,int loop,int extra)
{
       MPI_Send(&CA,1,MPI_INT,dest,10,MPI_COMM_WORLD);
       MPI_Send(&CB,1,MPI_INT,dest,10,MPI_COMM_WORLD);
       MPI_Send(&RB,1,MPI_INT,dest,10,MPI_COMM_WORLD);
       MPI_Send(&buffer[n][0],CA,MPI_DOUBLE,dest,10,MPI_COMM_WORLD); 
       MPI_Send(&buffer[RA+1][0],RB*x,MPI_DOUBLE,dest,10,MPI_COMM_WORLD); 
       MPI_Send(&loop,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
       MPI_Send(&extra,1,MPI_INT,dest,10,MPI_COMM_WORLD);  

        return 1;
}
      
int slavemulti(MPI_Status status)
{   double d[x],e[x][x],c[x];
    int  i,j,l;
       MPI_Recv(&CA,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&CB,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&RB,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&d[0],CA,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&e[0][0],RB*x,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&loop1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
       MPI_Recv(&extra1,1,MPI_INT,0,10,MPI_COMM_WORLD,&status);

                for(j=0; j < CB; j++)
                 { c[j]=0;
                  for(l=0; l < CA; l++)
                    c[j]=c[j]+d[l]*e[l][j]; }

    MPI_Send(&c[0],CB,MPI_DOUBLE,0,10,MPI_COMM_WORLD); 
    return 1;
}         

int M_RecvMulti(double result[x][x],int dest,int l,MPI_Status status)
{
         MPI_Recv(&result[l][0],CB,MPI_DOUBLE,dest,10,MPI_COMM_WORLD,&status); 
         return 1;
}


int first(char temp[90],FILE *fp,double buffer[x][x],int sign)
{
  int i,j,k,l,is_M2;
  char ch;

/*------open file & initial variable-------*/

  for(l =0;l<90;l++) temp[l] = '&';
   for(i=0; i < x; i++)
    for(j=0; j < x; j++)
	buffer[i][j] = 0;
   if((fp = fopen("list","r")) == NULL)
    {
    puts("cannot open file\n");
    exit(1);
    }
/*---------------------------------*/


/*---read matrix to buffer---*/
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
	      buffer[i][j]=atoi(temp);
	      if (ch == '\n') {
		i++;
		if(is_M2 == 1) CB=j+1;else CA =j+1;
		j=0;
	      }else j++;
	      for(l =0;l<90;l++) temp[l] = '&'; /* Refresh Temp */
	   }
       }
   else
      {
	 ch= getc(fp);
	    j=0;
            switch(ch) {
            case'+':sign=1;break;
	    case'-':sign=2;break;
            case'*':sign=3;break;
            defaults:sign=4;}
            ch= getc(fp);
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
		   buffer[i][j]=atoi(temp);
		   if (ch == '\n'){
		     i++;j=0;
		   }else j++;
		   for(l =0;l<90;l++) temp[l] = '&'; /* Refresh Temp */
		}
	     }
       }
     ch=getc(fp);
    }
 RB = i-1-RA;
fclose(fp);

/*---------------------------*/

   return sign;
}
