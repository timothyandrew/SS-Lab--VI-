%{
  int sw = 0;
%}
%%
([aA][nN][dD]|[oO][rR]|[bB][uU][tT]|[bB][eE][cC][aA][uU][sS][eE])  {
                                                                     printf("%s",yytext);
                                                                     sw = 1;
                                                                   }
. {
    printf("%s",yytext);
  }
%%
int main(){
  yyin = fopen("sentence.txt", "r");
  yylex();
  if(sw){
    printf("Compound sentence.\n");
  } else {
    printf("Simple sentence.\n");
  }
  fclose(yyin);
}

int yywrap(){
  return 1;
}
