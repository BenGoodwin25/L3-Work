#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <fcntl.h>

#define MAX_SIZE 32 //Because 32 is the size of DATA in TCP datagramme

int main(){
	//initialisation	
	struct sockaddr_in serveur;
	struct hostent *hp;
	char nom_recu[32],mess_recu[MAX_SIZE],mess_envoi[MAX_SIZE], tab[MAX_SIZE];
	int sock,cc,errno,i,j,n,l,d_sock,port;
	char ip[16];
	int longe,service;
	//configuration IP & port
	printf("Indiquez l'IP : ");
	scanf("%s",ip);
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
	read(sock,nom_recu,(sizeof(nom_recu)));
	printf("Le client a reçu comme nom de fichier : %s \n",nom_recu);
	//reception du fichier
	//FILE* fp=fopen(mess_recu,"w");
	int fd=open(nom_recu, O_WRONLY | O_CREAT | O_TRUNC,0777);
	if (fd==-1){//verification
		fprintf(stderr,"Error with file name");
		exit(1);
	}
	strcpy(mess_recu,"");//vidage du la variable par précaution
	int compteur=0;
	while(recv(sock,mess_recu,16,0) > 0){
		//fwrite(mess_recu,sizeof(char),1,fp);
		n=write(fd,mess_recu,16);
		compteur+=n;
	}
	//fclose(fp);//fermeture du fichier
	close(fd);
	strcpy(mess_recu,"");//vidage du la variable par précaution
	printf("Nombre de caractère recu = %i\n",compteur);
	//cc = read(sock,mess_recu,6);//reception du nombre de caractere
	//printf("Nombre de caractère envoyer ='%s' with %d\n",mess_recu,cc);
	close(sock);//fermeture
}
