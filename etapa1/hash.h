#define HASH_SIZE 997

typedef struct hash_node{
  int type;
  char *yytext;
  struct hash_node *next;
} HASH;

void hashInit();
int hashAddress(char *text);
HASH* hashInsert(int type, char *text);
void hashPrint(void);
