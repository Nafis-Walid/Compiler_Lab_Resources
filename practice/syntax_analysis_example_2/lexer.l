%option noyywrap

%{
    #include "parser.tab.h"
%} 

ws [ \t\n]+
id [a-zA-Z]+
digit [0-9]

%%
"Sub"   { printf("%s -> SUB\n", yytext); return SUB; }
"main"  { printf("%s -> MAIN\n", yytext); return MAIN;}
"Dim" { printf("%s -> DIM\n", yytext); return DIM;}
"As" { printf("%s -> AS\n", yytext); return AS;}
"Single" { printf("%s -> SINGLE\n", yytext); return SINGLE;}
"Integer" { printf("%s -> INTEGER\n", yytext); return INTEGER;}
"End" { printf("%s -> END\n", yytext); return END;}
{ws}    { }
";"     { printf("%s -> SEMI\n", yytext); return SEMI;}
"+"     { printf("%s -> ADD\n", yytext); return ADD;}
"="     { printf("%s -> ASSIGN\n", yytext); return ASSIGN;}
"("     { printf("%s -> LP\n", yytext); return LP;}
")"     { printf("%s -> RP\n", yytext); return RP;}
{id}    { printf("%s -> ID\n", yytext); return ID;}
{digit} { printf("%s -> ICONST\n", yytext); return ICONST;}
%%