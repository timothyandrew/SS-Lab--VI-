%{
  #include "y.tab.h"
  extern int yylval;
%}
%%
[A-Za-z] { yylval = atoi(yytext);
          return LETTER;
          }
[0-9]+ {
           yylval = atoi(yytext);
           return DIGIT;
         }
[+\-*/] {
           yylval = atoi(yytext);
           switch(yytext[0]){
              case '+':
                return PLUS;
              case '-':
                return MINUS;
              case '*':
                return MUL;
              case '/':
                return DIV;
           }
         }
\n       { yylval = atoi(yytext);
            return NEWL;
          }
.       { yylval = atoi(yytext);
          return OTHER;
        }
%%
