#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
  int boucle = 1;
  int choice;
  char key[26];
  char sourcename[24];
  char command[64];
  while(boucle == 1){
    choice=0;
    printf("################################################################\n");
    printf("#                                                              #\n");
	  printf("#               1 : Chiffrer avec Substitution                 #\n");
    printf("#               2 : Dechiffrer avec Substitution               #\n");
    printf("#               3 : Decrypter Cesar (Analyse Freq. & Manuel)   #\n");
    printf("#                                                              #\n");
    printf("################################################################\n");
    printf("Votre Choix :");
    scanf("%d", &choice);
    switch(choice){
    case 1:
      printf("Vous avez choisi de chiffrer avec Substitution, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      printf("Vous avez choisi de chiffrer %s, quel est la clé ? ", sourcename);
      scanf("%s",&key);
      sprintf(command, "./subst_encrypt %s < %s > cipher%s", key, sourcename, sourcename);
      system(command);
      break;
    case 2:
      printf("Vous avez choisi de dechiffrer avec Substitution, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      printf("Vous avez choisi de dechiffrer %s, quel est la clé ? ", sourcename);
      scanf("%s",&key);
      sprintf(command, "./subst_decrypt %s < %s > plain%s", key, sourcename, sourcename);
      system(command);
      break;
    case 3:
      printf("Vous avez choisi de Decrypter cesar en Brute Force, quel est le nom de votre fichier ? ");
      scanf("%s",&sourcename);
      sprintf(command, "./subst_break < %s",sourcename);
      system(command);
      break;
    default:
      printf("Restart menu and choose a number between 1 and 3");
      choice=0;
      break;
    }
  }
}
