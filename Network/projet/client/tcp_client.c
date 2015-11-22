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
	int sock,cc,errno,i,j,n,l,d_sock,port;
	char ip[16];
	int longe,service;


	printf("Indiquez l'IP : ");
	scanf("%s",&ip);
	hp=gethostbyname(ip);
	memcpy(&serveur.sin_addr,hp->h_addr,hp->h_length);
	printf("Indiquez le numéro de port : ");
	scanf("%i",&port);

	serveur.sin_port=port;
	serveur.sin_family=AF_INET;
	sock=socket(AF_INET,SOCK_STREAM,0);

	printf("Client ready\n");
	l=connect(sock,(struct sockaddr *)&serveur,sizeof(serveur));
	if(l==-1){
		fprintf(stderr,"Connexion non établi, essayer de changer de port ou vérifier l'IP\n");
		exit(1);
	}else{
		printf("Connected\n");
		//reception du nom de fichier
		read(sock,mess_recu,(sizeof(mess_recu)));
		printf("Le client a reçu comme nom de fichier : %s \n",mess_recu);
		//reception du fichier
		FILE* fp=fopen(mess_recu,"w");
		if (fp==NULL){
			fprintf(stderr,"Error with file name");
			exit(1);
		}else{
			strcpy(mess_recu,"");
			n = read(sock,mess_recu,sizeof(mess_recu));
			while(n > 0){
				fwrite(mess_recu,sizeof(char)*MAX_SIZE,MAX_SIZE,fp);
				n = read(sock,mess_recu,sizeof(mess_recu));
			}
			fclose(fp);
		}
	}
	close(sock);
}
