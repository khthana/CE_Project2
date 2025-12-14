#include  <stdio.h>
#include  <sys/types.h>

void  parse(char *line, char **argv)
{
	while (*line != '\0') {       /* if not the end of line ....... */ 
        while (*line == ' ' || *line == '\t' || *line == '\n')
             *line++ = '\0';     /* replace white spaces with 0    */
        *argv++ = line;          /* save the argument position     */
        while (*line != '\0' && *line != ' ' && 
               *line != '\t' && *line != '\n') 
             line++;             /* skip the argument until ...    */
	}
   	*argv = '\0';                 /* mark the end of argument list  */
}

void  execute(char **argv)
{
        pid_t  pid;
        int    status;

        if ((pid = fork()) < 0) {     /* fork a child process           */
             printf("*** ERROR: forking child process failed\n");
             exit(1);
        }
        else if (pid == 0) {          /* for the child process:         */
             if (execvp(*argv, argv) < 0) {     /* execute the command  */
                  printf("*** ERROR: exec failed\n");
                  exit(1);
             }
        }
        else {                                  /* for the parent:      */
             while (wait(&status) != pid);       /* wait for completion  */
              
        }
}
/*
int  main(void)
{
        char  *argv[20];              // the command line argument      
	char i[100];

		printf("lising the rules:\n");
		strcpy(i,"iptables -L INPUT");
		parse(i,argv);
                execute(argv);           // otherwise, execute the command 
		printf("adding Rules:\n");
		strcpy(i,"iptables -A INPUT -p icmp -j DROP");
		parse(i,argv);
		execute(argv);
		
		strcpy(i,"iptables -L INPUT");
		parse(i,argv);
		execute(argv);
		
		printf("add rules complete\n");
		printf("removing Rules:\n");
		strcpy(i,"iptables -D INPUT -p icmp -j DROP");
		parse(i,argv);
		execute(argv);
		strcpy(i,"iptables -L INPUT");
		parse(i,argv);
		execute(argv);
		printf("remove rules complete:\n");
}*/
