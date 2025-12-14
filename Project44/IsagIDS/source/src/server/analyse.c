#include <stdio.h>
#include <linux/acct.h>
#include <unistd.h>
#include <string.h>
#include "../define.h"

#define MY_ACCT_COMM 70

long compareCount;	// count how many time recentData compare with DB data //

int findSim(char rseq[SEQ_LEN][MY_ACCT_COMM+1],char dbseq[SEQ_LEN][MY_ACCT_COMM+1]){
/* find similarity value */
  int c;	// counter value //
  int i;
  int simScore;	
  
  simScore=0;
  c=1;
  for (i=0;i<SEQ_LEN;i++){
     if ( !strcmp(rseq[i],dbseq[i]) ){
        simScore+=c;
        c++;
     }else{
        c=1;
     }   
  }
  return simScore;
}

int analyse(char *recent, char *db){
/* main function for analyse part */
  char rseq[SEQ_LEN][MY_ACCT_COMM+1]; 	// recent sequenct list //
  char dbseq[SEQ_LEN][MY_ACCT_COMM+1];	// database sequence //
  FILE *frecent, *fdb;
  int count;
  int maxSim=0;	// keep maximum similarity value //
  int simValue=0;
  int countDbWindow=0;// count db window size //
  int countRWindow=0;// count recent window size //
  unsigned long totalScore=0; // keep total score //
  
  compareCount=0;	// reset compare counter //
  /* open input file */
  frecent=fopen(recent,"r");
  if (frecent==NULL){
     printf("open recent database file '%s' error...\n",recent);
     return -1;
  }
  fdb=fopen(db,"r");
  if (fdb==NULL){
     printf("open past database file error...\n");
     return -1;
  }

  /* first time load sequence list */
  for(count=0;count<SEQ_LEN;count++){
     do{
        fscanf(frecent,"%s\n",rseq[count]); // recent sequence list //
     }while(rseq[count][0]==0);
  }
  /* calculate and compare sequence similarity */
  do{
       countRWindow++;
       //reset DB variable//
       fseek(fdb,0,SEEK_SET);
       for(count=0;count<SEQ_LEN;count++){
       	   do{
	       fscanf(fdb,"%s\n",dbseq[count]);
       	   }while(dbseq[count][0]==0);
       }
       countDbWindow=0;
       maxSim=0;
      /* compare recent with all database */
       do{
            countDbWindow++;
            simValue=findSim(rseq,dbseq);
            if (simValue>maxSim) maxSim=simValue;	// keep maximum similarity value //
            /* read next db sequence */
   	    do {
                 for (count=0;count<SEQ_LEN-1;count++){
                     strcpy(dbseq[count],dbseq[count+1]);
                 }
                 
                 do{
                     fscanf(fdb,"%s\n",dbseq[SEQ_LEN-1]);
                 }while( (!feof(fdb))&&(dbseq[SEQ_LEN-1][0]==0) );
            }while((!feof(fdb))&&((dbseq[0][0]=='-')||(!strcmp(dbseq[0],"<f>"))));
       }while( (!feof(fdb))&&(countDbWindow<DB_WINDOW_SIZE) );
       /* add similarity score */
       totalScore+=maxSim;
       compareCount++;
       /* read next recent sequence */
       do {
              for(count=0;count<SEQ_LEN-1;count++){
                    strcpy(rseq[count],rseq[count+1]);
              }
            do{
               fscanf(frecent,"%s\n",rseq[SEQ_LEN-1]);
            }while( (!feof(frecent))&&(rseq[SEQ_LEN-1][0]==0) );
       }while((!feof(frecent))&&((rseq[0][0]=='-')||(!strcmp(rseq[0],"<f>"))));
  }while( (!feof(frecent))&&(countRWindow<R_WINDOW_SIZE) );
  
  fclose(frecent);
  fclose(fdb);
  return totalScore;
}

