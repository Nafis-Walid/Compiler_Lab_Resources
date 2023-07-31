%option noyywrap

%{
    #include "parser.tab.h"
%} 
delim [ \t\n]
ws {delim}+
digit     [0-9]

ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+

%%
{ws}        { } 
{ICONST}    { return INT_NUM;}
{FCONST}    { return FLOAT_NUM; }
"def"       { return DEF; }
"X"		{ return ID; }
"as"		{ return AS; }
"INT"		{ return INT_TYPE; }
"FOR_LOOP"		{ return LOOP; }
"("		{ return LP; }
")"		{ return RP; }
"Y"		{ return ID; }
"from"		{ return FROM; }
"to"		{ return TO; }
";"       { return SEMI; }
%%
