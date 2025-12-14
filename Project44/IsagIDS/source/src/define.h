
/* Use in module to change from kernel to user mode */
#define BEGIN_KMEM old_fs = get_fs();set_fs(get_ds());
#define END_KMEM set_fs(old_fs);

/* define constant <module part> */
#define PATH_LEN 	80	// path to file that use to execute
#define MAX_COMM_LEN 	80	// command + option length

/* define constant <server part> */
#define SERV_CONFIG_FILE	"config.serv"
#define BLACK_LIST_FILE		"blacklist"
#define EVENT_LIST_FILE		"eventlist"
#define MAX_RECEIVE 	512
#define MAX_FILENAME	128

/* global variable <analyse part>*/
extern int SEQ_LEN;  /* sequence length 15 */
extern int DB_WINDOW_SIZE;  /* number of command in database to compare 500*/
extern int R_WINDOW_SIZE;   /* number of command in recent sequence to compare 1000*/
extern long compareCount;

/* structure use to send to server */
struct execInfor {
   int uid;
   char pathname[PATH_LEN];
   char command[MAX_COMM_LEN];
   unsigned long startTime;
};

/* structure use to keep at IDS server */
struct userLog {
   char pathname[PATH_LEN];
   char command[MAX_COMM_LEN];
   unsigned long startTime;
};

/* structure use to keep black list */
struct blackUser{
   int uid;
   char hostIP[20];
   float score;
   unsigned long detectTime;
};
