#ifndef IPDEFRAGMENT

#define IPDEFRAGMENT

#define TUPCOUNT 20 
#define IPHDR_SIZE 20

#include "node.h"

#include <iostream.h>

#include <stdlib.h>

#include <string.h>

#include "report.h"

#include "manage.h"

struct range                  // Range of fragmentation
{
  int lfragoff;
  int rfragoff;
};

struct Chbuffer               // Structure of Buffer..
{
  u_long ip;                 // Keep IP of Frame
  int count;                 // Counting the Same-ID Frame   
  int id;                    // keep ID of Frame
  int flag;                  // flag bit 0 set if offset = 0 and MF
                             //      bit 1 set if offset > 0 and Non-MF frame

  struct range tupple[TUPCOUNT];   // Use for regist frame and manage the
                                   // reassemble process
  int lmerge;               // for keep left tupple of frame
  int rmerge;               // for keep right tupple of frame
                            // if lmerge and rmerge not eq to 0
                            // so frame can merge and reduce tupple...
  int tupplecount;          // Count the used Tupple
  int merge;	            // Count tupple which new frame can Merge
                            // IF Merge = 0 , add new Tupple
                            // IF Merge = 1 , reassemble to Tupple
                            // IF Merge = 2 , reassemble to double Tupple
                            // and it can reduce tupple...

};

struct OverlapData {
   in_addr ip;
   u_int16_t dest;	
  u_long count;
  int id;
  int start_hour;
  int start_min;
  int start_sec; 
   int end_hour;	
   int end_min;
  int end_sec;

};

class IPdefragment {
	
	private:
			config *con;
			int overflow;              // overflow flag 0 = overflow else 1; 
			struct Chbuffer buffer[STD_BUF];           
			//	struct iphdr *ip;
			//	struct IPdata data;
			report_node report_overlap;
			report_node report_gap;
			struct OverlapData overlap[STD_BUF];
			struct OverlapData gap[STD_BUF];
			int startindex;
			int addindex;
			int endindex;
			int fragstartindex;	
			int fragendindex;
			int fragcount;
			int abnormalsign;
			int gapstartindex;
			int gapendindex;
			int gapcount;
			node *data;
			int check_1_min;

	public:
		
				IPdefragment(config *conf ){ con = conf; Initialize(); }
				void Initialize();                 // Initialize Buffer for Use;
				void FoundInBuffer();              // Do all job if same-id Frame recieved;
				void NotFoundInBuffer();           // Do all job if new-id Frame recieved;
				void FixAndReduce();               // Reassemble and Reduce the tupple; 
				void AddNewTupple();               // Add new tupple to Buffer;
				void showbuffer();
				void NormalCheck(int);                // Checking normal reassemble 
				void AbnormalCheck(int);              // Checking Abnormal reassemble and 
				void AddOverlapID(int);            // AddID for OverlapFrame in Buffer
				void ShowResult(report *reportor);		   // Show fragment Result
				void GapDetect(int i);                  // Logging gap in Reassemble method
				void RealTimeFragChk(node *data1);            // For Checking Fragment in Realtime
	};
	
#endif
	
	