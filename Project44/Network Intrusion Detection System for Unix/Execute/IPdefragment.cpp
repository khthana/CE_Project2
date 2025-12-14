#include "IPdefragment.h"


/***************************
** Function : Initialize()
** Purpose  : Initial Buffer for Use;
** Argument : none
** Return   : none
***************************/
void IPdefragment::Initialize()
{
   int i;
   for (i=0;i<TUPCOUNT;i++)
   {
      buffer[i].flag = 0;
      buffer[i].tupplecount = 0;

   }
   startindex = 0;
   endindex = 0;
   addindex = 0; 

   fragstartindex = 0;
   fragendindex = 0;
   fragcount = 0;

   gapstartindex = 0;
   gapendindex = 0;
   gapcount = 0;
    
   overflow = 1; 
}


/**********************
** Function : RealTimeFragChk();
** Purpose  : Realtime monitor DoS in network 
**          : Checking Land , Overlap , Gap , Flooding
** Argument : none
** Return   : none  
**********************/
void IPdefragment::RealTimeFragChk(node *data1)
{

//
// don't recieve frame which frag=0 and Non-MF...
// It's complete itself... so Reject !!
// OR ELSE...
// Recieve only frame that have MF flag... 
// and the nonzero-frag_offet frame
//
data = data1;
if (((htons(data->ip_off) & 0x1fff)== 0)  &&              //frag = 0 
   ((htons(data->ip_off) & 0x2000) == 0) ) 
 {                                               //non_MF Frame
                                                // It is complete frame,REJECT 
   } else { 

     startindex = 0;                           // Search in Buffer 
      while (startindex <= endindex){
        if (buffer[startindex].id == data->ip_id) {  //Found in buffer
            FoundInBuffer();
            break;
        }
      startindex++;
     }

     if (startindex > endindex) {        // Don't found in buffer
        NotFoundInBuffer();
     }
   } // else 
//   showbuffer();
}


/***********************
** Function : NotFoundInBuffer();
** Purpose  : Do all job in case of the new-id frame recieved
** Argument : none
** Purpose  : none
************************/
void  IPdefragment::NotFoundInBuffer()
{
// add new row in buffer
//         addindex = 0;         
//         while (buffer[addindex].flag != 0) addindex++;

         buffer[addindex].lmerge = 0;
         buffer[addindex].rmerge = 0;
         buffer[addindex].ip = data->dstip.s_addr;
         buffer[addindex].id = data->ip_id;     // don't use htons for utilization
         buffer[addindex].tupplecount = 1;
         buffer[addindex].count = 1;

         buffer[addindex].tupple[0].lfragoff = htons(data->ip_off) & 0x01fff;
         buffer[addindex].tupple[0].rfragoff = (htons(data->ip_off) & 0x01fff)+ (htons(data->ip_len) - IPHDR_SIZE) / 8;

//   if Fragment Offset = 0 and has MORE FRAGMENT frag
//    buffer.flag = 0x0001
//
 if (((htons(data->ip_off) & 0x2000) == 0x2000) && 
      ((htons(data->ip_off) & 0x1fff) == 0))  {
         buffer[addindex].flag = buffer[startindex].flag | 0x0001; 
  }

//   if Fragment Offset > 0 and has NO FRAGMENT flag
//   buffer.flag = 0x0002
//

  if (((htons(data->ip_off) & 0x2000) == 0) && 
      ((htons(data->ip_off) & 0x1fff) > 0))  {
         buffer[addindex].flag = buffer[startindex].flag | 0x0002; 
  }

   if (addindex > endindex) endindex=addindex;
   addindex++;

   if (addindex == STD_BUF)
   {
     // CheckFlood();
      addindex = 0;
      startindex = 0;
      endindex = 0;
      overflow = 0;     
   }
 
}


/*********************
** Function : NormalCheck(int i);
** Purpose  : Checking the Normal Reassemble and add to buffer
** Argument : i = index of tupple in buffer; 
** Return   : none
*********************/
void IPdefragment::NormalCheck(int i)
{
// NORMAL CHECK;
        // check left...
        // if can reassemble to left of tupple
        // update tupple and inc(merge)
        // .. left fragment offset of tupple = fragmet_offset + length of data

      if (buffer[startindex].tupple[i].lfragoff ==
         (htons(data->ip_off) & 0x1fff) + (htons(data->ip_len) - IPHDR_SIZE)/8)
      {
         buffer[startindex].merge++;
         buffer[startindex].tupple[i].lfragoff = htons(data->ip_off) & 0x1fff;
         buffer[startindex].rmerge = i;          
      }

        // checkright
        // if can reassemble to right of tupple
        // update tupple and inc(merge)
        // .. right fragment offset of tupple = fragment_offset

       if (buffer[startindex].tupple[i].rfragoff ==
         (htons(data->ip_off) & 0x1fff))
       {

         buffer[startindex].merge++;
         buffer[startindex].tupple[i].rfragoff += ((htons(data->ip_len) - IPHDR_SIZE)/8);
         buffer[startindex].lmerge = i;
       }

       // AND.. lmerge is not equal to rmerge .. forever;

}

/*************************
** Function : AbnormalCheck(int i);
** Purpose  : Checking Abnormal reassemble and Alert
** Argument : i = index of tupple in buffer
** Return   : none
*************************/
void IPdefragment::AbnormalCheck(int i)
{
  int lastofframe;
  int startofframe;

  startofframe = htons(data->ip_off) & 0x1fff; 
  lastofframe = (htons(data->ip_off) & 0x1fff) + (htons(data->ip_len) - IPHDR_SIZE)/8;

//  Detecting 
//  1> .. newframe is overlap front of tupple
//  2> .. newframe is overlap end of tupple
//  3> .. newframe is overlap all of tupple
//
 
  if (((lastofframe > buffer[startindex].tupple[i].lfragoff) &&
       ( startofframe < buffer[startindex].tupple[i].lfragoff)) ||

     ((lastofframe > buffer[startindex].tupple[i].rfragoff) &&
      (startofframe < buffer[startindex].tupple[i].rfragoff))  ||


     ((lastofframe == buffer[startindex].tupple[i].rfragoff) &&
      (startofframe == buffer[startindex].tupple[i].lfragoff)))  

    {
//        printf("Found Overlap Package");
        AddOverlapID(htons(data->ip_id));
        buffer[startindex].tupplecount -= 1;
    }


}

/****************************
** Function : AddOverlapID(int i)
** Purpose  : Add ID of Overlap Frame in buffer for print result
** Argument : i = ID number
** Return   : none
*****************************/

void IPdefragment::AddOverlapID(int i)
{
   
  fragcount = 0;
  while (fragcount < fragendindex) {
     if (overlap[fragcount].id == i) {   // found in buffer
         overlap[fragcount].count++;
         overlap[fragcount].end_hour = data->hour;
	 overlap[fragcount].end_min = data->min;
         overlap[fragcount].end_sec = data->sec;

         break; 
     }
     fragcount++;
   }
 
  if (fragcount == fragendindex) {   // don't found in buffer
        fragendindex++;
        overlap[fragcount].id = i;
        overlap[fragcount].ip = data->dstip;
	overlap[fragcount].dest = data->addr.dest;
        overlap[fragcount].count = 1;
        overlap[fragcount].start_hour = data->hour;       
	overlap[fragcount].start_min = data->min;
        overlap[fragcount].start_sec = data->sec;
        overlap[fragcount].end_hour = data->hour;
        overlap[fragcount].end_min = data->min;
        overlap[fragcount].end_sec = data->sec;
  }

  if (fragendindex == STD_BUF) {
     fragendindex = 0;
     perror("Buffer Overflow in Overlap Buffer");
  }

}


/*************************
** Function : ShowResult()
** Purpose  : Show fragment Result
** Argument : none
** Return   : none
*************************/
 void IPdefragment::ShowResult(report *reportor)
{
  int i,logfd;
  char logfile[STD_BUF];
  char dat[80];

		time_t current_time;
		time(&current_time);
	//	char *date=ctime(&current_time);
		struct tm *curr_time=localtime(&current_time);
	//	int size_date=strlen(date);
	//	char date_2[size_date-1];
	//	strncpy(date_2,date,size_date-1);
	//	date_2[size_date-1]='\0';
		check_1_min=((curr_time->tm_hour*60*60)+(curr_time->tm_min*60)+(curr_time->tm_sec))-((overlap[fragcount].start_hour*60*60)+(overlap[fragcount].start_min*60)+(overlap[fragcount].start_sec));
		
/*** print frag ***/
if((div(check_1_min,13).rem==0) && (check_1_min !=0)) 
{

	char str[50];
		 if (fragendindex > 0)
			 {
  				//sprintf(str,"%s : Overlap Package\n",date_2);
				// reporter->gen_report_on_screen(str);
  				for (i=0;i<fragendindex;i++)
				{
     			//	sprintf(str,"%s :[%d] %d:%d:%d - %d:%d:%d = %d\n",inet_ntoa(overlap[i].ip),overlap[i].id,overlap[i].start_hour,overlap[i].start_min,overlap[i].start_sec,overlap[i].end_hour,overlap[i].end_min,overlap[i].end_sec,overlap[i].count);
  			//	reporter->gen_report_on_screen(str);
			//	sprintf(str,"\n");
				//reporter->gen_report_on_screen(str);
					strcpy(report_overlap.name,"Overlap Package Detection Class");
					strcpy(report_overlap.description,"This Class is used to detect IPdefragment attack");
					sprintf(report_overlap.type, "Overlap Package");
					snprintf(report_overlap.detail,sizeof(report_overlap.detail),"someone send fragment packet that maybe have same fragment or "
											   "overlap fragment. This could be issued in order to make you to handle "
					                                                    "this packet in an unpredictable or as a DoS attack.");
					report_overlap.dstip=overlap[i].ip;
					report_overlap.dstport=overlap[i].dest;
					report_overlap.Shour=overlap[i].start_hour;
			                report_overlap.Smin=overlap[i].start_min;
					report_overlap.Ssec=overlap[i].start_sec;
					report_overlap.Ehour=overlap[i].end_hour;
					report_overlap.Emin=overlap[i].end_min;
					report_overlap.Esec=overlap[i].end_sec;
					report_overlap.count =overlap[i].count;
					report_overlap.id =overlap[i].id;
					report_overlap.report_type =2;
					reportor->add_report(&report_overlap);
				}
  			} //if

/*** show gap ***/

  		if (gapendindex > 0)
			{
  			//	sprintf(str,"%s : Unable to Reassemble\n",date_2);reporter->gen_report_on_screen(str);
   				for (i=0;i<gapendindex;i++)
    			//	sprintf(str,"%s : %d %d:%d:%d - %d:%d:%d = %d\n",
         		//	inet_ntoa(gap[i].ip),gap[i].id,gap[i].start_hour,gap[i].start_min,gap[i].start_sec,gap[i].end_hour,gap[i].end_min,gap[i].end_sec,gap[i].count);
    			//	reporter->gen_report_on_screen(str);
			//	sprintf(str,"\n");
			//	reporter->gen_report_on_screen(str);
			{
					strcpy(report_gap.name,"Unable to Reassemble Package Detection Class");
					strcpy(report_gap.description,"This Class is used to detect IPdefragment attack");
					sprintf(report_gap.type, "Unable to Reassemble");
					snprintf(report_gap.detail,sizeof(report_gap.detail),"someone send fragment packet that maybe have missing fragment or "
											   "gap fragment. This could be issued in order to make you to handle "
					                                                    "this packet in an unpredictable or as a DoS attack.");
					report_gap.dstip=overlap[i].ip;
					report_gap.dstport=overlap[i].dest;
					report_gap.Shour=overlap[i].start_hour;
			                report_gap.Smin=overlap[i].start_min;
					report_gap.Ssec=overlap[i].start_sec;
					report_gap.Ehour=overlap[i].end_hour;
					report_gap.Emin=overlap[i].end_min;
					report_gap.Esec=overlap[i].end_sec;
					report_gap.count =overlap[i].count;
					report_gap.id =overlap[i].id;
					report_gap.report_type =2;
					reportor->add_report(&report_gap);
			}
  			} // if

 

   fragstartindex = 0;
   fragendindex = 0;
   fragcount = 0;
   gapstartindex = 0;
   gapendindex = 0;
   gapcount = 0;
}

}

/**************************
** Function : AddNewTupple()
** Purpose  : Add new tupple to Buffer 
** Argument : none
** Return   : none
***************************/
void IPdefragment::AddNewTupple()
{
   int newindex;
   newindex = buffer[startindex].tupplecount++;
   if (newindex == TUPCOUNT) 
   {

//      printf(" Syncflood Style Attack ..  It have gap in each frame \n");

      GapDetect(data->ip_id);
      newindex = 0; 
      buffer[startindex].tupplecount =0;
   }

   buffer[startindex].tupple[newindex].lfragoff = htons(data->ip_off)
   & 0x01fff; 
   buffer[startindex].tupple[newindex].rfragoff =
   (htons(data->ip_off) & 0x01fff)+ (htons(data->ip_len) - IPHDR_SIZE) / 8;
}

/**************************
** Function : GapDetect()
** Purpose  : logging gap in Reassemble method
** Argument : ID;  
** Return   : none
***************************/
void IPdefragment::GapDetect(int i)
{
   
  gapcount = 0;
  while (gapcount < gapendindex) {
     if (gap[gapcount].id == i) {   // found in buffer
         gap[gapcount].count++;
         gap[gapcount].end_hour = data->hour;	     
         gap[gapcount].end_min = data->min;
         gap[gapcount].end_sec = data->sec;
         break; 
     }
     gapcount++;
   }
  if (gapcount == gapendindex) {   // don't found in buffer
        gapendindex++;
        gap[gapcount].ip = data->dstip;
	gap[gapcount].dest =data->addr.dest;
        gap[gapcount].id = i;
        gap[gapcount].count = 1;
        gap[gapcount].start_hour = data->hour;
        gap[gapcount].start_min = data->min;
        gap[gapcount].start_sec = data->sec;
         gap[gapcount].end_hour = data->hour;	     	  
        gap[gapcount].end_min = data->min;
        gap[gapcount].end_sec = data->sec;
  }

 if (gapendindex == STD_BUF) {
    gapendindex =0;
    perror("Buffer Overflow in Gap Buffer");
 }

}

/*************************
** Function : FixAndReduce() 
** Purpose  : Reassemble and Reduce the tupple 
** Argument : none 
** Return   : none
**************************/ 
void IPdefragment::FixAndReduce() {
  int lower,upper,last,lmerge,rmerge;

  lmerge = buffer[startindex].lmerge; 
  rmerge = buffer[startindex].rmerge;

  lower = buffer[startindex].tupple[lmerge].lfragoff; upper =
  buffer[startindex].tupple[rmerge].rfragoff;

  last = buffer[startindex].tupplecount;

  if (lmerge < rmerge) {

    buffer[startindex].tupple[lmerge].rfragoff = upper;

    buffer[startindex].tupple[rmerge].lfragoff =
                   buffer[startindex].tupple[last].lfragoff;

    buffer[startindex].tupple[rmerge].rfragoff =
                   buffer[startindex].tupple[last].rfragoff;

    buffer[startindex].tupplecount--;

  } else {

    buffer[startindex].tupple[rmerge].lfragoff = lower;
    buffer[startindex].tupple[lmerge].lfragoff =
                   buffer[startindex].tupple[last].lfragoff;
    buffer[startindex].tupple[lmerge].rfragoff =
                   buffer[startindex].tupple[last].rfragoff;
    buffer[startindex].tupplecount--;

  }

}

/*************************
** Function : FoundInBuffer();
** Purpose  : Do all job incase of there is same-id tupple in buffer  
** Argument : none
** Return   : none
**************************/
void IPdefragment::FoundInBuffer()
{

  int i;          

//   Increase count
      buffer[startindex].count++;

//
//   __ Update Flag __
//   if Fragment Offset = 0 and has MORE FRAGMENT frag
//    buffer.flag = 0x0001
//
  if (((htons(data->ip_off) & 0x2000) == 0x2000) && 
      ((htons(data->ip_off) & 0x1fff) == 0))  {
         buffer[startindex].flag = buffer[startindex].flag | 0x0001; 
  }
//
//   __ Update Flag __
//   if Fragment Offset > 0 and has NO FRAGMENT flag
//   buffer.flag = 0x0002
//
  if (((htons(data->ip_off) & 0x2000) == 0) && 
      ((htons(data->ip_off) & 0x1fff) > 0))  {
         buffer[startindex].flag = buffer[startindex].flag | 0x0002; 
  }

//
//  Check in all tupple
//  Before checking ... Set Merge variable to zero;
//       
     buffer[startindex].merge = 0;
     abnormalsign = 0;
     for (i=0;i<buffer[startindex].tupplecount;i++)
     {
        NormalCheck(i);
        if (abnormalsign ==0) AbnormalCheck(i);
     }  // for 

         
         // if merge = 0 then add new tupple..
         // if merge = 1 then Normal... (self update)
         // if merge = 2 then reassemble and reduce tupple..
         // if merge > something special..  BUG !!!!!

    
    switch (buffer[startindex].merge) 
    {
        case 0 : AddNewTupple();
                 break;
        case 2 : FixAndReduce();
                 break;
    } //switch

//  printf("in reduce\n");

         // if flag = 0x0003 (complete reassemble)
         // and tupplecount = 1 then complete reassemble
         // free this row (by set flag to 0).. update addindex... 

//    printf(" flag : %d  tupplecount = %d \n",buffer[startindex].flag,
//           buffer[startindex].tupplecount);

    if ((buffer[startindex].flag == 3) && 
        (buffer[startindex].tupplecount == 1))
    {
       //printf (" ID : %d \n",buffer[startindex].id);

       buffer[startindex].flag == 0;                       //free row 
       if (addindex > startindex) addindex=startindex;   //set new index; 
    } //if
}