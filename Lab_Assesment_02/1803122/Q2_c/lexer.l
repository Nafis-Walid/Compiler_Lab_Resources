%option noyywrap

%{
    #include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	# include "symtab.h"
	int lineno = 1; // initialize to 1
	void yyerror();
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

{ID}        { strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    { strcpy(yylval.str_val, yytext); return ICONST;}
{FCONST}    { strcpy(yylval.str_val, yytext); return FCONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+ {}  

.       { yyerror("Unrecognized character"); }
%%
