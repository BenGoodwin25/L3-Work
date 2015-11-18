#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

int main(){
	
	char mess_recu[BUFSIZ],mess_envoi[BUFSIZ];
	int pp,d_sock,cc,l;
	int longe,service;
	char tab[128];
	
	struct sockaddr_in serveur = {AF_INET};
	struct sockaddr_in client;
	
	serveur.sin_port=2000;
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
	strcpy(mess_envoi,"zerg-rush.jpg");
	cc=write(service,mess_envoi,sizeof(mess_envoi));
	printf("message envoyer : %s\n",mess_envoi);
	
	//envoi du fichier
	FILE* fp=fopen("zerg-rush.jpg","r");
	while(!feof(fp)){
		fread(&mess_envoi,sizeof(char),1,fp);
		cc=write(service,&mess_envoi,sizeof(mess_envoi));
	}
	close(fp);
	close(d_sock);
}
