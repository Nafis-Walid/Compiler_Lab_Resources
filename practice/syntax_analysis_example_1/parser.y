%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token INT ID SEMI SCAN LP RP ASSIGN ADD ICONST PRINT
%start code

%%
code: statements
statements: statements statement |  
statement: declaration | scan | assign | print
declaration: INT ID SEMI
scan: SCAN LP ID RP SEMI
assign: ID ASSIGN ID ADD ICONST SEMI
print: PRINT LP ID RP SEMI
%%

int main(){
  yyparse();
  printf("Parsing Finished\n");
}
void yyerror(char *s){
    fprintf(stderr,"Error: %s\n", s);
}