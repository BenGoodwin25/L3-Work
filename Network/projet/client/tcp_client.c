#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

#define MAX_SIZE 32 //Because 32 is the size of DATA in TCP datagramme

int main(){
	//initialisation	
	struct sockaddr_in serveur;
	struct hostent *hp;
	char mess_recu[MAX_SIZE],mess_envoi[MAX_SIZE], tab[MAX_SIZE];
	int sock,cc,errno,i,j,n,l,d_sock,port;
	char ip[16];
	int longe,service;
	//configuration IP & port
	printf("Indiquez l'IP : ");
	scanf("%s",&ip);
	hp=gethostbyname(ip);
	memcpy(&serveur.sin_addr,hp->h_addr,hp->h_length);
	printf("Indiquez le numéro de port : ");
	scanf("%i",&port);
	//configuration socket
	serveur.sin_port=port;
	serveur.sin_family=AF_INET;
	sock=socket(AF_INET,SOCK_STREAM,0);
	//connexion au serveur
	printf("Client ready\n");
	l=connect(sock,(struct sockaddr *)&serveur,sizeof(serveur));
	if(l==-1){//verification de la connexion établi
		fprintf(stderr,"Connexion non établi, essayer de changer de port ou vérifier l'IP\n");
		exit(1);
	}
	printf("Connected\n");
	//reception du nom de fichier
	read(sock,mess_recu,(sizeof(mess_recu)));
	printf("Le client a reçu comme nom de fichier : %s \n",mess_recu);
	//reception du fichier
	FILE* fp=fopen(mess_recu,"w");
	if (fp==NULL){//verification
		fprintf(stderr,"Error with file name");
		exit(1);
	}
	strcpy(mess_recu,"");//vidage du la variable par précaution
	n = read(sock,mess_recu,sizeof(mess_recu));
	int compteur=0+n;
	while(n > 0){
		fwrite(mess_recu,sizeof(char),MAX_SIZE,fp);
		n = read(sock,mess_recu,sizeof(mess_recu));
		compteur+=n;
	}
	fclose(fp);//fermeture du fichier
	read(sock,mess_recu,sizeof(mess_recu));//reception du nombre de caractere
	printf("Nombre de caractère envoyer =%s\n",mess_recu);
	printf("Nombre de caractère recu = %i\n",compteur-MAX_SIZE);
	close(sock);//fermeture
}
