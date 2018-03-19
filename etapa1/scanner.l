
%x COMMENT
%{
#include "tokens.h"
#include "hash.c"

int lineNumber = 1;
int running    = 1;
%}

%%

if 					{return KW_IF;}
while				{return KW_WHILE;}
char				{return KW_CHAR;}
int 				{return KW_INT;}
float				{return KW_FLOAT;}
then				{return KW_THEN;}
else				{return KW_ELSE;}
read				{return KW_READ;}
print				{return KW_PRINT;}
return				{return KW_RETURN;}
for                 {return KW_FOR;}


"<="                {return OPERATOR_LE;}
">="                 {return OPERATOR_GE;}
"=="  	            {return OPERATOR_EQ;}
"!="                  {return OPERATOR_NE;}
"&&"                  {return OPERATOR_AND;}
"||"				{return OPERATOR_OR;}



"'"[^\n]"'"								{hashInsert(LIT_CHAR,yytext);return LIT_CHAR;}
\"([^\"\\\n]|\\[\"\\n])+\"				{hashInsert(LIT_STRING,yytext);printf("%s-> String\n",yytext);return LIT_STRING;}
[a-zA-Z_]{1}[a-zA-Z0-9_]*					{hashInsert(TK_IDENTIFIER,yytext);  return TK_IDENTIFIER;}
[0-9]+									{hashInsert(LIT_INTEGER,yytext); return LIT_INTEGER; }
[0-9]+"."[0-9]+							{hashInsert(LIT_REAL,yytext);  return LIT_REAL; }





","		{return yytext[0];}
";"		{return yytext[0];}
":"		{return yytext[0];}
"("		{return yytext[0];}
")"		{return yytext[0];}
"["		{return yytext[0];}
"]"		{return yytext[0];}
"{"		{return yytext[0];}
"}"		{return yytext[0];}
"+"		{return yytext[0];}
"-"		{return yytext[0];}
"*"		{return yytext[0];}
"/"		{return yytext[0];}
"<"		{return yytext[0];}
">"		{return yytext[0];}
"="		{return yytext[0];}
"!"		{return yytext[0];}
"&"		{return yytext[0];}
"$"		{return yytext[0];}
"#"		{return yytext[0];}

" "
"\t"
\n 					{lineNumber++;}
"//".*
"/*"				{BEGIN(COMMENT);}
.					{return TOKEN_ERROR;}

<COMMENT>\n 		{lineNumber++;}
<COMMENT>"*/" 		{BEGIN(INITIAL);}
<COMMENT>.



%%
int yywrap(){
	running = 0;
	return 1;

}
int getLineNumber(){

	return lineNumber;
}
int isRunning(){

	return running;

}

void initMe(void){
	hashInit();
}

#include "main.c"
