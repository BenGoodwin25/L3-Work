#include "main.h"

int main(){
	char option[80];
	printf("t\n");
	std::vector<CClient> aClient;
	printf("What do you want to do ?(help for list)\n");
	scanf("%s",&option);
	aClient.push_back(CClient("Jean","Bon","Besancon","0632"));
	printf("Number of Clients :%d\n",aClient.size());
}
