%option noyywrap

%{
    #include "parser.tab.h"
%} 

ws [ \t\n]+
id [a-zA-Z]+
digit [0-9]
iconst {digit}+
fconst {digit}*"."{digit}+

%%
"int"   { printf("%s -> INT\n", yytext); return INT; }
"scan"  { printf("%s -> SCAN\n", yytext); return SCAN;}
"print" { printf("%s -> PRINT\n", yytext); return PRINT;}
{ws}    { }
";"     { printf("%s -> SEMI\n", yytext); return SEMI;}
"+"     { printf("%s -> ADD\n", yytext); return ADD;}
"="     { printf("%s -> ASSIGN\n", yytext); return ASSIGN;}
"("     { printf("%s -> LP\n", yytext); return LP;}
")"     { printf("%s -> RP\n", yytext); return RP;}
{id}    { printf("%s -> ID\n", yytext); return ID;}
{iconst} { printf("%s -> ICONST\n", yytext); return ICONST;}
%%