main: cal.l
	flex cal.l
	gcc lex.yy.c
	a <input.txt> output.txt

main2: cal.l cal.y
	bison -d cal.y 
	flex cal.l 
	gcc cal.tab.c lex.yy.c
	a <input.txt> output.txt

main3: lexer.l parser.y
	bison -d parser.y 
	flex lexer.l 
	gcc parser.tab.c lex.yy.c
	a <input.txt> output.txt
	


