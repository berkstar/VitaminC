# VitaminC
Parser for a Programming Language for Creating Adventure Games and its Lexical Analyzer
## To Create Parser
$make

## BNF
 ``` 
<program> ::= 
    | <main> 
    | <main> <functs>
    | <functs> <main>
    | <functs> <main> <functs>
<main>  ::= main { <stmts> } 
    | main { } 
<functs> ::= <funct_dec> 
    | <funct_dec> <functs>
<funct_dec> ::= <definer> IDENTIFIER ( <input_dec> ) { <stmts> }
	| <definer> IDENTIFIER ( ) { <stmts> }
<input_dec> ::=  <definer> IDENTIFIER
    | <definer> IDENTIFIER , <input_dec>
    | <arr>
    | <arr>, <input_dec>
<stmts> ::= <stmt> 
    | <stmts><stmt> 
<stmt> ::= <curlystmt> 
    | <noncurlystmt>; 
    | ;
<curlystmt> ::=  <if_stmt> 
    | <loop>
<noncurlystmt> ::= <assignment>
    | <funct_call>
    | <var_decleration>
    | <return_stmt>
    | <arr_decleration>
<assignment> ::= IDENTIFIER <assign_symbol> <returnable>
    | <var_decleration> <assign_symbol>  <returnable> 
    | <arr> <assign_symbol> <returnable>
    | <increment>
    | <decrement>
<string_concat> ::= <string_concat> <+> IDENTIFIER 
    | <string_concat> <+> STRING  
    | STRING <+> IDENTIFIER
    | IDENTIFIER <+> STRING
    | IDENTIFIER <+> IDENTIFIER
    | STRING <+> STRING
<increment> ::= IDENTIFIER++
    | <arr>++
<decrement> ::= IDENTIFIER--
    | <arr>--

<assign_symbol> ::= = | += | -= | *= | /=
<if_stmt> ::=  if ( <logic_expr> ) { <stmts> } else { <stmts> }
    | if ( <logic_expr> ) { <stmts> } <elif_stmt> else { <stmts> }
    | if ( <logic_expr> ) { <stmts> } <elif_stmt>
	| if ( <logic_expr> ) { <stmts> }
<elif_stmt> ::= elif ( <logic_expr> ) { <stmts> } 
	| elif ( <logic_expr> ) { <stmts> } <elif_stmt>
<logic_expr> ::= <logic_expr> <logic_op> <basiclogic_expr>
    | <basiclogic_expr>
<basiclogic_expr> ::=  <basiclogic_expr> <logic_relations> <arith_expr> 
    | <arith_expr> 
<logic_op> ::= && | \|\|
<logic_relations> ::= < | > | <= | >= | != | ==
<arith_expr> ::= <arith_expr> + <term>
	| <arith_expr> - <term>
	| <term>
<term> ::= <term> * <notexpr>
	| <term> / <notexpr>
	| <notexpr>
<notexpr> ::= NOT <notexpr> 
    | <factor>
<factor> ::= ( <bool_expr> )
	| IDENTIFIER
	| <numconst>
    | <arr>
<loop> ::= <while>
	| <for>
	| <dowhile>
<const> ::= STRING | DIRECTION | BOOL | INT | FLOAT | CHAR
<while>::= while ( <logic_expr> )  { <stmts> } 
<for> ::= for ( <assignment> ; <logic_expr>; <assignment> ) { <stmts> }
<dowhile> ::= do { <stmts> } while ( <logic_expr> );
<definer> ::= void | <var_definer>
<var_decleration> ::=  <var_definer> IDENTIFIER
<var_definer> ::=  int | float | string | bool | dir | char
<arr_decleration> ::= <arr>
	| <arr> = {<returnables>}
<returnables> ::= <returnables>, <returnable>
	| <returnable>
<returnable> ::= <ternary_expr> | <string_concat>
    | { <returnables> } | null | <funct_call> 
<abs> ::= abs.<returnable>
<square> ::= square.<returnable>
<ternary_expr> ::= <bool_expr> ? <returnable> : <returnable> | <bool_expr>
<bool_expr> ::= <bool_expr> \| <bool_factor> | <bool_factor>
<bool_factor>  ::= <bool_factor> ^ <bool_term> | <bool_term>
<bool_term> ::= <bool_term> & <logic_expr> | <logic_expr>
<arr> ::= IDENTIFIER[<returnable>] | <arr>[<returnable>] 
<return_stmt> ::= return <returnable> 
	| return 
<funct_call> ::= IDENTIFIER ( <returnables> )
	| IDENTIFIER () 
    | <input_funct> 
    | <output_funct>
    | <abs> 
    | <square> 
    | <hitcheck>
<input_funct> ::= ~io()
<output_funct> ::= io~(<returnables>) 
    | io~()

<hitcheck> ::= _hitcheck ( <returnable> , <returnable> , <returnable> )
```

