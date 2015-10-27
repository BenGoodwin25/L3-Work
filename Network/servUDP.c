#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <errno.h>

extern int errno;

#define NAME "/tmp/socket_udp"

int main(){
	int sock;
	int err;
	char chaine[100];
	
	struct sockaddr_un nom;
	struct sockaddr_un nomRecep;
	
	unsigned int tailNomRecep = sizeof(nomRecep);
	
	sock = socket(AF_UNIX, SOCK_DGRAM, 0);
	if(sock < 0){
		perror("Erreur a la creation de la socket");
		exit(0);
	}
	nom.sun_family = AF_UNIX;
	strcpy(nom.sun_path, NAME);
	
	err = bind(sock, (struct sockaddr*)&nom, sizeof(struct sockaddr_un));
	
	err = recvfrom(sock,chaine,100,0,(struct sockaddr *) &nomRecep, &tailNomRecep);

	if(err < 0){
		perror("Erreur dans le receive");
		unlink(NAME);
		exit(0);
	}
	
	printf("Voici la chaine recue : %s\n", chaine);
	
	unlink(NAME);
	close(sock);
}
