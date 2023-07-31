%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE DEF AS LOOP FROM TO
%token LP RP SEMI
%token ID INT_NUM FLOAT_NUM

%start stmts

%%
stmts: stmts stmt
    | stmt
    ;

stmt: loop
    | exp
    ;

loop: LOOP LP ID FROM INT_NUM TO FLOAT_NUM RP SEMI
    ;
    
exp: DEF ID AS INT_TYPE SEMI
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
