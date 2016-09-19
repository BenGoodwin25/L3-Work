#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include "TP1.h"

/*struct fa {
  size_t alpha_count;
  size_t state_count;

  bool *initial_states;
  bool *final_states;
  struct state *states;

  struct state_set **transitions;
};

struct state {
  bool is_initial;
  bool is_final;
};


struct state_set {
  size_t size;
  size_t capacity;
  size_t *states;
};


struct state_node {
  size_t state;
  struct state_node *next;
};

struct state_set {
  struct state_node *first;
};

*/

void fa_create(struct fa *self, size_t alpha_count, size_t state_count){
  self->alpha_count=alpha_count;
  self->state_count=state_count;
}

void fa_delete(struct fa *self){

}

void fa_set_state_initial(struct fa *self, size_t state){

}

void fa_set_state_final(struct fa *self, size_t state){

}

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to){

}

void fa_pretty_print(const struct fa *self, FILE *out){
  printf("Initial states :\n\t");
  /*for(i;i<self->state_count;i++){
    if(self->bool==true){
      printf("%d ",??);
    }
  }*/
  printf("\n");

  printf("Final states :\n\t");
  /*for(i;i<self->state_count;i++){
    if(self->bool==true){
      printf("%d ",??);
    }
  }*/
  printf("\n");

  printf("Transitions :\n\t");
  /*for(i;i<self->state_count;i++){
    printf("For State %d:\n\t\t:",i)
    for(f;f<self->alpha_count;f++){
      printf("For letter %c: "f+'a')
      if(self->bool==true){
        printf("%d ",??);
      }
      printf("\n\t\t");
    }
  }*/

}

int main(){
  printf("TP1 \n");
  struct fa *tomate;
  fa_create(tomate,5,5);
  printf(" test : tomate->state_count : %zu\n",tomate->state_count);
  return 1;
}
