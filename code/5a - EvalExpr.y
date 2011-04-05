%{
  #include "stdio.h"
%}
%token LETTER DIGIT OTHER PLUS MINUS MUL DIV NEWL
%left PLUS MINUS
%left MUL DIV
%%
statement : EXPRESSION NEWL { printf("Result is %d\n", $1);  return 0; }
          ;
EXPRESSION : EXPRESSION PLUS EXPRESSION { $$ = $1 + $3; }
           | EXPRESSION MINUS EXPRESSION { $$ = $1 - $3; }
           | EXPRESSION MUL EXPRESSION { $$ = $1 * $3; }
           | EXPRESSION DIV EXPRESSION { $$ = $1 / $3; }
           | DIGIT { $$ = $1; }
           ;
%%
yyerror(){
  printf("ERROR\n");
  return 1;
}
int main(){
  printf("Enter expression: ");
  yyparse();
}
