#include "flood.h"

void flood::do_report_if_needed(hostdb_t *h,cnxInfo_t_flood *cnx,report *reportor) 
{
		     if ( cnx->cnx_count >= max_cnx_count ) {
					strcpy(report_flood.name," Flooding Detection Class");
					strcpy(report_flood.description,"This Class is used to detect many flood attack ");
					sprintf(report_flood.type,cnx->kind );
					snprintf(report_flood.detail,sizeof(report_flood.detail),"someone send too many packets to your computer or your network "
											   "This could be issued in order to make host can not do anything or DoS attack. ");
					report_flood.srcip.s_addr=h->ip->ip_src.s_addr;
					report_flood.dstip.s_addr=h->ip->ip_dst.s_addr;
					report_flood.dstport=cnx->port;
					report_flood.Shour=cnx->Shour;
			                report_flood.Smin=cnx->Smin;
					report_flood.Ssec=cnx->Ssec;
					report_flood.Ehour=cnx->Ehour;
					report_flood.Emin=cnx->Emin;
					report_flood.Esec=cnx->Esec;
					report_flood.count =cnx->cnx_count;
			     		report_flood.pps = cnx->pps;
			     		report_flood.kbps=cnx->kbps;
					report_flood.report_type =5;
					reportor->add_report(&report_flood);
					
			  }							
}

void flood::expire_cnx() 
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
		cnxInfo_t_flood *cnx;
		temp =flood_host->get_first_host(); 
		//fprintf(stderr,"check report scan port\n");
		while (temp)
			{
				cnt ++;
				//fprintf(stderr,"come to while loop cnx\n");
				temp2 = temp;
				temp = temp ->hnext;
				cnx = (cnxInfo_t_flood *) hostdb_get_data(temp2, FLOOD_ID);
				gettimeofday (&tv, NULL);
				check_time = tv.tv_sec;
				if ((check_time  - cnx->last_cnxtime) > cnx_ttl)
				{

					flood_host->hostdb_del(temp2,FLOOD_ID);
				        free(cnx->kind);
        				free(cnx);
				} // if
			} //while
		//	fprintf(stderr,"exit while loop cnx\n");
	}
}


cnxInfo_t_flood *flood::new_cnx (node *data, const char *kind)
{
	cnxInfo_t_flood *tmp;
	struct timeval tv;

	tmp = (cnxInfo_t_flood *) malloc (sizeof (cnxInfo_t_flood));
	if (!tmp)
	{
		perror ("malloc");
		return NULL;
	}

	gettimeofday (&tv, NULL);
	tmp->firstip.s_addr=tmp->lastip.s_addr=data->srcip.s_addr;
	if (data->this_tcphdr != NULL) tmp->port =  ntohs(data->this_tcphdr->dest);
	else tmp->port = 0;
	tmp->pps=0;
	tmp->kbps=0.0;
	tmp->kbp=(data->all_len);
	tmp->time_check=tmp->first_cnxtime = tmp->last_cnxtime=  tv.tv_sec;
	tmp->cnx_count = 1;
	tmp->kind = strdup (kind);
	tmp->Shour=tmp->Ehour = data->hour;
	tmp->Smin=tmp->Emin= data->min;
	tmp->Ssec=	tmp->Esec= data->sec;
//	fprintf(stderr,"create cnx \n");
	return tmp;
}

void flood::modify_cnx (hostdb_t *h,node *data,cnxInfo_t_flood * cnx)
{
	int ret;
	struct timeval tv;
	cnx->Ehour = data->hour;
	cnx->Emin= data->min;
	cnx->Esec= data->sec;
	if (data->srcip.s_addr < cnx->firstip.s_addr) cnx->firstip.s_addr = data->srcip.s_addr;
	if (data->srcip.s_addr > cnx->lastip.s_addr) cnx->lastip.s_addr = data->srcip.s_addr;
	gettimeofday (&tv, NULL);
	cnx->last_cnxtime = tv.tv_sec;
	cnx->cnx_count++;
	cnx->kbp=cnx->kbp+(data->all_len);
	long aa=(cnx->last_cnxtime - cnx->first_cnxtime);
	if (aa <=0) aa=1;
	//fprintf(stderr,"sub = %d\n",aa);
	cnx->pps = (u_long)( (cnx->cnx_count)/aa);
	cnx->kbps= (cnx->kbp)/( aa*1024.0);
	//fprintf(stderr,"pps = %d\n",cnx->pps);
//	fprintf(stderr,"kbps = %.2f\n",cnx->kbps);
	if ((cnx->pps >= max_cnx_count) )
	{
	      if ((cnx->last_cnxtime - cnx->time_check) >5 )
	      { 
	      do_report_if_needed(h,cnx,reportors);
	      flood_host->hostdb_del(h,FLOOD_ID);
	      free(cnx->kind);
              free(cnx);
	      cnx->time_check=tv.tv_sec;
	      }
	      
	}
	
}

void flood::update_hdb_entry (node *data, const char *kind, hostdb_t * h)
{
	cnxInfo_t_flood *tmp;
	tmp = (cnxInfo_t_flood *) hostdb_get_data (h, FLOOD_ID);
	if (!tmp)
	{
		tmp = new_cnx (data, kind);
		if (!tmp)
			return;

		hostdb_set_data (h, FLOOD_ID, (unsigned long) tmp);
	}
	else {
		modify_cnx (h,data,tmp);
		//	fprintf(stderr,"complete modify_cnx hostdb\n");
	}
}

void flood::create_hdb_entry (node *data, const char *kind)
{
	hostdb_t *hdb;
	cnxInfo_t_flood *tmp;

	hdb = flood_host->hostdb_new (data);
	if (!hdb) {
		fprintf(stderr,"can not add host\n");		
		return;
	}
	tmp = new_cnx (data, kind);
	if (!tmp)
		return;

	hostdb_set_data (hdb,FLOOD_ID, (unsigned long) tmp);
}

void flood::generic_packet (node *data, const char *kind)
{
	hostdb_t *hdb;
	hdb = flood_host->hostdb_search (data);
	if (!hdb) {
		create_hdb_entry (data, kind);
		//fprintf(stderr,"complete create hostdb\n");
		}
	else{
		update_hdb_entry (data, kind, hdb);
		//fprintf(stderr,"complete update hostdb\n");
		}
}

void flood::tcp_packet (node *data)
{
	u_long dip;	
	bzero(temp_node->this_iphdr,sizeof(ip));
	memcpy(temp_node->this_iphdr,data->this_iphdr ,sizeof(ip));
	bzero(temp_node->this_tcphdr,sizeof(tcphdr));
	memcpy((temp_node->this_tcphdr),data->this_tcphdr,sizeof(tcphdr));
	temp_node ->srcip.s_addr = data->srcip.s_addr;
	temp_node ->dstip.s_addr = data ->dstip.s_addr ;
	temp_node->hour = data->hour;
	temp_node->min = data->min;
	temp_node->sec = data->sec;
	temp_node->len=data->len;
	temp_node->all_len = data->all_len;
	dip=temp_node->this_iphdr->ip_src.s_addr;
	dip=0xFFFFFFFF;
	temp_node->this_iphdr->ip_src.s_addr=dip;
	if ((data->this_tcphdr->syn ==1) && (data->this_tcphdr->fin ==0) && (data->this_tcphdr->ack==0) && (data->this_tcphdr->psh ==0) && (data->this_tcphdr->rst==0) && (data->this_tcphdr->urg ==0)) 
	generic_packet (temp_node,"TCP SYN flood");
	else generic_packet (temp_node,"TCP flood");
}

void flood::udp_packet (node *data)
{
	u_long dip;	

	bzero(temp_node->this_iphdr,sizeof(ip));
	memcpy(temp_node->this_iphdr,data->this_iphdr ,sizeof(ip));
	temp_node ->srcip.s_addr = data->srcip.s_addr;
	temp_node ->dstip.s_addr = data ->dstip.s_addr ;
	temp_node->hour = data->hour;
	temp_node->min = data->min;
	temp_node->sec = data->sec;
	temp_node->len=data->len;
	temp_node->all_len = data->all_len;
	dip=temp_node->this_iphdr->ip_src.s_addr;
	dip=0xFFFFFFFF;
	temp_node->this_iphdr->ip_src.s_addr=dip;
	generic_packet (temp_node,"UDP flood");
}

flood::flood(config *conf)
{
	con= conf; 
	cnx_ttl =con->flood_ttl;
	max_cnx_count = con->flood_max_count;
	flood_host = new hostdb();
	check_1_min=0;
	temp_node=new node();
	temp_node->this_iphdr = (struct ip *) malloc(sizeof(ip));
	temp_node->this_tcphdr = (struct tcphdr *) malloc(sizeof(tcphdr));
		
}

void flood::icmp_packet (node *data)
{
	u_long dip;	
	bzero(temp_node->this_iphdr,sizeof(ip));
	memcpy(temp_node->this_iphdr,data->this_iphdr ,sizeof(ip));
	temp_node ->srcip.s_addr = data->srcip.s_addr;
	temp_node ->dstip.s_addr = data ->dstip.s_addr ;
	temp_node->hour = data->hour;
	temp_node->min = data->min;
	temp_node->sec = data->sec;
	temp_node->len=data->len;
	temp_node->all_len = data->all_len;
	if (data->this_icmphdr->type == ICMP_ECHOREPLY ) {
		dip=temp_node->this_iphdr->ip_src.s_addr;
		dip&=0x00FFFFFF;
		temp_node->this_iphdr->ip_src.s_addr=dip;
		generic_packet (temp_node,"Smurf attack");
	}
	else if (data->this_icmphdr->type == ICMP_ECHO ) {
		dip=0xFFFFFFFF;
		temp_node->this_iphdr->ip_src.s_addr=dip;
		generic_packet (temp_node,"Ping flood");
	}
	else { 
		dip=0xFFFFFFFF;
		temp_node->this_iphdr->ip_src.s_addr=dip;
		generic_packet (temp_node,"ICMP flood");
	}
}


void flood::flood_run (node *data,report *reportor)
{
	reportors= reportor;
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
 	expire_cnx();
}
