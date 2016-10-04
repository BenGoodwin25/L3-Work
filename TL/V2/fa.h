#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


//                Structure



struct fa {
  size_t alpha_count;
  size_t state_count;

  bool *initial_states;
  bool *final_states;

  //struct state *states;

  struct state_set **transitions;
};

/*
struct state {
  bool is_initial;
  bool is_final;
};
*/

struct state_set {
  size_t size;
  size_t capacity;
  size_t *states;
};



/*
struct state_node {
  size_t state;
  struct state_node *next;
};

struct state_set {
  struct state_node *first;
};
*/


//                    Fonctions

//                    TP1
void fa_create(struct fa *self, size_t alpha_count, size_t state_count);
void fa_destroy(struct fa *self);
void ajouteListe(struct state_set* l, size_t q);

void fa_set_state_initial(struct fa *self, size_t state);
void fa_set_state_final(struct fa *self, size_t state);

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to);

void fa_pretty_print(const struct fa *self, FILE *out);

//                     TP2
void fa_remove_transition(struct fa *self, size_t from, char alpha, size_t to);
void fa_remove_state(struct fa *self, size_t state);

size_t fa_count_transitions(struct fa *self);

bool fa_is_deterministic(struct fa *self);
bool fa_is_complete(struct fa *self);

void fa_make_complete(struct fa *self);
void fa_merge_states(struct fa *self, size_t s1, size_t s2);
