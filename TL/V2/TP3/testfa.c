#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#include "graph.h"
#include "fa.h"

int main(){
  printf("TP3\n");
  struct fa tomate;
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

  if(fa_is_language_empty(&tomate)){
    printf("Language is empty\n");
  } else {
    printf("language isn't empty\n");
  }
  /*struct graph gf;
  graph_create_from_fa(&gf,&tomate,false);
  if(graph_has_path(&gf,0,4)){
    printf("There is a path between 0 and 4\n");
  } else {
    printf("There is no path between 0 and 4\n");
  }
  graph_destroy(&gf);*/
  /*
   * -	graph_create(&gf,6);
  if(!graph_add_state(&gf,1)){
    fprintf(stderr,"couldn't create state\n");
  }
  if(!graph_add_transitions(&gf,1,2)){
    fprintf(stderr,"couldn't create transitions\n");
  }
  if(graph_has_path(&gf,1,4)){
    printf("There is a path between 1 and 4\n");
  } else {
    printf("There is no path between 1 and 4\n");
  }

   *
   */

}

