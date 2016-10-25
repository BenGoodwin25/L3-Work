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
	  printf("#               1 : Chiffrer avec cesar                        #\n");
    printf("#               2 : Dechiffrer avec cesar                      #\n");
    printf("#               3 : Decrypter Cesar (Brute Force)              #\n");
    printf("#               4 : Decrypter Cesar (Analyse Freq.)            #\n");
    printf("#                                                              #\n");
    printf("################################################################\n");
    printf("Votre Choix :");
    scanf("%d", &choice);
    switch(choice){
    case 1:
      printf("Vous avez choisi de chiffrer avec cesar, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      printf("Vous avez choisi de chiffrer %s, quel est la clé ? ", sourcename);
      scanf("%d",&key);
      sprintf(command, "./caesar_encrypt %d < %s > cipher%s", key, sourcename, sourcename);
      system(command);
      break;
    case 2:
      printf("Vous avez choisi de dechiffrer avec cesar, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      printf("Vous avez choisi de dechiffrer %s, quel est la clé ? ", sourcename);
      scanf("%d",&key);
      sprintf(command, "./caesar_decrypt %d < %s > plain%s", key, sourcename, sourcename);
      system(command);
      break;
    case 3:
      printf("Vous avez choisi de Decrypter cesar en Brute Force, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      sprintf(command, "./caesar_break_brute_force.py %s",sourcename);
      system(command);
      break;
    case 4:
      printf("Vous avez choisi de Decrypter cesar avec Analyse Freq., quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      sprintf(command, "./caesar_break.py %s",sourcename);
      system(command);
      break;
    default:
      printf("Restart menu and choose a number between 1 and 3");
      choice=0;
      break;
    }
  }
}
