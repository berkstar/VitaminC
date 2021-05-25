/* project1.l */ 
digit		[0-9]
alphabetic	[A-Za-z_$] 
alphanumeric 	({alphabetic}|{digit})
sign		[+-]
dot		\.
leftcomment	\/\*
rightcomment	\*\/
integer     {sign}?{digit}+	
float       {sign}?{digit}*{dot}?{digit}+

%option yylineno
%%
{leftcomment}[^\/*]*{rightcomment} ;
main	return (MAIN);
void	return (VOID);
int	    return (INTDEF);
float	return (FLOATDEF);
bool	return (BOOLDEF);
string	return (STRINGDEF);
char    return (CHARDEF);
null    return (NULLPTR);
\+\+    return (INCREMENT);
\-\-    return (DECREMENT);
\+\=    return (PLUSEQUAL);
\-\=    return (MINUSEQUAL);
\*\=    return (MULTEQUAL);
\/\=    return (DIVEQUAL);
square    return (SQUARE);
abs       return (ABS);
\=	return (ASSIGNMENT);
for 	return (FOR);
while	return (WHILE);
do	return (DO);
return 	return (RETURN);
dir return (DIRDEF);
\^  return (XOR);
\+	return (PLUS);
\-	return (MINUS);
\*	return (MULTIPLICATION);
\_  return (UNDERSCORE);
hitcheck    return (HITCHECK);
\/	return (DIVISION);
\?  return (TERNARY);
\<	return (LESSTHAN);
\<\=	return (LESSEQUAL);
\>	return (MORETHAN);
\>\=	return (MOREEQUAL);
\=\=	return (EQUAL);
\!\=	return (NOTEQUAL);
if	return (IF);
elif	return (ELIF);
else	return (ELSE);
\&\&	return (AND);
\|\|	return (OR);
\|  return (BINOR);
\&  return (BINAND);
\.	return (DOT);
!	return (NOT);
\,	return (COMMA);
\:	return (COLON);
\;	return (SEMICOLON);
\(	return (LP);
\)	return (RP);
\{	return (LCP);
\}	return (RCP);
\[	return (LB);
\]	return (RB);
\'  return (SQ);
\<\+\> return (CONCAT);
true|false return (BOOL);
east|west|north|south return(DIRECTION);   
~io return (INPUT);
io~	return (OUTPUT);
['][^']?['] return (CHAR);
["][^"]*["] return (STRING);
{alphabetic}{alphanumeric}* return (IDENTIFIER);
{integer} return(INT);
{float} return(FLOAT);
\n	;
. 	;

%%
int yywrap() { return 1; }