#ifndef FA_H
#define FA_H

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

#define MIN(a,b) ((a) < (b) ? a : b)

//                Structure

struct fa {
  size_t alpha_count;
  size_t state_count;

  bool *initial_states;
  bool *final_states;

  bool is_trash_on;

  struct state_set **transitions;
};

struct state_set {
  size_t size;
  size_t capacity;
  size_t *states;
};



//                    Fonctions

//                    TP1
void fa_create(struct fa *self, size_t alpha_count, size_t state_count);
void fa_destroy(struct fa *self);

void fa_set_state_initial(struct fa *self, size_t state);
void fa_set_state_final(struct fa *self, size_t state);

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to);

void fa_pretty_print(const struct fa *self, FILE *out);

//                     TP2
bool transitions_exist(struct fa *self, size_t from, char alpha, size_t to);
void fa_remove_transition(struct fa *self, size_t from, char alpha, size_t to);
void fa_remove_state(struct fa *self, size_t state);

size_t fa_count_transitions(struct fa *self);

bool fa_is_deterministic(struct fa *self);
bool fa_is_complete(struct fa *self);

void fa_make_complete(struct fa *self);
void fa_merge_states(struct fa *self, size_t s1, size_t s2);

//                      TP3

//4.6
bool fa_is_language_empty(const struct fa *self);
//5.1
void fa_remove_non_accessible_states(struct fa *self);
//5.2
void fa_remove_non_co_accessible_states(struct fa *self);

//6.1
void fa_create_product(struct fa *self, const struct fa *lhs, const struct fa *rhs);
//6.2
bool fa_has_empty_intersection(const struct fa *lhs, const struct fa *rhs);

//7.1
void fa_create_deterministic(struct fa *self, const struct fa *nfa);
//7.2
bool fa_is_included(const struct fa *lhs, const struct fa *rhs);

//8.1
bool fa_are_nerode_equivalent(const struct fa *self, size_t s1, size_t s2);
//8.2
void fa_create_minimal_nerode(struct fa *self,  const struct fa *other);
//8.3
void fa_create_minimal_moore(struct fa *self, const struct fa *other);



#endif