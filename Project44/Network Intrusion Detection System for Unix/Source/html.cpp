#include "html.h"


int htmlreport::start_document(FILE *fd) 
{
        return fprintf(fd,"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"
                       "<html><head><title>IsagNids Html Reportor</title>\n"
					   "</head>\n"
                       "<body bgcolor=\"#fefefe\" link=\"#486591\" vlink=\"#6f6c81\">\n"
					   "<center> <font size =7>IsagNids Html Report </font></center>"
                       "<table width=\"800\" align=\"center\" cellpadding=\"0\" cellspacing=\"10\">\n"
                       "<tr><td width=\"50%%\" valign=\"top\">\n");
}

int htmlreport::start_table(FILE *fd, const char *name, int col) 
{
        int ret;
        
        ret = fprintf(fd,
                      "<table width=\"800\" bgcolor=\"#000000\" border=\"0\" "
                      "cellpadding=\"1\" cellspacing=\"0\" align=\"center\">\n"
                      "<tr><td>\n"
	
                      "<table width=\"800\" bgcolor=\"#e6e6e6\" border=\"0\" "
                      "cellpadding=\"2\" cellspacing=\"0\" align=\"center\">\n");

        if ( name ) {
                ret += fprintf(fd, "<tr bgcolor=\"#486591\"><td colspan=\"%d\""
                               "align=\"left\">\n<font color=\"#fefefe\"><b>"
                               "&nbsp;&nbsp;%s&nbsp;&nbsp;</b></font></tr></td>\n"
                               "<tr><td colspan=\"%d\" align=\"center\">&nbsp;</td></tr>\n",
                               col, name, col);
        }
        
        return ret;
}

int htmlreport::end_table(FILE *fd, int col) 
{
        return fprintf(fd,
                       "<tr><td colspan=\"%d\" align=\"center\">&nbsp;</td></tr>\n"
                       "</table></tr></td></table>\n", col);
}

void htmlreport::create_link_if_needed(FILE *fd) 
{
        if ( ! pages ) {
                offset = fprintf(fd,
                                  "<center>"
                                  "Previous&nbsp;&nbsp;"
                                  "<a href=../%d/index.html>Next</a>&nbsp;&nbsp;"
                                  "<a href=../latest/index.html>Latest</a>"
                                  "</center>", pages + 1);
        } else {
                offset = fprintf(fd,
                                  "<center>"
                                  "<a href=../%d/index.html>Previous</a>&nbsp;&nbsp;"
                                  "<a href=../%d/index.html>Next</a>&nbsp;&nbsp;"
                                  "<a href=../latest/index.html>Latest</a>"
                                  "</center>", pages - 1, pages + 1);
        }
}

int htmlreport::end_document(FILE *fd) 
{
        return fprintf(fd, "</td></tr></table></body></html>\n");
}

void htmlreport::output_plugin_infos(FILE *fd, report_node *newreport) 
{
        start_table(fd, "Detection Class Information", 2);

        fprintf(fd,
                "<tr><th align=\"left\">&nbsp;&nbsp;Name</th><td align=\"left\"><font size=\"3\">%s</font></td></tr>\n"
                "</font></td></tr>\n<tr><th align=\"left\">&nbsp;&nbsp;Description</th><td align=\"left\">"
                "<font size=\"3\">%s</font></td></tr>\n",
               newreport->name, newreport->description);

        end_table(fd, 2);
}

void htmlreport::output_report_infos(FILE *fd,report_node *newreport) 
{
	time_t current_time2;
	time(&current_time2);
	char *date2=ctime(&current_time2);
	struct tm *curr_time2=localtime(&current_time2);
	int size_date2=strlen(date2);
	char date_22[size_date2-1];
	strncpy(date_22,date2,size_date2-1);
	date_22[size_date2-1]='\0';
//	fprintf(stderr,"1.31htmldir is %s \n",htmldir);
//	fprintf(stderr,"1.31htmldocdir is %s \n",htmldocdir);
//	fprintf(stderr,"1.31htmldoc is %s \n",htmldoc);
	start_table(fd, "Report Information", 2);

        fprintf(fd,
                "<tr><th align=\"left\">&nbsp;&nbsp;Quick Description&nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%s</font></td></tr>\n"
                "<tr><th align=\"left\">&nbsp;&nbsp;Date&nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%s</font></td></tr>\n"
	   	"<tr><th align=\"left\">&nbsp;&nbsp;Time&nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%d:%d:%d - %d:%d:%d</font></td></tr>\n",
              newreport->type,date_22,newreport->Shour,newreport->Smin,newreport->Ssec,newreport->Ehour,newreport->Emin,newreport->Esec);

     //   if ( rinfos->date_end != 0 )
	switch( newreport->report_type)
	{
		case 2 : fprintf(fd,"<tr><th align=left>&nbsp;&nbsp;Frame Id&nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%d</font></td></tr>\n"
                      		,  newreport->id);
				break;
		case 5 : fprintf(fd,"<tr><th align=left>&nbsp;&nbsp;number of packet(packets/sec) &nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%d pps</font></td></tr>\n"
                      		,  newreport->pps);
				fprintf(fd,"<tr><th align=left>&nbsp;&nbsp;Byte receive(kilobyte/sec) &nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%.2f kbps</font></td></tr>\n"
                      		,  newreport->kbps);
	};
       fprintf(fd,"<tr><th align=left>&nbsp;&nbsp;Received&nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%d &nbsp;&nbsp;times</font></td></tr>\n"
                "<tr><th align=left>&nbsp;&nbsp;Detail&nbsp;&nbsp;&nbsp;&nbsp;</th><td><font size=\"3\">%s</font></td></tr>\n",
            newreport->count, newreport->detail);
	    

        end_table(fd, 2);
//	fprintf(stderr,"1.32htmldir is %s \n",htmldir);
//	fprintf(stderr,"1.32htmldocdir is %s \n",htmldocdir);
//	fprintf(stderr,"1.32htmldoc is %s \n",htmldoc);
}

void htmlreport::output_host_infos(FILE *fd,report_node *newreport) 
{
	start_table(fd, "Host Information", 2);
//	fprintf(stderr,"destination port is %d\n",newreport->dstport);
        
		switch (newreport->report_type) 
	{
	      case 3:	fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n",
		                inet_ntoa(newreport->dstip));
    		      		fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Port</th><td align=\"left\"><font size=\"3\">%d - %d &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Port</th><td align=\"left\"><font size=\"3\">%d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n",
	        	                 newreport->dstport,newreport->dstport2, inet_ntoa(newreport->srcip), newreport->srcport);
				break;
	    case 4:    char ipstr3[INET_ADDRSTRLEN];    	
		    	       strcpy(ipstr3,inet_ntoa(newreport->dstip2));
		               fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Host</th><td align=\"left\"><font size=\"3\">%s - %s &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n", 
		               inet_ntoa(newreport->dstip),ipstr3);
    		               fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Port</th><td align=\"left\"><font size=\"3\"> currently N/A &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Port</th><td align=\"left\"><font size=\"3\"> currently N/A &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n",
	        	                 inet_ntoa(newreport->srcip));
				break;
	     case 6:    char ipstr4[INET_ADDRSTRLEN];    	
		    	       strcpy(ipstr4,inet_ntoa(newreport->srcip));
		     		fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n", 
		               inet_ntoa(newreport->dstip));
    		               fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Port</th><td align=\"left\"><font size=\"3\"> %d &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Port</th><td align=\"left\"><font size=\"3\"> %d &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n",
	        	                 newreport->dstport,ipstr4,newreport->srcport,newreport->dstport);
				break;
	      default: fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n",    inet_ntoa(newreport->dstip));
       	    			fprintf(fd,"<tr><th align=\"left\">&nbsp;&nbsp;Target Port</th><td align=\"left\"><font size=\"3\">%d  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Host</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n"
					"<tr><th align=\"left\">&nbsp;&nbsp;Source Port</th><td align=\"left\"><font size=\"3\">%s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>\n",
	     				newreport->dstport,"currently N/A","currently N/A");
				break;
      };
      
	
        end_table(fd, 2);
}

void htmlreport::create_detailled_report(report_node *newreport) 
{
	int ret;
	FILE *fd2;
//	fprintf(stderr,"create_detail_report::destination port is %d\n",newreport->dstport);
//	fprintf(stderr,"htmldir is %s \n",htmldir);
       	int check =check_newpage(); /* check for starting new pages if current page have files more than 38 files */
	//fprintf(stderr,"create_detail_report1::destination port is %d\n",newreport->dstport);
	if (check >0) {    	snprintf(latest, sizeof(latest), "%s/latest", htmldir);
					snprintf(htmldocdir, sizeof(htmldocdir), "%s/%ld", htmldir, pages);
        				ret = create_dir(htmldocdir);
       				 	if ( ret < 0 ) {
    		 				fprintf(stderr,"couldn't create_dir n");
        					}
					if ( pages > 0 && unlink(latest) < 0 ) {
    		 				fprintf(stderr,"couldn't delete %s\n", latest);
        					}
					ret = symlink(htmldocdir, latest);
        			        if ( ret < 0 ) {
             					 fprintf(stderr,"couldn't create link %s -> %s\n", latest, htmldocdir);
        					}
					snprintf(htmldoc, sizeof(htmldoc), "%s/index.html", htmldocdir);
       					fd2 = fopen(htmldoc, "w");
       					if ( ! fd2 ) {
             					fprintf(stderr, "error opening %s\n", htmldoc);
        					}
					create_host_index(fd2);
				}



 //   fprintf(stderr,"htmldir is %s \n",htmldir);
//	fprintf(stderr,"htmldocdir is %s \n",htmldocdir);
//	fprintf(stderr,"htmldoc is %s \n",htmldoc);
	gettimeofday(&tv, NULL);
        snprintf(bufff, sizeof(bufff), "%s/%ld-%ld.html", htmldocdir, tv.tv_sec, tv.tv_usec);
	FILE *fd;
        fd = fopen(bufff, "w");
        if ( !fd ) {
               fprintf(stderr, "couldn't open %s.\n", bufff);
                return;
        }

	    snprintf(bufff, sizeof(bufff), "../%ld/%ld-%ld.html", pages, tv.tv_sec, tv.tv_usec);
	//	fprintf(stderr,"2htmldir is %s \n",htmldir);
	//    fprintf(stderr,"2htmldocdir is %s \n",htmldocdir);
	//    fprintf(stderr,"2htmldoc is %s \n",htmldoc);
        update_host_index(bufff,newreport);
	//	fprintf(stderr,"4htmldir is %s \n",htmldir);
	//    fprintf(stderr,"4htmldocdir is %s \n",htmldocdir);
	//    fprintf(stderr,"4htmldoc is %s \n",htmldoc);

        start_document(fd);
    //  fprintf(stderr,"create_detail_report::2::destination port is %d\n",newreport->dstport);
	//	fprintf(stderr,"1.2htmldir is %s \n",htmldir);
	//    fprintf(stderr,"1.2htmldocdir is %s \n",htmldocdir);
	//    fprintf(stderr,"1.2htmldoc is %s \n",htmldoc);
       output_plugin_infos(fd,newreport);
        fprintf(fd, "<br><br>\n");
	//	fprintf(stderr,"1.3htmldir is %s \n",htmldir);
	//    fprintf(stderr,"1.3htmldocdir is %s \n",htmldocdir);
	//    fprintf(stderr,"1.3htmldoc is %s \n",htmldoc);
      //  fprintf(stderr,"create_detail_report::output_plugin_infos::destination port is %d\n",newreport->dstport);
        output_report_infos(fd, newreport);
    //    fprintf(stderr,"create_detail_report::output_report_infos::destination port is %d\n",newreport->dstport);	
        fprintf(fd, "<br><br>\n");
	//	fprintf(stderr,"1.4htmldir is %s \n",htmldir);
	//    fprintf(stderr,"1.4htmldocdir is %s \n",htmldocdir);
	//    fprintf(stderr,"1.4htmldoc is %s \n",htmldoc);
	output_host_infos(fd, newreport);
        fprintf(fd, "<br><br>\n");
    //    fprintf(stderr,"1.5htmldir is %s \n",htmldir);
	 //   fprintf(stderr,"1.5htmldocdir is %s \n",htmldocdir);
	 //   fprintf(stderr,"1.5htmldoc is %s \n",htmldoc);
 /*      if ( rinfos->pktdump ) {
               output_pktdump(fd, rinfos->pktdump);
                fprintf(fd, "<br><br>\n");
        }
        
        if ( rinfos->hexdump) {
                output_hexdump(fd, rinfos->hexdump);
                fprintf(fd, "<br><br>\n");
        }*/      
        end_document(fd);
        fclose(fd);
}

void htmlreport::create_host_index(FILE *fd) 
{
        start_document(fd);

        start_table(fd, NULL, 0);

        fprintf(fd,
                "<tr bgcolor=\"#486591\">\n"
                "<th><font color=\"#fefefe\"><b>&nbsp;&nbsp;Date&nbsp;&nbsp;</b></font></th>\n"
                "<th><font color=\"#fefefe\"><b>&nbsp;&nbsp;Attack&nbsp;&nbsp;</b></font></th>\n"
                "<th><font color=\"#fefefe\"><b>&nbsp;&nbsp;Target Host&nbsp;&nbsp;</b></font></th>\n"
                "<th><font color=\"#fefefe\"><b>&nbsp;&nbsp;Target Port&nbsp;&nbsp;</b></font></th>\n"
                "<th><font color=\"#fefefe\"><b>&nbsp;&nbsp;Source Host&nbsp;&nbsp;</b></font></th>\n"
                "<th><font color=\"#fefefe\"><b>&nbsp;&nbsp;Counts&nbsp;&nbsp;</b></font></th>\n"
                "</tr>        \n     \n");

        offset = 0;
        end_table(fd, 6);
        create_link_if_needed(fd);
        end_document(fd);
        fflush(fd);
	
}


int htmlreport::create_dir(const char *dirname) 
{
        int ret;
        
        ret = mkdir(dirname, S_IRWXU|S_IRGRP|S_IXGRP|S_IROTH|S_IXOTH);
        if ( ret < 0 && errno != EEXIST ) {
                fprintf(stderr,"couldn't create %s\n", dirname);
                return -1;
        }
        
        return 0;
}

int htmlreport::check_pages()
{
	DIR* dd = opendir(htmldir);
	dirent*  readd;
	int cnt =0;
	for(int i = 0 ;readd =readdir(dd);)
	{
		//fprintf(stderr,"pagesis %s \n",readd->d_name);
		i++;
		cnt++;
	}
	closedir(dd);
	return (cnt-4); /* -4 means donot count (".","..","lastest") and pages start at 0 */	
}

int htmlreport::check_newpage()
{
	//fprintf(stderr,"htmldir is %s \n",htmldir);
//	fprintf(stderr,"create_detail_report221::destination port is \n");
	sprintf(htmldocdir,"%s/%ld",htmldir,pages);
//	fprintf(stderr,"dir is %s \n",htmldocdir);
	DIR* dd = opendir(htmldocdir);
	dirent*  readd;
	int cnt =0;
	for(int i = 0 ;readd =readdir(dd);)
	{
	//	fprintf(stderr,"pagesis %s \n",readd->d_name);
		i++;
		cnt++;
	}
	closedir(dd);
	cnt-=2;
//	fprintf(stderr,"cnt is %d \n",cnt);
	if (cnt >38 ) {pages=pages +1; return 2;}
	return -1; /*  */	
}

FILE *htmlreport::setup_htmldoc(void) 
{
        int ret;
	int flag=0;
        FILE *fd;
        snprintf(latest, sizeof(latest), "%s/latest", htmldir);
        ret = access(htmldir, F_OK);
        if ( ret < 0 ) {
                pages = -1;
		flag =1;
                ret = create_dir(htmldir);
                if ( ret < 0 )
                        return NULL;
        }
	pages = check_pages(); /* return current page*/
	int check;
	if (flag==1) {pages = 0;}
	else{
	check=check_newpage(); /* check for starting new pages if current page have files more than 38 files */
	}
	if ((check >0) || (flag==1)) {    	snprintf(htmldocdir, sizeof(htmldocdir), "%s/%ld", htmldir, pages);
        				ret = create_dir(htmldocdir);
       				 	if ( ret < 0 ) 
                			goto err;
					if ( pages > 0 && unlink(latest) < 0 ) {
     		 				fprintf(stderr,"couldn't delete %s\n", latest);
        					goto err;
        					}
					ret = symlink(htmldocdir, latest);
        			        if ( ret < 0 ) {
             					 fprintf(stderr,"couldn't create link %s -> %s\n", latest, htmldocdir);
                				goto err;
        					}
					snprintf(htmldoc, sizeof(htmldoc), "%s/index.html", htmldocdir);
       					fd = fopen(htmldoc, "w");
       					if ( ! fd ) {
             					fprintf(stderr, "error opening %s\n", htmldoc);
                				goto err;
        					}
					create_host_index(fd);
				}
	else { 
			snprintf(htmldocdir, sizeof(htmldocdir), "%s/%ld", htmldir, pages);
			snprintf(htmldoc, sizeof(htmldoc), "%s/index.html", htmldocdir);
			return NULL;
		}
        return fd;
 err:
        pages--;
	fprintf(stderr,"error was found , you should check your program again!!!");
        return NULL;
}

void htmlreport::write_host_infos(int fd,report_node *newreport)
{        
      char tmp[256];
	memset(tmp,'\0',256);
	switch (newreport->report_type)
	{
		case 3:	snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s</font></td>",inet_ntoa(newreport->dstip));
       				write(fd,tmp,strlen(tmp));
				if (newreport->dstport > 0) {  snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d-%d</font></td>",newreport->dstport,newreport->dstport2);
	      			}
				else {	snprintf(tmp,sizeof(tmp),"<td align=\"center\"><font size=\"3\">N/A</font></td>");
      				}
				write(fd,tmp,strlen(tmp));
				snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s</font></td>",inet_ntoa(newreport->srcip));
				write(fd,tmp,strlen(tmp));   
				snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d</font></td>",newreport->count);
      				write(fd,tmp,strlen(tmp));
				break;
		case 4 :	char ipstr3[INET_ADDRSTRLEN];   
				strcpy(ipstr3,inet_ntoa(newreport->dstip2));
			        snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s - %s</font></td>",inet_ntoa(newreport->dstip),ipstr3);
       				write(fd,tmp,strlen(tmp));
				snprintf(tmp,sizeof(tmp),"<td align=\"center\"><font size=\"3\">N/A</font></td>");
      				write(fd,tmp,strlen(tmp));
				snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s</font></td>",inet_ntoa(newreport->srcip));
				write(fd,tmp,strlen(tmp));   
				snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d</font></td>",newreport->count);
      				write(fd,tmp,strlen(tmp));
				break;
		case 6  :snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s</font></td>",inet_ntoa(newreport->dstip));
        			 write(fd,tmp,strlen(tmp));
				 snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d</font></td>",newreport->dstport);
				 write(fd,tmp,strlen(tmp));
				 snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s</font></td>",inet_ntoa(newreport->srcip));
				 write(fd,tmp,strlen(tmp));
		      		 snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d</font></td>",newreport->count);
                                 write(fd,tmp,strlen(tmp));
				break;
		default: snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%s</font></td>",inet_ntoa(newreport->dstip));
        			   write(fd,tmp,strlen(tmp));
				   snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d</font></td>",newreport->dstport);
				   write(fd,tmp,strlen(tmp));
				   snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">N/A</font></td>");
				   write(fd,tmp,strlen(tmp));
		      		   snprintf(tmp,sizeof(tmp), "<td align=\"center\"><font size=\"3\">%d</font></td>",newreport->count);
                                   write(fd,tmp,strlen(tmp));
				break;
	};
}

void htmlreport::update_host_index(const char *link,report_node *newreport)
{
	char str_t2[256];
    int ret;
	//fprintf(stderr,"offset is %d",offset);
	if (pages==0) {offset = -233;}
	else {offset=-265;}
	//offset = -260; //260 //233
	//fprintf(stderr,"offset  = %d",offset);
	long z	;
	//fprintf(stderr,"3htmldir is %s \n",htmldir);
	//fprintf(stderr,"3htmldocdir is %s \n",htmldocdir);
	//fprintf(stderr,"3htmldoc is %s \n",htmldoc);
	int ff= open(htmldoc,O_RDWR);
	z=lseek(ff,(off_t)0,SEEK_END);
	//fprintf(stderr,"offset3  = %d",z);
	//fprintf(stderr,"offset4  = %d\n",offset);
	z=lseek(ff,(off_t)offset,SEEK_END);
	//fprintf(stderr,"offset4  = %d",z);
	time_t current_time;
	time(&current_time);
	char *date=ctime(&current_time);
	struct tm *curr_time=localtime(&current_time);
	int size_date=strlen(date);
	char date_2[size_date-1];
	strncpy(date_2,date,size_date-1);
	date_2[size_date-1]='\0';
	
	snprintf(str_t2,sizeof(str_t2), "<tr><td align=\"center\" nowarp><a href=%s><font size=\"3\" color=\"%s\">%s", link,  "Red",date_2);
	write(ff,str_t2,strlen(str_t2));
   	snprintf(str_t2,sizeof(str_t2),   "</font></a></td>\n <td align=\"center\"><font size=\"3\">%s</font></td>\n", newreport->type);
	write(ff,str_t2,strlen(str_t2));
	write_host_infos(ff,newreport);
	snprintf(str_t2,sizeof(str_t2), "</tr>\n");	
	write(ff,str_t2,strlen(str_t2));
	snprintf(str_t2,sizeof(str_t2),"   \n    \n   \n<tr><td colspan=\"%d\" align=\"center\">&nbsp;</td></tr>\n"
                      					"</table></tr></td></table>\n", 6);
	write(ff,str_t2,strlen(str_t2));
        if ( ! pages ) {
                offset -=snprintf(str_t2,sizeof(str_t2),
                                  "<center>"
                                  "Previous&nbsp;&nbsp;"
                                  "<a href=../%d/index.html>Next</a>&nbsp;&nbsp;"
                                  "<a href=../latest/index.html>Latest</a>"
                                  "</center>", pages + 1);
        } else {
                offset -=snprintf(str_t2,sizeof(str_t2),
                                  "<center>"
                                  "<a href=../%d/index.html>Previous</a>&nbsp;&nbsp;"
                                  "<a href=../%d/index.html>Next</a>&nbsp;&nbsp;"
                                  "<a href=../latest/index.html>Latest</a>"
                                  "</center>", pages - 1, pages + 1);
        }
	
	write(ff,str_t2,strlen(str_t2));
	snprintf(str_t2,sizeof(str_t2),"</td></tr></table></body></html>\n");		
	write(ff,str_t2,strlen(str_t2));
	z=lseek(ff,(off_t)0,SEEK_END);
	close(ff);	
}
