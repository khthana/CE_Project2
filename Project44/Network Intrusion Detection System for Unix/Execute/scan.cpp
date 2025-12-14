#include "scan.h"

void scan::do_report_if_needed(hostdb_t *h,cnxInfo_t *cnx,report *reportor) 
{
		     if ( cnx->cnx_count >= max_cnx_count ) {
					strcpy(report_scan.name,"Scan Port Detection Class");
					strcpy(report_scan.description,"This Class is used to detect almost kind of Scan Port ");
					sprintf(report_scan.type,cnx->kind );
					snprintf(report_scan.detail,sizeof(report_scan.detail),"someone send packet that have many IP Address and many port "
											   "for checking what services are open .This could be issued in order to survey your "
					                                                    "computer or network .");
				
					report_scan.srcip.s_addr=h->ip->ip_src.s_addr;
					report_scan.dstip.s_addr=h->ip->ip_dst.s_addr;
					report_scan.dstport=cnx->first_port;
					report_scan.dstport2=cnx->last_port;
					report_scan.srcport=h->srcport;;
					report_scan.Shour=cnx->Shour;
			                report_scan.Smin=cnx->Smin;
					report_scan.Ssec=cnx->Ssec;
					report_scan.Ehour=cnx->Ehour;
					report_scan.Emin=cnx->Emin;
					report_scan.Esec=cnx->Esec;
					report_scan.count =cnx->cnx_count;
					if (strcmp(cnx->kind,"Ping Sweep")==0) 
						{
						      report_scan.report_type =4;
						      report_scan.dstip.s_addr = cnx->firstip.s_addr;
						      report_scan.dstip2.s_addr = cnx->lastip.s_addr;
						}
					else report_scan.report_type =3;
					reportor->add_report(&report_scan);
					
			  }							
}

void scan::expire_cnx(report *reportor) 
{
	struct timeval tv;
	gettimeofday (&tv, NULL);
	long cur =	tv.tv_sec;
	check_1_min=cur - check_time;
	if(check_1_min>=8 ) 
	{	
		int cnt =0;
		hostdb_t *temp;
		hostdb_t *temp2;
		cnxInfo_t *cnx;
		temp =scan_host->get_first_host(); 
		//fprintf(stderr,"check report scan port\n");
		while (temp)
			{
				cnt ++;
				//fprintf(stderr,"come to while loop cnx\n");
				temp2 = temp;
				temp = temp ->hnext;
				cnx = (cnxInfo_t *) hostdb_get_data(temp2, scan_ID);
				gettimeofday (&tv, NULL);
				check_time = tv.tv_sec;
				/*
				fprintf(stderr,"first_cnx_time is %d\n",cnx->first_cnxtime);
				fprintf(stderr,"\ncnt : %d,last_cnx_time is %d : cur time is %d : sub is %d \n",cnt,cnx->last_cnxtime,check_time,check_time-cnx->last_cnxtime);
			   fprintf(stderr," %s cnx_count is %d \n",cnx->kind,cnx->cnx_count);
				fprintf(stderr,"cnx_count is %d\n",cnx->cnx_count);
			   fprintf(stderr," temp source ip is %s\n",inet_ntoa(temp2->ip->ip_src));
				fprintf(stderr,"temp dest ip %s\n",inet_ntoa(temp2->ip->ip_dst));
				fprintf(stderr,"first port is %d\n",cnx->first_port);
				fprintf(stderr,"last port %d\n",cnx->last_port);	
		*/
			//	cnx_ttl = 15;

				if ((check_time  - cnx->last_cnxtime) > cnx_ttl)
				{
					do_report_if_needed(temp2,cnx,reportor);
					scan_host->hostdb_del(temp2, scan_ID);
				        free(cnx->kind);
        				free(cnx);
				} // if
			} //while
		//	fprintf(stderr,"exit while loop cnx\n");
	}
}

char *scan::kind_cnxInfo (struct tcphdr *tcp)
{

/*	fprintf(stderr,"fin is %d\n", tcp->fin);
	fprintf(stderr,"syn is %d\n", tcp->syn);
	fprintf(stderr,"rst is %d\n", tcp->rst);
	fprintf(stderr,"ack is %d\n", tcp->ack);
	fprintf(stderr,"urg is %d\n", tcp->urg);
	fprintf(stderr,"psh is %d\n", tcp->psh);
	fprintf(stderr,"\n");
*/	if ((tcp->syn ==0) && (tcp->fin ==0) && (tcp->ack==0) && (tcp->psh ==0) && (tcp->rst==0) && (tcp->urg ==0)) 
		return "TCP NULL scan";
	else if  ((tcp->fin ==1)  && (tcp->psh ==1) && (tcp->urg ==1)) 
			return "TCP XMAS scan";
	else if  ((tcp->fin ==1)  && (tcp->syn !=1) && (tcp->ack!=1) && (tcp->rst!=1)  && (tcp->psh !=1) && (tcp->urg !=1)) 
			return "TCP FIN scan";
	else if  ((tcp->fin !=1)  && (tcp->syn ==1) && (tcp->ack!=1) && (tcp->rst!=1)  && (tcp->psh!=1) && (tcp->urg !=1)) 
			return "TCP SYN/Normal scan";

// return "Unknown type scan";
 return NULL;
}

cnxInfo_t *scan::new_cnx (node *data, const char *kind)
{
	cnxInfo_t *tmp;
	struct timeval tv;

	tmp = (cnxInfo_t *) malloc (sizeof (cnxInfo_t));
	if (!tmp)
	{
		perror ("malloc");
		return NULL;
	}

	gettimeofday (&tv, NULL);
	memset (tmp->port, 0, sizeof (tmp->port));
	tmp->port[dportcur / 8] |= BIT (dportcur % 8);
	tmp->firstip.s_addr=tmp->lastip.s_addr=data->dstip.s_addr;
	tmp->last_port = tmp->first_port = dportcur;
	tmp->first_cnxtime = tmp->last_cnxtime=  tv.tv_sec;
	tmp->cnx_count = 1;
	tmp->kind = strdup (kind);
	tmp->Shour=tmp->Ehour = data->hour;
	tmp->Smin=tmp->Emin= data->min;
	tmp->Ssec=	tmp->Esec= data->sec;
//	fprintf(stderr,"create cnx \n");
	return tmp;
}

void scan::modify_cnx (node *data,cnxInfo_t * cnx)
{
	int ret;
	unsigned int p = dportcur - 1;
	struct timeval tv;

	cnx->Ehour = data->hour;
	cnx->Emin= data->min;
	cnx->Esec= data->sec;
if (dportcur >0 && dportcur < 65535)
{	if (dportcur < cnx->first_port)
		cnx->first_port = dportcur;
	else if (dportcur > cnx->last_port)
		cnx->last_port = dportcur;
	//fprintf(stderr,"port is %d \n",dportcur);
	ret = cnx->port[p / 8] & BIT (p % 8);
	if (ret == 0)
	{
		gettimeofday (&tv, NULL);
		cnx->first_cnxtime =cnx->last_cnxtime = tv.tv_sec;
		cnx->port[p / 8] |= BIT (p % 8);
		cnx->cnx_count++;
	//	fprintf(stderr," %s cnx_count is %d \n",cnx->kind,cnx->cnx_count);
		

	}
}
else 
{
	if (strcmp(cnx->kind,"Ping Sweep") ==0) {
		//fprintf(stderr,"%s update\n",cnx->kind);
		if (data->dstip.s_addr < cnx->firstip.s_addr) cnx->firstip.s_addr = data->dstip.s_addr;
		if (data->dstip.s_addr > cnx->lastip.s_addr) cnx->lastip.s_addr = data->dstip.s_addr;		
		if (cnx->firstip.s_addr!=cnx->lastip.s_addr) 
		{
			gettimeofday (&tv, NULL);
			cnx->first_cnxtime =cnx->last_cnxtime = tv.tv_sec;
			cnx->cnx_count++;
		//	fprintf(stderr,"count is %d\n",cnx->cnx_count);
		//	fprintf(stderr," first ip is %s\n",inet_ntoa(cnx->firstip));
			//fprintf(stderr,"last dest ip %s\n",inet_ntoa(cnx->lastip));
	        }
	}
}
}

void scan::update_hdb_entry (node *data, const char *kind, hostdb_t * h)
{
	cnxInfo_t *tmp;
	tmp = (cnxInfo_t *) hostdb_get_data (h, scan_ID);
	if (!tmp)
	{
		tmp = new_cnx (data, kind);
		if (!tmp)
			return;

		hostdb_set_data (h, scan_ID, (unsigned long) tmp);
	}
	else {
		modify_cnx (data,tmp);
		//	fprintf(stderr,"complete modify_cnx hostdb\n");
	}
}

void scan::create_hdb_entry (node *data, const char *kind)
{
	hostdb_t *hdb;
	cnxInfo_t *tmp;

	hdb = scan_host->hostdb_new (data);
	if (!hdb) {
		fprintf(stderr,"can not add host\n");		
		return;
	}
	tmp = new_cnx (data, kind);
	if (!tmp)
		return;

	hostdb_set_data (hdb,scan_ID, (unsigned long) tmp);
}

void scan::generic_packet (node *data, const char *kind)
{
	hostdb_t *hdb;
	hdb = scan_host->hostdb_search (data);
	if (!hdb) {
		create_hdb_entry (data, kind);
		}
	else{
		update_hdb_entry (data, kind, hdb);
		}
}

void scan::tcp_packet (node *data)
{
	const char *kind;

	kind = kind_cnxInfo (data->this_tcphdr);
	if (!kind)
		return;

	dportcur = data->dstport;
	generic_packet (data, kind);
}

void scan::udp_packet (node *data)
{
	dportcur = data->dstport;
	generic_packet (data, "UDP scan");
}

scan::scan(config *conf)
{
	con =conf;  
	cnx_ttl = con->scan_ttl ;
	max_cnx_count = con->scan_max_count; 
	scan_host = new hostdb();
	check_1_min=0;	
	temp_node=new node();
	temp_node->this_iphdr = (struct ip *) malloc(sizeof(ip));
	temp_node->this_icmphdr = (struct  icmphdr *) malloc(sizeof(icmphdr));
}
	

void scan::icmp_packet (node *data)
{
	u_long dip;	
	if (data->this_icmphdr->type != ICMP_ECHO ) {//fprintf(stderr,"can not detect ICMP_ECHO_REQUEST\n");
													return;}
	else
		{
			bzero(temp_node->this_iphdr,sizeof(ip));
			bzero(temp_node->this_icmphdr,sizeof(icmphdr));
	   		memcpy(temp_node->this_iphdr,data->this_iphdr ,sizeof(ip));
			memcpy((temp_node->this_icmphdr),data->this_icmphdr,sizeof(icmphdr));
			temp_node ->srcip.s_addr = data->srcip.s_addr;
	   		temp_node ->dstip.s_addr = data ->dstip.s_addr ;
	  		temp_node->hour = data->hour;
	   		temp_node->min = data->min;
	  	 	temp_node->sec = data->sec;
			dip=temp_node->this_iphdr->ip_dst.s_addr;
			dip&=0x00FFFFFF;
			temp_node->this_iphdr->ip_dst.s_addr=dip;
			//fprintf(stderr,"network addr is %s\n",inet_ntoa(data->this_iphdr->ip_dst) );
			dportcur = 0;
			generic_packet (temp_node, "Ping Sweep");
	}
}


void scan::scandetect_run (node *data,report *reportor)
{
	switch (data->ip_p)
	{
	case IPPROTO_TCP:
		//fprintf(stderr,"tcp packet coming\n");
		tcp_packet (data);
		break;
	case IPPROTO_UDP:
		//fprintf(stderr,"udp packet coming\n");
		udp_packet (data);
		break;
	case IPPROTO_ICMP:
		//fprintf(stderr,"udp packet coming\n");
		icmp_packet (data);
		break;
	}
  	expire_cnx(reportor);
}
