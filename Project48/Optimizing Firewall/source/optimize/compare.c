#include<stdio.h>
#include<string.h>
//function change string to integer
//argument is number in type string
int string2int(char *digit)
{
	int x = 0;
	while (*digit >= '0' && *digit <= '9')
	{
		x = (x*10)+(*digit-'0');
		digit=digit+1;
	}
	return x;
}
//function convert decimal to 8 bit binary
//argument is number to convert and pointer that will collect binary after convert
void dectobi(int number,char *bin){
	int remainder;
	//convert each bit
	if(number >= 128){
		strcat(bin,"1");
		number = number-128;
	}else{
		strcat(bin,"0");
	}
	if(number >= 64){
		strcat(bin,"1");
		number = number-64;
	}else{
		strcat(bin,"0");
	}
	if(number >= 32){
		strcat(bin,"1");
		number = number-32;
	}else{
		strcat(bin,"0");
	}
	if(number >= 16){
		strcat(bin,"1");
		number = number-16;
	}else{
		strcat(bin,"0");
	}
	if(number >= 8){
		strcat(bin,"1");
		number = number-8;
	}else{
		strcat(bin,"0");
	}
	if(number >= 4){
		strcat(bin,"1");
		number = number-4;
	}else{
		strcat(bin,"0");
	}
	if(number >= 2){
		strcat(bin,"1");
		number = number-2;
	}else{
		strcat(bin,"0");
	}
	if(number == 1){
		strcat(bin,"1");
		number = number-1;
	}else{
		strcat(bin,"0");
	}
}
//function cut ipaddress each segment
//argument is array number of ipaddress
//ipaddress and pointer that will collect binary after convert
int cutip(int i,char *ipaddress,char *binary){
	int sh = 0;
	char temp[4];
	temp[0] = '\0';
	int x = 0;
	//cut ipaddress for each segment
	while (ipaddress[i] != '.' && ipaddress[i] != '\0')
	{
		temp[x] = ipaddress[i];
		i = i+1;
		x = x+1;
	}
	temp[x] = '\0';
	sh = string2int(temp);
	dectobi(sh,binary);
	//if not last ipaddress segment call recursive
	if (ipaddress[i] == '.'){
		i = i+1;
		cutip(i,ipaddress,binary);
	}
}
//main function
//argument is 2 ipaddress and 1 subnetmask
//program will compare ipaddress bit by bit (number of bit to compare is subnetmask)
int main(int argc,char* argv[]){
	if(argc != 4)
		return;
	char *ipaddress1 = argv[1];
	char *ipaddress2 = argv[2];
	char binary1[50] = "";
	char binary2[50] = "";
	char *netmask;
	netmask = argv[3];
	int mask = 0;
	mask = string2int(netmask);
	int i = 0;
	int y = 0;
	cutip(i,ipaddress1,binary1);
	i = 0;
	y = 0;
	cutip(i,ipaddress2,binary2);
	//compare ipaddress
	for (y==0;y<mask;y++){
		if(binary1[y]!=binary2[y]){
			printf("notmatch");
			return;
		}
	}
	printf("match");
}
