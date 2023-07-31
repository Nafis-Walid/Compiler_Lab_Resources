main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc -o cal.exe cal.tab.c lex.yy.c
	cal <input.txt> output.txt