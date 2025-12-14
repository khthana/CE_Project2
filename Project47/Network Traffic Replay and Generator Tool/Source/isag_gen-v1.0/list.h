
#ifndef _LIST_H_
#define _LIST_H_

struct list_type {
    u_int64_t max;
    u_int64_t min;
    struct list_type *next;
};

typedef struct list_type LIST;

int parse_list(LIST **, char *);
int check_list(LIST *, u_int64_t);
void free_list(LIST *);

#endif
