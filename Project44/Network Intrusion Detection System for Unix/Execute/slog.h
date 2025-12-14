#ifndef SLOG_HEADER
#define SLOG_HEADER
#include <syslog.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

class slog {
		private:
			char buff[256];
		public:
			slog(){  };
			~slog(){};
			int slog_init(void);
			void slog_close(void);
			void slog_dump (char *std);
	};


#endif SLOG_HEADER
	