%option noyywrap

%{
    
%} 
delim [ \t\n]
ws {delim}+
digit     [0-9]
id [XY]
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+

%%
{ws}        { } 
{ICONST}    {printf("%s -> INT_NUM\n", yytext);}
{FCONST}    {printf("%s -> FLOAT_NUM\n", yytext);}
"def"       { printf("%s -> DEF_TYPE\n", yytext); }
{id}		{ printf("%s -> ID\n", yytext); }
"as"		{ printf("%s -> AS\n", yytext); }
"INT"		{ printf("%s -> TYPE_INT\n", yytext); }
"FOR_LOOP"		{ printf("%s -> LOOP\n", yytext); }
"("		{ printf("%s -> LP\n", yytext); }
")"		{ printf("%s -> RP\n", yytext); }
"from"		{ printf("%s -> FROM\n", yytext); }
"to"		{ printf("%s -> TO\n", yytext); }
";"       { printf("%s -> SEMI\n", yytext); }
%%

int main()
{
    yylex();
    return 0;
}