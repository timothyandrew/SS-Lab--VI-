%{
  int unclosed_parens = 0;
  int equal_count = 0, operator_count = 0, operand_count = 0;

  char stck[100];
  int top = -1;
%}
%%
[A-Za-z0-9]+ {
            printf("[operand]\t\t%s\n", yytext);
            operand_count++;
          }
[=]       {
            if(++equal_count > 1){
              printf("[FATAL ERROR] Too many assignments.\n");
              return 1;
            } else {
              printf("[operator]\t\t=\n");
              operator_count++;
            }
          }
[\{\[\(]  {
            unclosed_parens++;
            stck[++top] = yytext[0];
          }
[\}\]\)]  {
            unclosed_parens--;
            if(stck[top--] != yytext[0]){
              printf("[FATAL ERROR] Parens closed in wrong order\n");
              return 1;
            }
          }
[+\-*/]   {
            printf("[operator]\t\t%s\n", yytext);
            operator_count++;
          }
.         {
          }
%%
int main(){
  yyin = fopen("expr.txt", "r");
  yylex();
  if(operator_count != operand_count - 1){
    printf("[FATAL ERROR] Too few/many operators.\n");
    return 1;
  } else if(unclosed_parens != 0){
    printf("[FATAL ERROR] One or more unclosed parens.\n");
    return 1;
  } else {
    printf("[VALID EXPR] %d operators and %d operands.\n", operator_count, operand_count);
  }
  fclose(yyin);
}

int yywrap(){
  return 1;
}
