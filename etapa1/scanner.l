
%x COMMENT
%{
#include "tokens.h"
#include "hash.c"

int lineNumber;
int isRunnig = 1;
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
>=                  {return OPERATOR_GE;}
==               	{return OPERATOR_EQ;}
!=                  {return OPERATOR_NE;}
&&                  {return OPERATOR_AND;}
"||"				{return OPERATOR_OR;}


[a-zA-Z_]+			{hashInsert(1,yytext); return TK_IDENTIFIER; }
[0-9]+
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
[-*/<>=!&$#]		{return yytext[0];}


\n 					{lineNumber++;}
"//".*				
"/*"				{BEGIN(COMMENT);}

<COMMENT>\n 		{lineNumber++;}
<COMMENT>"*/" 		{BEGIN(INITIAL);}
<COMMENT>.			

%%
