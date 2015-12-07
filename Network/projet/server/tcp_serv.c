#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <fcntl.h>

#define MAX_SIZE 32 //32 because 32 is the size of DATA in TCP datagramme


int main(){
	//initialisation
	char nom_envoi[32],mess_recu[MAX_SIZE],mess_envoi[MAX_SIZE],nom[32];
	int pp,d_sock,cc,l,port;
	int longe,service;
	char tab[128];
	struct sockaddr_in serveur = {AF_INET};
	struct sockaddr_in client;
	//configuration du port
	printf("Indiquez le numéro de port : ");
	scanf("%i",&port);
	//configuration du Socket
	serveur.sin_port=port;
	serveur.sin_family=AF_INET;
	serveur.sin_addr.s_addr=INADDR_ANY;
	d_sock=socket(AF_INET,SOCK_STREAM,0);
	//launch socket
	pp=bind(d_sock,(struct sockaddr*)&serveur,sizeof(serveur));
	printf("Server ready\n");
	//waiting for a connection
	l=listen(d_sock,1);
	longe=sizeof(struct sockaddr_in);
	service=accept(d_sock,(struct sockaddr *)&client,&longe);
	printf("Connected\n");
	//envoi du nom de fichier
	printf("Le nom du fichier : ");
	scanf("%s",nom);
	strcpy(nom_envoi,nom);
	cc=write(service,nom_envoi,sizeof(nom_envoi));
	printf("message envoyer : %s\n",nom_envoi);
	//envoi du fichier
	//FILE* fp=fopen(nom,"r");
	int fd=open(nom,O_RDONLY);
	int compteur=0;
	//verification fichier
	if(fd==-1){
		fprintf(stderr,"File not Found\n");
		exit(1);
	}
	//envoi
	strcpy(mess_envoi,"");
	while(read(fd,mess_envoi,16)>0){
		//fread(mess_envoi,sizeof(char),1,fp);
		cc=send(service,mess_envoi,16,0);
		compteur+=cc;
	}
	//fermeture fichier
	//fclose(fp);
	close(fd);
	//envoi de la taille
	strcpy(mess_envoi,"");
	sprintf(mess_envoi,"%d",compteur);
	//write(service,mess_envoi,6);
	printf("Nombre de caractère envoyer ~= %s\n",mess_envoi);
	//fermeture socket
	close(d_sock);
}
