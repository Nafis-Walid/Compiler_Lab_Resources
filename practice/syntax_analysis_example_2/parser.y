%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token SUB MAIN LP RP DIM ID AS SINGLE INTEGER ASSIGN ICONST ADD SEMI END
%start code

%%
code: SUB MAIN LP RP statements END SUB
statements: statements statement |  
statement: declaration | assign
declaration: DIM ID AS type
type: SINGLE | INTEGER
assign: ID ASSIGN exp
exp: ICONST | ID ADD ID ADD ICONST SEMI
%%

int main(){
  yyparse();
  printf("Parsing Finished\n");
}
void yyerror(char *s){
    fprintf(stderr,"Error: %s\n", s);
}