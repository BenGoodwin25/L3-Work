#include "fa.h"



void fa_create(struct fa *self, size_t alpha_count, size_t state_count){
  int i,f;

  self->is_trash_on=false;

  self->alpha_count = alpha_count;
  self->state_count = state_count;

  self->initial_states = malloc((self->state_count+1)*sizeof(size_t));//+1 : Trash State
  self->final_states = malloc((self->state_count+1)*sizeof(size_t));
  for(i=0;i<self->state_count;i++){
    self->initial_states[i] = false;
    self->final_states[i] = false;
  }

  self->transitions = (struct state_set**)malloc((self->state_count+1) * self->alpha_count*sizeof(struct state_set*));

  for(i=0;i<self->state_count+1;i++){
    self->transitions[i] = malloc((self->state_count+1) * sizeof(struct state_set));
    for(f=0;f<self->alpha_count;f++){
      self->transitions[i][f].capacity = self->alpha_count*(self->state_count+1);
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
  int i,f;
  for(i=0;i<self->state_count;i++){
    for(f=0;f<self->alpha_count;f++){
      free(self->transitions[i][f].states);
    }
    free(self->transitions[i]);
  }
  free(self->transitions);

}

void fa_set_state_initial(struct fa *self, size_t state){
  if(state>=self->state_count){
    return;
  }
  self->initial_states[state]=true;
}

void fa_set_state_final(struct fa *self, size_t state){
  if(state>=self->state_count){
    return;
  }
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
    fprintf(stderr,"plus de place, aggrandissement non pris en charge taille maximum de transitions alpha*state");
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
    if(self->is_trash_on==true && i==self->state_count-1){
      fprintf(out," (Trash State)");
    }
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
  for(i=state;i<self->state_count;i++){
    for(j=0;j<self->state_count;j++){
      for(s=0;s<self->alpha_count;s++){
        if(transitions_exist(self,j,'a'+s,i)) {
          fa_remove_transition(self, j, 'a' + s, i);
          if(i==j){
            fa_add_transition(self, i - 1, 'a' + s, j-1);
          }else {
            fa_add_transition(self, j, 'a' + s, i - 1);
          }
        }
        if(transitions_exist(self, i, 'a' + s, j)) {
          fa_remove_transition(self, i, 'a' + s, j);
          fa_add_transition(self, i - 1, 'a' + s, j);
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
    for(s=0;s<self->alpha_count;s++){
      count=0;
      for(j=0;j<self->state_count;j++){
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

void fa_make_complete(struct fa *self){
  if(fa_is_complete(self)==true){
    return;
  }
  int i,j,s,count;
  for(i=0;i<self->state_count;i++){
    for(s=0;s<self->alpha_count;s++){
      count=0;
      for(j=0;j<self->state_count;j++){
        if(transitions_exist(self,i,'a'+s,j)){
          count+=1;
        }
      }
      if(count==0){
        if(self->is_trash_on==false){
          self->is_trash_on=true;
          self->state_count+=1;
        }
        fa_add_transition(self,i,'a'+s,self->state_count-1);
      }
    }
  }
  return;
}

void fa_merge_states(struct fa *self, size_t s1, size_t s2){
  int i,s;
  for(i=0;i<self->state_count;i++){
    for(s=0;s<self->alpha_count;s++){
      if(transitions_exist(self,i,'a'+s,s2)){
        fa_remove_transition(self,i,'a'+s,s2);
        if(i==s2){
          fa_add_transition(self, s1, 'a' + s, s1);

        }else {
          fa_add_transition(self, i, 'a' + s, s1);
        }
      }
      if(transitions_exist(self,s2,'a'+s,i)){
        fa_remove_transition(self,s2,'a'+s,i);
        fa_add_transition(self,s1,'a'+s,i);
      }
    }
  }
  fa_remove_state(self,s2);
}