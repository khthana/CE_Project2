#include "linklist.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



NODE *init_list(void)
{
	NODE *list;
	//char *temp[] = {"1","2","3","4","11","17","18","19"};
	char *temp[] = {"1","2","3","4","11","17","19"};
	int length = 7;
	int i;
	int duplicate;


	if ((list = (NODE *) malloc(sizeof(NODE))) == NULL)
	{
		printf("Fatal malloc error in main\n");
		exit(1);
	}
	list->data[0] = '\0';

	if((list->next = (NODE *)malloc(sizeof(NODE))) == NULL)
	{
		printf("Fatal malloc error in main\n");
		exit(2);
	}

	list->next->data[0] = DUMMY_TRAILER;
	list->next->data[1] = '\0';
	list->next->next = NULL;

	for(i =0 ; i< length ; i++)
	{
		duplicate = Insert2(list,temp,i);
		if(duplicate)
		{
			printf("This name is already used\n");
		}
	}

	return list;
}

int Insert(NODE *list,char *string)
{
	NODE *current = list->next;
	NODE *previous = list;
	NODE *newnode;

	while (strcmp(string,current->data) > 0)
	{
		previous = current;
		current = current->next;
	}
	if (strcmp(string,current->data) == 0)
	{
		return DUPLICATE;
	}
	else
	{
		newnode = (NODE *)malloc(sizeof(NODE));
		strcpy(newnode->data,string);
		newnode->next=current;
		previous->next = newnode;
		return NEW_NODE;
	}
/*	if ( (newnode = (NODE *) malloc(sizeof(NODE))) == NULL);
	{
		printf("Fatal malloc error in Insert()\n");
		exit(3);	
	}
*/	

}

int Insert2(NODE *list,char *string[],int i)
{
	NODE *current = list->next;
	NODE *previous = list;
	NODE *newnode;

	while (strcmp(string[i],current->data) > 0)
	{
		previous = current;
		current = current->next;
	}
	if (strcmp(string[i],current->data) == 0)
	{
		return DUPLICATE;
	}
	else
	{
		newnode = (NODE *)malloc(sizeof(NODE));
		strcpy(newnode->data,string[i]);
		//strcpy(newnode->status,"online");
		strcpy(newnode->ip,"xxx.yyy.zzz.aaa");
		newnode->next=current;
		previous->next = newnode;
		return NEW_NODE;
	}
}


int Delete(NODE *list,char *string)
{
	NODE *current = list->next;
	NODE *previous = list;

	while(strcmp(string,current->data) > 0)
	{
		previous = current;
		current = current->next;
	}
	if (strcmp(string,current->data) !=0)
	{
		return NOT_FOUND;
	}
	else
	{
		previous->next = current->next;
		free(current);
		return FOUND;
	}
}



void traverse(NODE *list)
{
	list = list->next;
	while(list->data[0] != DUMMY_TRAILER)
	{
		fprintf(stderr,"In the Link list  %s\n",list->data);
		list = list->next;
	}
}

int find(NODE *list,char *string)
{
	NODE *current = list->next;
	NODE *previous = list;

	while(strcmp(string,current->data) > 0)
	{
		previous = current;
		current = current->next;
	}
	if (strcmp(string,current->data) !=0)
		return NOT_FOUND;
	else
		return FOUND;
}

NODE *getNode(NODE *list,char *string)
{
	NODE *current = list->next;
	NODE *previous = list;

	while(strcmp(string,current->data) > 0)
	{
		previous = current;
		current = current->next;
	}
	if (strcmp(string,current->data) !=0)
		return NULL;
	else
		return current;
}


void find_online(NODE *link,char *string ,char status[],char ip[])
{
	NODE *current = link->next;
	NODE *previous = link;

	while(strcmp(string,current->data) > 0)
	{
		previous = current;
		current = current->next;
	}
	if (strcmp(string,current->data) !=0)
	{
		//return list;
		strcpy(status,"F");
		strcpy(ip,"-");
	}
	else 
	{
		//return current;
		strcpy(status,"O");
		strcpy(ip,current->ip);

	}

}


