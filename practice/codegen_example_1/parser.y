%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "symtab.c"
  void yyerror();
  extern int lineno;
  extern int yylex();
%}

%union{
    char str_val[100];
    int int_val;
}

%token SEMI SCAN LP RP ASSIGN ADD PRINT
%token<str_val> ID
%token<int_val> ICONST
%token<int_val> INT

%type<int_val> exp

%start code

%%
code: statements ;
statements: statements statement |  ;
statement: declaration | scan | assign | print ;
declaration: INT ID SEMI 
              {
                $1=INT_TYPE;
                insert($2, $1);
              }
              ;
scan: SCAN LP ID RP SEMI 
              {
                idcheck($3);
              };
assign: ID ASSIGN exp SEMI 
              {
                idcheck($1);
              };
exp : exp ADD exp
      {
        $$=typecheck($1, $3);
      }
      | ID 
      {
        printf("%d\n", $1);
        if(idcheck($1))
          $$=gettype($1);
      } 
      | ICONST
      {
        $$=INT_TYPE;
      } ;
print: PRINT LP ID RP SEMI  
              {
                idcheck($3);
              };
%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
