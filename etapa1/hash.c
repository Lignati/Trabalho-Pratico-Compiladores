#include "hash.h"

HASH* table[HASH_SIZE];



/*Inicialização da hash table com zero em todas posições*/
void hashInit(void){
  int i = 0;

  for(i ; i<HASH_SIZE ; i++){
    table[i] = 0;
  }
}

/*Cálculo do endereço do elemento hash*/
int hashAddress(char *text){
  int address = 1;
  int i=0;
  for(i; i<strlen(yytext) ; i++){
    address = (address*text[i])%HASH_SIZE + 1;
  }
  return address-1;
}

/*Inserção de um elemento na HASH*/
HASH* hashInsert(int type, char *text){

  int address;
  HASH* newNode = 0

  newNode = (HAHS*) calloc(1,sizeof(HASH));
  address = hashAddress(text);
  newNode->text = calloc(strlen(yytext)+1,sizeof(char));
  strcpy(newnode->text,text);
  newNode->next = table[address];
  table[address] = newNode;
  return newNode;

}

void hashPrint(){

  int i = 0;
  for(i ; i<HASH_SIZE; i++){
    printf("%s",table[HASH_SIZE]);
  }

}
