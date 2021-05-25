parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c 
y.tab.c: CS315s21_team01.yacc.y lex.yy.c
	yacc CS315s21_team01.yacc.y
lex.yy.c: CS315s21_team01.lex.l
	lex CS315s21_team01.lex.l
clean:
	rm -f lex.yy.c y.tab.c parser 