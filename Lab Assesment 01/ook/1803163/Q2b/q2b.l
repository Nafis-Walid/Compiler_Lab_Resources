%option noyywrap

%{
/*
 Q2. Consider given statements,
  1.He Loves "Pizza".
  2.  He Loves "Burger".  
  3.  He Loves "Pasta". 
  b) Show a bison file which can parse given statements.

*/
#include "q2b.tab.h"
%}

digit [0-9]
delim [ \t]
letter [A-Za-z_]

%%
{delim}+ {}

(He) {return  FIRST;}
(Loves) {return MIDDLE;}
{STRING} {return STRING;}
(.) {return  STOP;}
%%

