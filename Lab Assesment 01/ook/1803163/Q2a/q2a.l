%option noyywrap

%{
/*
 Q2. Consider given statements,
  1.He Loves "Pizza".
  2.  He Loves "Burger".  
  3.  He Loves "Pasta". 
  a) Show a flex file which can tokenize given statements. 

*/
%}

/* digit [0-9] */
delim [ \t]
ws {delim}+
letter [A-Za-z_]
STRING    \"{letter}*\"

%%
{delim}+ {}
(He) {printf("%s -> FIRST\n", yytext);}
(Loves) {printf("%s -> MIDDLE\n", yytext);}
(.) {printf("%s -> STOP\n", yytext);}
{STRING} {printf("%s -> STRING\n", yytext);}


%%

int main()
{
  yylex();
  return 0;
}
