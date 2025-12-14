/*dersaac
 
s
 */

#define GAIM_PLUGINS
#include "gaim.h"
#include "util.c"
#include "conversation.h"
#include "debug.h"
#include "prefs.h"
#include "signals.h"
#include "version.h"
#include "notify.h"
#include "gtkimhtml.h"
#include "gtkplugin.h"
#include "gtkutils.h"
#include "gtkdialogs.h"
#include "prpl.h"

#include <stdio.h>
#include <gtk/gtk.h>
#include <string.h>
#include <time.h>
//#include <gmp.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>




#include "common.c"
#include "rsa_key.c"
#include "certutil.c"

#include "ssl_connect.c"

//#include "test.c"

#define CH 1	//certificate header



G_MODULE_IMPORT GSList *gaim_accounts;
G_MODULE_IMPORT guint im_options;
#define PROJECT_PLUGIN_ID "project"
GaimPlugin *isagq_plugin_handle;
char selected_name[255];

static GtkWidget *key_size_entry, *proto_combo;
static GtkWidget *regen_window = NULL;
static GtkWidget *request_window = NULL;
static unsigned char  *send_encrypt( const char *name,GaimAccount *acct,char *message){
					RSA *pub_key;
					FILE *fp;
					unsigned char  *ciphertext,*cipher_msg;
					unsigned char  *cipher_str;
					unsigned char directory[255];
					unsigned char pubkey_cmd[255];
					unsigned char pubkey_file[255];
					int ciphersize,len;
					buddy_cert_file(name,directory,3);
					buddy_cert_file(name,pubkey_file,0);
 				sprintf(pubkey_cmd,"openssl x509 -pubkey -noout -in %s > %s",directory,pubkey_file);
					system(pubkey_cmd);
					//if(!(fp=fopen("/root/.gaim/cert/isagmq@hotmail.com.pub","r")))
					if(!(fp=fopen(pubkey_file,"r")))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not open dir");
	
					if(!(pub_key=PEM_read_RSA_PUBKEY(fp, NULL, NULL, NULL)))
					{
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not read key");
					exit;
					}

					int size = RSA_size(pub_key);
					ciphertext=g_malloc(size);
					
				 ciphersize=RSA_public_encrypt(strlen(message),message,	ciphertext,pub_key,RSA_PKCS1_OAEP_PADDING);
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "out of encrypted function is %s \n",ciphertext);
					fclose(fp);
/*					cipher_str=g_malloc(ciphersize); //with header
					//cipher_msg=g_malloc(ciphersize+4);
					len=bytes_to_str(cipher_str,ciphertext,ciphersize);
					cipher_msg=g_malloc(len+4);
					sprintf(cipher_msg,":EM:%s",cipher_str);
					serv_send_im(acct->gc, name,cipher_msg,GAIM_MESSAGE_AUTO_RESP);
	
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "cipher msg is %s \n",cipher_msg);
					g_free(cipher_str);
					g_free(cipher_msg);*/
					cipher_str=g_malloc(ciphersize*2+1);		// no header
					len=bytes_to_str(cipher_str,ciphertext,ciphersize);			
					cipher_str[len]=0;
				 cipher_msg=g_malloc(len+4);
				
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "msg length  before header = %d\n",len);
					sprintf(cipher_msg,":EM:%s",cipher_str);
					
					serv_send_im(acct->gc, name,cipher_msg,GAIM_MESSAGE_AUTO_RESP);
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "cipher msg is %s \n",cipher_msg);
					
					
					g_free(cipher_str);
					g_free(ciphertext);
					g_free(cipher_msg);
					return cipher_msg;
}
static void key_file(char key[255]){
					
			
							sprintf( key,"%s/cert/client.pem",gaim_user_dir());
}
static void ca_file(char ca[255]){
					
					
							sprintf(ca,"%s/cert/rootcert.pem",gaim_user_dir());
}
static void ca_dir(char dir[255]){
					
							
							sprintf( dir,"%s/cert/",gaim_user_dir());
}
static void crl_file(char crl[255]){
					
							//sprintf( key,"/root/Desktop/gaim-1.5.0/plugins/client.pem");
							sprintf(crl,"%s/cert/crl",gaim_user_dir());
}
static void check_state( const char *name,GaimAccount *acct){

			serv_send_im(acct->gc, name,":PC:",GAIM_MESSAGE_SEND );
}
static void cert_req( const char *name,GaimAccount *acct){
			
			serv_send_im(acct->gc, name,":CR:",GAIM_MESSAGE_SYSTEM );
}
static void send_cert( const char *name,GaimAccount *acct){
			char *msg;
			GaimConversation *conv;
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "send_key: %s\n", acct->username);
   
   conv = gaim_find_conversation_with_account(name, acct);
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "send_key: %s, %p, %s\n", name, conv, acct->username);
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "Gaim directory is %s\n", gaim_user_dir());
			msg = alloca(1000);
			char cert_file[255];
			
//			int i;
			unsigned char buf[255];
			sprintf(cert_file,"%s",gaim_user_dir());
			strcat(cert_file,"/cert/");
			chdir(cert_file);
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "Gaim absolute directory is %s\n", cert_file);
			sprintf(cert_file,"[CE]%s",acct->username);
			strcat(cert_file,".pem");
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "Gaim absolute directory is %s\n", cert_file);
			
			msg = alloca(1000);
			FILE *fp;				
			if (!(fp = g_fopen(cert_file, "r+")))
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "directory open error\n");
			while (fgets(buf, sizeof(buf), fp)>0) {
		
			sprintf(msg,":CE:%s",buf);
			serv_send_im(acct->gc, name, msg,GAIM_MESSAGE_AUTO_RESP);
			
			
			};
			
		
				/*gaim_debug(GAIM_DEBUG_INFO, "Isagq","Error1\n");
			serv_send_im(acct->gc, name, msg,GAIM_MESSAGE_AUTO_RESP);*/
			*msg=0;
		

}
static void save_cert(GaimAccount *account,char *who,char **message){
				
	char *tmp;
	char cert_file[255];
	tmp = *message;		
	FILE *fp;
	int valid;
	buddy_cert_file(who,cert_file,3);
	valid = check_cert(who);
	gaim_debug(GAIM_DEBUG_INFO, "Isagq", "cert_file is %s",cert_file);
	if (!(fp =fopen(cert_file,"a+"))){
	gaim_debug(GAIM_DEBUG_INFO, "Isagq", "error open file");
	}
	else{
		
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", " open file ok dumb file is %s\n",*message);
		//gaim_markup_strip_html(*message);
		memcpy(tmp,gaim_markup_strip_html(*message)+4,strlen(*message)-4);
		
		fputs(tmp,fp);
		fputs("\n",fp);
	};
	fclose(fp);
		
return;
}

int check_header(char *message){
char tag[4];
int  tagnum = 0;
	
	memcpy(tag,message,4);
	
	/* try finding the tag */
	if(!strncmp(":PC:",tag,4))tagnum = 1;	//certificate request
 if(!strncmp(":CR:",tag,4))tagnum = 2;	//encrypt message
 if(!strncmp(":CE:",tag,4))tagnum = 3;	//plugin check
 if(!strncmp(":EM:",tag,4))tagnum = 4;  
        /* if theres a tag remove it.. if not. then leave it alone */
        if(tagnum > 0) memmove(message,message+4,strlen(message)-4);
	
	return tagnum;


}
int cstr_to_bytes(unsigned char *bytes, unsigned char *cstr, int num) {
   int bytes_cursor, str_cursor = 0;
   unsigned char minibuf[3] = "00";

   for (bytes_cursor = 0; bytes_cursor < num; ++bytes_cursor) {
      minibuf[0] = cstr[str_cursor++];
      if (minibuf[0] == 0) return bytes_cursor;
      minibuf[1] = cstr[str_cursor++];
      if (minibuf[1] == 0) return -1;      
      bytes[bytes_cursor] = (unsigned char) strtoul(minibuf, 0, 16);
   }
   return bytes_cursor;
}
static unsigned char *msg_decrypt(GaimAccount *acct,char **name,char *message){
		RSA *priv_key;
		FILE *fp;
		unsigned char *cipher_str_decode,*plain_text;
		unsigned char buf[500];
		
		unsigned char *pure_msg,*tmp_msg;
		int i,length,error; 
	/*	char cert_file[255];
		char pvkey_cmd[255];*/
		char pvkey_file[255];		
	//	char *username;
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","error 1\n");	
		//gaim_debug(GAIM_DEBUG_INFO, "Isagq","pure message is %s\n",message);	
		//pure_msg=gaim_markup_strip_html(message);

		sprintf(buf,"%s",gaim_markup_strip_html(message));
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","buf = %s\n",buf);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","length buf = %d\n",strlen(buf));
		pure_msg=g_malloc(strlen(buf));
		sprintf(pure_msg,"%s",buf);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","pure msg = %s\n",pure_msg);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","pure msg length= %d\n",strlen(pure_msg));
		length = strlen(buf)-4;
	
		unsigned char *token;
			
		token = strtok(buf,":");
		for( i=0;i<2;i++){
		if(i==1) tmp_msg=token;
		token = strtok(NULL,":");
		};
	
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","message  after token %s\n",tmp_msg);	

		cipher_str_decode = g_malloc(length);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "error5\n");
		int len = cstr_to_bytes(cipher_str_decode,tmp_msg,length);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","error 1\n");
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "error1\n");
		//gaim_debug(GAIM_DEBUG_INFO, "Isagq", "cipher_str_decode = %s ",cipher_str_decode);

		name=acct->username;
		buddy_cert_file(name,pvkey_file,1);

		if(!(fp=fopen(pvkey_file,"r")))
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not open dir");
		
		if(!(priv_key=PEM_read_RSAPrivateKey(fp, NULL, NULL, NULL)))
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not read key\n");	 
		
		int text_len = RSA_size(priv_key);
		
		plain_text=g_malloc(text_len); 
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "error3\n");
		error=RSA_private_decrypt(len,cipher_str_decode,plain_text,priv_key,RSA_PKCS1_OAEP_PADDING);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", " decrypted length %d\n",error);	
		
			
		
		if(error==-1){
		 gaim_debug(GAIM_DEBUG_INFO, "Isagq", "decrypt error");
		 //sprintf(show_msg,"%s","no message");				
		}
		else {
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "out of decrypted function is %s \n",plain_text);
		
		/*strncpy(show_msg,plain_text,error);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq", "show_msg is %s \n",show_msg);*/
		}
		
		fclose(fp);
		//g_free(token);
		g_free(plain_text);
		//g_free(tmp_msg);
		g_free(cipher_str_decode);
		
		
		g_free(pure_msg);
		unsigned char *decrypt_msg;
		decrypt_msg=g_malloc(error);
		strncpy(decrypt_msg,plain_text,error);
		return decrypt_msg;
}
	
static void recv_msg_cb(GaimAccount *account,char **who,char **message){
		int type;
		
		unsigned char *pure_msg;
		unsigned char *decrypt_msg;	
 		pure_msg=gaim_markup_strip_html(*message);
		type = check_header(pure_msg);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","message type %d\n",type);
		int valid;
		valid		= check_cert(*who);
		GaimConversation *conv;
		conv = gaim_find_conversation_with_account(*who,account);
		gaim_debug(GAIM_DEBUG_INFO, "Isagq","who is %s\n",*who);
		char encrypt_pref[255];
		sprintf(encrypt_pref,"/plugins/gtk/isagq/%s",*who);
		fprintf(stderr,"*************************************recieve start here\n");
		if(conv == NULL){
		
			conv=gaim_conversation_new(GAIM_CONV_IM,account,*who);
		
		};

								if(type==1)
								{
																			
																			gaim_debug(GAIM_DEBUG_INFO, "Isagq"," recieve plugin check \n");
																			if(gaim_prefs_get_int(encrypt_pref)==0)			
																			{
																												serv_send_im(account->gc,*who,":PC:",GAIM_MESSAGE_SEND );	
																												if(valid==0)
																												cert_req(*who,account);	
																												gaim_prefs_set_int(encrypt_pref,2); 
																												gaim_debug(GAIM_DEBUG_INFO, "Isagq"," send check state \n");
																				}
	
			
								}
							else if(type==2){
							
																			gaim_debug(GAIM_DEBUG_INFO, "Isagq","recieve cert_req \n");			
																			send_cert(*who,account);
																			if(valid==0)
																			cert_req(*who,account);

								}
							else if(type==3){

																			gaim_debug(GAIM_DEBUG_INFO, "Isagq","recieve save cert \n");										
																			save_cert(account,*who,message);
																			gaim_prefs_set_int(encrypt_pref,2); 

							}
							else if(type==4){
			
																			gaim_debug(GAIM_DEBUG_INFO, "Isagq","recieve encrypted message \n");
																			decrypt_msg=msg_decrypt(account,who,*message);
																			gaim_conv_im_write(GAIM_CONV_IM(conv),*who,decrypt_msg,GAIM_MESSAGE_RECV,time((time_t)NULL));		
							
							}
							else{
																			
																			gaim_debug(GAIM_DEBUG_INFO, "Isagq","recieve normal message\n");				
																			gaim_conv_im_write(GAIM_CONV_IM(conv),*who,*message,GAIM_MESSAGE_RECV,time((time_t)NULL));
																			**message=0;						

							}

				fprintf(stderr,"*************************************recieve end here\n");
}
static void send_msg_cb(GaimAccount *account,char *who,char **message){
				int valid;
				int state;
				state=0;
				unsigned char *encrypt_message;	
				char encrypt_pref[255];	
				fprintf(stderr,"*************************************function start here\n");
				gaim_debug(GAIM_DEBUG_MISC, "Isagq", "gaim home direcory: %s\n", gaim_home_dir());
				gaim_debug(GAIM_DEBUG_MISC, "Isagq", "gaim user direcory: %s\n", gaim_user_dir());
    const char *accountname = gaim_account_get_username(account);
    const char *protocol = gaim_account_get_protocol_id(account);
  
				//perror(accountname);
				//perror(protocol);
				//perror(who);

				GaimConversation *conv;
			 gaim_debug(GAIM_DEBUG_MISC, "Isagq", "send_msg: %s\n", who);
			 conv = gaim_find_conversation_with_account(who,account);
				   if (conv == NULL) 
										{
      					conv = gaim_conversation_new(GAIM_CONV_IM, account, who);
   							}
				//gaim_debug(GAIM_DEBUG_INFO, "Isagq", "requesting certificate\n");
   /* gaim_conversation_write(conv, 0, _("Requesting certificate..."),
                              GAIM_MESSAGE_SYSTEM, time((time_t)NULL));*/

				
	
				sprintf(encrypt_pref,"/plugins/gtk/isagq/%s",who);
				valid = check_cert(who);
				state=gaim_prefs_get_int(encrypt_pref);
				gaim_debug(GAIM_DEBUG_INFO, "Isagq", "state = %d \n",state);
				gaim_debug(GAIM_DEBUG_INFO, "Isagq", "valid = %d \n",valid);

				if(state==0)
				{
			 									gaim_debug(GAIM_DEBUG_INFO, "Isagq", "check plugin \n");
			 									check_state(who,account);	
			 									gaim_prefs_set_int(encrypt_pref,1);
				}
				else if(state==2)
				{
										if(valid==0)
													cert_req(who,account);
										else 
										{
													encrypt_message=send_encrypt(who,account,*message);
													gaim_debug(GAIM_DEBUG_INFO, "Isagq", "encrypt message is %s\n",encrypt_message);
  											gaim_conv_im_write(GAIM_CONV_IM(conv), NULL,encrypt_message,GAIM_MESSAGE_SEND, time((time_t)NULL));		
													gaim_conv_im_write(GAIM_CONV_IM(conv), NULL,*message,GAIM_MESSAGE_SEND, time((time_t)NULL));
													**message=0;										

										}


					};

	
	fprintf(stderr,"*************************************function end here\n");

		
}


/*void on_comboboxentry1_add(){
}*/
static void config_cancel_regen() {
   if (regen_window) {
      gtk_widget_destroy(regen_window);
   }
   regen_window = NULL;
}
void	do_regen(){

			FILE *fp;
			char dir[255],tmp1[255],tmp2[255];
			char key_size[255];
			char *file_pt;
		 char *name_pt;
			int size;
			sprintf(dir,"%s/cert/tmp.txt",gaim_user_dir());	
			fp = fopen(dir,"w");
			fprintf(fp,"%s",selected_name);
			fclose(fp);
			file_pt = selected_name;
		 unsigned char *token,*tmp_msg;
			int i;
		
			token = strtok(selected_name,"]");
			for( i=0;i<2;i++){
			if(i==0) tmp_msg=token;
			token = strtok(NULL,"]");
			};
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "intoken 1 is %s\n",tmp_msg);
	//	 sprintf(tmp1,"%s",tmp_msg);
	//		strncpy(tmp2,tmp1,strlen(tmp1)-4);
			
			name_pt = tmp_msg;





		//	gaim_debug(GAIM_DEBUG_INFO, "Isagq", "intoken 2 is %s\n",tmp2);
		//	get_name_from_cert(name_pt,file_pt);
			
			const gchar* key_string = gtk_entry_get_text(GTK_ENTRY(GTK_COMBO(proto_combo)->entry)); 
	  
			sprintf(key_size,"%s",key_string);
			size=atoi(key_size);
	
			
			//strncpy(name_pt,tmp_msg,strlen(tmp_msg)-4);
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "intoken is %s\n",name_pt);
			if (size==1024){
			
			create_req(name_pt,1024);
			ssl_con1(name_pt);
			}
			else if(size==2048)
			{
			create_req(name_pt,2048);
			ssl_con1(name_pt);				
			}
			else if (size==4096)
			{
			create_req(name_pt,4096);
			ssl_con1(name_pt);			
			}
			gaim_debug(GAIM_DEBUG_INFO, "Isagq", "last row");
			config_cancel_regen();
}
static void cancel_request_window(){
   if (request_window) {
      gtk_widget_destroy(request_window);
   }
   request_window = NULL;
}
static	void show_request_window(){

  	GtkWidget *vbox1;
  	GtkWidget *label1;
  	GtkWidget *button1;   
			if (request_window != NULL) return;
  
   GAIM_DIALOG(request_window);
			gtk_window_set_modal (GTK_WINDOW (request_window), TRUE);
			gtk_window_set_keep_above(GTK_WINDOW (request_window), TRUE);	
   gtk_widget_set_size_request(request_window, 200, 100);
   //gtk_window_set_title(GTK_WINDOW(regen_window), _("Requesting Certificate"));		
  	vbox1 = gtk_vbox_new (FALSE, 0);
  	gtk_widget_show (vbox1);
  	gtk_container_add (GTK_CONTAINER (request_window), vbox1);

  	label1 = gtk_label_new (_("\nRequesting Certifiacte...\n\n"));
  	gtk_widget_show (label1);
  	gtk_box_pack_start (GTK_BOX (vbox1), label1, FALSE, FALSE, 0);

  	button1 = gtk_button_new_with_mnemonic (_("Cancel"));
   g_signal_connect(G_OBJECT(button1), "clicked",
                    GTK_SIGNAL_FUNC(cancel_request_window),NULL);
  	gtk_widget_show (button1);
  	gtk_box_pack_start (GTK_BOX (vbox1), button1, 0, 0, 0);
  	gtk_widget_show (request_window);

}
	
static void config_regen_key() {
   //GtkTreeSelection *selection = gtk_tree_view_get_selection(GTK_TREE_VIEW(key_list_view));
   
   GtkWidget *vbox, *hbox, *label, *table, *button;//*regen_err_label
   GList *proto_list = NULL;

   proto_list = g_list_append(proto_list,"1024");
   proto_list = g_list_append(proto_list,"2048");
			proto_list = g_list_append(proto_list,"4096");
		
   if (regen_window != NULL) return;
  
   GAIM_DIALOG(regen_window);
   gtk_widget_set_size_request(regen_window, 300, 150);
   gtk_window_set_title(GTK_WINDOW(regen_window), _("Generate Certificate"));
  /* g_signal_connect(G_OBJECT(regen_window), "destroy", 
                    GTK_SIGNAL_FUNC(config_cancel_regen), NULL);*/

   vbox = gtk_vbox_new(0, 2);
   gtk_container_set_border_width(GTK_CONTAINER(vbox), 4);
   gtk_container_add(GTK_CONTAINER(regen_window), vbox);
   gtk_widget_show (vbox);
   
 /*  if (!gtk_tree_selection_get_selected(selection, NULL, NULL)) {
      label = gtk_label_new(_("No key selected to re-generate!"));
      gtk_box_pack_start(GTK_BOX(vbox), label, 0, 0, 0);
      gtk_widget_show(label);
      
      hbox = gtk_hbox_new(FALSE, 2);
      gtk_box_pack_end(GTK_BOX(vbox), hbox, 0, 0, 0);
      gtk_widget_show(hbox);

      button = gtk_button_new_with_label(_("OK"));
      g_signal_connect(G_OBJECT(button), "clicked",
                         GTK_SIGNAL_FUNC(config_cancel_regen), NULL);
      gtk_box_pack_end(GTK_BOX(hbox), button, 0, 0, 0);
      gtk_widget_set_size_request(button, 100, -1);
      gtk_widget_show(button);
      gtk_widget_show(regen_window);
      return;
   }
*/
   /* Start 2 x 2 table */
   table = gtk_table_new(2, 2, FALSE);
   gtk_box_pack_start(GTK_BOX(vbox), table, 0, 0, 0);
   gtk_widget_show(table);

   /* First column */
   label = gtk_label_new(_("Key size:"));
   gtk_widget_set_size_request(label, 150, -1);
   gtk_label_set_justify(GTK_LABEL(label), GTK_JUSTIFY_LEFT);
   gtk_table_attach(GTK_TABLE(table), label, 0, 1, 0, 1,
                    0, 0, 0, 0);
   gtk_widget_show(label);
         
 /*  label = gtk_label_new(_("Key size:"));
   gtk_widget_set_size_request(label, 150, -1);
   gtk_label_set_justify(GTK_LABEL(label), GTK_JUSTIFY_LEFT);
   gtk_table_attach(GTK_TABLE(table), label, 0, 1, 1, 2,
                    0, 0, 0, 0);
   gtk_widget_show(label);*/

   /* Second column: */
   proto_combo = gtk_combo_new();
 /*  gtk_entry_set_text(GTK_ENTRY(GTK_COMBO(proto_combo)->entry), 
                      ((crypt_proto*)crypt_proto_list->data)->name);*/
   gtk_entry_set_text(GTK_ENTRY(GTK_COMBO(proto_combo)->entry),"test1");
   gtk_editable_set_editable(GTK_EDITABLE(GTK_COMBO(proto_combo)->entry),
                             FALSE);
/*   for( iter = crypt_proto_list; iter != NULL; iter = iter->next ) {
      proto_list = g_list_append(proto_list,
                                 ((crypt_proto *)iter->data)->name);
   }*/
   gtk_combo_set_popdown_strings(GTK_COMBO (proto_combo), proto_list);
   g_list_free(proto_list);
   gtk_table_attach(GTK_TABLE(table), proto_combo, 1, 2, 0, 1,
                    0, 0, 0, 0);

   gtk_widget_set_size_request(proto_combo, 85, -1);
   gtk_widget_show(proto_combo);

   key_size_entry = gtk_entry_new();
   gtk_entry_set_max_length(GTK_ENTRY(key_size_entry), 5);
   gtk_entry_set_text(GTK_ENTRY(key_size_entry), "1024");
   gtk_table_attach(GTK_TABLE(table), key_size_entry, 1, 2, 1, 2,
                    0, 0, 0, 0);
   gtk_widget_set_size_request(key_size_entry, 85, -1);
   //gtk_widget_show(key_size_entry);
   /* End of 2x2 table */
   

   hbox = gtk_hbox_new(FALSE, 2);
   gtk_box_pack_end(GTK_BOX(vbox), hbox, 0, 0, 0);
   gtk_widget_show(hbox);

   button = gtk_button_new_with_label(_("Ok"));
   g_signal_connect(G_OBJECT(button), "clicked",
                    GTK_SIGNAL_FUNC(do_regen),NULL);
   gtk_box_pack_start(GTK_BOX(hbox), button, 0, 0, 0);
   gtk_widget_set_size_request(button, 100, -1);
   gtk_widget_show(button);
 
   button = gtk_button_new_with_label(_("Cancel"));
   g_signal_connect(G_OBJECT(button), "clicked",
                    GTK_SIGNAL_FUNC(config_cancel_regen), NULL);
   gtk_box_pack_start(GTK_BOX(hbox), button, 0, 0, 0);
   gtk_widget_set_size_request(button, 100, -1);
   gtk_widget_show(button);
   

   
   gtk_widget_show(regen_window);


}
void selection_made( GtkWidget      *clist,
                     gint            row,
                     gint            column,
                     GdkEventButton *event,
                     gpointer        data )
{
    gchar *text;

    /* Get the text that is stored in the selected row and column
     * which was clicked in. We will receive it as a pointer in the
     * argument text.
     */
    gtk_clist_get_text(GTK_CLIST(clist), row, column, &text);

    /* Just prints some information about the selected row */
    g_print("You selected row %d. More specifically you clicked in "
            "column %d, and the text in this cell is %s\n\n",
            row, column, text);
				
				sprintf(selected_name,"%s",text);

    return;
}

static GtkWidget * get_config_frame(GaimPlugin *plugin)
{
  GtkWidget *window1;
  GtkWidget *notebook1;
  GtkWidget *vbox1;
  GtkWidget *checkbutton1;
  GtkWidget *checkbutton2;
  GtkWidget *label1;
  GtkWidget *vbox2;
  GtkWidget *scrolledwindow1;
  GtkWidget *clist1;
 /* GtkWidget *label7;
  GtkWidget *label8;
  GtkWidget *label9;*/
  GtkWidget *hbox1;
  GtkWidget *button1;
  GtkWidget *button2;
  GtkWidget *label2;
  GtkWidget *vbox3;
  GtkWidget *hbox2;
  GtkWidget *checkbutton3;
  GtkWidget *vbox4;
  GtkWidget *hbox7;
  GtkWidget *checkbutton4;
  GtkWidget *hbox8;
  GtkWidget *label10;
  GtkWidget *entry1;
  GtkWidget *hbox9;
  GtkWidget *label11;
  GtkWidget *entry2;
  GtkWidget *label3;

		window1 = gtk_vbox_new(TRUE, 10);

		gtk_container_set_border_width (GTK_CONTAINER (window1), 5);

  notebook1 = gtk_notebook_new ();
  gtk_widget_show (notebook1);
  gtk_container_add (GTK_CONTAINER (window1), notebook1);

  vbox1 = gtk_vbox_new (FALSE, 0);
  gtk_widget_show (vbox1);
  gtk_container_add (GTK_CONTAINER (notebook1), vbox1);

  checkbutton1 = gtk_check_button_new_with_mnemonic (_("Auto encryption if buddy has plugin"));
  gtk_widget_show (checkbutton1);
  gtk_box_pack_start (GTK_BOX (vbox1), checkbutton1, FALSE, FALSE, 0);
  gtk_container_set_border_width (GTK_CONTAINER (checkbutton1), 10);

  checkbutton2 = gtk_check_button_new_with_mnemonic (_("Accept certificate automatically"));
  gtk_widget_show (checkbutton2);
  gtk_box_pack_start (GTK_BOX (vbox1), checkbutton2, FALSE, FALSE, 0);
  gtk_container_set_border_width (GTK_CONTAINER (checkbutton2), 10);

  label1 = gtk_label_new (_("Option"));
  gtk_widget_show (label1);
  gtk_notebook_set_tab_label (GTK_NOTEBOOK (notebook1), gtk_notebook_get_nth_page (GTK_NOTEBOOK (notebook1), 0), label1);

  vbox2 = gtk_vbox_new (FALSE, 0);
  gtk_widget_show (vbox2);
  gtk_container_add (GTK_CONTAINER (notebook1), vbox2);

  scrolledwindow1 = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_show (scrolledwindow1);
  gtk_box_pack_start (GTK_BOX (vbox2), scrolledwindow1, TRUE, TRUE, 0);
  gtk_scrolled_window_set_shadow_type (GTK_SCROLLED_WINDOW (scrolledwindow1), GTK_SHADOW_IN);
/*
  clist1 = gtk_clist_new (3);
  gtk_widget_show (clist1);
  gtk_container_add (GTK_CONTAINER (scrolledwindow1), clist1);
  gtk_container_set_border_width (GTK_CONTAINER (clist1), 10);
  gtk_clist_set_column_width (GTK_CLIST (clist1), 0, 80);
  gtk_clist_set_column_width (GTK_CLIST (clist1), 1, 80);
  gtk_clist_set_column_width (GTK_CLIST (clist1), 2, 80);
  gtk_clist_column_titles_show (GTK_CLIST (clist1));

  label7 = gtk_label_new (_("Name"));
  gtk_widget_show (label7);
  gtk_clist_set_column_widget (GTK_CLIST (clist1), 0, label7);

  label8 = gtk_label_new (_("Bits"));
  gtk_widget_show (label8);
  gtk_clist_set_column_widget (GTK_CLIST (clist1), 1, label8);

  label9 = gtk_label_new (_("Fingerprint"));
  gtk_widget_show (label9);
  gtk_clist_set_column_widget (GTK_CLIST (clist1), 2, label9);

  hbox1 = gtk_hbox_new (FALSE, 0);
  gtk_widget_show (hbox1);
  gtk_box_pack_start (GTK_BOX (vbox2), hbox1, FALSE, FALSE, 0);*/
  gchar *titles[3] = { "Name", "Bit","Fingerprint" };
  clist1 = gtk_clist_new_with_titles( 3, titles);
  gtk_signal_connect(GTK_OBJECT(clist1), "select_row",
                       GTK_SIGNAL_FUNC(selection_made),
                       NULL); 
  gtk_clist_set_shadow_type (GTK_CLIST(clist1), GTK_SHADOW_OUT);

  gtk_clist_set_column_width (GTK_CLIST(clist1), 0, 150);

    /* Add the CList widget to the vertical box and show it. */
  gtk_container_add(GTK_CONTAINER(scrolledwindow1), clist1);
  gtk_widget_show(clist1);
 	
		scan_cert((gpointer) clist1);
	 
		hbox1 = gtk_hbox_new (FALSE, 0);
  gtk_widget_show (hbox1);
  gtk_box_pack_start (GTK_BOX (vbox2), hbox1, FALSE, FALSE, 0);
  button1 = gtk_button_new_with_mnemonic (_("Generate new certificate"));
  g_signal_connect(G_OBJECT(button1), "clicked",
                    GTK_SIGNAL_FUNC(config_regen_key), NULL);
/*  g_signal_connect(G_OBJECT(button1), "clicked",
                    GTK_SIGNAL_FUNC(ssl_con), NULL);*/
  /*g_signal_connect(G_OBJECT(button1), "clicked",
                    GTK_SIGNAL_FUNC(create_req), NULL);
  gtk_widget_show (button1);*/
/*  gtk_signal_connect_object(GTK_OBJECT(button1), "clicked",
                              GTK_SIGNAL_FUNC(config_regen_key),
                              (gpointer) clist1);*/
  gtk_box_pack_start (GTK_BOX (hbox1), button1, FALSE, FALSE, 0);
  
  gtk_container_set_border_width (GTK_CONTAINER (button1), 10);

  button2 = gtk_button_new_with_mnemonic (_("Delete selected certificate"));

  g_signal_connect(G_OBJECT(button2), "clicked",
                    GTK_SIGNAL_FUNC(ssl_con1), NULL);
 	
  gtk_widget_show (button2);

  gtk_box_pack_start (GTK_BOX (hbox1), button2, FALSE, FALSE, 0);
  
  gtk_container_set_border_width (GTK_CONTAINER (button2), 10);




  label2 = gtk_label_new (_("Certificate"));
  gtk_widget_show (label2);
  gtk_notebook_set_tab_label (GTK_NOTEBOOK (notebook1), gtk_notebook_get_nth_page (GTK_NOTEBOOK (notebook1), 1), label2);

  vbox3 = gtk_vbox_new (FALSE, 0);
  gtk_widget_show (vbox3);
  gtk_container_add (GTK_CONTAINER (notebook1), vbox3);

  hbox2 = gtk_hbox_new (FALSE, 0);
  gtk_widget_show (hbox2);
  gtk_box_pack_start (GTK_BOX (vbox3), hbox2, FALSE, FALSE, 0);

  checkbutton3 = gtk_check_button_new_with_mnemonic (_("Use default CA"));
  gtk_widget_show (checkbutton3);
  gtk_box_pack_start (GTK_BOX (hbox2), checkbutton3, FALSE, FALSE, 0);
  gtk_container_set_border_width (GTK_CONTAINER (checkbutton3), 10);

  vbox4 = gtk_vbox_new (FALSE, 0);
  gtk_widget_show (vbox4);
  gtk_box_pack_start (GTK_BOX (vbox3), vbox4, FALSE, FALSE, 0);

  hbox7 = gtk_hbox_new (FALSE, 0);
  gtk_widget_show (hbox7);
  gtk_box_pack_start (GTK_BOX (vbox4), hbox7, FALSE, FALSE, 0);

  checkbutton4 = gtk_check_button_new_with_mnemonic (_("Use other CA"));
  gtk_widget_show (checkbutton4);
  gtk_box_pack_start (GTK_BOX (hbox7), checkbutton4, FALSE, FALSE, 0);
  gtk_container_set_border_width (GTK_CONTAINER (checkbutton4), 10);

  hbox8 = gtk_hbox_new (FALSE, 0);
  gtk_widget_show (hbox8);
  gtk_box_pack_start (GTK_BOX (hbox7), hbox8, TRUE, TRUE, 0);

  label10 = gtk_label_new (_("IP"));
  gtk_widget_show (label10);
  gtk_box_pack_start (GTK_BOX (hbox8), label10, TRUE, TRUE, 0);

  entry1 = gtk_entry_new ();
  gtk_widget_show (entry1);
  gtk_box_pack_start (GTK_BOX (hbox8), entry1, TRUE, TRUE, 0);

  hbox9 = gtk_hbox_new (FALSE, 0);
  gtk_widget_show (hbox9);
  gtk_box_pack_start (GTK_BOX (hbox7), hbox9, TRUE, TRUE, 0);

  label11 = gtk_label_new (_("Port"));
  gtk_widget_show (label11);
  gtk_box_pack_start (GTK_BOX (hbox9), label11, TRUE, TRUE, 0);

  entry2 = gtk_entry_new ();
  gtk_widget_show (entry2);
  gtk_box_pack_start (GTK_BOX (hbox9), entry2, TRUE, FALSE, 0);

  label3 = gtk_label_new (_("CA"));
  gtk_widget_show (label3);
  gtk_notebook_set_tab_label (GTK_NOTEBOOK (notebook1), gtk_notebook_get_nth_page (GTK_NOTEBOOK (notebook1), 2), label3);

 

		gtk_widget_show_all(window1);
  return window1;
}
static void new_conv_cb(GaimAccount *account,char *who){
				
				GaimConversation *conv;
			 gaim_debug(GAIM_DEBUG_MISC, "Isagq", "send_msg: %s\n", who);
			 conv = gaim_find_conversation_with_account(who,account);
				   if (conv == NULL) 
										{
      					conv = gaim_conversation_new(GAIM_CONV_IM, account, who);
   							}
	
		 //show_request_window();
			
}
static void init_pref(){
   gaim_prefs_add_none("/plugins/gtk");
   gaim_prefs_add_none("/plugins/gtk/isagq");
   
   //gaim_prefs_add_bool("/plugins/gtk/encrypt/accept_unknown_key", FALSE);

}
static gboolean
plugin_load(GaimPlugin *handle)
{	
			
    init_pref();
				init_cert();
			 //ssl_con1();
    void *conv_handle = gaim_conversations_get_handle();
/*  void *conn_handle = gaim_connections_get_handle();
    void *blist_handle = gaim_blist_get_handle();
    void *core_handle = gaim_get_core();*/	
				isagq_plugin_handle = handle;
	
    gaim_signal_connect(conv_handle, "sending-im-msg", isagq_plugin_handle,
            GAIM_CALLBACK(send_msg_cb), NULL);
    gaim_signal_connect(conv_handle, "receiving-im-msg", isagq_plugin_handle,
            GAIM_CALLBACK(recv_msg_cb), NULL);
    gaim_signal_connect(conv_handle, "conversation-created", isagq_plugin_handle,
            GAIM_CALLBACK(new_conv_cb), NULL);

	
	return TRUE;
	
}



static gboolean
plugin_unload(GaimPlugin *plugin)
{
	gaim_prefs_remove("/plugins/gtk/isagq");
	/*gaim_signal_disconnect(conv_handle, "conversation-created",
					plugin, GAIM_CALLBACK(timestamp_new_convo));
	gaim_signal_disconnect(conv_handle, "receiving-im-msg",
					plugin, GAIM_CALLBACK(timestamp_receiving_msg));
	gaim_signal_disconnect(conv_handle, "displaying-im-msg",
					plugin, GAIM_CALLBACK(timestamp_displaying_conv_msg));
	
	destroy_timer_list();*/
	return TRUE;
}

static GaimGtkPluginUiInfo ui_info =
{
	get_config_frame
};

static GaimPluginInfo info =
{
	GAIM_PLUGIN_MAGIC,
	GAIM_MAJOR_VERSION,
	GAIM_MINOR_VERSION,
	GAIM_PLUGIN_STANDARD,                             /**< type           */
	GAIM_GTK_PLUGIN_TYPE,                             /**< ui_requirement */
	0,                                                /**< flags          */
	NULL,                                             /**< dependencies   */
	GAIM_PRIORITY_DEFAULT,                            /**< priority       */

	PROJECT_PLUGIN_ID,                              /**< id             */
	N_("IsagQ"),                                  /**< name           */
	VERSION,                                          /**< version        */
	                                                  /**  summary        */
	N_("gaim with isagq."),
	                                                  /**  description    */
	N_("gaim with isagq."),
	"rachod <evangelion99@hotmail.com>",             /**< author         */
	GAIM_WEBSITE,                                     /**< homepage       */

	plugin_load,                                      /**< load           */
	plugin_unload,                                    /**< unload         */
	NULL,                                             /**< destroy        */

	&ui_info,                                         /**< ui_info        */
	NULL,                                             /**< extra_info     */
	NULL,	
	NULL
};

static void
init_plugin(GaimPlugin *plugin)
{
/*	 gaim_debug(GAIM_DEBUG_INFO, "project", "requesting key\n");
	gaim_prefs_add_none("/plugins/project");
	gaim_prefs_add_int("/plugins/project/interval", interval);*/
}

GAIM_INIT_PLUGIN(project, init_plugin, info)
