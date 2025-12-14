//#define MODULE
//#define __KERNEL__
#define BEGIN_KMEM old_fs=get_fs();set_fs(get_ds());
#define END_KMEM set_fs(old_fs);
//#define TEMP_FORK "./forkp.tmp"
#define TEMP_DATA "./error.log"
#define CONFIG_AUDIT_FILE "./sc.conf"
#define MAX_NAME_PROGRAM 20

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <asm/unistd.h>
#include <sys/syscall.h>
#include <asm/fcntl.h>
#include <asm/errno.h>
#include <asm/uaccess.h>
#include <linux/types.h>
#include <linux/slab.h>

#include <linux/errno.h>
#include <linux/fs.h>
//#include <linux/module.h>
#include <linux/mm.h>
#include <asm/uaccess.h>
#define CASE1 1
#define CASE2 2
#define STR_SIZE 30

extern void* sys_call_table[];       /*sys_call_table is exported, so we can access it*/

asmlinkage int(*orig_execve)(struct pt_regs);
asmlinkage static pid_t (*orig_fork)(struct pt_regs);
asmlinkage long (*orig_open)(const char*,int,int);
asmlinkage long (*orig_close)(unsigned int);
asmlinkage ssize_t (*read)(unsigned int,char*,size_t);
asmlinkage ssize_t (*write)(unsigned int,char*,size_t);

int cits(char *,const long);
int read_name_process(char *,const char *);
int chk_detect_process(char *const);
void make_proc_name_list(char *);

//variable for detect program
char * audit_program[10];			// name of program that want to detect
int	num_audit_program = 0;

//variable for communicat with process
//static unsigned int count_str,font,back;
//static char string [200],ptr_str[STR_SIZE][200];
static char str_success[200],str_fork[200];


//static  unsigned int count_auditsuccess, sfont, sback;
//static char auditsuccess[100],ptr_auditsuccess[STR_SIZE][100];


struct fd_list
{
	long   fd;
	char * filename;
	struct fd_list * next;
};

struct fork_list
{	
	int	id;
	long 	pid;
	char 	* pname;
	struct fork_list * next;
};

struct fd_list * first_fd_list;
struct fd_list * AuditSuccess;
struct fork_list * first_fork_list;

//##################################################################################
//###############################  START AUDITSUCCESS ##############################

static int auditsuccess_open (struct inode *inode, struct file *file)
{
//	MOD_INC_USE_COUNT;
//	sfont = 0;
//	sback = 0;
//	count_auditsuccess = 0;
	return 0;
}

static int auditsuccess_release (struct inode *inode, struct file *file)
{
//	MOD_DEC_USE_COUNT;
	return 0;
}


static ssize_t auditsuccess_read (struct file *file, char *buf, size_t count, loff_t *ppos)
{
	int len=0,err;
	struct fd_list *tmp;
	
	if(AuditSuccess != NULL)
	{
		tmp = AuditSuccess;
		strcpy(str_success,tmp->filename);
		len = strlen(str_success);
		err = copy_to_user(buf,str_success,count);
		if(err != 0)
			return -EFAULT;
		AuditSuccess = AuditSuccess->next;
		kfree(tmp->filename);
		kfree(tmp);
	}

	return len;
}

static struct file_operations auditsuccess_fops =
{
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
	NULL,                           /* skeleton_llseek */
	auditsuccess_read,          /* skeleton_read */
//	skeleton_write,         /* skeleton_write */
	NULL,
	NULL,                           /* skeleton_readdir */
	NULL,                           /* skeleton_poll */
//	skeleton_ioctl,         /* skeleton_ioctl */
	NULL,
	NULL,                           /* skeleton_mmap */
	auditsuccess_open,          /* skeleton_open */
	NULL,                           /* skeleton_flush */
	auditsuccess_release,               /* skeleton_release */
	NULL,                           /* skeleton_fsync */
	NULL,                           /* skeleton_fasync */
	NULL,                           /* skeleton_check_media_change */
	NULL,                           /* skeleton_revalidate */
	NULL                            /* skeleton_lock */
#else /* for LINUX_VERSION_CODE 2.4.0 and later */
	THIS_MODULE,                    /* struct module *owner;*/
	NULL,                           /* skeleton_llseek */
	auditsuccess_read,          /* skeleton_read */
//	skeleton_write,         /* skeleton_write */
	NULL,
	NULL,                           /* skeleton_readdir */
	NULL,                           /* skeleton_poll */
//	skeleton_ioctl,         /* skeleton_ioctl */
	NULL,
	NULL,                           /* skeleton_mmap */
	auditsuccess_open,          /* skeleton_open */
	NULL,                           /* skeleton_flush */
	auditsuccess_release,               /* skeleton_release */
	NULL,                           /* skeleton_fsync */
	NULL,                           /* skeleton_fasync */
	NULL,                           /* skeleton_lock */
	NULL,                           /* skeleton_readv */
	NULL                            /* skeleton_writev */
#endif
};


//###################################  END AUDITSUCCESS #########################
//##################################################################################


//##################################################################################
//###################################  START SKELETON   #########################

static int skeleton_open (struct inode *inode, struct file *file)
{
//	MOD_INC_USE_COUNT;
//	font = 0;
//	back = 0;
//	count_str = 0;
	return 0;
}

static int skeleton_release (struct inode *inode, struct file *file)
{
//	MOD_DEC_USE_COUNT;
	return 0;
}


static ssize_t skeleton_read (struct file *file, char *buf, size_t count, loff_t *ppos)
{
/*	int len, err;

	if( count_str <= 0 )
		return 0;
	strcpy(string,ptr_str[font]);
	len = strlen(string);
	err = copy_to_user(buf,string,count);
	if (err != 0)
		return -EFAULT;

	count_str = count_str -1;
	font = font +1;
	if(font == STR_SIZE)
		font = 0;

	return len;
*/
	int len=0,err;
	struct fork_list *tmp;
	
	if(first_fork_list != NULL)
	{
		tmp = first_fork_list;

//		printk("<1> Read success %s\n",tmp->pname);
		
		strcpy(str_fork,tmp->pname);
	//	len = strlen(str_fork);
		len = tmp->pid;
		err = copy_to_user(buf,str_fork,count);
		if(err != 0)
			return -EFAULT;
		first_fork_list = first_fork_list->next;
		kfree(tmp->pname);
		kfree(tmp);
	}

	return len;
}

static struct file_operations skeleton_fops =
{
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
	NULL,                           /* skeleton_llseek */
	skeleton_read,          /* skeleton_read */
//	skeleton_write,         /* skeleton_write */
	NULL,
	NULL,                           /* skeleton_readdir */
	NULL,                           /* skeleton_poll */
//	skeleton_ioctl,         /* skeleton_ioctl */
	NULL,
	NULL,                           /* skeleton_mmap */
	skeleton_open,          /* skeleton_open */
	NULL,                           /* skeleton_flush */
	skeleton_release,               /* skeleton_release */
	NULL,                           /* skeleton_fsync */
	NULL,                           /* skeleton_fasync */
	NULL,                           /* skeleton_check_media_change */
	NULL,                           /* skeleton_revalidate */
	NULL                            /* skeleton_lock */
#else /* for LINUX_VERSION_CODE 2.4.0 and later */
	THIS_MODULE,                    /* struct module *owner;*/
	NULL,                           /* skeleton_llseek */
	skeleton_read,          /* skeleton_read */
//	skeleton_write,         /* skeleton_write */
	NULL,
	NULL,                           /* skeleton_readdir */
	NULL,                           /* skeleton_poll */
//	skeleton_ioctl,         /* skeleton_ioctl */
	NULL,
	NULL,                           /* skeleton_mmap */
	skeleton_open,          /* skeleton_open */
	NULL,                           /* skeleton_flush */
	skeleton_release,               /* skeleton_release */
	NULL,                           /* skeleton_fsync */
	NULL,                           /* skeleton_fasync */
	NULL,                           /* skeleton_lock */
	NULL,                           /* skeleton_readv */
	NULL                            /* skeleton_writev */
#endif
};

//###################################  END SKELETON     #########################
//##################################################################################


// Save string to  file
// filename, filename to write
//ptr_str , pointer point to string
int save_str( char *const  filename,const char * ptr_str)
{	
	int fd;
	mm_segment_t old_fs;
	int str_lenght= strlen(ptr_str);
	char * str_buff;
	
	str_buff = (char*)kmalloc((str_lenght+2) * sizeof(char),GFP_KERNEL);
	strcpy(str_buff,ptr_str);
	str_buff[str_lenght] = 10;
	str_buff[str_lenght+1] = 0;
	
	BEGIN_KMEM
		fd=orig_open( filename,O_CREAT | O_RDWR | O_APPEND,0600);
	END_KMEM
    
	if (fd>0){
         	BEGIN_KMEM
			 write(fd,str_buff,(str_lenght+1));
			orig_close(fd);
		END_KMEM
         
		kfree(str_buff);
		return 1;
		} else{
	   	// error  open fill for save //
	   	kfree(str_buff);
		return -1;
  	 }
}


//############ Part of Read Config File#############################


//read name of process  from buffer
//ptr_str , pointer of  buffer
//str_size, size of buffer
//return value by  Global variable "Audit_program"
/*
void search_name_program(char *ptr_str,int str_size)
{
	int source_index,target_index,program_count;
	char buff[MAX_NAME_PROGRAM];
	program_count = 0;
	source_index = 0;
	
	while(source_index < str_size)
	{
		if(ptr_str[source_index] == '#')																//detect comment
		{	while(ptr_str[source_index] != 10 && source_index < str_size )
			source_index++;
		}
		else if (ptr_str[source_index] == '"')
		{
			source_index++;
			target_index = 0;
			while(ptr_str[source_index] != '"' && source_index < str_size )
			{
				buff[target_index] = ptr_str[source_index];
				target_index++;
				source_index++;
			}
			buff[target_index] = '\0';
			audit_program[program_count] = (char*)kmalloc(target_index * sizeof(char),GFP_KERNEL);
			strcpy(audit_program[program_count],buff);
			program_count++;
			source_index++;
		}
		else source_index++;
	}

		num_audit_program = program_count;

//	test output to file
//	for(i=0;i<program_count;i++)
//		save_str(TEMP_DATA,audit_program[i]);
//	for(i=0;i<program_count;i++)
//		kfree(audit_program[i]);
	
}

// Read config file  if  success return 1 
int read_config()
{
	int fd ;
	int read_size = 100;					// size of read 
	int max_size = 2048;					// maximum size of config to read  
	int total_read_size;
	int size_return;
//	int read_next_line;
	char buff[read_size];
	char stream_buff[max_size];
	mm_segment_t old_fs;
	
	BEGIN_KMEM
		fd=orig_open(CONFIG_AUDIT_FILE,O_RDONLY,0600);
	END_KMEM
	if (fd>0){
		BEGIN_KMEM
			stream_buff[0] = '\0';
			total_read_size = 0;
			do{	
				size_return = read(fd,buff,read_size);
				buff[size_return] = '\0';
				strcat(stream_buff,buff);
				total_read_size += size_return;
			}while(size_return == read_size && total_read_size < (max_size - read_size));
			orig_close(fd);
		END_KMEM

			search_name_program(stream_buff,total_read_size);
	
		return 1;
	}
	else
		return -1;

}
*/
int read_config(){
	
	int  fd,i,j,k,size_return;
	char  buff[2000],tmp[1000],ch[10];
	mm_segment_t  old_fs;
	
	BEGIN_KMEM
		fd = orig_open(CONFIG_AUDIT_FILE,O_RDONLY,0600);
	END_KMEM
	if(fd >0){

		do{
			i = 0;
			BEGIN_KMEM
			do{
				size_return = read(fd,ch,1);
				buff[i] = ch[0];
				i++;
			}while( (ch[0] != '\n') && (size_return > 0) );
			END_KMEM
			buff[i] = '\0';

			i=0;
			while( buff[i] == ' ' ){
				i++;
			}

			if( (buff[i] != '#') && (buff[i] != '\n') ){
				j = i;
				while(buff[i] != ':' && (i < strlen(buff) )){
					i++;
				}
				
				if(i >= strlen(buff)){
					save_str(TEMP_DATA,"ERROR in config file");
					save_str(TEMP_DATA,buff);
				}

				k= 0;
				while(j<i && j < 100){
					tmp[k] = buff[j];
					k++;
					j++;
				}
			tmp[k] = '\0';

//			save_str(TEMP_DATA,"Variable name");
//			save_str(TEMP_DATA,tmp);

			if( 0 == strcmp(tmp,"DetectProcessName")){

				while(buff[i] != '"'){
					i++;
				}
				i++;
				j = i;
				while(buff[i] != '"'){
					i++;
				}

				k= 0;
				while(j<i){
					tmp[k] = buff[j];
					k++;
					j++;
				}
				tmp[k] = '\0';
				
//				save_str(TEMP_DATA,"list of process");
//				save_str(TEMP_DATA,tmp);
				
				make_proc_name_list(tmp);
			}
			
//			save_str(TEMP_DATA,"variable name not match");
	
		}


	}while(size_return > 0);

		BEGIN_KMEM
			orig_close(fd);
		END_KMEM
		
		return 1;
	}
	else{
		save_str(TEMP_DATA,"Cannot read config file");
		return -1;
	}
}

void make_proc_name_list(char * ptr){
	int source, tstart , index,program_count;
	char buff[MAX_NAME_PROGRAM];


	program_count = 0;
	source = 0;
	
	while(ptr[source] != '\0'){
		tstart = source;
		while( (ptr[source] != ',') && (ptr[source] != '\0')){
			source++;
		}

			index= 0;
			while(tstart< source){
				buff[index] = ptr[tstart];
				index++;
				tstart++;
			}
			buff[index] = '\0';
			
			audit_program[program_count] = (char*)kmalloc(index * sizeof(char),GFP_KERNEL);			    			   strcpy(audit_program[program_count],buff);
//			save_str(TEMP_DATA,buff);	
			
			program_count ++;
			source++;
	}
	num_audit_program = program_count;
	

//	save_str(TEMP_DATA,"_______________");
//	for(source = 0; source < num_audit_program; source++){
//		save_str(TEMP_DATA,audit_program[source]);
//	}
	
}

//############ End Part of Read Config File#########################

//############ Part of Detec System Call ###########################

asmlinkage int new_execve(struct pt_regs regs)
{
	char *filename;
	char tmp[10];
	filename = getname((char*)regs.ebx);
	
	cits(tmp,current->uid);
//	save_str(TEMP_CLOSE,tmp);
/*	strcpy(ptr_str[back],filename);
	count_str = count_str +1;
	back = back +1;
	if (back ==  STR_SIZE)
		back = 0;
*/	
	return do_execve(filename,(char**)regs.ecx,(char**)regs.edx,&regs);
}

//int cut_execve_name(char * source,const char * target);

asmlinkage int new_fork(struct pt_regs regs)
{
	int chlid_pid;
	char str_pid[10],str_id[10];
	char process_name[100],tmp_str[200];
	struct fork_list * tmp, * nfork;
	
	chlid_pid =  orig_fork(regs);
	
	if(chlid_pid != 0)							//if pid ==0  is chlid  process fork
	{	cits(str_pid,chlid_pid);

		if( 1 == read_name_process(process_name,str_pid)){		// if read name of process success
//			  save_str(TEMP_FORK,process_name);
			
			if(1 == chk_detect_process(process_name))		// if is program want to detect
			{
				//####################################
				// connot debug by save_str it not work
				// ###################################
	
//				printk("<1> TFORK %s %s\n",str_pid,process_name);
			/*	strcpy(ptr_str[back],str_pid);
				strcat(ptr_str[back],"-");
				strcat(ptr_str[back],process_name);
			        count_str = count_str +1;
				back = back +1;
				if (back ==  STR_SIZE)
					back = 0;
			*/	
				
				cits(str_id,current->uid);
				strcpy(tmp_str,str_id);
				strcat(tmp_str,"-");
				strcat(tmp_str,str_pid);
				strcat(tmp_str,"-");
				strcat(tmp_str,process_name);
				
				nfork = (struct fork_list *)kmalloc(sizeof(struct fork_list),GFP_KERNEL);
				nfork->pname = (char *)kmalloc(strlen(tmp_str) * sizeof(char),GFP_KERNEL);
				strcpy(nfork->pname,tmp_str);
				nfork->id = current->uid ;
				nfork->pid = chlid_pid;
				nfork->next = NULL;
				
				tmp = first_fork_list;
				if(tmp != NULL)
				{	
					while(tmp->next != NULL)
						tmp = tmp->next;
					tmp->next = nfork;
//					printk("<1> ADD To list %s\n",nfork->pname);
				}
				else
				{
					first_fork_list = nfork;
//					printk("<1> ADD To Head list %s\n",nfork->pname);
				}
				
//				save_str(TEMP_FORK,"found process");
//				save_str(TEMP_FORK,tmp_str);



			}
		}
	}
	return chlid_pid;
}

int str_procinfo(char * ptr_str,const int pid)
{
	char str_pid[7];   //process id can 0 to 32767
	char process_name[20];	//Assum that lenght of procees name max 20 char
	char sp[] = "   "; //space	

	cits(str_pid,pid);
	if( 1 == read_name_process(process_name,str_pid))
	{
		strcpy(ptr_str,str_pid);
		strcat(ptr_str,sp);
		strcat(ptr_str,process_name);
		return 1;
	}
	
	return 0;
}

int cits(char * ptrs,const long data) /*convert integer to string*/
{
        int i,k;
        long remind=data;
        char tmpch[6];
	
	i =0; 
      	do{
                tmpch[i] = (remind % 10) + 48;
                remind = remind / 10;
		i ++;
	  }while(remind > 0);
 	
	i--;
        for(k=0;i>=0;i--,k++)
        {
                ptrs[k] = tmpch[i];
        }
	ptrs[k] ='\0';
	return 0;
}

//read process name form process id
//real_name pass by reference , for return the name of process
//pid , pid of process that want to know process name
int read_name_process(char *real_name,const char *pid)
{
	char path_init[20] = "/proc/";		// read from path /proc
	char sf[] ="/status"; 		// read from status file
	int fd,i,k;
	mm_segment_t old_fs;
	char name_buff[110];
	
	
	strcat(path_init,pid);
	strcat(path_init,sf);
	
	BEGIN_KMEM
		fd=orig_open(path_init,O_RDONLY,0444);
	END_KMEM
	if (fd>0){
		BEGIN_KMEM
			read(fd,name_buff,100);   //tile Name:   xxxxxx = 30 byte
			orig_close(fd);
		END_KMEM

		for(i=6,k=0 ; name_buff[i]!= 10 ; i++,k++)
		{
			real_name[k] = name_buff[i];
		}
		real_name[k] = '\0';
		
//		save_str(TEMP_FORK,"read name process");
//		save_str(TEMP_FORK,real_name);

		return 1;
	} else{
		return -1; 
	}
}


//##################### End of  part detect systemcall ##############################

//##################### Part of  check process  want to detect ########################
int chk_detect_process(char *const process_name)
{
	int i,chk=0;

	for(i=0; i<num_audit_program; i++){
		
		if(0==	strcmp(audit_program[i],process_name))
		{	chk = 1;
			break;
		}
	}
	return chk;
}
//##################### End part of  check process  want to detect #####################

asmlinkage long new_open(const char* filename,int flags,int mode)
{
	int i,j,len;
	long open_return;
	char * tmp,sub_filename[7];
//	char str_fd[10];
	char   audit[]= "Audit";
	struct fd_list * tmp_fd, * travel;


	open_return = orig_open(filename,flags,mode);
	if(open_return != -1)
	{
		tmp = getname(filename);
		len = strlen(filename);
		if(len > 6)
		{
			for(i=0,j=5 ; i < 6; i++,j--)
				sub_filename[j]= filename[len-i];
		}
		if(!strcmp(audit,sub_filename))
		{
			tmp_fd = (struct fd_list *)kmalloc(sizeof(struct fd_list),GFP_KERNEL);
			tmp_fd->fd = open_return;
			tmp_fd->filename = (char *)kmalloc(strlen(filename) * sizeof(char),GFP_KERNEL);
			strcpy(tmp_fd->filename,filename);
			tmp_fd->next = NULL;
	
			travel = first_fd_list;		
			while(travel->next != NULL)
				travel = travel->next;
			
			travel->next = tmp_fd;

//			travel = first_fd_list->next;
//			save_str(TEMP_OPEN,"__________");
//			while(travel != NULL)
//			{
//				cits(str_fd,travel->fd);
//				save_str(TEMP_OPEN,str_fd);
//				save_str(TEMP_OPEN,travel->filename);
//				travel= travel->next;
//			}
		}
		
	}
	
	return open_return;	
}


asmlinkage long new_close(unsigned int fd)
{
	struct fd_list * travel, * tmp_success,* tail, * match;
//	char  str_fd[10];
	int found = 0;
	
		travel = first_fd_list;
		while(travel->next != NULL && (found == 0))
		{
			if(travel->next->fd == fd)
			{
				found = 1;
				tail = travel->next->next;
				match = travel->next;
				match->next = NULL;
				
				tmp_success = AuditSuccess;
				if(tmp_success != NULL)
				{	
					while(tmp_success->next != NULL)
						tmp_success = tmp_success->next;
					tmp_success->next = match;
				}
				else
				{
					AuditSuccess = match;
				}

				travel->next = tail;

/*				tmp_success = AuditSuccess;
				save_str(TEMP_CLOSE,"__________");
				while( tmp_success!= NULL)
				{
					cits(str_fd,tmp_success->fd);
					save_str(TEMP_CLOSE,str_fd);
					save_str(TEMP_CLOSE,tmp_success->filename);
					tmp_success= tmp_success->next;
				}
*/

			}
			if(travel->next != NULL)
				travel = travel->next;
		}

	return orig_close(fd);
}

int init_module(void)                /*module setup*/
{	
	int i;

	orig_open=sys_call_table[__NR_open];
	sys_call_table[__NR_open]=new_open;
	
	orig_close=sys_call_table[__NR_close];
	sys_call_table[__NR_close]=new_close;

	read=sys_call_table[__NR_read];
	write=sys_call_table[__NR_write];
	
	read_config();


	orig_fork=sys_call_table[__NR_fork];
	sys_call_table[__NR_fork]=new_fork;

//	orig_execve=sys_call_table[__NR_execve];
//	sys_call_table[__NR_execve]=new_execve;

       first_fd_list = (struct fd_list *)kmalloc(sizeof(struct fd_list),GFP_KERNEL);
       first_fd_list->filename = (char *)kmalloc(10,GFP_KERNEL);
       first_fd_list->fd = -1;
       first_fd_list->next = NULL;
      
       first_fork_list = NULL;
       AuditSuccess = NULL;
	
	i = register_chrdev (32, "skeleton", & skeleton_fops);
	if (i != 0) return - EIO;


        i = register_chrdev (33, "auditsuccess", & auditsuccess_fops);
	if (i != 0) return - EIO;
		
	
	return 0;
}

void cleanup_module(void)            /*module shutdown*/
{
	int i;
	struct fd_list * tmp;
	struct fork_list * stmp;

	sys_call_table[__NR_fork]=orig_fork;
//	sys_call_table[__NR_execve]=orig_execve;
	sys_call_table[__NR_open]=orig_open;
	sys_call_table[__NR_close]=orig_close;


	for(i=0;i<num_audit_program;i++)
		kfree(audit_program[i]);

	while(first_fd_list != NULL)
	{
		tmp = first_fd_list;
		first_fd_list = first_fd_list->next;
		kfree(tmp->filename);
		kfree(tmp);
	}

	while(first_fork_list != NULL)
	{
		stmp = first_fork_list;
		first_fork_list = first_fork_list->next;
		kfree(stmp->pname);
		kfree(stmp);
	}
	

	 unregister_chrdev (32, "skeleton");
	 unregister_chrdev (33, "auditsuccess");
}


