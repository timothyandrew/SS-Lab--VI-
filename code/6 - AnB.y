%{
  #include "stdio.h"
%}
%token A B NEWL OTHER
%%
statement : A A A A A A A A A A s B NEWL { printf("Valid string\n");  return 0; }
          ;
s : A s;
  |
  ;
%%
yyerror(){
  printf("ERROR\n");
  return 1;
}
int main(){
  printf("Enter string: ");
  yyparse();
}
