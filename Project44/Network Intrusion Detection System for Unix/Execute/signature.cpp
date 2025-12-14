#include "signature.h"

int signature::min(int value1, int value2)
{
   return ( (value1 < value2) ? value1 : value2);
}

int signature::max(int value1, int value2)
{
   return ( (value1 > value2) ? value1 : value2);
}


void signature::final( int signal )
{
 
   free_s_tree( tcp_tree );
  free_s_tree( udp_tree );
  free_s_tree( icmp_tree );
  fprintf(stderr,"signature thread exit \n");
  exit( signal );

} /*** final ***/

int signature::get_next_str( char **reader, int max ){

  int i;

  char *next;

  i = 0;
  while ( isspace( **reader ) )
    {
      (*reader)++;
      if ( i++ >= max )
	{
	  fputs("Signature Format Error", stderr );
	  final( 0 );
	}
    }

  i = 0;

  next = *reader;
  while ( !isspace( *next ) )
    {
      next++;
      i++;
      if ( i >= max )
	{
	  fputs( "Signature Format Error", stderr );
	  final( 0 );
	}
    }
  return i;
} /* get_next_str */

s_node *signature::new_s_node( u_long src_number, u_long dest_number )
{

  s_node *new_node = (s_node *) malloc( sizeof(s_node) );
  
  if( new_node == (s_node *)NULL )
    {
      fputs( "Memory allocation error for a service node.",stderr );
      final( 0 );
    }

  new_node->src_number = src_number;

  new_node->dest_number = dest_number;

  new_node->c_tree = (c_node *)NULL;

  new_node->next = (s_node *)NULL;

  return new_node;

} /* new_s_node */

c_node *signature::new_c_node(s_node *service,  u_int sig_id, u_char *pattern, u_int pattern_len, char * name, u_char pattern_mode )
{
  u_char namelen;
  char * re_err;
  c_node *new_node = (c_node *) malloc( sizeof(c_node) );
  if( new_node == (c_node *)NULL )
    {
      fputs("Memory allocation error.", stderr );
      final( 0 );
    }
  new_node->s_node = service;
  new_node->sig_id = sig_id;
  new_node->pattern_mode = pattern_mode;
  new_node->pattern = (u_char *)malloc( sizeof(u_char) * ( pattern_len+1 ));
  if( new_node->pattern == (u_char *)NULL)
      {
	fputs("Memory allocation failure for new_nonode->pattern", stderr);
	final( 0 );
      }
    memcpy( new_node->pattern, pattern, pattern_len );
    memset( new_node->pattern + pattern_len, 0, 1 );
    new_node->pattern_len = pattern_len;
    new_node->delta1 = boyer_moore_delta1( pattern, (u_char)pattern_len );
    new_node->delta2 = boyer_moore_delta2( pattern, (u_char)pattern_len );
    new_node->next = (c_node *)NULL;
    namelen = sizeof(char) * ( strlen(name) );
    new_node->name = (char *)malloc( namelen + sizeof(char) );
    if( new_node->name == (char *)NULL )
    {
      fputs("Memory allocation failure for new_node->name", stderr);
      final( 0 );
    }
  memcpy( new_node->name, name, namelen );
  memset( new_node->name + namelen, 0, 1);
  return new_node;
} /* new_c_node*/

s_node * signature::get_s_node( char *protocol, u_long src_number, u_long dest_number )
{
  s_node **s_tree_top = (s_node **)NULL;
  s_node *s_tree_index = (s_node *)NULL;
  s_node *s_tree_prev = (s_node *)NULL;
  /* tcp_tree, udp_tree, icmp_tree top node for each tree */
  if( !strncmp( protocol, "tcp", 3) )
    s_tree_top = &tcp_tree;
  else if(!strncmp( protocol, "udp", 3) )
    s_tree_top = &udp_tree;
  else if(!strncmp( protocol, "icmp", 4) )
    s_tree_top = &icmp_tree;
  else
    {
      fprintf( stderr, "Unknown protocol name %s", protocol );
      final( 0 );
    }
  if( *s_tree_top == (s_node *)NULL )
    {
    *s_tree_top = new_s_node( src_number, dest_number );
      s_tree_index = *s_tree_top;
    }
  else
    {
      /* start from s_tree_top */
      s_tree_index = *s_tree_top;
      /* search s_tree ordered by destination number */
      while( ( s_tree_index != (s_node *)NULL )   && ( s_tree_index->dest_number < dest_number ))
	{
 	  /* save current position */
 	 s_tree_prev = s_tree_index;
	  /* forward */
	  s_tree_index = s_tree_index->next;
	} /* while */
      if( s_tree_index == (s_node *)NULL )
	{
	  /* create new node */
	  s_tree_prev->next = new_s_node( src_number, dest_number );
	  /* set current node */
	  s_tree_index = s_tree_prev->next;
	}
      else if( s_tree_index->dest_number != dest_number )
	{
	  if( s_tree_index == *s_tree_top )
	    {
	      /* create new node as top */
	      s_tree_prev = new_s_node( src_number, dest_number ); 
	      /* for temporary */
	      s_tree_prev->next = s_tree_index;
	      *s_tree_top = s_tree_prev;
	      s_tree_index = *s_tree_top;
	    }
	  else
	    {
	      /* create new node */
	      s_tree_prev->next = new_s_node( src_number, dest_number );
	      /* link from new node to next */
	      ( s_tree_prev->next )->next = s_tree_index;
	      /* set current node */
	      s_tree_index = s_tree_prev->next; 
	    } /* else s_tree */
	} /* else if s_tree->service_number */
    } /* else */
  while( ( s_tree_index != (s_node *)NULL )
	 && ( s_tree_index->dest_number == dest_number )
	 && ( s_tree_index->src_number < src_number ) )
    {
      /* save current position */
      s_tree_prev = s_tree_index;
      /* forward */
      s_tree_index = s_tree_index->next;
    } /* while */
  if( s_tree_index == (s_node *)NULL ) /* last node */
    {
      /* create new node */
      s_tree_prev->next = new_s_node( src_number, dest_number );
      /* set current node */
      s_tree_index = s_tree_prev->next;
    }
  else if( ( s_tree_index->dest_number != dest_number ) || ( s_tree_index->src_number != src_number ) )
    {
      /* create new node */
      s_tree_prev->next = new_s_node( src_number, dest_number );
      /* link from new node to next */
      ( s_tree_prev->next )->next = s_tree_index;
      /* set current node */
      s_tree_index = s_tree_prev->next; 
    } /* else s_tree */
  return ( s_tree_index );
}/* get_s_node */

int signature::init_signature(char *sig_file)
{
  FILE *fp;

  char line_buff[LARGE_BUF_SIZE]; /* line to read */

  char *sig_reader, *endof_sig, *line_end; /* pointers to read the line */

  int line_len, sig_id, read_len, pattern_len;

  char name_buf[STD_BUF_SIZE]; /* buffer for signature name */
  
  s_node *s_tree_index;

  c_node *c_tree_index;

  char *protocol;

  u_char pattern[LARGE_BUF_SIZE]; /* signature pattern data */

  u_long src_number = 0, dest_number = 0; /* service(port) numbers */

  u_char pattern_mode = CASE_SENSE;

  endof_sig = (char *)NULL;

  /*** open file ***/
  if( (FILE *)NULL == ( fp = fopen( sig_file, "r")) ){
    fprintf(stderr, "Signature file %s could not be opend.\n", sig_file );
    return ( 0 );
  }

  signa_len_max = signa_len_min = 0;

  sig_id = 0;

  /* process each line */
  while ( fgets( line_buff, LARGE_BUF_SIZE, fp ) != (char *)NULL  )
    {
      /* line_len = length of new line */
      line_len = strlen( line_buff );
	    
      if( line_len >= LARGE_BUF_SIZE - 1 )
	{
	  fprintf( stderr, "Signature Format Error: A line is more than %d chars.\n%s" ,LARGE_BUF_SIZE -1, line_buff );
	  return ( 0 );
	}

      line_end = line_buff + line_len;

      sig_reader = line_buff; 

      /*********** comment line or NULL ***********/
      if ( (*sig_reader == '#')||(*sig_reader == '\n') ) continue;
      /*********** Signature Name **********/
      read_len = get_next_str( &sig_reader, line_len );
      if ( read_len >= STD_BUF_SIZE )
	{
	  fprintf( stderr, "Signature Format Error: signature name must be less than %d chars.\n%s\n" ,STD_BUF_SIZE, line_buff );
	  return ( 0 );
	}
      memcpy( name_buf, sig_reader, read_len );
      memset( name_buf + read_len, '\0', 1 );
      sig_reader += read_len;
      /*********** Protocol Name **********/
      read_len = get_next_str( &sig_reader, line_len - ( sig_reader - line_buff));
      if ( read_len >= STD_BUF_SIZE )
	{
	  fprintf( stderr, "Signature Format Error: protocol name must be less than %d chars.\n%s\n" ,STD_BUF_SIZE, line_buff );
	  return ( 0 );
	}
      protocol = sig_reader; /* point to protocol name */
      sig_reader += read_len;
      /*********** Service Number( Port Number ) source **********/
      read_len = get_next_str( &sig_reader, line_len - ( sig_reader - line_buff) );
      if( *sig_reader == '*' )
	{
	  src_number = ULONG_MAX;
	}
      else
	{
	  src_number = strtoul( sig_reader, (char **)NULL, 10 );

	  if( (src_number == ULONG_MAX) && (errno == ERANGE)) 
	    {
	      fprintf(stderr, "Invalid Service Number %s in a Signature Definition\n%s\n", sig_reader,line_buff );
	      return ( 0 );
	    }
	}
      sig_reader += read_len;
      /*********** Service Number( Port Number ) destination **********/
      read_len = get_next_str( &sig_reader, line_len - ( sig_reader - line_buff) );
      if( *sig_reader == '*' )
	{
	  dest_number = ULONG_MAX ; /* ULONG_MAX is wild card */
	}
      else
	{
	  dest_number = strtoul( sig_reader, (char **)NULL, 10 );

	  if( (src_number == ULONG_MAX) && (errno == ERANGE) ) 
	    {
	      fprintf(stderr, "Invalid Service Number %s in a Signature Definition\n%s\n", sig_reader,line_buff );
	      return( 0 );
	    }
	}
      sig_reader += read_len;
      /*********** Payload **********/
      read_len = get_next_str( &sig_reader, line_len - ( sig_reader - line_buff) );
      if( *sig_reader == '\"')
	{
	  /********** case sensitive payload description (start with double quote) **********/
	  endof_sig = index( sig_reader + 1, '\"' );
	  /* skip escape sequences */
	  while( (*(endof_sig - 1) == '\\') && ( endof_sig +1 < line_end -1 )) {    endof_sig = index( endof_sig + 1, '\"');}

	  if( ( endof_sig > line_end - 1 ) || ( endof_sig == (char *)NULL ) )
	    {
	      fputs("Invalid Payload Description. No closing quote\n", stderr );
	      fputs( line_buff, stderr );
	      return ( 0 );
	    }

	  pattern_mode = CASE_SENSE;

	}
      else if( *sig_reader == '\'') 
	{
	  /********** case insensitive payload description (start with single quote) **********/
	  endof_sig = index( sig_reader + 1, '\'' );
	  /* skip escape sequences */
	  while( *(endof_sig - 1) == '\\' ) {   endof_sig = index( endof_sig +1, '\''); }

	  if( ( endof_sig > line_buff + line_len) || ( endof_sig == (char *)NULL ) )
	    {
	      fputs("Invalid Payload Description. No closing quote.", stderr );
	      fputs( line_buff, stderr );
	      return ( 0 );
	    }

	  pattern_mode = CASE_INSENSE;

	}
   else{
	  /********** no payload description **********/
	  fprintf(stderr,"No Payload Definition in line : %s \n",line_buff);
	  return ( 0 );
	}
    pattern_len = make_pattern( pattern, LARGE_BUF_SIZE, sig_reader + 1, endof_sig - 1, pattern_mode );
    s_tree_index = get_s_node( protocol, src_number, dest_number );
    if( s_tree_index->c_tree == ( c_node *)NULL )
	{
	  s_tree_index->c_tree = new_c_node( s_tree_index, sig_id, pattern, pattern_len, name_buf, pattern_mode );
	  ( s_tree_index->c_tree )->next = (c_node *)NULL;
	  c_tree_index = s_tree_index->c_tree;
	}
      else
	{
	  c_tree_index = s_tree_index->c_tree;
	  while( c_tree_index->next != ( c_node *)NULL )
	    c_tree_index = c_tree_index->next;
	    c_tree_index->next = new_c_node( s_tree_index, sig_id, pattern, pattern_len, name_buf, pattern_mode );
	    (c_tree_index->next)->next = ( c_node * )NULL;
  	    c_tree_index = c_tree_index->next;
	}
      
      /* check minimum length */
      if( (signa_len_min == 0) || ( signa_len_min > c_tree_index->pattern_len ) )
      {signa_len_min = c_tree_index->pattern_len;}
	  
      if( (signa_len_max == 0) || ( signa_len_max < c_tree_index->pattern_len ) )
      {	signa_len_max = c_tree_index->pattern_len;}

      sig_id++;
    
    }/* while */

  fclose(fp);


#ifdef DEBUG

  fprintf(stderr,"===== tcp_tree =====");

  dump_s_tree( tcp_tree );

  fprintf(stderr,"===== udp_tree =====");

  dump_s_tree( udp_tree );

  fprintf(stderr,"===== icmp_tree =====");

  dump_s_tree( icmp_tree );

#endif

  return sig_id;

} /* init_signature */

int signature::make_pattern( u_char *pattern, u_int max_pattern_size, char *sig_reader, char *endof_sig, u_char pattern_mode )
{
  u_char *sig_writer;
  char letter;
  int read_length;
  memset( pattern, 0, max_pattern_size ); /* initialize pattern buffer */
  
for( sig_writer = pattern; sig_reader <= endof_sig; sig_reader++ )
    {
      letter = *sig_reader; /* get a letter */
      if ( letter == '\\' ) /* escape sequence */
	{
	  if( sig_reader == endof_sig )
	    {
	      fprintf(stderr,"Invalid Escape Sequence at the last of pattern description.");
	      final( 0 );
	    }
	  letter = *( ++sig_reader );
	  switch( letter )
	    {
	    case 'a':
	      {
		*sig_writer = '\a';
		break;
	      }
	    case 'b':
	      {
		*sig_writer = '\b';
		break;
	      }
	    case 'f':
	      {
		*sig_writer = '\f';
		break;
	      }
	    case 'n':
	      {
		*sig_writer = '\n';
		break;
	      }
	    case 'r':
	      {
		*sig_writer = '\r';
		break;
	      }
	    case 't':
	      {
		*sig_writer = '\t';
		break;
	      }
	    case 'v':
	      {
		*sig_writer = '\v';
		break;
	      }
	    case '\\':
	      {
		*sig_writer = '\\';
		break;
	      }
	    case '\?':
	      {
		*sig_writer = '\?';
		break;
	      }
	    case '\'':
	      {
		*sig_writer = '\'';
		break;
	      }
	    case '\"':
	      {
		*sig_writer = '\"';
		break;
	      }
	      /* for hexadecimal binary expression */
	    case 'x':
	      {
		char bin_buffer[3];

		if( isxdigit( *( ++sig_reader ) ) )
		  {
		    if( isxdigit( *( sig_reader + 1 ) ) )
		      {
			sprintf( bin_buffer, "%c%c%c", 
				 *sig_reader, 
				 *(sig_reader + 1 ),
				 (char)NULL );
			sig_reader += 2;
		      }
		    else
		      {
			sprintf( bin_buffer, "%c%c", 
				 *sig_reader, 
				 (char)NULL );
			sig_reader += 1;
		      }

		    *sig_writer =   (u_char)strtol( bin_buffer, (char **)NULL, 16);
		      
		    if( pattern_mode != CASE_SENSE )    *sig_writer = toupper( *sig_writer );
		    
		  } /* if isxdigit */
		break;
	      }
	    default:
	      {
		fprintf(stderr,"Invalid Escape Sequence in pattern description." );
		final( 0 );
	      }

	    } /* switch */
	  sig_writer++;
	}
      else if ( letter == '|' ) /* when get the first '|' read binary data */
	{
	  char *endof_bin = index( sig_reader + 1, '|' );
	  /* skip escape sequences */
	  while( *( endof_bin - 1) == '\\' )     {   endof_bin = index( endof_bin + 1, '|'); /* find next | */}

	  if( ( endof_bin > endof_sig ) || ( endof_bin == (char *)NULL ) )
	    {
	      fprintf(stderr,"Invalid Payload Description.No closing |.");
	      final( 0 );
	    }
	  sig_writer += make_bin_pattern( sig_writer, sig_reader + 1, endof_bin - 1, pattern_mode );
	  if( endof_bin == endof_sig )
	    sig_reader = endof_bin;
	  else
	    sig_reader = endof_bin + 1;
	}
      else                    /*** read text ***/
	{

	  *sig_writer = ( pattern_mode == CASE_SENSE ) ? letter : toupper( letter );
	  sig_writer++;
	  continue;
	}

    } /* for sig_reader */

  *sig_writer = (u_char)NULL;

  return sig_writer - pattern; /* legnth of pattern exclude last \0 */

} /* make_pattern */


int signature::make_bin_pattern( u_char *sig_writer, char *bin_reader, char *endof_bin, u_char pattern_mode )
{

  char bin_buffer[3];

  u_char *original = sig_writer;

  while( bin_reader <= endof_bin )
    {

      /* skip spaces */
      while( isspace( *bin_reader) ) 
	bin_reader++;

      if( isxdigit( *( bin_reader ) ) )
	{
	  if( isxdigit( *( bin_reader + 1 ) ) )
	    {
	      sprintf( bin_buffer, "%c%c%c", 
		       *bin_reader, 
		       *(bin_reader + 1 ),
		       (char)NULL );
	      bin_reader += 2;
	    }
	  else
	    {
	      sprintf( bin_buffer, "%c%c", 
		       *bin_reader, 
		       (char)NULL );
	      bin_reader += 1;
	    }

	  *sig_writer = 
	    (u_char)strtol( bin_buffer, (char **)NULL, 16);

	  if( pattern_mode != CASE_SENSE )
	    *sig_writer = toupper( *sig_writer );
	  
	  sig_writer++;

	}
      else
	{
	  fprintf(stderr,"Signature Format Error : Invalid Binary Expression. " );
	  final( 0 );
	}

    } /* while */

  return (sig_writer - original); /* length of pattern */

} /* make_bin_pattern */

c_node *signature::detect_signature( node *data, u_char *capital, s_node **s_tree_index,  c_node **c_tree_index )
{
  u_char *payload ;
 u_long src_number;
 u_long dest_number;
  switch( data->ip_p )
    {
    case IPPROTO_TCP:
    case IPPROTO_UDP:
      {
	  src_number =data->srcport;
	  dest_number = data->dstport;
	break;
      }
    case IPPROTO_ICMP:
      {
	 src_number = data->this_icmphdr->type;
         dest_number = data->this_icmphdr->code;
	break;
      }
    } //switch
  while( ( *s_tree_index != (s_node *)NULL ) &&	 ( (*s_tree_index)->dest_number <= data->dstport ) )
    {

      /* number ULONG_MAX is used for wild card */

      while( ( *s_tree_index != (s_node *)NULL ) &&

	     ( ( (*s_tree_index)->dest_number == ULONG_MAX ) || 
	       ( (*s_tree_index)->dest_number ==  dest_number ) )   &&

	     ( ( (*s_tree_index)->src_number == ULONG_MAX ) ||
	       ( (*s_tree_index)->src_number ==  src_number  )) )
	{

	  if( *c_tree_index == (c_node*)NULL )
	    *c_tree_index = (*s_tree_index)->c_tree;

	  while( *c_tree_index != (c_node *)NULL )
	    {
		  if( ((*c_tree_index)->pattern_len == 0) )	    return ( *c_tree_index ); 
		  if( (*c_tree_index)->pattern_mode == CASE_SENSE ) {  payload = data->data;} 
		  else if( (*c_tree_index)->pattern_mode == CASE_INSENSE ){    payload = capital;}
	  /* Booyer-Moore Algorithm */
		  if( boyer_moore_match ( payload, data->len, 
			  	(*c_tree_index)->pattern,
		  		(*c_tree_index)->pattern_len,
		  		(*c_tree_index)->delta1,
				 (*c_tree_index)->delta2
				 ) )
		    return ( *c_tree_index ); /* return when match */

	      *c_tree_index = (*c_tree_index)->next;

	    } /* while c_tree */
	      
	  *s_tree_index = (*s_tree_index)->next;

	} /* while s_tree */
	  
      if(*s_tree_index != (s_node *)NULL)
	*s_tree_index = (*s_tree_index)->next;
    }

  return (c_node *)NULL;

} /* detect_signature */

int signature::dump_c_tree(s_node * s_tree )
{

  c_node * c_tree = ( c_node * )NULL;

  if(s_tree == (s_node *)NULL )
    {

      fprintf(stderr, "dump_c_tree: s_tree == NULL\n");

      return (-1);
    }
  
  c_tree = s_tree->c_tree;

  while( c_tree != (c_node *)NULL )
    {

      int i;
      fprintf(stderr,"s_node[");

      if(((s_node *)c_tree->s_node)->src_number == ULONG_MAX ) 
	if(((s_node *)c_tree->s_node)->dest_number == ULONG_MAX )
	  fprintf(stderr,"* *");
	else
	  fprintf(stderr,"* %lu", ((s_node *)c_tree->s_node)->dest_number);
      else if (((s_node *)c_tree->s_node)->dest_number == ULONG_MAX )
	  fprintf(stderr,"%lu *", ((s_node *)c_tree->s_node)->src_number);
      else
	  fprintf(stderr,"%lu %lu", ((s_node *)c_tree->s_node)->src_number,
		 ((s_node *)c_tree->s_node)->dest_number );

      fprintf(stderr, "] c_node[%d] %s (%d) ", 
	      c_tree->sig_id,
	      c_tree->name,
	      c_tree->pattern_len
	      );

      if( c_tree->pattern_mode == CASE_SENSE )
	fprintf(stderr,"\"");
      else
	fprintf(stderr,"\'");
      for( i=0; i < c_tree->pattern_len; i++ )
	{
	  if ( isprint( *(c_tree->pattern + i)  ) )
	    putchar( *(c_tree->pattern + i) );
	  else
	    fprintf( stderr,"\\x%x", *( c_tree->pattern + i ) );
	}

      if( c_tree->pattern_mode == CASE_SENSE )
	puts("\"");
      else
	puts("\'");

      c_tree = c_tree->next;
    }

  return (0);

} /* dump_c_tree */

void signature::dump_s_tree(s_node * s_tree )
{

  while( s_tree != (s_node *)NULL )
    {

      dump_c_tree( s_tree );

      s_tree = s_tree->next;
      
    }

} /* dump_sig_tree */

void signature::free_s_tree( s_node * s_tree)
{

  if( s_tree == (s_node *)NULL )
    return;

  if( s_tree->next != (s_node *)NULL )
    free_s_tree( s_tree->next );

  if( s_tree->c_tree != (c_node *)NULL )
    free_c_tree( s_tree->c_tree );

  free( s_tree );

  return;

} /*** free_s_tree ***/

void signature::free_c_tree( c_node * c_tree)
{

  if( c_tree->next != (c_node *)NULL )
    free_c_tree( c_tree->next );

  if( c_tree->pattern )
    free( c_tree->pattern);
  if( c_tree->name )
    free( c_tree->name);
  if( c_tree->delta1 )
    free( c_tree->delta1 );
  if( c_tree->delta2 )
    free( c_tree->delta2 );
  if( c_tree )
    free( c_tree );

  return;

} /*** free_c_tree ***/

int signature::boyer_moore_match ( u_char * data, int data_length, u_char * pattern, int pattern_length, u_char *delta1, u_char *delta2 )
{

  int i; /* data index */

  int j; /* pattern index */
  u_char c;
  int d1, d2; /* values from delta table of BM */
#ifdef DEBUG
  int k;
#endif
  i = pattern_length -1; /* from last u_char */

  for(i = 0;i+pattern_length  <= data_length;)
  {
  #ifdef DEBUG
    printf("i=%d\n", i);
    printf("[pattern]=");
    for( k=0; k <= i-1 ; k++)
      putchar('.');
    printf("%s\n", pattern );
    printf("[d a t a]=");
    for( k=0; k <= data_length; k++)
      {
	if( isprint(data[k]) )
	  putchar(data[k]);
	else
	  putchar('.');
      }
#endif
  for(j=pattern_length;j>0;--j)
  {
    c=data[i+j-1];
    if(c  != pattern[j-1])
     break;
  }
  if (j==0) {i+=delta2[0]; return TRUE;
  } else {
  d1 =  delta1[c] -(pattern_length-j)  ;
  d2 =   delta2[j]  ;
  i+= max(d1,d2);
  }
#ifdef DEBUG
    printf("i=%d, j=%d, d1=%d, d2=%d\n", i, j, d1,d2 );
#endif
  }

  return FALSE;
}

u_char *signature::boyer_moore_delta1( u_char *pattern, u_char pattern_length )
{
  int i;

  u_char *delta1;

  if( pattern_length <= 0 )
      return (u_char *)NULL;

  if( pattern_length > MAX_PATTERN_SIZE)
    {
      fprintf(stderr, "Too large patttern for delta1.\n");
      final( 0 ); /* failure */ 
    }

  delta1 = (u_char *)malloc( 256 * sizeof(u_char) );

  if ( delta1 == (u_char *)NULL )
    {
      fprintf(stderr, "Memory allocation error for delta1\n");
      final( 0 );
    }
  
  for( i = 0; i < 256; i++)
    delta1[i] = pattern_length;

  for( i = 0; i < pattern_length; i++ )
    {
#ifdef DEBUG
      printf("delta1[%c]=%d\n", pattern[i], pattern_length -i -1);
#endif
      delta1[ pattern[i] ] = pattern_length - i -1;
    }

  return delta1;

}

u_char *signature::boyer_moore_delta2( u_char *pattern, u_char pattern_length )
{

    int i_delta, j_pattern, k_pattern, reader1, reader2;

    u_char last_u_char;

    u_char *delta2;
    u_char *f;
    u_char *dd;
    u_char *dd_;
    int j,t;
    int k;
    int dd_t;
    if( pattern_length == 0 )
      return (u_char *)NULL;

    f = (u_char *)malloc( pattern_length * sizeof(u_char) + 1 );
    dd = (u_char *)malloc( pattern_length * sizeof(u_char) + 1 );
    dd_ = (u_char *)malloc( pattern_length * sizeof(u_char) + 1 );
    memset(dd,pattern_length,pattern_length);
    memset(dd_,pattern_length,pattern_length);
    if ( (dd_ == (u_char *)NULL) ||(delta2 == (u_char *)NULL) ||(f == (u_char *)NULL) ||(dd == (u_char *)NULL) )
      {
	fputs( "Memory allocation error for delta2.",stderr );
	final( 0 );
      }

    for (k=0;k<=pattern_length;k++) {dd[k] =dd_[k] =pattern_length;}
   //  printf("dd_[6] is %d\n",dd_[6]);
    j = pattern_length;
    t = pattern_length +1;
    while (j>0)
    {
	f[j] =t;
	while (t<=pattern_length && pattern[j-1] != pattern[t-1])
	{
	   dd_[t] = min(dd_[t],t-j);
	   dd_t =dd_[t];
	   t=f[t];
	}
	j--;t--;
	dd[t] = min(dd[t],t-j);
    }
    for(k=0;k<=t;k++)
    {
      dd[k] = min(dd[k],t);
      dd_[k] = min(dd_[k],t);
    //  delta2[k] = dd_[k];
#ifdef DEBUG
      printf("delta2[%d](%c)=%d\n", k, pattern[k], dd_[k]);
#endif
    }
    delta2 =dd_;
     // delta2[6]=3  ;
      //printf("delta2[%d](%c)=%d\n", k+1, pattern[k+1], dd_[k+1]);
    free(dd);
    free(f);
    return dd_;
}

void signature::read_payload(node *data )
{
  int i;
  char *protocol_name;
  u_char *capital; /* buffer to store capitalized payload */
  c_node **c_tree_index;
  s_node **s_tree_index = (s_node **)NULL;
  c_node * detect_sig = (c_node *)NULL;

  switch( data->ip_p )
    {
    case IPPROTO_TCP:
      {
	s_tree_index = ( s_node **)malloc( sizeof (s_node **));
	if( s_tree_index == ( s_node **)NULL ) { fprintf(stderr,"malloc fail in read_payload:IPPROTO_TCP \n"); final( 0 );}
	protocol_name = "TCP";
	*s_tree_index = tcp_tree;
	break;
      }
    case IPPROTO_UDP:
      {
	s_tree_index = ( s_node **)malloc( sizeof (s_node **));
	if( s_tree_index == ( s_node **)NULL ) { fprintf(stderr,"malloc fail in read_payload:IPPROTO_UDP \n"); final( 0 );}
	protocol_name = "UDP";
	*s_tree_index = udp_tree;
	break;
      }
    case IPPROTO_ICMP:
      {
	s_tree_index = ( s_node **)malloc( sizeof (s_node **) );
	if( s_tree_index == ( s_node **)NULL ) {	fprintf(stderr,"malloc fail in read_payload:IPPROTO_ICMP \n"); final( 0 ); }
	protocol_name = "ICMP";
	*s_tree_index = icmp_tree;
	break;
      }
    default:
      {
	s_tree_index = ( s_node **)malloc( sizeof (s_node **) );
	protocol_name = "UNK";
	*s_tree_index = (s_node *)NULL;
      }
    }
  c_tree_index = ( c_node **)malloc( sizeof (c_node **));
  if( c_tree_index == (c_node **)NULL )
    {
      fprintf(stderr,"malloc fail in read_payload:malloc c_node\n");
      free( s_tree_index );
      final( 0 );
    }
  capital = ( u_char * )malloc( ( data->len + 1 ) * sizeof( u_char ));
  if( capital == (u_char *)NULL )
    {
      fprintf(stderr,"malloc fail in read_payload:capital \n");
      free( s_tree_index );
      free( c_tree_index );
      final( 0 );
    }
  *c_tree_index = (c_node *)NULL;
  /* making capital string */
  for( i = 0; i < data->len; i++ )
    {
      *(capital + i) = toupper( *( data->data+ i ) );
    }
  *( capital + data->len ) = (u_char)NULL; 
  while( (detect_sig = detect_signature( data, capital, s_tree_index, c_tree_index )) != (c_node *)NULL )
    {
					//fprintf(stderr,"found signature attack in UDP\n");
	           			/*create detail report*/
					strcpy(report_signature.name," Signature Detection Class");
					strcpy(report_signature.description,"This Class is used to detect signature attack in data ");
					sprintf(report_signature.type,detect_sig->name );
					snprintf(report_signature.detail,sizeof(report_signature.detail),"someone send invalid data in packets to make your computer or your network "
											   " handle it in unpredict way or crash your operating system . This could be issued in order to make host can not do anything or DoS attack. ");
					report_signature.srcip.s_addr=data->srcip.s_addr;
					report_signature.dstip.s_addr=data->dstip.s_addr;
					report_signature.dstport=data->dstport;
	    				report_signature.srcport=data->srcport;
					report_signature.Shour= data->hour;
			                report_signature.Smin=data->min;
					report_signature.Ssec=data->sec;
					report_signature.Ehour=data->hour;
					report_signature.Emin=data->min;
					report_signature.Esec=data->sec;
					report_signature.count =1;
					report_signature.report_type =6;
					reportors->add_report(&report_signature);
      /*end report*/
      *c_tree_index = (*c_tree_index)->next;
      
      if( *c_tree_index == (c_node *)NULL )
	{
	  *s_tree_index = (*s_tree_index)->next;
	}

   }

  free(s_tree_index );
  free(c_tree_index);
  free(capital );
  return;

} /* read_payload  */

void signature::signature_run (node *data,report *reportor)
{
	reportors= reportor;
	switch (data->ip_p)
	{
	case IPPROTO_TCP:
		//fprintf(stderr,"tcp packet coming\n");
		if(data->this_tcphdr->syn) return; // reject syn packet
		if(data->this_tcphdr->rst) return; //  reject fin packet
		if((data->all_len)<=(sizeof(struct ether_header)+(data->this_iphdr->ip_hl*4)+(data->this_tcphdr->doff*4)))    return; // rejecting packets which contain no data 
		//tcp_packet (data);
		read_payload(data );
		break;
	case IPPROTO_UDP:
		//fprintf(stderr,"udp packet coming\n");
		if((data->all_len)<=(sizeof(struct ether_header)+(data->this_iphdr->ip_hl*4)+sizeof(struct udphdr)))    return; // rejecting packets which contain no data 
		//udp_packet (data);
		  read_payload(data );
		break;
	case IPPROTO_ICMP:
		//fprintf(stderr,"udp packet coming\n");
		if((data->all_len)<=(sizeof(struct ether_header)+(data->this_iphdr->ip_hl*4)+sizeof(struct icmphdr)))    return; // rejecting packets which contain no data 
		//icmp_packet (data);
		read_payload(data );
		break;
	}
}
