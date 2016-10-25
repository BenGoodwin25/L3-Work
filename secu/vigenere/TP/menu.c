#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
  int boucle = 1;
  int choice;
  int key;
  char sourcename[24];
  char command[64];
  while(boucle == 1){
    choice=0;
    printf("################################################################\n");
    printf("#                                                              #\n");
	  printf("#               1 : Chiffrer avec Vigenere                     #\n");
    printf("#               2 : Dechiffrer avec Vigenere                   #\n");
    printf("#                                                              #\n");
    printf("################################################################\n");
    printf("Votre Choix :");
    scanf("%d", &choice);
    switch(choice){
    case 1:
      printf("Vous avez choisi de chiffrer avec Vigener, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      printf("Vous avez choisi de chiffrer %s, quel est la cle ? ", sourcename);
      scanf("%d",&key);
      sprintf(command, "./vigenere_encrypt %d < %s > cipher%s", key, sourcename, sourcename);
      system(command);
      break;
    case 2:
      printf("Vous avez choisi de dechiffrer avec vigenere, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      printf("Vous avez choisi de dechiffrer %s, quel est la cle ? ", sourcename);
      scanf("%d",&key);
      sprintf(command, "./vigenere_decrypt %d < %s > plain%s", key, sourcename, sourcename);
      system(command);
      break;
    default:
      printf("Restart menu and choose a number between 1 and 2");
      choice=0;
      break;
    }
  }
}
