%{
  #include "stdio.h"
%}
%token LETTER DIGIT OTHER
%%
variable : LETTER chars { printf("Valid\n"); return 0; }
chars : LETTER 
      | DIGIT
      ;
%%
yyerror(){
  printf("Error\n");
  return 1;
}
int main(){
  printf("Enter variable name: ");
  yyparse();
}
