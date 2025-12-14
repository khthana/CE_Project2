
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>

#include "config.h"
#ifdef DEBUG
extern int debug;
#endif

void
dbg(int dbg_level, const char *fmt, ...)
{
#ifdef DEBUG
    va_list ap;

    if (debug < dbg_level)
        return;

    fprintf(stderr, "DEBUG%d: ", dbg_level);
    va_start(ap, fmt);
    if (fmt != NULL)
        (void)vfprintf(stderr, fmt, ap);
    (void)fprintf(stderr, "\n");
    va_end(ap);
    fflush(NULL);
#else
    return;
#endif
}


void
err(int eval, const char *fmt, ...)
{
    va_list ap;
	FILE *ERR;
	int line;

	ERR = fopen("error.txt","w");
	line = strlen(fmt);
	fwrite(fmt,line,1,ERR);
	fclose( ERR );

    va_start(ap, fmt);
    if (fmt != NULL) {
        (void)vfprintf(stderr, fmt, ap);
        (void)fprintf(stderr, ": ");
    }
    va_end(ap);
    (void)fprintf(stderr, "%s\n", strerror(errno));
    exit(eval);
}

void
warn(const char *fmt, ...)
{
    va_list ap;
	FILE *Warnx;
	int line;

	Warnx = fopen("Warn.txt","w");
	line = strlen(fmt);
	fwrite(fmt,line,1,Warnx);
	fclose( Warnx );

    va_start(ap, fmt);
    if (fmt != NULL) {
        (void)vfprintf(stderr, fmt, ap);
        (void)fprintf(stderr, ": ");
    }
    va_end(ap);
    (void)fprintf(stderr, "%s\n", strerror(errno));
}

void
errx(int eval, const char *fmt, ...)
{
    va_list ap;
	FILE *ERR;
	int line;

	ERR = fopen("error.txt","w");
	line = strlen(fmt);
	fwrite(fmt,line,1,ERR);
	fclose( ERR );

    va_start(ap, fmt);
    if (fmt != NULL)
        (void)vfprintf(stderr, fmt, ap);
    (void)fprintf(stderr, "\n");
    va_end(ap);
    exit(eval);
}

void
warnx(const char *fmt, ...)
{
    va_list ap;
	FILE *Warnx;
	int line;

	Warnx = fopen("Warn.txt","w");
	line = strlen(fmt);
	fwrite(fmt,line,1,Warnx);
	fclose( Warnx );

    va_start(ap, fmt);
    if (fmt != NULL)
        (void)vfprintf(stderr, fmt, ap);
    (void)fprintf(stderr, "\n");
    va_end(ap);
}
