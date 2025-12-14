#include "support_serv.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <fcntl.h>

unsigned int random_sequence(int MAX_RAN, int MIN_RAN)
{
  /* Store a file descriptor opened to /dev/random in a static
  variable. That way, we don’t need to open the file every time
  this function is called. */
  static int dev_random_fd = -1;
  char* next_random_byte;
  int bytes_to_read;
  unsigned random_value;
 
  //char user_id[5];

  /* Make sure MAX is greater than MIN. */
  assert (MAX_RAN > MIN_RAN);

  /* If this is the first time this function is called, open a file
  descriptor to /dev/random. */
  if (dev_random_fd == -1)
  {
    dev_random_fd = open("/dev/random", O_RDONLY);
    assert (dev_random_fd != -1);
  }

  /* Read enough random bytes to fill an integer variable. */
  next_random_byte = (char*) &random_value;
  bytes_to_read = sizeof (random_value);

  /* Loop until we’ve read enough bytes. Because /dev/random is filled
  from user-generated actions, the read may block and may only
  return a single random byte at a time. */
  do
  {
    int bytes_read;
    bytes_read = read (dev_random_fd, next_random_byte, bytes_to_read);
    bytes_to_read -= bytes_read;
    next_random_byte += bytes_read;
  } while (bytes_to_read > 0);

  /* Compute a random number in the correct range. */
 return MIN_RAN + (random_value % (MAX_RAN - MIN_RAN + 1));

}


unsigned char convert_high(unsigned char x)
{
	unsigned char tmp;
	switch(x)
	{
		case '0' :tmp = 0x00;
		                break;
		case '1' :tmp = 0x10;
		                break;
		case '2' :tmp = 0x20;
		                break;
		case '3' :tmp = 0x30;
		                break;	
		case '4' :tmp = 0x40;
		                break;
		case '5' :tmp = 0x50;
		                break;
		case '6' :tmp = 0x60;
		                break;
		case '7' :tmp = 0x70;
		                break;
		case '8' :tmp = 0x80;
		                break;
		case '9' :tmp = 0x90;
		                break;
		case 'a' :tmp = 0xa0;
		                break;
		case 'b' :tmp = 0xb0;
		                break;	
		case 'c' :tmp = 0xc0;
		                break;
		case 'd' :tmp = 0xd0;
		                break;
		case 'e' :tmp = 0xe0;
		                break;
		case 'f' :tmp = 0xf0;
		                break;
		default: tmp= 0x45;
	}
	return tmp;
}

unsigned char convert_low(unsigned char y)
{
	unsigned char tmp1;
	switch(y)
	{
		case '0' :tmp1 = 0x00;
		                break;
		case '1' :tmp1 = 0x01;
		                break;
		case '2' :tmp1 = 0x02;
		                break;
		case '3' :tmp1 = 0x03;
		                break;	
		case '4' :tmp1 = 0x04;
		                break;
		case '5' :tmp1 = 0x05;
		                break;
		case '6' :tmp1 = 0x06;
		                break;
		case '7' :tmp1 = 0x07;
		                break;
		case '8' :tmp1 = 0x08;
		                break;
		case '9' :tmp1 = 0x09;
		                break;
		case 'a' :tmp1 = 0x0a;
		                break;
		case 'b' :tmp1 = 0x0b;
		                break;	
		case 'c' :tmp1 = 0x0c;
		                break;
		case 'd' :tmp1 = 0x0d;
		                break;
		case 'e' :tmp1 = 0x0e;
		                break;
		case 'f' :tmp1 = 0x0f;
		                break;
		default: tmp1= 0x45;
	}
	return tmp1;
}

void assign_value(unsigned char* hex,unsigned char* hex_r)
{
	int dec;
	
		dec = strlen(hex);

		if(dec==1){
			hex_r[0]='0';
			hex_r[1]='0';
			hex_r[2]='0';
			hex_r[3]=hex[0];
		}
		else if(dec==2){
			hex_r[0]='0';
			hex_r[1]='0';
			hex_r[2]=hex[0];
			hex_r[3]=hex[1];
		}
		else if(dec==3){
			hex_r[0]='0';
			hex_r[1]=hex[0];
			hex_r[2]=hex[1];
			hex_r[3]=hex[2];
		}
		else {
			hex_r[0]=hex[0];
			hex_r[1]=hex[1];
			hex_r[2]=hex[2];
			hex_r[3]=hex[3];
		}
}

void convert_sequence(int length,unsigned char hex_total[])
{
	int i;
	unsigned char hex[4];
	unsigned char cl[2],ch[2],hex_r[4];
	unsigned char tmp1,tmp2;

		sprintf(hex,"%x",length);
		//printf("%s\n",hex);

	 	assign_value(hex,hex_r);	
	
		for(i=0;i<2;i++)
	 		ch[i]=hex_r[i];
		for(i=0;i<2;i++)
	 		cl[i] = hex_r[2+i];

		tmp1 = convert_high(ch[0]);
		tmp2 = convert_low (ch[1]);
		hex_total[0] = tmp1+tmp2;

		tmp1 = convert_high(cl[0]);
		tmp2 = convert_low (cl[1]);
		hex_total[1] = tmp1+tmp2;
}

int check_char_userid(int a_value)
{
	int status=0;
	if( (a_value>47 && a_value < 58) )
		status = 1;
	return status;
}
int check_userid(unsigned char userid[])
{
	int i,status=0,num,a_value;
	num = strlen(userid);
	for(i=0;i<num;i++)
	{
		a_value = userid[i];
		status = check_char_userid(a_value);
		if(status == 0)break;
	}
	return status;
}
/*
	Check Name************************************************
*/
int check_char_name(int a_value)
{
	int status=0;
		if( (a_value>64 && a_value < 91) || (a_value >96 && a_value < 123) )
			status = 1;
		return status;
}
int check_name(char name[])
{
	int dec,i,status;
	
		dec = strlen(name);
   
		for(i=0;i<dec;i++){
	    	status = name[i];
			status = check_char_name(status);
			if(status == 0)break;
		}
  	return status;
}
int check_nick(char name[])
{
	int dec,i,status;
	
		dec = strlen(name);
   
		for(i=0;i<dec;i++){
	    	status = name[i];
			status = check_char_nick(status);
			if(status == 0)break;
		}
  	return status;
}
int check_char_nick(int a_value)
{
	int status=0;
	if( a_value>32 && a_value < 127 )
		status = 1;
	return status;
}

/*
	Check Sex************************************************
*/
int check_sex(unsigned char sex[])
{
	int status;
    	switch(sex[0])
	 	{
			case 'F' :status = 1;
		                	break;
			case 'f' :status = 1;
		                	break;
			case 'M' :status = 1;
		                	break;
			case 'm' :status = 1;
		                	break;
			default: status= 0;
	 	}
	return status;					
}

/*
  Check Email
*/
int spc_email_isvalid(const char *address) {
  int        count = 0;
  const char *c, *domain;
  static char *rfc822_specials = "()<>@,;':\\\"[]";

  /* first we validate the name portion (name@domain) */
  for (c = address;  *c;  c++) {
    if (*c == '\"' && (c == address || *(c - 1) == '.' || *(c - 1) == '\"')) {
      while (*++c) {
        if (*c == '\"') break;
        if (*c == '\\' && (*++c == ' ')) continue;
        if (*c <= ' ' || *c >= 127) return 0;
      }
      if (!*c++) return 0;
      if (*c == '@') break;
      if (*c != '.') return 0;
      continue;
    }
    if (*c == '@') break;
    if (*c <= ' ' || *c >= 127) return 0;
    if (strchr(rfc822_specials, *c)) return 0;
  }
  if (c == address || *(c - 1) == '.') return 0;

  /* next we validate the domain portion (name@domain) */
  if (!*(domain = ++c)) return 0;
  do {
    if (*c == '.') {
      if (c == domain || *(c - 1) == '.') return 0;
      count++;
    }
    if (*c <= ' ' || *c >= 127) return 0;
    if (strchr(rfc822_specials, *c)) return 0;
  } while (*++c);

  return (count >= 1);
}
