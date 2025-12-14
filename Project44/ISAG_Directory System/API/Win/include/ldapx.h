/*
 * $Novell: /ldap/src/cldap/nldapx/extensions/sdkinc/common/ldapx.h,v 1.20 2001/04/24 20:31:18 dsteck Exp $
 ******************************************************************************
 * Copyright (C) 1999, 2000 Novell, Inc. All Rights Reserved.
 * 
 * THIS WORK IS SUBJECT TO U.S. AND INTERNATIONAL COPYRIGHT LAWS AND
 * TREATIES. USE, MODIFICATION, AND REDISTRIBUTION OF THIS WORK IS SUBJECT
 * TO VERSION 2.0.7 OF THE OPENLDAP PUBLIC LICENSE, A COPY OF WHICH IS
 * AVAILABLE AT HTTP://WWW.OPENLDAP.ORG/LICENSE.HTML OR IN THE FILE "LICENSE"
 * IN THE TOP-LEVEL DIRECTORY OF THE DISTRIBUTION. ANY USE OR EXPLOITATION
 * OF THIS WORK OTHER THAN AS AUTHORIZED IN VERSION 2.0.7 OF THE OPENLDAP
 * PUBLIC LICENSE, OR OTHER PRIOR WRITTEN CONSENT FROM NOVELL, COULD SUBJECT
 * THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY. 
 ******************************************************************************
 */
#ifndef LDAPX_H
#define LDAPX_H

#include <ldap.h>

LDAP_BEGIN_DECL

/* LDAP Extension OIDS */


#define NLDAP_NDS_TO_LDAP_EXTENDED_REQUEST						"2.16.840.1.113719.1.27.100.1"
#define NLDAP_NDS_TO_LDAP_EXTENDED_REPLY						"2.16.840.1.113719.1.27.100.2"
#define NLDAP_CREATE_NAMING_CONTEXT_EXTENDED_REQUEST			"2.16.840.1.113719.1.27.100.3"
#define NLDAP_CREATE_NAMING_CONTEXT_EXTENDED_REPLY				"2.16.840.1.113719.1.27.100.4"
#define NLDAP_MERGE_NAMING_CONTEXT_EXTENDED_REQUEST				"2.16.840.1.113719.1.27.100.5"
#define NLDAP_MERGE_NAMING_CONTEXT_EXTENDED_REPLY				"2.16.840.1.113719.1.27.100.6"
#define NLDAP_ADD_REPLICA_EXTENDED_REQUEST						"2.16.840.1.113719.1.27.100.7"
#define NLDAP_ADD_REPLICA_EXTENDED_REPLY						"2.16.840.1.113719.1.27.100.8"
#define NLDAP_REFRESH_SERVER_REQUEST							"2.16.840.1.113719.1.27.100.9"
#define NLDAP_REFRESH_SERVER_REPLY								"2.16.840.1.113719.1.27.100.10"
#define NLDAP_REMOVE_REPLICA_EXTENDED_REQUEST					"2.16.840.1.113719.1.27.100.11"
#define NLDAP_REMOVE_REPLICA_EXTENDED_REPLY						"2.16.840.1.113719.1.27.100.12"
#define NLDAP_NAMING_CONTEXT_ENTRY_COUNT_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.13"
#define NLDAP_NAMING_CONTEXT_ENTRY_COUNT_EXTENDED_REPLY			"2.16.840.1.113719.1.27.100.14"
#define NLDAP_CHANGE_REPLICA_TYPE_EXTENDED_REQUEST				"2.16.840.1.113719.1.27.100.15"
#define NLDAP_CHANGE_REPLICA_TYPE_EXTENDED_REPLY				"2.16.840.1.113719.1.27.100.16"
#define NLDAP_GET_REPLICA_INFO_EXTENDED_REQUEST					"2.16.840.1.113719.1.27.100.17"
#define NLDAP_GET_REPLICA_INFO_EXTENDED_REPLY					"2.16.840.1.113719.1.27.100.18"
#define NLDAP_LIST_REPLICAS_EXTENDED_REQUEST					"2.16.840.1.113719.1.27.100.19"
#define NLDAP_LIST_REPLICAS_EXTENDED_REPLY						"2.16.840.1.113719.1.27.100.20"
#define NLDAP_RECEIVE_ALL_UPDATES_EXTENDED_REQUEST				"2.16.840.1.113719.1.27.100.21"
#define NLDAP_RECEIVE_ALL_UPDATES_EXTENDED_REPLY				"2.16.840.1.113719.1.27.100.22"
#define NLDAP_SEND_ALL_UPDATES_EXTENDED_REQUEST					"2.16.840.1.113719.1.27.100.23"
#define NLDAP_SEND_ALL_UPDATES_EXTENDED_REPLY					"2.16.840.1.113719.1.27.100.24"
#define NLDAP_REQUEST_NAMING_CONTEXT_SYNC_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.25"
#define NLDAP_REQUEST_NAMING_CONTEXT_SYNC_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.26"
#define NLDAP_REQUEST_SCHEMA_SYNC_EXTENDED_REQUEST				"2.16.840.1.113719.1.27.100.27"
#define NLDAP_REQUEST_SCHEMA_SYNC_EXTENDED_REPLY				"2.16.840.1.113719.1.27.100.28"
#define NLDAP_ABORT_NAMING_CONTEXT_OPERATION_EXTENDED_REQUEST	"2.16.840.1.113719.1.27.100.29"
#define NLDAP_ABORT_NAMING_CONTEXT_OPERATION_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.30"
#define NLDAP_GET_CONTEXT_IDENTITY_NAME_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.31"
#define NLDAP_GET_CONTEXT_IDENTITY_NAME_EXTENDED_REPLY			"2.16.840.1.113719.1.27.100.32"
#define NLDAP_GET_EFFECTIVE_PRIVILEGES_EXTENDED_REQUEST			"2.16.840.1.113719.1.27.100.33"
#define NLDAP_GET_EFFECTIVE_PRIVILEGES_EXTENDED_REPLY			"2.16.840.1.113719.1.27.100.34"
#define NLDAP_SET_REPLICA_FILTER_EXTENDED_REQUEST				"2.16.840.1.113719.1.27.100.35"
#define NLDAP_SET_REPLICA_FILTER_EXTENDED_REPLY					"2.16.840.1.113719.1.27.100.36"
#define NLDAP_GET_REPLICA_FILTER_EXTENDED_REQUEST				"2.16.840.1.113719.1.27.100.37"
#define NLDAP_GET_REPLICA_FILTER_EXTENDED_REPLY					"2.16.840.1.113719.1.27.100.38"
#define NLDAP_CREATE_ORPHAN_NAMING_CONTEXT_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.39"
#define NLDAP_CREATE_ORPHAN_NAMING_CONTEXT_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.40"
#define NLDAP_REMOVE_ORPHAN_NAMING_CONTEXT_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.41"
#define NLDAP_REMOVE_ORPHAN_NAMING_CONTEXT_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.42"


// Extensions to trigger NDS background processes
#define NLDAP_TRIGGER_BKLINKER_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.43"
#define NLDAP_TRIGGER_BKLINKER_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.44"

#define NLDAP_TRIGGER_JANITOR_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.47"
#define NLDAP_TRIGGER_JANITOR_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.48"

#define NLDAP_TRIGGER_LIMBER_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.49"
#define NLDAP_TRIGGER_LIMBER_EXTENDED_REPLY			"2.16.840.1.113719.1.27.100.50"

#define NLDAP_TRIGGER_SKULKER_EXTENDED_REQUEST		"2.16.840.1.113719.1.27.100.51"
#define NLDAP_TRIGGER_SKULKER_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.52"

#define NLDAP_TRIGGER_SCHEMA_SYNC_EXTENDED_REQUEST	"2.16.840.1.113719.1.27.100.53"
#define NLDAP_TRIGGER_SCHEMA_SYNC_EXTENDED_REPLY	"2.16.840.1.113719.1.27.100.54"

#define NLDAP_TRIGGER_PART_PURGE_EXTENDED_REQUEST	"2.16.840.1.113719.1.27.100.55"
#define NLDAP_TRIGGER_PART_PURGE_EXTENDED_REPLY		"2.16.840.1.113719.1.27.100.56"


/* Replica types */
typedef enum LDAP_REPLICA_TYPE {
   LDAP_RT_MASTER = 0,
   LDAP_RT_SECONDARY = 1,
   LDAP_RT_READONLY = 2,
   LDAP_RT_SUBREF = 3,
   LDAP_RT_SPARSE_WRITE = 4,
   LDAP_RT_SPARSE_READ = 5,
   LDAP_RT_COUNT = 6
} LDAP_REPLICA_TYPE;

/* Replica State can have any of the following values */
#define LDAP_RS_ON				0
#define LDAP_RS_NEW_REPLICA		1
#define LDAP_RS_DYING_REPLICA	2
#define LDAP_RS_LOCKED			3
#define LDAP_RS_TRANSITION_ON	6
#define LDAP_RS_DEAD_REPLICA	7
#define LDAP_RS_BEGIN_ADD		8
#define LDAP_RS_MASTER_START	11
#define LDAP_RS_MASTER_DONE    12
#define LDAP_RS_SS_0			48 /* Replica Splitting State 0 */
#define LDAP_RS_SS_1			49 /* Replica Splitting State 1 */
#define LDAP_RS_JS_0			64 /* Replica Joining State 0 */
#define LDAP_RS_JS_1			65 /* Replica Joining State 1 */
#define LDAP_RS_JS_2			66 /* Replica Joining State 2 */

/* ldap_get_effective_privileges flags */
#define LDAP_DS_DYNAMIC_ACL              0x40000000L

#define LDAP_DS_ATTR_COMPARE        0x00000001L
#define LDAP_DS_ATTR_READ           0x00000002L
#define LDAP_DS_ATTR_WRITE          0x00000004L
#define LDAP_DS_ATTR_SELF           0x00000008L
#define LDAP_DS_ATTR_SUPERVISOR     0x00000020L
#define LDAP_DS_ATTR_INHERIT_CTL    0x00000040L

#define LDAP_DS_ENTRY_BROWSE        0x00000001L
#define LDAP_DS_ENTRY_ADD           0x00000002L
#define LDAP_DS_ENTRY_DELETE        0x00000004L
#define LDAP_DS_ENTRY_RENAME        0x00000008L
#define LDAP_DS_ENTRY_SUPERVISOR    0x00000010L
#define LDAP_DS_ENTRY_INHERIT_CTL	0x00000040L


#define L_MAX_DN_CHARS				257
#define L_MAX_BYTES_IN_UTF_CHAR		3
#define L_MAX_DN_BYTES				L_MAX_BYTES_IN_UTF_CHAR * L_MAX_DN_CHARS
#define FILTER_SEP					'$'

/* ID's used to refer to different NDS backgground processes*/
#define LDAP_BK_PROCESS_BKLINKER	1
#define LDAP_BK_PROCESS_JANITOR		2
#define LDAP_BK_PROCESS_LIMBER		3
#define LDAP_BK_PROCESS_SKULKER		4
#define LDAP_BK_PROCESS_SCHEMA_SYNC	5
#define LDAP_BK_PROCESS_PART_PURGE	6

/* This structure is used by the ldap_get_replica_info api */
typedef struct ldapreplicainfo {
      int               rootID;      
      int               state;     
      int               modificationTime; 
      int               purgeTime;        
      int               localReplicaID; 
      char              namingContextDN[L_MAX_DN_BYTES];  /* replace with symbol */
      LDAP_REPLICA_TYPE replicaType;      
      int               flags;
} LDAPReplicaInfo;

/* Values for flags in the LDAPReplicaInfo structure */
#define LDAP_DS_FLAG_BUSY     0x000000000001L
#define LDAP_DS_FLAG_BOUNDARY 0x000000000002L

/* This flag can be passed as a flag parameter in the partitioning APIs */
#define LDAP_ENSURE_SERVERS_UP         0x00000001

/*
 * In LDUP terminology a naming context is a NDS partition so this
 * is really just the NDS Split Partition.  The context specified
 * by dn identifies the new naming context.
 */
LDAP_F(int) ldap_create_naming_context(LDAP* ld, char* dn, int flags);                    

/*
 * NDS equivalent of joining two naming contexts.  The context identifies
 * the parent and the child naming contexts
 */
LDAP_F(int) ldap_merge_naming_contexts(LDAP* ld, char*dn, int flags);

/*
 * Add replica rooted at dn to server specified by serverName of
 * type replicaType
 */
LDAP_F(int) ldap_add_replica(LDAP* ld, char* dn, char* serverDN, LDAP_REPLICA_TYPE replicaType, int flags);

/*
 * Remove the replica from server specified by serverName.
 * The replica is specified by dn
 */
LDAP_F(int) ldap_remove_replica(LDAP* ld, char* dn, char* serverDN, int flags);

/*
 * Get the number of entries in the naming context rooted
 * at dn
 */
LDAP_F(int) ldap_naming_context_entry_count(LDAP* ld, char* dn, unsigned long* count);

/*
 * Change the type of the replica rooted at dn on server serverName
 * to new type identified by replicaType
 */
LDAP_F(int) ldap_change_replica_type(LDAP* ld, char* dn, char* serverName, LDAP_REPLICA_TYPE replicaType, int flags);

/*
 * Fills in the LDAPReplicaInfo structure for the replica rooted at dn on serverDN
 */
LDAP_F(int) ldap_get_replica_info(LDAP* ld, char* dn, char* serverDN, LDAPReplicaInfo* replicaInfo);

/*
 * Lists all the replicas on the server identified by serverDN
 * Caller does not allocate but is reponsible for freeing
 * replicaList by calling ldap_value_free
 */
LDAP_F(int) ldap_list_replicas(LDAP *ld, char *serverDN, char*** replicaList);

/*
 * In the LDUP world we would set some attribute on the replication
 * agreement object triggering a replication event.between the
 * toServerDN and fromServerDN.
 * In the NDS world we ignore the
 * fromServerDN attribute as this is always the server holding
 * the master replica of naming context rooted at partitionRoot.
 */
LDAP_F(int) ldap_receive_all_updates(LDAP *ld, char* partitionRoot, char* toServerDN, char* fromServerDN);  

/*
 * In the LDUP world we would set some attribute on the replication
 * agreement object triggering a replication event that forces the
 * server specified by origServerDN to send updates to all replicas.
 * In the NDS world we ignore the origServerDN attribute as this
 * is always the server holding the master replica of naming context
 * rooted at partitionRoot.
 */
LDAP_F(int) ldap_send_all_updates(LDAP *ld, char* partitionRoot, char* origServerDN);

/*
 * NDS specific API.
 * Schedules skulker on server after delay seconds. Server must have
 * a replica of the naming context identified by partitionRoot
 */
LDAP_F(int) ldap_request_naming_context_sync(LDAP *ld, char* serverName, char* partitionRoot, int delay);

/*
 * NDS specific API
 * Schedule schema skulker on the server specified by the serverName
 * after delay seconds.
 */
LDAP_F(int) ldap_request_schema_sync(LDAP*ld, char* serverName, int delay);                    

/*
 * NDS specific API.
 * This aborts the the last naming context operation that was performed on
 * the naming context specified by the dn container.  The flags parameter
 * is currently unused, pass 0
 */
LDAP_F(int) ldap_abort_naming_context_operation(LDAP* ld, char* dn, int flags);

/*
 * Get the dn of whoever we are logged in as. Caller is responsible 
 * for freeing identity by calling ldapx_memfree
 */
LDAP_F(int) ldap_get_context_identity_name(LDAP* ld, char** identity);

/*
 * Get rights of trusteeDN to object dn for attribute attrName
 */
LDAP_F(int) ldap_get_effective_privileges(LDAP* ld, char* dn, char* trusteeDN, char* attrName, int* privileges);

/*
 * This API is provided for legacy NDS applications.  
 * It converts a dot-sperated-Unicode NDS name to 
 * a typed LDAP name. Caller has the responsibility of
 * freeing ldapName by calling ldapx_memfree
 */
LDAP_F(int) ldap_nds_to_ldap(LDAP* ld, unsigned short* ndsName, char** ldapName);

/*
 * This API is used to reload the LDAP Server.  The LDAP context
 * identifies the LDAP Server
 */
LDAP_F(int) ldap_refresh_server(LDAP* ld);

/*
 * Applications must use this API is to free any mmeory that the library allocates
 */
LDAP_F(void) ldapx_memfree(void* mem);

/*
 * This API is used to set the attribute and class filter on NDS 
 * Virtual Replica.  The serverDN identifies the server on which
 * the filter needs to be set.  With NDS 8.5 these filters are set
 * on a per server basis.  The filter identifies the classes and
 * attributes that comprise the filter and has the following format:
 * 
 * Example Filter:
 * 	class1$attr1$attr2$attr3$$class2$attr1$$$
 */
LDAP_F(int) ldap_set_replication_filter(LDAP* ld, const char* serverDN, const char* filter);

/*
 * This API is used to get the attribute and class filter on an existing
 * NDS Server.  The filter has the same format as that in the set_replication_filter
 * call. The caller must free filter by calling ldapx_memfree
 */
LDAP_F(int) ldap_get_replication_filter(LDAP* ld, const char* serverDN, char** filter);

/*
 * This API is used to create an orphan partition on the specified server
 */
LDAP_F(int) ldap_create_orphan_naming_context(LDAP* ld, char* serverDN, char* contextName);

/*
 * This API is used to remove the specified orphan naming context from the specified 
 * server. The call fails if the server does not hold the specified naming context
 */
LDAP_F(int) ldap_remove_orphan_naming_context(LDAP* ld, char* serverDN, char* contextName);

/*
 * This API is used to trigger the specified background process on the NDS server
 */
LDAP_F(int) ldap_trigger_back_process(LDAP* ld, int processID);


LDAP_END_DECL

#endif /*LDAPX_H*/

