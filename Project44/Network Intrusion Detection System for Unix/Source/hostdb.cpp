#include "hostdb.h"

int hostdb::ip_match(const struct ip *ip1, const struct ip *ip2) 
{
        return ( ip1->ip_src.s_addr == ip2->ip_src.s_addr &&
                 ip1->ip_dst.s_addr == ip2->ip_dst.s_addr &&
                 ip1->ip_p == ip2->ip_p );
}

hostdb_t *hostdb::search(hostdb_t *bucket, const struct ip *ip) 
{
        while ( bucket != NULL ) {
                if ( ip_match(bucket->ip, ip) )
                        return bucket;
                bucket = bucket->next;
        }        
        return NULL;
}

void hostdb::host_add(hostdb_t **bucket, hostdb_t *h) 
{
        h->next = *bucket;
        if ( h->next )
                h->next->prev = h;
        *bucket = h;
	if (last_host ==NULL) {
		first_host = h;
		last_host =h;
		h->hnext =NULL;
		h->hprev =NULL;
	}
	else {
		h->hnext =NULL;
		h->hprev =last_host;
		last_host->hnext =h;
		last_host =h;
	}
	
}

void hostdb::host_del(hostdb_t **bucket, hostdb_t *h) 
{        
        if ( h->next )
                h->next->prev = h->prev;
        if ( h->prev )
                h->prev->next = h->next;
        else *bucket = h->next;

	if (h->hnext) { h->hnext->hprev = h->hprev;	}
	else {
		       	if(h->hprev) {  last_host=h->hprev;}
			else{ last_host =NULL;}
	}
	if(h->hprev)
                h->hprev->hnext = h->hnext;	
	else {
		   if (h->hnext) {first_host =h->hnext;}
		   else {first_host=NULL;}
		
	}
	
        free(h->pdata);
	free(h->ip);
        free (h);
	//fprintf(stderr,"complete delete host\n");
}

hostdb_t *hostdb::hostdb_new(node *data) 
{
        int key = host_key(data->this_iphdr);
        hostdb_t *news;
        
        news =(hostdb_t *) malloc(sizeof(hostdb_t));
	//news = new hostdb_t;
        if (! news ) {
              fprintf(stderr,"malloc(%d)", sizeof(hostdb_t));
                return NULL;
        }

        news->pdata = (unsigned long *) calloc(1, 1 * sizeof(unsigned long *));
       // news->pdata =new (unsigned long) ;
	if ( ! news->pdata ) {
                fprintf(stderr,"malloc(%d):",  1 * sizeof(unsigned long *));
                return NULL;
        }
        news->ip  = (struct ip *) malloc(sizeof(ip));
	memcpy(news->ip,data->this_iphdr,sizeof(ip));
	//fprintf(stderr,"source ip is %s\n",inet_ntoa(news->ip->ip_src));
	//fprintf(stderr,"dest ip %s\n",inet_ntoa(news->ip->ip_dst));
        news->prev = NULL;
        news->key_cache = key;
        news->srcport=data->srcport;
	news->dstport=data->dstport;  
        host_add(&host_hash[key], news);
	
        return news;
}

void hostdb::hostdb_del(hostdb_t *h, const unsigned int pid)
{
        h->pdata[pid] = 0;
        host_del(&host_hash[h->key_cache], h);
}

hostdb_t *hostdb::hostdb_search(node *data) 
{
        return search(host_hash[host_key(data->this_iphdr)], data->this_iphdr);
}



