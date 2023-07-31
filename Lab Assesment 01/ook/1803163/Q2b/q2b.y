%{
/*


*/

#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token FIRST MIDDLE STRING STOP
%start BEGIN

%%
BEGIN: FIRST MIDDLE STRING STOP
    ;
%%

int main()
{
  yyparse();
  printf("Parsing Finished");
  return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}