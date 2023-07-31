%{
/*


*/

#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INCR DECR THEN WHILE ID NE EQ ADD_ASSIGN GT LT SEMI
%start prog
%%
prog: statements
      ;

statements : statements statement 
           | 
           ;
 statement : while_statement
            ;

while_statement: WHILE exp THEN exp
            ;       
exp: ID INCR
    | ID DECR
    | ID ADD_ASSIGN ID
    ;  

%%

int main(){
    yyparse();
    printf("Parshing Finished\n");
    return 0;
}
 void yyerror(char *s){
     fprintf(stderr,"Error:%s\n",s);
 }
