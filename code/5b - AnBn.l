%{
  #include "y.tab.h"
  extern int yylval;
%}
%%
[aA] { yylval = atoi(yytext);
          return A;
         }
[bB] { yylval = atoi(yytext);
          return B;
         }
\n       { yylval = atoi(yytext);
            return NEWL;
          }
.       { yylval = atoi(yytext);
          return OTHER;
        }
%%
