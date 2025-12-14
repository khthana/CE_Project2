#include <linux/unistd.h>

_syscall0(int,newcall);
_syscall1(int,newcallreceive,char *,fd);

main()
{
  long ab;
  newcall(); 
  newcallreceive("Test run in kernel");
} 
