//                Structure



struct fa {
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

/*
struct state_set {
  size_t size;
  size_t capacity;
  size_t *states;
};
*/

struct state_node {
  size_t state;
  struct state_node *next;
};

struct state_set {
  struct state_node *first;
};



//                    Fonctions

void fa_create(struct fa *self, size_t alpha_count, size_t state_count);
void fa_delete(struct fa *self);

void fa_set_state_initial(struct fa *self, size_t state);
void fa_set_state_final(struct fa *self, size_t state);

void fa_add_transition(struct fa *self, size_t from, char alpha, size_t to);

void fa_pretty_print(const struct fa *self, FILE *out);
