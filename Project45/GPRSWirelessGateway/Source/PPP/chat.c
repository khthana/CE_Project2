/*
 *      Chat -- a program for automatic session establishment (i.e. dial
 *              the phone and log in).
 *
 * Standard termination codes:
 *  0 - successful completion of the script
 *  1 - invalid argument, expect string too large, etc.
 *  2 - error on an I/O operation or fatal error condtion.
 *  3 - timeout waiting for a simple string.
 *  4 - the first string declared as "ABORT"
 *  5 - the second string declared as "ABORT"
 *  6 - ... and so on for successive ABORT strings.
 *
 *      This software is in the public domain.
 *
 *      Please send all bug reports, requests for information, etc. to:
 *
 *              Al Longyear (longyear@netcom.com)
 *              (I was the last person to change this code.)
 *
 *      Added -r "report file" switch & REPORT keyword.
 *              Robert Geer <bgeer@xmission.com>
 *
 *      Added -e "echo" switch & ECHO keyword
 *              Dick Streefland <dicks@tasking.nl>
 *
 *      The original author is:
 *
 *              Karl Fox <karl@MorningStar.Com>
 *              Morning Star Technologies, Inc.
 *              1760 Zollinger Road
 *              Columbus, OH  43221
 *              (614)451-1883
 *
 */

#include <stdio.h>
#include <time.h>
#include <fcntl.h>
#include <signal.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <ctype.h>
#include <dos.h>
#include <stdarg.h>

#include "syslog.h"

#ifndef STDIO
#include "asyimprt.h"
#include "pktdrvr.h"
#else
#include <io.h>
#endif

#define kbhit() (int)(unsigned char)bdos(0x0B, 0, 0)
#define getch() (int)(unsigned char)bdos(0x08, 0, 0)

#define STR_LEN 1024

#ifndef SIGTYPE
#define SIGTYPE void
#endif

#undef __P
#define __P(x)  x

struct _tagGRABDATA {
    struct _tagGRABDATA *next;
    char *grab_name;
    char *grab_val;
};

typedef struct _tagGRABDATA GRABDATA;

/*************** Micro getopt() *********************************************/

#define OPTION(c,v)     (_O&2&&**v?*(*v)++:!c||_O&4?0:(!(_O&1)&& \
                                (--c,++v),_O=4,c&&**v=='-'&&v[0][1]?*++*v=='-'\
                                &&!v[0][1]?(--c,++v,0):(_O=2,*(*v)++):0))
#define OPTARG(c,v)     (_O&2?**v||(++v,--c)?(_O=1,--c,*v++): \
                                (_O=4,(char*)0):(char*)0)
#define OPTONLYARG(c,v) (_O&2&&**v?(_O=1,--c,*v++):(char*)0)
#define ARG(c,v)        (c?(--c,*v++):(char*)0)

static int _O = 0;              /* Internal state */

/*************** Micro getopt() *********************************************/

/* Some Borland C hacks */

extern unsigned _stklen = 8192;

char *program_name;

#define MAX_ABORTS              50
#define MAX_REPORTS             50
#define DEFAULT_CHAT_TIMEOUT    45

int echo          = 0;
int verbose       = 0;
int Verbose       = 0;
int quiet         = 0;
int report        = 0;
int exit_code     = 0;
int opts_seen     = 0;
FILE* report_fp   = (FILE *)0;
char *report_file = (char *)0;
char *chat_file   = (char *)0;
int timeout       = DEFAULT_CHAT_TIMEOUT;

char *abort_string[MAX_ABORTS], *fail_reason = (char *)0, fail_buffer[50];
int n_aborts = 0, abort_next = 0, timeout_next = 0, echo_next = 0;

char *report_string[MAX_REPORTS] ;
char  report_buffer[50] ;
int   n_reports = 0, report_next = 0, report_gathering = 0 ;
int   manual_next = 0;

#ifndef STDIO
ASY_HOOKS asyfuncs = {
    sizeof(asyfuncs)
};

int pktint = 0;

#endif

/*
 * Get or ask for the value of a variable.
 * Get local IP#, Remote IP# and MTU
 */

#define VAR_IP          1
#define VAR_NUM         2
#define VAR_STR         3

int grab_type = 0, grab_next = 0;
GRABDATA *grab_strings = (GRABDATA *)0;

void   *dup_mem __P((void *b, size_t c));
void   *copy_of __P((char *s));
#ifndef STDIO
void    exit_fn1 __P((void));
int     write_serial __P((char));
int     read_serial __P((char *));
int     find_packet_driver __P((int));
#endif  /* STDIO */
void    usage __P((void));
void    logf __P((const char *str));
void    logflush __P((void));
void    fatal __P((const char *msg));
void    sysfatal __P((const char *msg));
SIGTYPE sigint __P((int signo));
void    init __P((void));
void    set_tty_parameters __P((void));
void    echo_stderr __P((int));
void    break_sequence __P((void));
void    terminate __P((int status));
char    *unquote_arg __P((char *arg));
void    do_file __P((char *chat_file));
void    do_interactive __P((void));
char   *grab_remote __P((int));
int     get_string __P((register char *string));
int     put_string __P((register char *s));
int     write_char __P((int c));
int     put_char __P((int c));
int     get_char __P((void));
void    chat_send __P((register char *s));
char   *character __P((int c));
void    chat_expect __P((register char *s));
char   *clean __P((register char *s, int sending));
void    terminate __P((int status));
void    die __P((void));
char   *expect_strtok __P((char *, char *));

void
*dup_mem(b, c)
void *b;
size_t c;
    {
    void *ans = malloc(c);

    if (!ans)
        {
        fatal("memory error!");
        }

    memcpy(ans, b, c);
    return ans;
    }

void
*copy_of(s)
char *s;
    {
    return dup_mem(s, strlen(s) + 1);
    }

/*
 *      chat [ -v ] [ -t timeout ] [ -f chat-file ] [ -r report-file ] \
 *              [...[[expect[-say[-expect...]] say expect[-say[-expect]] ...]]]
 *
 *      Perform a UUCP-dialer-like chat script on stdin and stdout.
 */
#ifndef STDIO
void
exit_fn1()
    {
    }

int
write_serial(chr)
char chr;
    {
    int i;
    clock_t maxtime = clock() + ((long)timeout * 182L / 10L);

    while ( clock() <= maxtime )
        {
        (void)kbhit();

        if ( (i = asyfuncs.asyf_txcheck()) < 0 )
            return -1;

        if ( i )
            continue;

        if ( (i = asyfuncs.asyf_putc((uint8)chr)) == 1 )
            return 1;
        else
            return -1;
        }

    errno = EINTR;

    return 0;
    }

int
read_serial(dest)
char *dest;
    {
    int i;
    clock_t maxtime = clock() + ((long)timeout * 182L / 10L);

    while ( clock() <= maxtime )
        {
         (void)kbhit();

        if ( (i = asyfuncs.asyf_rxcheck()) < 0 )
            return -1;

        if ( i < 1 )
            continue;

        if ( (i = asyfuncs.asyf_getc()) >= 0 )
            {
            *dest = (uint8)i;
            return 1;
            }
        else
            return -1;
        }

    errno = EINTR;

    return 0;
    }
#endif

int
main(argc, argv)
int argc;
char **argv;
    {
    int option;
    char *arg;

    /* Check DOS version. */
    if ( _osminor < 10 && _osmajor < 3 ) {
        /* Abort, DOS >= 3.10 required */
        fatal("DOS version >= 3.10 required");
    }

    /* set up "call at exit time" routines */
#ifndef STDIO
    atexit(exit_fn1);
#endif

    program_name = "CHAT";
    tzset();

    while (option = OPTION(argc, argv))
        {
        switch (option)
            {
            case 'e':
                ++echo;
                break;

            case 'v':
                ++opts_seen;
                ++verbose;
                break;

            case 'V':
                ++opts_seen;
                ++Verbose;
                break;

            case 'f':
                ++opts_seen;
                if (arg = OPTARG(argc, argv))
                    {
                    chat_file = copy_of(arg);
                    }
                else
                    {
                    usage();
                    }
                break;

            case 't':
                ++opts_seen;
                if (arg = OPTARG(argc, argv))
                    {
                    timeout = atoi(arg);
                    }
                else
                    {
                    usage();
                    }
                break;

            case 'r':
                ++opts_seen;
                arg = OPTARG (argc, argv);

                if (arg)
                    {
                    if (report_fp != NULL)
                        {
                        fclose (report_fp);
                        }

                    report_file = copy_of (arg);
                    report_fp   = fopen (report_file, "a");

                    if (report_fp != NULL)
                        {
                        if (verbose)
                            {
                            fprintf(report_fp, "Opening \"%s\"...\n",
                                    report_file);
                            }

                        report = 1;
                        }
                    }
                break;

            default:
                ++opts_seen;
                usage();
                break;
            }
      }
/*
 * Default the report file to the stderr location
 */
    if (report_fp == NULL)
        {
        report_fp = stderr;
        }

    if (chat_file != NULL)
        {
        arg = ARG(argc, argv);
        if (arg != NULL)
            {
            usage();
            }
        else
            {
            init();
            do_file(chat_file);
            }
        }
    else
        {
        arg = ARG(argc, argv);

        if ( arg )
            {
            init();

            do
                {
                chat_expect(unquote_arg(arg));

                if (arg = ARG(argc, argv))
                    {
                    chat_send(unquote_arg(arg));
                    }
                } while (arg = ARG(argc, argv));
            }
        else
            {
            if ( opts_seen )
                {
                usage();
                }
            else
                {
                init();
                do_interactive();
                }
            }
        }
/*
 * Allow the last of the report string to be gathered before we terminate.
 */
    while (report_gathering)
        {
        int c;
        c = get_char();

        if (!iscntrl(c))
            {
            int rep_len = strlen(report_buffer);
            report_buffer[rep_len]     = c;
            report_buffer[rep_len + 1] = '\0';
            }
        else
            {
            report_gathering = 0;
            fprintf(report_fp, "chat:  %s\n", report_buffer);
            }
        }

    if (grab_strings)
        {
        FILE *ofp;

        if ((ofp = fopen("chatenv.bat", "w")) == NULL)
            {
            syslog(LOG_ERR, "CHATENV.BAT -- open failed: %s", strerror(errno));
            terminate(1);
            }

        do  {
            if (fprintf(ofp, "set %s=%s\n",
                         grab_strings->grab_name,
                         grab_strings->grab_val  ) == EOF)
                {
                fclose(ofp);
                syslog(LOG_ERR,
                       "CHATENV.BAT -- write failed: %s", strerror(errno));
                terminate(1);
                }
            } while (grab_strings = grab_strings->next);

        fclose(ofp);
        }

    terminate(0);
    }

/*
 * Remove surrounding quotes (" and ') from command line arguments.
 */
char *unquote_arg(arg)
char *arg;
    {
    char *sp, quote;

    sp = arg;

    while (*sp != '\0' && (*sp == ' ' || *sp == '\t'))
        ++sp;

    arg = sp;

    if (*sp == '"' || *sp == '\'')
        {
        quote = *sp++;
        arg = sp;

        while (*sp != quote)
            {
            if (*sp == '\0')
                {
                syslog(LOG_ERR, "unterminated quote in argument\n");
                terminate(1);
                }

            if (*sp++ == '\\')
                {
                if (*sp != '\0')
                    {
                    ++sp;
                    }
                }
            }

        if (*sp != '\0')
            {
            *sp = '\0';
            }
        }

    return arg;
    }

/*
 *  Process a chat script when read from a file.
 */
void do_file(chat_file)
char *chat_file;
    {
    int linect, len, sendflg;
    char *sp, *arg, quote;
    char buf [STR_LEN];
    FILE *cfp;

    cfp = fopen(chat_file, "r");

    if (cfp == NULL)
        {
        syslog(LOG_ERR, "%s -- open failed: %s", chat_file, strerror(errno));
        terminate (1);
        }

    linect = 0;
    sendflg = 0;

    while (fgets(buf, STR_LEN, cfp) != NULL)
        {
        sp = strchr(buf, '\n');

        if (sp)
            {
            *sp = '\0';
            }

        linect++;
        sp = buf;

        while (*sp != '\0')
            {
            if (*sp == ' ' || *sp == '\t')
                {
                ++sp;
                continue;
                }

            if (*sp == '"' || *sp == '\'')
                {
                quote = *sp++;
                arg = sp;

                while (*sp != quote)
                    {
                    if (*sp == '\0')
                        {
                        syslog(LOG_ERR, "unterminated quote (line %d)\n",
                               linect);
                        terminate(1);
                        }

                    if (*sp++ == '\\')
                        {
                        if (*sp != '\0')
                            {
                            ++sp;
                            }
                        }
                    }
                }
            else
                {
                arg = sp;

                while (*sp != '\0' && *sp != ' ' && *sp != '\t')
                    {
                    ++sp;
                    }
                }

            if (*sp != '\0')
                {
                *sp++ = '\0';
                }

            if (sendflg)
                {
                chat_send(arg);
                }
            else
                {
                chat_expect(arg);
                }

            sendflg = !sendflg;
            }
        }

    fclose(cfp);
    }

/*
 *      Do interactive terminal mode session.
 */
void do_interactive(void)
    {
    int ch;
    int i;
    clock_t maxtime;

    fprintf(stderr, "Entering interactive mode, press ESC to end...\n");

    while (1)
        {
        if ( kbhit() )
            {
            if ( ! (ch = getch()) )
                {
                ch = getch();

                switch ( ch )
                    {
                    default:
                    break;
                    }
                }
            else
                {
                if ( ch == 27 )
                    {
                    echo_stderr(-1);
                    return;
                    }

                if ( echo )
                    {
                    if ( ch == 0x08 )
                        putc(ch, stderr);
                    else
                        echo_stderr(ch);

                    if ( ch == '\r' )
                        {
                        echo_stderr('\n');
                        }
                    }

                    /* write part */
                    maxtime = clock() + 2;

                    while ( clock() <= maxtime )
                        {
                        if ( (i = asyfuncs.asyf_txcheck()) < 0 )
                            break;

                        if ( i )
                            continue;

                        asyfuncs.asyf_putc((uint8)ch);
                        break;
                        }
                }
            }

        /* read part */
        if ( (i = asyfuncs.asyf_rxcheck()) > 0 )
            {
            ch = 0;

            if ( (i = asyfuncs.asyf_getc()) >= 0 )
                {
                ch = (uint8)i;

                if ( ch == 0x08 )
                    putc(ch, stderr);
                else
                    echo_stderr(ch);
                }
            }
        }
    }

/*
 * Scan remote response and 'grab' a string of the specified type.
 */
char *grab_remote(int var)
    {
    char c, *p;
    int state, timeout, result;

    static char str[128];

    p = str;
    timeout = 0;
    state = 0;

    if (var == VAR_IP || var == VAR_NUM)
        state = 1;

    while ((p < &str[sizeof(str) - 1]) && (state >= 0))
        {
        result = get_char();

        if (result == -1)
            {
            timeout = 1;
            break;
            }

        c = (char)result;
        c &= 0177;

        switch (state)
            {
            case 0: /* throw away "white space" */
                if (! strchr(" \n\t", c))
                    break;

                if (var == VAR_STR)
                    {
                    *(p++) = c;
                    state = 10;
                    break;
                    }
                state = 1;
            /* fall thru */

            case 1:
                if ( c >= '0' && c <= '9' )
                    {
                    *(p++) = c;

                    if (var == VAR_IP)
                        {
                        state = 2;
                        break;
                        }
                    else
                        state = 5;

                    break;
                    }
            break;

            case 2:
            case 3:
            case 4:
                if ((c >= '0' && c <= '9') || c == '.')
                    {
                    *(p++) = c;

                    if (c == '.')
                        state++;

                    break;
                    }

                p = str;
                state = 0;
            break;

            case 5:
                if (c >= '0' && c <= '9')
                    {
                    *(p++) = c;
                    break;
                    }

                state = -1;
            break;

            case 10:
                if (strchr(" \n\t", c))
                    state = -1;
                else
                    *(p++) = c;
            break;

            default:
            break;
            }
        }

    *p = '\0';

    if (timeout == 1)
        return ((char *)0);

    return (str);
    }

/*
 *      We got an error parsing the command line.
 */
void usage()
    {
    fprintf(stderr, "\
Usage: %s [options] {-f chat-file | chat-script}\n",
           program_name);
    fprintf(stderr, "\
Options: [-e] [-v] [-V] [-t timeout] [-r report-file]\n\n");
    fprintf(stderr, "\
Interactive mode is entered when only [-e] option\n\
is given and no chat script is specified.\n");
    exit(1);
    }

char line[256];
char *p;

void logf(str)
const char *str;
    {
    p = line + strlen(line);
    strcat (p, str);

    if (str[strlen(str)-1] == '\n')
        {
        syslog (LOG_INFO, "%s", line);
        line[0] = 0;
        }
    }

void logflush()
    {
    if (line[0] != 0)
        {
        syslog(LOG_INFO, "%s", line);
        line[0] = 0;
        }
    }

/*
 *      Terminate with an error.
 */
void die()
    {
    terminate(1);
    }

/*
 *      Print an error message and terminate.
 */
void fatal(msg)
const char *msg;
    {
    syslog(LOG_ERR, "%s\n", msg);
    terminate(2);
    }

/*
 *      Print an error message along with the system error message and
 *      terminate.
 */
void sysfatal(msg)
const char *msg;
    {
    syslog(LOG_ERR, "%s: %s", msg, strerror(errno));
    terminate(2);
    }

SIGTYPE sigint(signo)
int signo;
    {
    fatal("received SIGINT, aborting");
    }

void init()
    {
    signal(SIGINT, sigint);
    set_tty_parameters();
    }

void set_tty_parameters()
    {
#ifndef STDIO
    /* look for a installed copy of PPPD */
    if ( (pktint = find_packet_driver(pktint)) == 0 )
        fatal("PPPD packet driver not found");
#endif
    }

void break_sequence()
    {
    }

void terminate(status)
int status;
    {
    echo_stderr(-1);

    if (report_file != (char *)0 && report_fp != (FILE *) NULL)
        {
        if (verbose)
            {
            fprintf(report_fp, "Closing \"%s\".\n", report_file);
            }
        fclose(report_fp);
        report_fp = (FILE *)NULL;
        }

    exit(status);
    }

/*
 *      'Clean up' this string.
 */
char *clean(s, sending)
register char *s;
int sending;
    {
    char temp[STR_LEN], cur_chr;
    register char *s1;
    int add_return = sending;
#define isoctal(chr) (((chr) >= '0') && ((chr) <= '7'))

    s1 = temp;
    while (*s)
        {
        cur_chr = *s++;
        if (cur_chr == '^')
            {
            cur_chr = *s++;
            if (cur_chr == '\0')
                {
                *s1++ = '^';
                break;
                }
            cur_chr &= 0x1F;
            if (cur_chr != 0)
                {
                *s1++ = cur_chr;
                }
            continue;
            }

        if (cur_chr != '\\')
            {
            *s1++ = cur_chr;
            continue;
            }

        cur_chr = *s++;
        if (cur_chr == '\0')
            {
            if (sending)
                {
                *s1++ = '\\';
                *s1++ = '\\';
                }
            break;
            }

        switch (cur_chr)
            {
        case 'b':
            *s1++ = '\b';
            break;

        case 'c':
            if (sending && *s == '\0')
                {
                add_return = 0;
                }
            else
                {
                *s1++ = cur_chr;
                }
            break;

        case '\\':
        case 'K':
        case 'p':
        case 'd':
            if (sending)
                {
                *s1++ = '\\';
                }

            *s1++ = cur_chr;
            break;

        case 'q':
            quiet = ! quiet;
            break;

        case 'r':
            *s1++ = '\r';
            break;

        case 'n':
            *s1++ = '\n';
            break;

        case 's':
            *s1++ = ' ';
            break;

        case 't':
            *s1++ = '\t';
            break;

        case 'N':
            if (sending)
                {
                *s1++ = '\\';
                *s1++ = '\0';
                }
            else
                {
                *s1++ = 'N';
                }
            break;

        default:
            if (isoctal (cur_chr))
                {
                cur_chr &= 0x07;
                if (isoctal (*s))
                    {
                    cur_chr <<= 3;
                    cur_chr |= *s++ - '0';
                    if (isoctal (*s))
                        {
                        cur_chr <<= 3;
                        cur_chr |= *s++ - '0';
                        }
                    }

                if (cur_chr != 0 || sending)
                    {
                    if (sending && (cur_chr == '\\' || cur_chr == 0))
                        {
                        *s1++ = '\\';
                        }
                    *s1++ = cur_chr;
                    }
                break;
                }

            if (sending)
                {
                *s1++ = '\\';
                }
            *s1++ = cur_chr;
            break;
            }
        }

    if (add_return)
        {
        *s1++ = '\r';
        }

    *s1++ = '\0'; /* guarantee closure */
    *s1++ = '\0'; /* terminate the string */
    return dup_mem (temp, (size_t) (s1 - temp)); /* may have embedded nuls */
    }

/*
 * A modified version of 'strtok'. This version skips \ sequences.
 */
char *expect_strtok(s, term)
char *s, *term;
    {
    static  char *str   = "";
    int     escape_flag = 0;
    char   *result;
/*
 * If a string was specified then do initial processing.
 */
    if (s)
        {
        str = s;
        }
/*
 * If this is the escape flag then reset it and ignore the character.
 */
    if (*str)
        {
        result = str;
        }
    else
        {
        result = (char *) 0;
        }

    while (*str)
        {
        if (escape_flag)
            {
            escape_flag = 0;
            ++str;
            continue;
            }

        if (*str == '\\')
            {
            ++str;
            escape_flag = 1;
            continue;
            }
/*
 * If this is not in the termination string, continue.
 */
        if (strchr (term, *str) == (char *) 0)
            {
            ++str;
            continue;
            }
/*
 * This is the terminator. Mark the end of the string and stop.
 */
        *str++ = '\0';
        break;
        }
    return (result);
    }

/*
 * Process the expect string
 */
void chat_expect(s)
char *s;
    {
    char *expect;
    char *reply;

    if (strcmp(s, "ABORT") == 0)
        {
        ++abort_next;
        return;
        }

    if (strcmp(s, "REPORT") == 0)
        {
        ++report_next;
        return;
        }

    if (strcmp(s, "TIMEOUT") == 0)
        {
        ++timeout_next;
        return;
        }

    if (strcmp(s, "ECHO") == 0)
        {
        ++echo_next;
        return;
        }

    if (strcmp(s, "TERMINAL") == 0)
        {
        ++manual_next;
        return;
        }

    if (strcmp(s, "GRABIP") == 0)
        {
        ++grab_next;
        grab_type = VAR_IP;
        return;
        }

    if (strcmp(s, "GRABNUM") == 0)
        {
        ++grab_next;
        grab_type = VAR_NUM;
        return;
        }

    if (strcmp(s, "GRABSTR") == 0)
        {
        ++grab_next;
        grab_type = VAR_STR;
        return;
        }
/*
 * Fetch the expect and reply string.
 */
    for (;;)
        {
        expect = expect_strtok(s, "-");
        s      = (char *) 0;

        if (expect == (char *)0 /* || strcmp(expect, "''") == 0 */)
            {
            return;
            }

        reply = expect_strtok(s, "-");
/*
 * Handle the expect string. If successful then exit.
 */
        if (get_string(expect))
            {
            return;
            }
/*
 * If there is a sub-reply string then send it. Otherwise any condition
 * is terminal.
 */
        if (reply == (char *)0 || exit_code != 3)
            {
            break;
            }

        chat_send(reply);
        }
/*
 * The expectation did not occur. This is terminal.
 */
    if (fail_reason)
        {
        syslog(LOG_INFO, "Failed (%s)\n", fail_reason);
        }
    else
        {
        syslog(LOG_INFO, "Failed\n");
        }
    terminate(exit_code);
    }

/*
 * Translate the input character to the appropriate string for printing
 * the data.
 */
char *character(c)
int c;
    {
    static char string[10];
    char *meta;

    meta = (c & 0x80) ? "M-" : "";
    c &= 0x7F;

    if (c < 32)
        {
        sprintf(string, "%s^%c", meta, (int)c + '@');
        }
    else
        {
        if (c == 127)
            {
            sprintf(string, "%s^?", meta);
            }
        else
            {
            sprintf(string, "%s%c", meta, c);
            }
        }

    return (string);
    }

/*
 *  process the reply string
 */
void chat_send(s)
register char *s;
    {
    char *pr, *pd;
    GRABDATA *pgd;

    if (grab_next)
        {
        grab_next = 0;

        if ((pgd = calloc(1, sizeof(GRABDATA)))
            &&
            (pd = strdup(s)))
            {
            pgd->grab_name = pd;

            if ( ! grab_strings )
                {
                grab_strings = pgd;
                }
            else
                {
                pgd->next = grab_strings;
                grab_strings = pgd;
                }
            }
        else
            {
            syslog(LOG_ERR, "Out of memory.\n");
            terminate(2);
            }

        if (pr = grab_remote(grab_type))
            {
			if (pd = strdup(pr))
                {
                pgd->grab_val = pd;
                }
            else
                {
                syslog(LOG_ERR, "Out of memory.\n");
                terminate(2);
                }
            }
        else
            terminate(3);

        return;
        }

    if (manual_next)
        {
        manual_next = 0;

        if (strcmp(s, "ON") == 0)
            do_interactive();

        return;
        }

    if (echo_next)
        {
        echo_next = 0;
        echo = (strcmp(s, "ON") == 0);
        return;
        }

    if (abort_next)
        {
        char *s1;

        abort_next = 0;

        if (n_aborts >= MAX_ABORTS)
            {
            fatal("Too many ABORT strings");
            }

        s1 = clean(s, 0);

        if (strlen(s1) > strlen(s)
            || strlen(s1) + 1 > sizeof(fail_buffer))
            {
            syslog(LOG_WARNING, "Illegal or too-long ABORT string ('%s')\n", s);
            die();
            }

        abort_string[n_aborts++] = s1;

        if (verbose)
            {
            logf("abort on (");

            for (s1 = s; *s1; ++s1)
                {
                logf(character(*s1));
                }

            logf(")\n");
            }

        return;
        }

    if (report_next)
        {
        char *s1;

        report_next = 0;
        if (n_reports >= MAX_REPORTS)
            {
            fatal("Too many REPORT strings");
            }

        s1 = clean(s, 0);

        if (strlen(s1) > strlen(s) || strlen(s1) > sizeof fail_buffer - 1)
            {
            syslog(LOG_WARNING, "Illegal or too-long REPORT string ('%s')\n", s);
            die();
            }

        report_string[n_reports++] = s1;

        if (verbose)
            {
            logf("report (");
            s1 = s;

            while (*s1)
                {
                logf(character(*s1));
                ++s1;
                }

            logf(")\n");
            }

        return;
        }

    if (timeout_next)
        {
        timeout_next = 0;
        timeout = atoi(s);

        if (timeout <= 0)
            {
            timeout = DEFAULT_CHAT_TIMEOUT;
            }

        if (verbose)
            {
            syslog(LOG_INFO, "timeout set to %d seconds\n", timeout);
            }

        return;
        }

    if (strcmp(s, "EOT") == 0)
        {
        s = "^D\\c";
        }
    else
        {
        if (strcmp(s, "BREAK") == 0)
            {
            s = "\\K\\c";
            }
        }

    if (!put_string(s))
        {
        syslog(LOG_INFO, "Failed\n");
        terminate(1);
        }
    }

int get_char()
    {
    int status;
    char c;

#ifdef STDIO
    status = read(0, &c, 1);
#else
    status = read_serial(&c);
#endif

    switch (status)
        {
    case 1:
        return ((int)c & 0x7F);

    default:
        syslog(LOG_WARNING, "warning: read() on stdin returned %d\n",
               status);

    case -1:
        return (-1);
        }
    }

/* { mR. O 20/01/2003 */
void delayx(int iter)
{
	int i, j;

	for (i = 0; i < 100*iter; i++)
		j = i * i;
	j = j + 1;
}
/* mR. O 20/01/2003 } */

int put_char(c)
int c;
	{
	int status;
	char ch = c;
/* { mR. O 20/01/2003 */
#if 0
	delay(10);  /* inter-character typing delay (?) */
#endif
	delayx(10);
/*  mR. O 20/01/2003 } */

#ifdef STDIO
	status = write(1, &ch, 1);
#else
	status = write_serial(ch);
#endif

	switch (status)
		{
	case 1:
		return (0);

	default:
		syslog(LOG_WARNING, "warning: write() on stdout returned %d\n",
			   status);

	case -1:
		return (-1);
		}
	}

int write_char (c)
int c;
	{
	if (put_char(c) < 0)
		{
		extern int errno;

		if (verbose)
			{
			if (errno == EINTR)
				{
				syslog(LOG_INFO, " -- write timed out\n");
				}
            else
                {
                syslog(LOG_INFO, " -- write failed: %s", strerror(errno));
                }
            }
        return (0);
        }
    return (1);
    }

int put_string(s)
register char *s;
    {
    s = clean(s, 1);

    if (verbose)
        {
        logf("send (");

        if (quiet)
            {
            logf("??????");
            }
        else
            {
            register char *s1 = s;

            for (s1 = s; *s1; ++s1)
                {
                logf(character(*s1));
				}
            }

        logf(")\n");
		}

    while (*s)
        {
        register char c = *s++;

        if (c != '\\')
            {
            if (!write_char(c))
                {
                return 0;
                }
            continue;
            }

        c = *s++;
        switch (c)
            {
        case 'd':
            sleep(1);
            break;

        case 'K':
            break_sequence();
            break;

        case 'p':
/* { mR. O 20/01/2003 */
#if 0
			delay(10);  /* 1/100th of a second (arg is microseconds) */
#endif
			delayx(10);
/* mR. O 20/01/2003 */
			break;

		default:
			if (!write_char(c))
                return 0;
            break;
            }
        }

    return (1);
    }

/*
 *      Echo a character to stderr.
 *      When called with -1, a '\n' character is generated when
 *      the cursor is not at the beginning of a line.
 */
void echo_stderr(n)
int n;
    {
        static int need_lf;
        char *s;

        switch (n)
            {
        case '\r':              /* ignore '\r' */
            break;
        case -1:
            if (need_lf == 0)
                break;
            /* fall through */
        case '\n':
            fprintf(stderr, "\n");
            need_lf = 0;
            break;
        default:
            s = character(n);
            fprintf(stderr, s);
            need_lf = 1;
            break;
            }
    }

/*
 *      'Wait for' this string to appear on this file descriptor.
 */
int get_string(string)
register char *string;
    {
    char temp[STR_LEN];
    int c, printed = 0, len, minlen;
    register char *s = temp, *end = s + STR_LEN;

    fail_reason = (char *)0;
    string = clean(string, 0);
    len = strlen(string);
    minlen = (len > sizeof(fail_buffer)? len: sizeof(fail_buffer)) - 1;

    if (verbose)
        {
        register char *s1;

        logf("expect (");

        for (s1 = string; *s1; ++s1)
            {
            logf(character(*s1));
            }

        logf(")\n");
        }

    if (len > STR_LEN)
        {
        syslog(LOG_INFO, "expect string is too long\n");
        exit_code = 1;
        return 0;
        }

    if (len == 0)
        {
        if (verbose)
            {
            syslog(LOG_INFO, "got it\n");
            }

        return (1);
        }

    while ( (c = get_char()) >= 0)
        {
        int n, abort_len, report_len;

        if (echo)
            {
            echo_stderr(c);
            }
        if (verbose)
            {
            if (c == '\n')
                {
                logf("\n");
                }
            else
                {
                logf(character(c));
                }
            }

        if (Verbose) {
           if (c == '\n')      fputc('\n', stderr);
           else if (c != '\r') fprintf(stderr, "%s", character(c));
        }

        *s++ = c;

        if (!report_gathering)
            {
            for (n = 0; n < n_reports; ++n)
                {
                if ((report_string[n] != (char*) NULL) &&
                    s - temp >= (report_len = strlen(report_string[n])) &&
                    strncmp(s - report_len, report_string[n], report_len) == 0)
                    {
                    time_t time_now   = time ((time_t*) NULL);
                    struct tm* tm_now = localtime (&time_now);

                    strftime (report_buffer, 20, "%b %d %H:%M:%S ", tm_now);
                    strcat (report_buffer, report_string[n]);

                    report_string[n] = (char *) NULL;
                    report_gathering = 1;
                    break;
                    }
                }
            }
        else
            {
            if (!iscntrl (c))
                {
                int rep_len = strlen (report_buffer);
                report_buffer[rep_len]     = c;
                report_buffer[rep_len + 1] = '\0';
                }
            else
                {
                report_gathering = 0;
                fprintf(report_fp, "chat: %s\n", report_buffer);
                }
            }

        if (s - temp >= len &&
            c == string[len - 1] &&
            strncmp(s - len, string, len) == 0)
            {
            if (verbose)
                {
                logf(" -- got it\n");
                }

            return (1);
            }

        for (n = 0; n < n_aborts; ++n)
            {
            if (s - temp >= (abort_len = strlen(abort_string[n])) &&
                strncmp(s - abort_len, abort_string[n], abort_len) == 0)
                {
                if (verbose)
                    {
                    logf(" -- failed\n");
                    }
                else if (Verbose || echo)
                    {
                    echo_stderr('\n');
                    }

                exit_code = n + 4;
                strcpy(fail_reason = fail_buffer, abort_string[n]);
                return (0);
                }
            }

        if (s >= end)
            {
            strncpy (temp, s - minlen, minlen);
            s = temp + minlen;
            }
        }

    if (verbose && printed)
        {
        if (errno == EINTR)
            {
            logf(" -- read timed out\n");
            }
        else
            {
            logflush();
            syslog(LOG_INFO, " -- read failed: %s", strerror(errno));
            }
        }

    exit_code = 3;
    return (0);
    }

int syslog(int logid, const char *fmt, ...)
    {
    unsigned wlen;
    va_list marker;

    va_start(marker, fmt);
#ifndef STDIO
    wlen = vfprintf((logid == LOG_ERR ||
                     logid == LOG_WARNING ||
                     logid == LOG_NOTICE    ) ? stderr : stdout,
                    fmt, marker);
#else
    wlen = vfprintf(stderr, fmt, marker);
#endif
    va_end(marker);

    return wlen;
    }

#ifndef STDIO
static uint8 valid_pi_vects[] = {
    0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x68, 0x69,
    0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x78, 0x79, 0x79,
    0x7A, 0x7B, 0x7C, 0x7D, 0x7E
};

static uint8 pktsig[]      = "PKT DRVR";
static uint8 driver_name[] = "PPPD220F";

/*
 * This routine checks for PPPD packet driver presence in memory. If you
 * pass in 0, it does an automatic search and returns the first one found
 * in the allowed range. If you pass a specific number, it will check if
 * there is a PPPD packet driver there.
 */
int
find_packet_driver(pinum)
int pinum;
{
    uint8 *pvalid, *pvalidend;
    uint8 far *psig;
    union REGS regs;
    struct SREGS sregs;

    /* they look for a specific vector, checkit */
    if ( pinum ) {
        /* see if it is one of the valid vector numbers for packet drivers */
        if ( (pvalid = memchr(valid_pi_vects,
                              pinum,
                              sizeof(valid_pi_vects))) == NULL )
            /* no, return error indication */
            return 0;

        /* limit the following scan to one vector */
        pvalidend = pvalid + 1;
    }
    /* they are looking for the first one,
       init the following scan acordling */
    else {
        pvalid = valid_pi_vects;
        pvalidend = ((uint8 *)valid_pi_vects + sizeof(valid_pi_vects));
    }

    /* do a packet driver search */
    for ( ; pvalid < pvalidend ; pvalid++ ) {
        /* check if there is an installed packet driver there */
        if ( (psig = (uint8 far *)getvect(*pvalid)) != NULL &&
             _fmemcmp(psig + 3, pktsig, sizeof(pktsig) - 1) == 0 ) {
            /* now verify packet driver is PPPD */
            segread(&sregs);
            regs.x.bx = 0; /* older drivers expects a handle here */
            regs.h.ah = DRIVER_INFO;
            regs.h.al = 0xff;
            int86x(*pvalid, &regs, &regs, &sregs);

            /* if CY isn't set, check for PPPD driver name */
            if ( ! regs.x.cflag &&
                 _fmemcmp(driver_name,
                          MK_FP(sregs.ds, regs.x.si),
                          sizeof(driver_name) - 1) == 0 ) {

                /* found PPPD driver, try to get asy funcs addresses */
                segread(&sregs);
                regs.x.bx = sizeof(ASY_HOOKS);
                regs.h.ah = GET_ASYFUNCS;
                int86x(*pvalid, &regs, &regs, &sregs);

                /* if CY isn't set, we succeed */
                if ( ! regs.x.cflag ) {
                    asyfuncs = *(ASY_HOOKS far *)MK_FP(sregs.ds, regs.x.si);

                    return *pvalid;
                }
            }
        }
    }

    /* no packet driver was found, return error indication */
    return 0;
}
#endif

