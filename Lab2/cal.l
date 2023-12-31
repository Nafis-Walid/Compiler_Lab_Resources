%option noyywrap

%{
    #include "cal.tab.h"
%}

digit [0-9]
number {digit}+
delim [ \t\n]
ws {delim}+
%%

{ws} {}
{number} {yylval = atoi(yytext); return(NUM);}
"+" {return(ADD);}
"-" {return(SUB);}
"*" {return(MUL);}
"/" {return(DIV);}
%%
