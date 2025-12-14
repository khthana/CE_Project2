#include <fcntl.h>
main() {
	  int fd, id,pid,i;

	  char string[200],str_system[200],str_init[]="/usr/bin/strace -o /usr/local/ids/temp/";
	  char str_id[10],str_pid[10];

	  fd = open("/dev/skeleton",O_RDONLY);

	  if( fd == -1) {
		printf("open error...\n");
		exit(0);
	  }
	
	  while(1)
	{	
		pid = read(fd, string,200);
		if( pid == -1 ) {
			printf("read error...\n");
			exit(1);
		}

		if(pid > 0){

			for(i=0;string[i] != '-';i++)
				str_id[i] = string[i];
		 	str_id[i] = '\0';
		 	id = atoi(str_id);
					       
		
			printf("\nAudit process %s Userid %d\n",string,id);
			
			sprintf(str_pid,"%d",pid);
			strcpy(str_system,str_init);
			strcat(str_system,string);
			strcat(str_system,".Audit -p ");
			strcat(str_system,str_pid);
			strcat(str_system," & ");
			system(str_system);
//			printf("X%sX\n",str_system);
		}
	}
	close(fd);
	return 0;
}

