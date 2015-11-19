#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

#define MAX_SIZE 32 //Because 32 is the size of DATA in TCP datagramme

int main(){
	
	struct sockaddr_in serveur;
	struct hostent *hp;
	char mess_recu[BUFSIZ],mess_envoi[BUFSIZ], tab[BUFSIZ];
	int sock,cc,errno,i,j,n,l,d_sock;
	int longe,service;

	hp=gethostbyname("127.0.0.1");
	memcpy(&serveur.sin_addr,hp->h_addr,hp->h_length);
	serveur.sin_port=2004;
	serveur.sin_family=AF_INET;
	sock=socket(AF_INET,SOCK_STREAM,0);

	printf("Server ready\n");
	l=connect(sock,(struct sockaddr *)&serveur,sizeof(serveur));
	
	printf("connected%d\n",l);
	//Confirmation de recuperation
	strcpy(mess_envoi,"Oui je veux mes données");
	cc=write(sock,mess_envoi,BUFSIZ);
	printf("Client a envoyer : %s\n",mess_envoi);
	//reception du nom de fichier
	read(sock,mess_recu,(sizeof(mess_recu)));
	printf("Le client a reçu comme nom de fichier : %s \n",mess_recu);
	//reception du fichier
	FILE* fp=fopen(mess_recu,"w");
	strcpy(mess_recu,"");
	n = read(sock,&mess_recu,sizeof(mess_recu));
	while(n > 0){
		fwrite(mess_recu,sizeof(char)*32,32,fp);
		n = read(sock,mess_recu,sizeof(mess_recu));
	}
	fclose(fp);
	close(sock);
}
