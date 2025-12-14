#include "slog.h"

int slog::slog_init(void)
{
	openlog("IsagNids", LOG_PID|LOG_NDELAY, LOG_USER);
	return 1;
}

void slog::slog_close(void)
{
	closelog();
}
void slog::slog_dump (char *std )
{
	strcpy(buff, std);
	syslog(LOG_ALERT, buff);
	
}
