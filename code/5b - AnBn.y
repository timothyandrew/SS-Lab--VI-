%{
  #include "stdio.h"
%}
%token A B NEWL OTHER
%%
statement : s NEWL { printf("Valid string\n");  return 0; }
          ;
s : A s B;
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
