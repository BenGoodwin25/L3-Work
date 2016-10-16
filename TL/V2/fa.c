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
      self->transitions[i][f].capacity = self->alpha_count*self->state_count;
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
  int s;
  if(from>=self->state_count || to>=self->state_count ||
     (size_t)alpha-'a' >= self->alpha_count){
    return;
  }

  if(self->transitions[from][(size_t) alpha - 'a'].size >
     self->transitions[from][(size_t) alpha - 'a'].capacity){
    printf("plus de place, aggrandissement non pris en charge taille maximum de transitions alpha*state");
  }


  if(self->transitions[from][(size_t) alpha - 'a'].size>0){
    for(s=0;s<self->transitions[from][(size_t) alpha - 'a'].size;s++){
        if(self->transitions[from][(size_t) alpha - 'a'].states[s]==to){
          return;
        }
    }
  }
  self->transitions[from][(size_t) alpha - 'a'].states[self->transitions[from]
    [(size_t) alpha - 'a'].size]=to;
  self->transitions[from][(size_t) alpha - 'a'].size+=1;
}

void fa_pretty_print(const struct fa *self, FILE *out){
  int i,f,s;
  fprintf(out, "Initial states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->initial_states[i]==true){
      fprintf(out, "%d ", i);
    }
  }

  fprintf(out, "\nFinal states :\n\t");
  for(i=0;i<self->state_count;i++){
    if(self->final_states[i]==true){
      fprintf(out, "%d ",i);
    }
  }

  fprintf(out, "\nTransitions :");
  for(i=0;i<self->state_count;i++){
    fprintf(out, "\n\tFor State %d:",i);
    for(f=0;f<self->alpha_count;f++){
      fprintf(out, "\n\t\tFor letter %c: ",(unsigned int) f + 'a');
      for(s=0;s<self->transitions[i][f].size;s++){
        fprintf(out, "%zu ",self->transitions[i][f].states[s]);
      }
    }
  }
  fprintf(out, "\n");
}


//------------------------TP2----------------------//
/*void remove_value_array(size_t *array, size_t value){

}*/

bool transitions_exist(struct fa *self,size_t from, char alpha, size_t to){
  int i;
  for(i=0;i<self->transitions[from][(size_t) alpha - 'a'].size;i++){
    if(self->transitions[from][(size_t) alpha - 'a'].states[i]==to){
      return true;
    }
  }
  return false;
}

void fa_remove_transition(struct fa *self, size_t from, char alpha, size_t to){
  int s,c;
  if(from>=self->state_count || to>=self->state_count ||
     (size_t)alpha-'a' >= self->alpha_count){
    return;
  }

  if(self->transitions[from][(size_t) alpha - 'a'].size>0){
    for(s=0;s<self->transitions[from][(size_t) alpha - 'a'].size;s++){
        if(self->transitions[from][(size_t) alpha - 'a'].states[s]==to){
          for(c=s+1;c<self->transitions[from][(size_t) alpha - 'a'].size;c++){
            self->transitions[from][(size_t) alpha - 'a'].states[s]=
              self->transitions[from][(size_t) alpha - 'a'].states[c];
          }
          self->transitions[from][(size_t) alpha - 'a'].size-=1;
        }
    }
  }
  return;
}

void fa_remove_state(struct fa *self, size_t state){
  int i,j,s;
  if(state>=self->state_count){
    return;
  }
  i=state;
  for(j=0;j<self->state_count;j++){
    for(s=0;s<self->alpha_count;s++){
      fa_remove_transition(self, i, 'a' + s, j);
      fa_remove_transition(self, j, 'a' + s, i);
    }
  }
  //TODO move transitions n+1 to n...
  for(i=state+1;i<self->state_count;i++){
    for(j=0;j<self->state_count;j++){
      for(s=0;s<self->alpha_count;s++){
        if(transitions_exist(self,i,'a'+s,j)){
          fa_remove_transition(self,i,'a'+s,j);
          printf("Find one : %d-%c>%d : %d-%c>%d\n",i,'a'+s,j,i-1,'a'+s,j);
          fa_add_transition(self,i-1,'a'+s,j);
        }
        if(transitions_exist(self,j,'a'+s,i)){
          fa_remove_transition(self,j,'a'+s,i);
          printf("find one : %d-%c>%d : %d-%c>%d\n",j,'a'+s,i,j,'a'+s,i-1);
          fa_add_transition(self,j,'a'+s,i-1);
        }
      }
    }
  }
  self->state_count-=1;
}

size_t fa_count_transitions(struct fa *self){
  size_t count=0;
  int i,j,s;
  for(i=0;i<self->state_count;i++){
    for(j=0;j<self->state_count;j++){
      for(s=0;s<self->alpha_count;s++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
    }
  }
  return count;
}

bool fa_is_deterministic(struct fa *self){
  int ini_count=0,count=0,i,j,s;
  for(i=0;i<self->state_count;i++){
    //checking for multiple initial_states
    if(ini_count>1){
      return false;
    }
    if(self->initial_states[i]==true){
      ini_count+=1;
    }
    //Checking for multiple choice for a letter
    for(s=0;s<self->alpha_count;s++){
      count=0;
      for(j=0;j<self->state_count;j++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
      if(count>1){
        return false;
      }
    }

  }
  return true;
}


bool fa_is_complete(struct fa *self){
  int i,j,s,count;
  for(i=0;i<self->state_count;i++){
    for(j=0;j<self->state_count;j++){
      count=0;
      for(s=0;s<self->alpha_count;s++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
      if(count==0){
        return false;
      }
    }
  }
  return true;
}

/*
void fa_make_complete(struct fa *self){

}

void fa_merge_states(struct fa *self, size_t s1, size_t s2){

}*/
