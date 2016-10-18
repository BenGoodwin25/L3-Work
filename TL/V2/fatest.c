#include "fa.h"

int main(){
  //TODO demonstration pour chaque fonction : MENU
  //printf("TP2\n");
  struct fa tomate;
  /*
  //2.1
  fa_create(&tomate,2,5);
  //2.3
  fa_set_state_initial(&tomate, 0);
  fa_set_state_initial(&tomate, 1);
  fa_set_state_final(&tomate, 4);
  //2.4
  fa_add_transition(&tomate, 0, 'a', 1);
  fa_add_transition(&tomate, 0, 'a', 2);
  fa_add_transition(&tomate, 0, 'a', 3);
  fa_add_transition(&tomate, 1, 'b', 3);
  fa_add_transition(&tomate, 2, 'a', 3);
  fa_add_transition(&tomate, 2, 'b', 4);
  fa_add_transition(&tomate, 3, 'a', 3);
  fa_add_transition(&tomate, 3, 'b', 4);
  fa_add_transition(&tomate, 4, 'a', 4);
  //2.5
  fa_pretty_print(&tomate, stdout);
  //3.1
  //fa_remove_state(&tomate, 2);

  //fa_make_complete(&tomate);
  //printf("Number of transitions : %zu\n",fa_count_transitions(&tomate));
  fa_merge_states(&tomate,0,4);
  fa_pretty_print(&tomate, stdout);
  */
  size_t states,alphas;
  int loop=1,loop2,choice;
  bool fa_created=false;
  printf("################################################################\n");
  printf("#                                                              #\n");
  printf("#                     TL fa-manager(0.3.7)                     #\n");
  printf("#                                                              #\n");
  printf("# !!! Warning there is no input check, follow instructions !!! #\n");
  printf("#                                                              #\n");
  printf("################################################################\n");
  while(loop == 1){
    choice=0;
    printf("################################################################\n");
    printf("#                                                              #\n");
	  printf("#               1 : Create Automate                            #\n");
    printf("#               2 : Modify Automate                            #\n");
    printf("#               3 : Delete Automate                            #\n");
    printf("#               4 : Quit (and delete Automate)                 #\n");
    printf("#                                                              #\n");
    printf("################################################################\n");
    printf("Your Choice :");
    scanf("%d", &choice);
    switch(choice){
      case 1:
        printf("How many states do you want ?");
        scanf("%d",&states);
        printf("How many alpha's do you want ?");
        scanf("%d",&alphas);
        fa_create(&tomate,alphas,states);
        fa_created=true;
        break;
      case 2:
        loop2=1;
        int choice2;
        while(loop2==1) {
          printf("################################################################\n");
          printf("#                                                              #\n");
          printf("#               1 : Add Transitions                            #\n");
          printf("#               2 : ...                            #\n");
          printf("#               3 : ...                            #\n");
          printf("#               4 : Go Back                                    #\n");
          printf("#                                                              #\n");
          printf("################################################################\n");
          choice2 = 0;
          printf("Your Choice :");
          scanf("%d", &choice2);
          switch (choice2) {
            case 1:
              printf("How many states do you want ?");
              scanf("%d", &states);

              break;
            case 2:
              printf("How many states do you want ?");
              scanf("%d", &states);
              choice2 = 0;
              break;
            case 4:
              loop2 = 0;
              break;
            default:
              printf("Restart menu and choose a number between 1 and 4\n");
              choice2 = 0;
              break;
          }
        }
        choice=0;
        break;
      case 3:
        printf("Suppression en cours\n");
        fa_created=false;
        fa_destroy(&tomate);
        choice=0;
        break;
      case 4:
        printf("Exiting ...\n");
        fa_destroy(&tomate);
        loop=0;
        break;
      default:
        printf("Restart menu and choose a number between 1 and 4\n");
        choice=0;
        break;
    }
  }
}
