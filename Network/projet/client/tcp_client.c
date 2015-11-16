#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

int main(){
	
	struct sockaddr_in serveur;
	struct hostent *hp;
	char mess_recu[BUFSIZ],mess_envoi[BUFSIZ], tab[BUFSIZ];
	int sock,cc,errno,i,j,n,l,d_sock;
	int longe,service;

	hp=gethostbyname("127.0.0.1");
	memcpy(&serveur.sin_addr,hp->h_addr,hp->h_length);
	serveur.sin_port=2008;
	serveur.sin_family=AF_INET;
	sock=socket(AF_INET,SOCK_STREAM,0);

	printf("Client ready\n");
	l=connect(sock,(struct sockaddr *)&serveur,sizeof(serveur));
	
	printf("connected%d\n",l);
	//Confirmation de recuperation
	strcpy(mess_envoi,"Oui je veux mes dadas");
	cc=write(sock,mess_envoi,BUFSIZ);
	printf("Client a envoyer %s\n",mess_envoi);
	//reception du nom de fichier
	read(sock,mess_recu,(sizeof(mess_recu)));
	printf("Le client a reçu comme nom de fichier : %s \n",mess_recu);
	//reception du fichier
	FILE* fp=fopen(mess_recu,"w");
	read(sock,mess_recu,(sizeof(mess_recu)));
	printf("Le client a reçu : %s \n",mess_recu);
	fprintf(fp,mess_recu);
	close(sock);
}
