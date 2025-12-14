#include "land.h"

void Land::LAND(node *data)
{
	if (data->srcip.s_addr==data->dstip.s_addr)
	{
		Lcount=0;
		while (Lcount < Lmaxindex) 
		{
			if(land[Lcount].host.s_addr == data->dstip.s_addr)
			{
				land[Lcount].count++;
				land[Lcount].end_hour = data->hour;
				land[Lcount].end_min = data->min;
				land[Lcount].end_sec = data->sec;
				break;
			}
			Lcount++;
		}
		if (Lcount == Lmaxindex)
		{

			Lmaxindex++;
			land[Lcount].start_hour = data->hour;
			land[Lcount].start_min = data->min;
			land[Lcount].start_sec = data->sec;
			land[Lcount].end_hour = data->hour;
			land[Lcount].end_min = data->min;
			land[Lcount].end_sec = data->sec;
			land[Lcount].host.s_addr = data->dstip.s_addr;
			land[Lcount].dest = data->addr.dest;
			land[Lcount].count = 1;
		} // end if
	} // end if
}// end method

void Land::ShowLandResult(report *reportor)
{

	if (Lmaxindex > 0)
	{
		time_t current_time;
		time(&current_time);
		struct tm *curr_time=localtime(&current_time);
		Lcount=0;
		check_1_min=((curr_time->tm_hour*60*60)+(curr_time->tm_min*60)+(curr_time->tm_sec))-((land[Lcount].start_hour*60*60)+(land[Lcount].start_min*60)+(land[Lcount].start_sec));
		if((div(check_1_min,13).rem==0) && (check_1_min !=0)) 
		{	
			for(Lcount=0;Lcount<Lmaxindex;Lcount++)
  			 	{  
				
					strcpy(report_land.name,"Land Attack Detection Class");
					strcpy(report_land.description,"This Class is used to detect Land Attack");
					sprintf(report_land.type, "Land Attack");
					snprintf(report_land.detail,sizeof(report_land.detail),"someone send packet that have same dest/sou IP Address."
											   "This could be issued in order to make you to handle "
					                                                    "this packet in an unpredictable or as a DoS attack.");
					report_land.dstip=land[Lcount].host;
					report_land.dstport=land[Lcount].dest;
					report_land.Shour=land[Lcount].start_hour;
			                report_land.Smin=land[Lcount].start_min;
					report_land.Ssec=land[Lcount].start_sec;
					report_land.Ehour=land[Lcount].end_hour;
					report_land.Emin=land[Lcount].end_min;
					report_land.Esec=land[Lcount].end_sec;
					report_land.count =land[Lcount].count;
					report_land.report_type =1;
					count2 =count2 +1;
					reportor->add_report(&report_land);
				//	fprintf(stderr,"land count is %d \n",count2 );
							
	   			}
		Lcount = 0;
  		Lmaxindex = 0;
		}
	}
	else {//	fprintf(stderr,"else  done");
		       time_t check_time;	
			time(&check_time);
			struct tm *che_time=localtime(&check_time);
		//    fprintf(stderr," %d:%d:%d \n",che_time->tm_hour,che_time->tm_min,che_time->tm_sec);
		start_hour=che_time->tm_hour;
		start_min=che_time->tm_min;
		start_sec=che_time->tm_sec;
		}
}



