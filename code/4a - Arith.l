%{
  #include "y.tab.h"
  extern int yylval;
%}
%%
[A-Za-z]+ {
            yylval = atoi(yytext);
            return LETTER;
          }
[0-9]+    {
            yylval = atoi(yytext);
            return DIGIT;
          }
[+\-*/]   {
            yylval = atoi(yytext);
            switch(yytext[0]){
              case '+':
                return PLUS;
                break;
              case '-':
                return MINUS; 
                break;
              case '*':
                return MUL;
                break;
              case '/':
                return DIV;
                break;
            }
          }
[\s|\t]+; /*Ignore Whitespace*/
\n      return 0;
.         {}
%%
