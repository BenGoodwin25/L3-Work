#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

#define MAX_SIZE 32 //32 because 32 is the size of DATA in TCP datagramme


int main(){
	
	char mess_recu[BUFSIZ],mess_envoi[BUFSIZ];
	int pp,d_sock,cc,l;
	int longe,service;
	char tab[128];
	
	struct sockaddr_in serveur = {AF_INET};
	struct sockaddr_in client;
	
	serveur.sin_port=2004;
	serveur.sin_family=AF_INET;
	serveur.sin_addr.s_addr=INADDR_ANY;
	d_sock=socket(AF_INET,SOCK_STREAM,0);
	
	pp=bind(d_sock,(struct sockaddr*)&serveur,sizeof(serveur));
	printf("Server ready\n");

	l=listen(d_sock,1);
	longe=sizeof(struct sockaddr_in);
	service=accept(d_sock,(struct sockaddr *)&client,&longe);
	printf("Accept =%d\n",service);
	//Reception de la confirmation

	read(service,mess_recu,BUFSIZ);
	printf("Le serveur a recu : %s\n",mess_recu);
	//envoi du nom de fichier
	strcpy(mess_envoi,"sample.avi");
	cc=write(service,mess_envoi,sizeof(mess_envoi));
	printf("message envoyer : %s\n",mess_envoi);
	//envoi du fichier
	FILE* fp=fopen("sample.avi","r");
	if(fp==NULL){
		fprintf(stderr,"File not Found\n");
		exit(1);
	}else{
		while(!feof(fp)){
			fread(mess_envoi,sizeof(char)*MAX_SIZE,MAX_SIZE,fp);
			cc=write(service,mess_envoi,sizeof(mess_envoi));
		}
		fclose(fp);
	}
	close(d_sock);
}