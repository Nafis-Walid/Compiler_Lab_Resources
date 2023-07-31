%option noyywrap
%{
  #include "prog.tab.h"  
%}
delim [ \t\n]
ws {delim}+
letter [A-Za-z]
us [_]
id ({us}|{letter})({us}|{letter}|{digit})*

%%
{ws} {}
"++" {return (INCR);}
"--" {return (DECR);}
":" {return (THEN);}
"WHILE" {return (WHILE);}
{id} {return (ID);}
"!=" {return (NE);}
"==" {return (EQ);}
"+=" {return (ADD_ASSIGN);}
">" {return (GT);}
"<" {return (LT);}
";" {return (SEMI);}
%%
