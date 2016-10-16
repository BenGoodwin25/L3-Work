#include "fa.h"

int main(){
  printf("TP1\n");
  /*
  struct fa tomate;
  //2.1
  fa_create(&tomate,2,5);
  //2.3
  fa_set_state_initial(&tomate, 0);
  fa_set_state_initial(&tomate, 1);

  fa_set_state_final(&tomate, 4);

  //fa_pretty_print(&tomate, stdout);//DEBUG
  //2.4
  fa_add_transition(&tomate, 0, 'a', 1);
  fa_add_transition(&tomate, 0, 'a', 2);
  fa_add_transition(&tomate, 0, 'a', 3);
  fa_add_transition(&tomate, 0, 'a', 1);
  fa_add_transition(&tomate, 1, 'b', 3);
  fa_add_transition(&tomate, 2, 'a', 3);
  fa_add_transition(&tomate, 2, 'b', 4);
  fa_add_transition(&tomate, 3, 'a', 3);
  fa_add_transition(&tomate, 3, 'b', 4);
  fa_add_transition(&tomate, 4, 'a', 4);

  //2.5
  fa_pretty_print(&tomate, stdout);
  //2.2
  fa_destroy(&tomate);
  fa_pretty_print(&tomate, stdout);
  */
  printf("TP2\n");
  struct fa tomate;
  //2.1
  fa_create(&tomate,2,5);
  //2.3
  fa_set_state_initial(&tomate, 0);
  fa_set_state_initial(&tomate, 1);
  fa_set_state_final(&tomate, 4);
  //2.4
  fa_add_transition(&tomate, 0, 'a', 1);
  fa_add_transition(&tomate, 0, 'a', 2);
  fa_add_transition(&tomate, 0, 'b', 3);
  fa_add_transition(&tomate, 1, 'a', 3);
  fa_add_transition(&tomate, 1, 'b', 3);
  fa_add_transition(&tomate, 2, 'a', 3);
  fa_add_transition(&tomate, 2, 'b', 4);
  fa_add_transition(&tomate, 3, 'a', 3);
  fa_add_transition(&tomate, 3, 'b', 4);
  fa_add_transition(&tomate, 4, 'a', 4);
 //2.5
  fa_pretty_print(&tomate, stdout);
  //3.1
  //fa_remove_state(&tomate, 0);
  //printf("Number of transitions : %zu\n",fa_count_transitions(&tomate));
  //printf("Is deterministic ? %i\n",fa_is_deterministic(&tomate));
  printf("Is complete ? %i\n",fa_is_complete(&tomate));
  //DEBUG
  //printf("%d",transitions_exist(&tomate, 0, 'a', 1));
  //printf("%zu\n",tomate.transitions[0][0].states[0]);
  //fa_pretty_print(&tomate, stdout);

  return 1;
}
