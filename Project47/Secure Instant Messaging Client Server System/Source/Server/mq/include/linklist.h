
#define DUMMY_TRAILER '\177'
#define DUPLICATE 1
#define NEW_NODE 0
#define FOUND 1
#define NOT_FOUND 0


struct Usercon;
typedef struct Usercon NODE;
int Insert(NODE *list,char *string);
int Insert2(NODE *list,char *string[],int i);
int Delete(NODE *list,char *string);
NODE *init_list(void);
void traverse(NODE *list);
void find_online(NODE *list,char *string,char status[],char ip[]);
int find(NODE *list,char *string);
//void get_status_ip(NODE *list,char status[],char ip[]);

struct Usercon
{
	char data[20];
//	char status[10];
	char ip[16];
	NODE *next;
};
