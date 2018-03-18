#
# UFRGS - Compiladores B - Marcelo Johann - 2018/1 - Etapa 1
#
# Makefile for single compiler call
# All source files must be included from code embedded in scanner.l
# In our case, you probably need #include "hash.c" at the beginning
# and #include "main.c" in the last part of the scanner.l
#

etapa1: lex.yy.o main.o
	gcc lex.yy.o main.o -o etapa1

main.o: main.c
	gcc -c main.c

lex.yy.c: scanner.l
	lex scanner.l

clean:
	rm lex.yy.c etapa1 *.o

