%{
  #include "y.tab.h"
  extern int yylval;
%}
%%
[A-Za-z] {
           yylval = atoi(yytext);
           return LETTER;
         }
[0-9]    {
           yylval = atoi(yytext);
           return DIGIT;
         }
.     { yylval = atoi(yytext);
        return OTHER;      
}
%%
