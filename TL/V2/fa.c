#include "fa.h"



void fa_create(struct fa *self, size_t alpha_count, size_t state_count){
  int i,f;


  self->alpha_count = alpha_count;
  self->state_count = state_count;

  self->initial_states = malloc(self->state_count*sizeof(size_t));
  self->final_states = malloc(self->state_count*sizeof(size_t));
  for(i=0;i<self->state_count;i++){
    self->initial_states[i] = false;
    self->final_states[i] = false;
  }

  self->transitions = (struct state_set**)malloc(self->state_count * self->alpha_count*sizeof(struct state_set*));

  for(i=0;i<self->state_count;i++){
    self->transitions[i] = malloc(self->state_count * sizeof(struct state_set));
    for(f=0;f<self->alpha_count;f++){
      self->transitions[i][f].capacity = self->alpha_count;
      self->transitions[i][f].size = 0;
      self->transitions[i][f].states = malloc(sizeof(size_t));
    }
  }

  self = (struct fa*) malloc(sizeof(struct fa));
}

void fa_destroy(struct fa *self){
  self->alpha_count=0;
  self->state_count=0;
  free(self->initial_states);
  free(self->final_states);
  free(self->transitions);
}

void fa_set_state_initial(struct fa *self, size_t state){
  self->initial_states[state]=true;
}

void fa_set_state_final(struct fa *self, size_t state){
  self->final_states[state]=true;
}

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to){//TODO
  //TODO check if transition exist already
  if(self->transitions[from][(unsigned int) alpha].size >
     self->transitions[from][(unsigned int) alpha].capacity){
    self->transitions[from][(unsigned int) alpha - 'a'].capacity+=1;
  }
  self->transitions[from][(unsigned int) alpha - 'a'].states[self->transitions[from][(unsigned int) alpha].size]=to;
  //self->transitions[0][0].states[0]=to;
  self->transitions[from][(size_t) alpha - 'a'].size+=1;
}

void fa_pretty_print(const struct fa *self, FILE *out){
  int i,f;
  fprintf(out, "Initial states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->initial_states[i]==true){
      fprintf(out, "%d ", i);
    }
  }
  fprintf(out, "\n");

  fprintf(out, "Final states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->final_states[i]==true){
      fprintf(out, "%d ",i);
    }
  }
  fprintf(out, "\n");

  fprintf(out, "Transitions :\n");
  for(i=0;i<self->state_count;i++){
    fprintf(out, "\tFor State %d:\n",i);
    for(f=0;f<self->alpha_count;f++){
      fprintf(out, "\t\tFor letter %c: ",(unsigned int) f + 'a');
      //TODO
      fprintf(out, "\n");
    }
  }
  fprintf(out, "\n");

}
