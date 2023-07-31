%option noyywrap

%{
    #include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	#include "symtab.h"
	int lineno = 1; // initialize to 1
	void yyerror();
%} 

ws [ \t]+
id [a-zA-Z]+
digit [0-9]
iconst {digit}+
fconst {digit}*"."{digit}+

%%
"int"   {return INT; }
"scan"  {return SCAN;}
"print" {return PRINT;}
{ws}    { }
";"     {return SEMI;}
"+"     {return ADD;}
"="     {return ASSIGN;}
"("     {return LP;}
")"     {return RP;}
{id}    {strcpy(yyval.str_val, yytext); return ID;}
{iconst} {yyval.int_val = atoi(yytext); return ICONST;}
"\n"    {lineno += 1;}
%%