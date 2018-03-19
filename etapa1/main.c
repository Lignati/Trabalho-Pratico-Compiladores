#include<stdio.h>
int main(int argc, char **argv)
{
    int tok;
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyin = fd;

    }
    else
        printf("Usage: a.out filename\n");

    initMe();
    while (isRunning()) {
        tok = yylex();
        switch (tok) {
            case KW_CHAR:
                printf("KW CHAR");
                break;
            case KW_INT:
                printf("KW_INT");
                break;
            case KW_FLOAT:
                printf("KW_FLOAT");
                break;
            case KW_IF:
                printf("KW_IF");
                break;
            case KW_THEN:
                printf("KW_THEN");
                break;
            case KW_ELSE:
                printf("KW_ELSE");
                break;
            case KW_WHILE:
                printf("KW_WHILE");
                break;
            case KW_FOR:
                printf("KW_FOR");
                break;
            case KW_READ:
                printf("KW_READ");
                break;
            case KW_RETURN :
                printf("KW_RETURN");
                break;
            case KW_PRINT:
                printf("KW_PRINT");
                break;
            case OPERATOR_LE:
                printf("OPERATOR_LE");
                break;

            case OPERATOR_GE:
                printf("OPERATOR_GE");
                break;
            case OPERATOR_EQ:
                printf("OPERATOR_EQ");
                break;
            case OPERATOR_NE:
                printf("OPERATOR_NE");
                break;
            case OPERATOR_AND:
                printf("OPERATOR_AND");
                break;
            case OPERATOR_OR:
                printf("OPERATOR_OR");
                break;
            case TK_IDENTIFIER:
                printf("TK_IDENTIFIER");
                break;
            case LIT_INTEGER:
                printf("LIT_INTEGER");
                break;
            case LIT_REAL:
                printf("LIT_REAL");
                break;
            case LIT_CHAR:
                printf("LIT_CHAR");
                break;
            case LIT_STRING:
                printf("LIT_STRING");
                break;
            case TOKEN_ERROR:
                printf("TOKEN_ERROR");
                break;
                
                
            default:
                printf("%c",tok);
                break;
            
        }
        printf("linha:%d\n",lineNumber);
    }

    hashPrint();
    return (0);
}
