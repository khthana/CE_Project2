#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#define x 11 

double deter(double buff[x][x],int R);
int RA,RB,CA,CB;

main(int argc,char** argv) 
{
  int i,j,l,rank,size,dest,worker,n,extra,R,loop,task,numworker,Co,is_M2,k;
  FILE *fp;
  char ch,temp[90];
  double buffer[x][x],e[x][x],sdet,buff1[x][x],sd[x],det,start,stop,start1,stop1;
  MPI_Status status;
  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rank);
  MPI_Comm_size(MPI_COMM_WORLD,&size);



  if (rank == 0)
  {     
	start=MPI_Wtime();
	first(temp,fp,buffer);
  	task=CA; numworker=size-1;
  	loop=task/numworker;
  	extra=task%numworker;    
	printf("\n\n               ...Calculating Now...\n");          
    i=1;       
     while (i <= loop) 
     {  
        if (i==1) n=0; else n=(i-1)*numworker;
    
    for(dest=1; dest <= numworker; dest++)
       { 
        cut(n,0,buffer,buff1,CA);
        Co=CA-1;
        MPI_Send(&Co,1,MPI_INT,dest,10,MPI_COMM_WORLD);  
        MPI_Send(&buff1[0][0],x*x,MPI_DOUBLE,dest,10,MPI_COMM_WORLD);
        MPI_Send(&loop,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
        MPI_Send(&extra,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
        n++;
       }
        if (i==1) l=0; 
            else l=(i-1)*numworker;


   
   for(dest=1; dest <= numworker; dest++)
       {  
         MPI_Recv(&sd[l],1,MPI_DOUBLE,dest,10,MPI_COMM_WORLD,&status); 
         l++;
       }
      i++; 
     } 




  if (extra > 0) 
   {
     n=loop*numworker;
     for(dest=1; dest <= extra; dest++)
       {   
        cut(n,0,buffer,buff1,CA);
        Co=CA-1;
        MPI_Send(&Co,1,MPI_INT,dest,10,MPI_COMM_WORLD);  
        MPI_Send(&buff1[0][0],x*x,MPI_DOUBLE,dest,10,MPI_COMM_WORLD);
        MPI_Send(&loop,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
        MPI_Send(&extra,1,MPI_INT,dest,10,MPI_COMM_WORLD); 
          n++; 
        }
      if (i==1) l=0; 
      else l=(i-1)*numworker;


     for(dest=1; dest <= extra; dest++)
       {   
          MPI_Recv(&sd[l],1,MPI_DOUBLE,dest,10,MPI_COMM_WORLD,&status); 
          l++;
       } 
      } 
 for(i =0; i< CA; i++)
   if ((i%2) == 1) sd[i]=-1*sd[i];

 for(i =0; i< CA; i++)
    sd[i]=sd[i]*buffer[i][0]; 
  
  det=0;
 for(i =0; i< CA; i++)
  det=det+sd[i];
  printf("\n\n            determinant is %f\n\n",det);
stop=MPI_Wtime(); 
  printf("               Response Time = %f\n\n",stop-start);
 

}


  if (rank > 0) 
  { start1=MPI_Wtime();  i=1; 
  while (i <= loop+1)
   {
    if (i == loop+1)
      if (rank <= extra)
        {  MPI_Recv(&R,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
           MPI_Recv(&e[0][0],x*x,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
           MPI_Recv(&loop,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
           MPI_Recv(&extra,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
 

                sdet=deter(e,R);
                  

           MPI_Send(&sdet,1,MPI_DOUBLE,0,10,MPI_COMM_WORLD); 
        }
      else ;
   else { 
          MPI_Recv(&R,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
          MPI_Recv(&e[0][0],x*x,MPI_DOUBLE,0,10,MPI_COMM_WORLD,&status); 
          MPI_Recv(&loop,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
          MPI_Recv(&extra,1,MPI_INT,0,10,MPI_COMM_WORLD,&status); 
 

                 sdet=deter(e,R);
                 

          MPI_Send(&sdet,1,MPI_DOUBLE,0,10,MPI_COMM_WORLD); 
         }
    i++;
    }
   stop1=MPI_Wtime(); printf("\n   Response time of node %d is %f\n",rank,stop1-start1); }
MPI_Finalize();
}
       
int cut(int PR,int PC,double buff[x][x],double buff1[x][x],int size)
{ int k,l,i,j;
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
int first(char temp[90],FILE *fp,double buffer[x][x])
{
  int i,j,k,l,is_M2;
  char ch;


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
return 0;
}
