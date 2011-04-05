%{
  #include <stdio.h>
%}
%token LETTER MINUS DIGIT PLUS MUL DIV
%left PLUS MINUS
%left MUL DIV
%%
list: exp { printf("Valid\n"); return 0; }

exp: '(' exp ')'
   | exp PLUS exp
   | exp MINUS exp
   | exp MUL exp
   | exp DIV exp
   | NUM
   | LETTER
   ;

NUM: DIGIT
   | NUM DIGIT
   ;
%%
yyerror(){
  fprintf(stderr, "[ERROR]\n");
}
int main(){
  printf("Enter the expression: ");
  yyparse();
  return 0;
}
