#include <stdio.h>

unsigned char convert_high(unsigned char x);
unsigned char convert_low(unsigned char y);
void assign_value(unsigned char* hex,unsigned char* hex_r);
void convert_sequence(int length,unsigned char hex_total[]);
unsigned int random_sequence(int MAX_RAN, int MIN_RAN);
int check_char_userid(int a_value);
int check_userid(unsigned char userid[]);
int check_char_name(int a_value);
int check_name(char name[]);
int check_char_nick(int a_value);
int check_sex(unsigned char sex[]);
int spc_email_isvalid(const char *address);


