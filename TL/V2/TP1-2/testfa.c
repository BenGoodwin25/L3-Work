#include "fa.h"

int main(){
  struct fa tomate;
  size_t states,alphas;
  int loop=1,loop2,example,choice;
  bool fa_created=false;
  printf("################################################################\n");
  printf("#                                                              #\n");
  printf("#                     TL fa-manager(0.3.7)                     #\n");
  printf("#                                                              #\n");
  printf("# !!! Warning there is no input check, follow instructions !!! #\n");
  printf("#       !!! Do not put any letter when not prompt to !!!       #\n");
  printf("#                                                              #\n");
  printf("################################################################\n");
  while(loop == 1){
    printf("################################################################\n");
    printf("#                                                              #\n");
	  printf("#               1 : Create Automate                            #\n");
    printf("#               2 : Display Automate                           #\n");
    printf("#               3 : Modify Automate                            #\n");
    printf("#               4 : Delete Automate                            #\n");
    printf("#               5 : Quit (and delete Automate)                 #\n");
    printf("#                                                              #\n");
    printf("################################################################\n");
    printf("Your Choice :");
    scanf("%d", &choice);
    switch(choice){
      case 1:
        if(fa_created==true){
          printf("Automate already created, destroy it before creating a other one\n");
        } else {
          printf("Do you want a example automate (from the TP subject) ?(1/0)");
          scanf("%d", &example);
          if (example==1) {
            fa_create(&tomate,2,5);

            fa_set_state_initial(&tomate, 0);
            fa_set_state_initial(&tomate, 1);
            fa_set_state_final(&tomate, 4);

            fa_add_transition(&tomate, 0, 'a', 1);
            fa_add_transition(&tomate, 0, 'a', 2);
            fa_add_transition(&tomate, 0, 'a', 3);
            fa_add_transition(&tomate, 1, 'b', 3);
            fa_add_transition(&tomate, 2, 'a', 3);
            fa_add_transition(&tomate, 2, 'b', 4);
            fa_add_transition(&tomate, 3, 'a', 3);
            fa_add_transition(&tomate, 3, 'b', 4);
            fa_add_transition(&tomate, 4, 'a', 4);
          } else {
            printf("How many states do you want ?");
            scanf("%zu", &states);
            printf("How many alpha's do you want ?");
            scanf("%zu", &alphas);
            fa_create(&tomate, alphas, states);
          }
          fa_created = true;
        }
        break;
      case 2:
        if(fa_created==false){
          printf("No Automate has been created, create it before displaying it\n");
        } else {
          printf("The Automate has %zu transition(s)\n",fa_count_transitions(&tomate));
          if(fa_is_deterministic(&tomate)) {
            printf("The Automate is deterministic\n");
          }else{
            printf("The Automate isn't deterministic\n");
          }
          if(fa_is_complete(&tomate)) {
            printf("The Automate is complete\n");
          }else{
            printf("The Automate isn't complete\n");
          }
          fa_pretty_print(&tomate,stdout);

        }
        break;
      case 3:
        loop2=1;
        int choice2;
        size_t s1,s2;
        char alpha;
        if(fa_created==false){
          printf("No Automate has been created, create it before modifying it\n");
        } else {
          while(loop2==1) {
            printf("################################################################\n");
            printf("#                                                              #\n");
            printf("#               1 : Add Transition                             #\n");
            printf("#               2 : Remove Transition                          #\n");
            printf("#               3 : Add Initial State                          #\n");
            printf("#               4 : Add Final State                            #\n");
            printf("#               5 : Make Complete                              #\n");
            printf("#               6 : Merge States                               #\n");
            printf("#               7 : Remove State                               #\n");
            printf("#               8 : Go Back                                    #\n");
            printf("#                                                              #\n");
            printf("################################################################\n");
            choice2 = 0;
            printf("Your Choice :");
            scanf("%d", &choice2);
            switch (choice2) {
              case 1:
                printf("State from ?(0,1,...)");
                scanf("%zu", &s1);
                printf("With which letter ?(a,b,...)");
                scanf("%s", &alpha);
                printf("State to ?(0,1,...)");
                scanf("%zu", &s2);
                fa_add_transition(&tomate,s1,alpha,s2);
                break;
              case 2:
                printf("State from ?(0,1,...)");
                scanf("%zu", &s1);
                printf("With which letter ?(a,b,...)");
                scanf("%s", &alpha);
                printf("State to ?(0,1,...)");
                scanf("%zu", &s2);
                fa_remove_transition(&tomate,s1,alpha,s2);
                break;
              case 3:
                printf("Initial state ?(0,1,...)");
                scanf("%zu", &s1);
                fa_set_state_initial(&tomate,s1);
                break;
              case 4:
                printf("Final state ?(0,1,...)");
                scanf("%zu", &s1);
                fa_set_state_final(&tomate,s1);
                break;
              case 5:
                printf("Completing ...\n");
                fa_make_complete(&tomate);
                break;
              case 6:
                printf("First State to merge ?(0,1,...)");
                scanf("%zu", &s1);
                printf("Second State to merge ?(0,1,...)");
                scanf("%zu", &s2);
                fa_merge_states(&tomate,s1,s2);
                break;
              case 7:
                printf("State to remove ?(0,1,...)");
                scanf("%zu", &s1);
                fa_remove_state(&tomate,s1);
                break;
              case 8:
                loop2 = 0;
                break;
              default:
                printf("Restart menu and choose a number between 1 and 8\n");
                loop2=0;
                break;
            }
          }
        }
        break;
      case 4:
        if(fa_created==false){
          printf("No Automate has been created, create it before deleting it\n");
        } else {
          printf("Deleting ...\n");
          fa_created = false;
          fa_destroy(&tomate);
        }
        break;
      case 5:
        printf("Exiting ...\n");
        if(fa_created==true){
          fa_destroy(&tomate);
        }
        loop=0;
        break;
      default:
        printf("Restart menu and choose a number between 1 and 5\n");
        loop=0;
        break;
    }
  }
  return 0;
}
