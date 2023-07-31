%{
    #include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
    #include "symtab.c"
	extern int lineno;
	extern int yylex();
%}

%union{
    char str_val[40];
    int int_val;
}

%token INT_TYPE DEF AS LOOP FROM TO
%token LP RP SEMI

%token<str_val> ID
%token<str_val> INT_NUM
%token<str_val> FLOAT_NUM

%left LP RP
%start stmts

%%
stmts: stmts stmt
    | stmt
    ;

stmt: loop
    | exp
    ;

loop: LOOP LP ID FROM type TO FLOAT_NUM RP SEMI
    ;
    
exp: DEF ID AS type SEMI{insert($2, $4);}
    ;
type: INT_NUM{$$ = INT_TYPE;} 
    | FLOAT_NUM{$$ = REAL_TYPE;}
    ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}
int main()
{
    yyparse();
    printf("Parsing Finished\n");
}
