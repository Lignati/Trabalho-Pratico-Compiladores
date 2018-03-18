
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
>=                  {return OPERATOR_GE;}
==  	            {return OPERATOR_EQ;}
!=                  {return OPERATOR_NE;}
&&                  {return OPERATOR_AND;}
"||"				{return OPERATOR_OR;}


<<<<<<< Updated upstream
[a-zA-Z_]+			{hashInsert(280,yytext); return TK_IDENTIFIER; }
[0-9]+				{hashInsert(281,yytext); return LIT_INTEGER; }
[a-zA-z]			{hashInsert(285,yytext); return LIT_CHAR;}

=======
[a-zA-Z_]+			{hashInsert(TK_IDENTIFIER,yytext); return TK_IDENTIFIER; }
[0-9]+				{hashInsert(LIT_INTEGER,yytext); return LIT_INTEGER; }
[a-zA-z]			{hashInsert(LIT_CHAR,yytext); return LIT_CHAR;}
 "\""+ "\""         {hashInsert(LIT_STRING,yytext);return LIT_STRING;}
>>>>>>> Stashed changes



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


\n 					{lineNumber++;}
"//".*
"/*"				{BEGIN(COMMENT);}

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

#include "main.c"


