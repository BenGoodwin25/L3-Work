#include "fa.h"

int main(){
  printf("TP1 \n");
  struct fa tomate;
  fa_create(&tomate,2,5);
  fa_set_state_initial(&tomate, 0);
  fa_set_state_final(&tomate, 4);
  fa_pretty_print(&tomate, stdout);
  //fa_destroy(&tomate);
  fa_add_transition(&tomate, 0, 'a', 1);
  //fa_pretty_print(&tomate, stdout);
  return 1;
}
