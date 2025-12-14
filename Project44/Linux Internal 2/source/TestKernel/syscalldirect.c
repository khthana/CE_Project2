#include <sys/syscall.h>

main()
{
  syscall(191);
  syscall(192,"Test run in kernel");
} 
