/* project2.y */
%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
extern int yylineno;
%}

%start program
%token STRING
%token DIRECTION
%token FLOAT CONCAT SQ
%token INT IDENTIFIER BOOLDEF DIRDEF BINOR BINAND SQUARE ABS CHAR CHARDEF UNDERSCORE HITCHECK
%token MAIN VOID INTDEF FLOATDEF BOOL STRINGDEF NULLPTR INCREMENT DECREMENT PLUSEQUAL MINUSEQUAL MULTEQUAL DIVEQUAL ASSIGNMENT FOR WHILE DO RETURN XOR PLUS MINUS MULTIPLICATION DIVISION TERNARY LESSTHAN LESSEQUAL MORETHAN MOREEQUAL EQUAL NOTEQUAL IF ELIF ELSE AND OR DOT NOT COMMA COLON SEMICOLON LP RP LCP RCP LB RB INPUT OUTPUT

%%

program: /* nothing */
    | main
    | main functs
    | functs main
    | functs main functs

main: MAIN LCP stmts RCP 
    | MAIN LCP RCP

functs: funct_dec
    | funct_dec functs

funct_dec: definer IDENTIFIER LP input_dec RP LCP stmts RCP
    | definer IDENTIFIER LP RP LCP stmts RCP

input_dec: definer IDENTIFIER
    | definer IDENTIFIER COMMA input_dec
    | arr
    | arr COMMA input_dec

stmts: stmt 
    | stmts stmt 

stmt: curlystmt 
    | noncurlystmt SEMICOLON 
    | SEMICOLON

curlystmt: if_stmt 
    | loop
    
noncurlystmt: assignment
    | funct_call
    | var_decleration
    | return_stmt
    | arr_decleration

assignment: IDENTIFIER assign_symbol returnable 
    | var_decleration assign_symbol returnable 
    | arr assign_symbol returnable
    | increment
    | decrement

string_concat: string_concat CONCAT IDENTIFIER 
    | string_concat CONCAT STRING  
    | STRING CONCAT IDENTIFIER
    | IDENTIFIER CONCAT STRING
    | IDENTIFIER CONCAT IDENTIFIER
    | STRING CONCAT STRING

increment: IDENTIFIER INCREMENT
    | arr INCREMENT

decrement: IDENTIFIER DECREMENT
    | arr DECREMENT

assign_symbol: ASSIGNMENT | PLUSEQUAL | MINUSEQUAL | MULTEQUAL | DIVEQUAL

if_stmt: IF LP logic_expr RP LCP stmts RCP ELSE LCP stmts RCP 
    | IF LP logic_expr RP LCP stmts RCP elif_stmt ELSE LCP stmts RCP
    | IF LP logic_expr RP LCP stmts RCP elif_stmt 
	| IF LP logic_expr RP LCP stmts RCP 
elif_stmt: ELIF LP logic_expr RP LCP stmts RCP 
	| ELIF LP logic_expr RP LCP stmts RCP elif_stmt

logic_expr: logic_expr logic_op basiclogic_expr
    | basiclogic_expr 

basiclogic_expr: basiclogic_expr logic_relations arith_expr 
    | arith_expr

logic_op: AND 
    | OR 

logic_relations: LESSTHAN  | MORETHAN  | LESSEQUAL
            | MOREEQUAL | NOTEQUAL | EQUAL

arith_expr: arith_expr PLUS term
	| arith_expr MINUS term 
	| term 

term: term MULTIPLICATION notexpr 
	| term DIVISION notexpr 
	| notexpr 

notexpr: NOT notexpr 
    | factor

factor: IDENTIFIER
    | arr
	| const
    | LP returnable RP

loop: while
	| for
	| dowhile

const: INT | FLOAT | BOOL | CHAR | DIRECTION | STRING

while: WHILE LP returnable RP LCP stmts RCP 
for: FOR LP assignment SEMICOLON logic_expr SEMICOLON assignment RP LCP stmts RCP
dowhile: DO LCP stmts RCP WHILE LP logic_expr RP SEMICOLON

definer: VOID | var_definer
var_decleration: var_definer IDENTIFIER
var_definer: INTDEF 
        | FLOATDEF 
        | STRINGDEF 
        | BOOLDEF 
        | DIRDEF
        | CHARDEF

arr_decleration: arr
	| arr EQUAL LCP returnables RCP

returnables: returnables COMMA returnable 
	| returnable 

returnable: ternary_expr | string_concat
    | LCP returnables RCP | NULLPTR | funct_call 

abs: ABS DOT returnable    
square: SQUARE DOT returnable

ternary_expr: bool_expr TERNARY returnable COLON returnable | bool_expr
bool_expr: bool_expr BINOR bool_factor | bool_factor
bool_factor: bool_factor XOR bool_term | bool_term
bool_term: bool_term BINAND logic_expr | logic_expr


arr: IDENTIFIER LB returnable RB | arr LB returnable RB 

return_stmt: RETURN returnable 
	| RETURN
 
funct_call: IDENTIFIER LP returnables RP 
	| IDENTIFIER LP RP 
    | input_funct 
    | output_funct
    | abs 
    | square 
    | hitcheck
input_funct: INPUT LP RP 

output_funct: OUTPUT LP returnables RP 
    | OUTPUT LP RP

hitcheck: UNDERSCORE HITCHECK LP returnable COMMA returnable COMMA returnable RP


%%
#include "lex.yy.c"

int main(void){
 yyparse();
if(yynerrs < 1){
		printf("Parsing is successful\n");
	}
 return 0;
}

yyerror( char *s ) { fprintf(stdout, "line %d: %s\n", yylineno,s); };