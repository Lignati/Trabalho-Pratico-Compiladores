#include "hash.h"

HASH* table[HASH_SIZE];



/*Inicialização da hash table com zero em todas posições*/
void hashInit(void){
  int i = 0;

  for(i = 0 ; i<HASH_SIZE ; i++){
    table[i] = 0;
  }
}

/*Cálculo do endereço do elemento hash*/
int hashAddress(char *text){
  int address = 1;
  int i=0;
  for(i = 0; i<strlen(yytext) ; i++){
    address = (address*text[i])%HASH_SIZE + 1;
  }
  return address-1;
}

/*Inserção de um elemento na HASH*/
HASH* hashInsert(int type, char *text){

  int address;
  HASH* newNode = 0;

  newNode = (HASH*) calloc(1,sizeof(HASH));
  address = hashAddress(text);
  newNode->type = type;
  newNode->yytext = calloc(strlen(yytext)+1,sizeof(char));
  strcpy(newNode->yytext,text);
  newNode->next = table[address];
  table[address] = newNode;
  return newNode;

}


/*Print de toda hashtable*/
void hashPrint(){
  HASH* print_node;

  int i = 0;
  for(i = 0 ; i<HASH_SIZE; i++){
    for(print_node = table[i]; print_node ; print_node=print_node->next){
      switch(print_node->type){
          case TK_IDENTIFIER:
              printf("HashTable[%d] contains %s and is TK_IDENTIFIER\n",i,print_node->yytext);
              break;
          case LIT_CHAR:
            printf("HashTable[%d] contains %s and is LIT_CHAR\n",i,print_node->yytext);
            break;
          case LIT_STRING:
            printf("HashTable[%d] contains %s and is LIT_STRING\n",i,print_node->yytext);
            break;
          case LIT_REAL:
            printf("HashTable[%d] contains %s and is LIT_REAL\n",i,print_node->yytext);
            break;
          case LIT_INTEGER:
            printf("HashTable[%d] contains %s and is LIT_INTEGER\n",i,print_node->yytext);
            break;
          default:
            printf("Not identified!");
      }

    }
  }

}
