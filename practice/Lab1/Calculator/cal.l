%option noyywrap

%{
#include "cal.tab.h"  
%}

delim [ \t] 
ws {delim}+
digit [0-9]
number {digit}+
letter [A-Za-z]
id {letter}+
%%

{ws} {}
{number} {return (NUM);}
{id} {return (ID);}
"+" {return (ADD);}
%%
