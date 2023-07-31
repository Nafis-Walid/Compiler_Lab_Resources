%option noyywrap

%{
	#define INT_TYPE 1
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	int lineno = 1; // initialize to 1
	void yyerror();
%}

digit     [0-9]
delim [ \t]
ws  {delim}+
ID        [AB]
ICONST    {digit}+
%%

{ws} {}
"LET"       { return LET;}
"AS"       { return AS; }
"INT"       {yylval.int_val=INT_TYPE; return INT; }
"("       { return LPAREN; }
")"       { return RPAREN; }
";"       { return SEMI; }
"="       { return ASSIGN; }
"+"       { return ADDOP; }
"OUT"       { return PRINT; }
"IN"       { return SCAN; }
{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {yylval.int_val=atoi(yytext); return ICONST;}
"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
