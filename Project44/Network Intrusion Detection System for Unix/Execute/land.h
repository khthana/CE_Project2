/*  LAND Checking */
/*  Source and Destination host address is the same */
#ifndef LANDD
#define LANDD
#include <iostream.h>
#include <stdlib.h>
#include <string.h>
#include <semaphore.h>
#include "node.h"
#include "report.h"


struct LandData
{
   in_addr host;
   u_int16_t dest;	
   int count;
   int start_hour;
   int start_min;
   int start_sec;
   int end_hour;
   int end_min;
   int end_sec;


};

class Land {
		private:
			int Lmaxindex;
			int Lcount;
			struct LandData land[STD_BUF];
			long check_1_min;
			int start_hour;
			int start_min;
			int start_sec;			
			report_node report_land;
			int count2;
			config *con;
		public:
			Land(config *conf ){con =conf; count2 =0;Lmaxindex =0;Lcount=0;check_1_min=0;}
		//	void Landcheck(char *,int);  for check from sniffed file;
			void LAND(node *data);
			void ShowLandResult(report *reportor);
			
};

#endif
