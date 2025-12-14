#include<openssl/rsa.h>
#include<openssl/pem.h>
extern int cstr_to_bytes(unsigned char *bytes, unsigned char *cstr, int num);
int check_cert(const char *who){

	FILE *fp;
	char buddy_cert[255];
	sprintf(buddy_cert,"%s/cert/[CE]%s.pem",gaim_user_dir(),who);
	//perror(buddy_cert);
	if(!(fp=fopen(buddy_cert,"r"))){
	
	return 0;
	}
	fclose(fp);
	return 1;
}

 void buddy_cert_file(const char *who,char directory[255],int type){
					if(type==0){
			
					sprintf(directory,"%s/cert/[PK]%s.pem",gaim_user_dir(),who);
					}
					else if(type==1){
					sprintf(directory,"%s/cert/[PV]%s.pem",gaim_user_dir(),who);
					}
					else if(type==2){
					sprintf(directory,"%s/cert/[CR]%s.pem",gaim_user_dir(),who);
					}		
					else  //type ==3
					sprintf(directory,"%s/cert/[CE]%s.pem",gaim_user_dir(),who);
					//return directory;
}
/*void make_key(const char *user,int length){
					char directory[255];
					RSA *rsa_key = NULL;
					rsa_key=RSA_generate_key(length,RSA_F4,NULL,NULL);
					if(rsa_key == NULL)
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "RSA key null");
					buddy_cert_file(user,directory,0);
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "Gaim key file is: %s\n",directory);
					FILE *fp;
					if(!(fp=fopen(directory,"w+")))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not open dir");
					PEM_write_RSAPublicKey(fp, rsa_key);
					fclose(fp);
					buddy_cert_file(user,directory,1);
					if(!(fp=fopen(directory,"w+")))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not open dir");
					PEM_write_RSAPrivateKey(fp, rsa_key, NULL, NULL, 0, NULL, NULL);
					fclose(fp);			


					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "out of make_key");
}*/
int bytes_to_str(unsigned char *str,unsigned char *bytes,int num){
					int bytes_cursor = 0,str_cursor = 0 ;
	
					while(bytes_cursor < num){
										sprintf(str+str_cursor,"%02x",bytes[bytes_cursor++]);
										str_cursor +=2;
					}
					return str_cursor;
}

/*void public_encrypt(char *message){
					RSA *pub_key,*priv_key;
					FILE *fp;
					unsigned char text[255];
					unsigned char  *ciphertext,*plain_text;
					unsigned char  *cipher_str;
					unsigned char buf[500];
					int ciphersize,i;

					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "msg is %s \n",message);
				
 				sprintf(text,"hello na ja");
					if(!(fp=fopen("/root/.gaim/cert/isagmq@hotmail.com.pub","r")))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not open dir");
					if(!(pub_key=PEM_read_RSAPublicKey(fp, NULL, NULL, NULL)))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not read key");
					int size = RSA_size(pub_key);
					ciphertext=g_malloc(size);
					
				 ciphersize=RSA_public_encrypt(strlen(message),message,	ciphertext,pub_key,RSA_PKCS1_PADDING);
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "out of encrypted function is %x \n",ciphertext);
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "msg size %d \n",strlen(message));
					fclose(fp);
					cipher_str=g_malloc(ciphersize);
					int len;
					len=bytes_to_str(cipher_str,ciphertext,ciphersize);
					fp=fopen("/root/.gaim/cert/cipher","w+");
				 fprintf(fp,"%s",cipher_str);
					fclose(fp);
					//cipher_str=buf;
					fp=fopen("/root/.gaim/cert/cipher","r");
					while ((i = fread(buf, 1, sizeof(buf), fp)) > 0)
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "file in buffer is is %s \n",buf);
					cipher_str=buf;
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "file in buffer is is %s \n",cipher_str);
					fclose(fp);
//////decrypt	
				unsigned char *cipher_str_decode;
						int length;
					length=strlen(buf);
					cipher_str_decode = g_malloc(length);
					int len2 = cstr_to_bytes(cipher_str_decode,cipher_str,length);

				if(!(fp=fopen("/root/.gaim/cert/isagmq@hotmail.com.priv","r")))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not open dir");
					if(!(priv_key=PEM_read_RSAPrivateKey(fp, NULL, NULL, NULL)))
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "could not read key");									
					int text_len = RSA_size(priv_key);
					plain_text=g_malloc(text_len); 

					RSA_private_decrypt(len2,cipher_str_decode,plain_text,priv_key,RSA_PKCS1_PADDING);
				
					gaim_debug(GAIM_DEBUG_INFO, "Isagq", "out of decrypted function is %s \n",plain_text);
					
					fclose(fp);
					g_free(ciphertext);
					g_free(plain_text);
}
*/







