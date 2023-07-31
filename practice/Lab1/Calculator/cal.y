%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token NUM ADD SUB MULT ID
%start cal

%%
cal: exp;
exp: exp ADD exp | NUM | ID;
%%

int main(){
  yyparse();//this function is called to start the parsing process
  printf("Parsing Finished\n");//if a successfull parsing conducted then this line will be executed
}
void yyerror(char *s){
    fprintf(stderr,"Error: %s\n", s);
}