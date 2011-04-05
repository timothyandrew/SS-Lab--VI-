  int c = 0, w = 0, s = 0, l = 0;
%%
\n   ++l;
^[^ \t] ++w;
[ ]   ++s; ++w; 
\t   w += 8;
.    ++c;

%%

int main(){
  yyin = fopen("file1.txt", "r");
  yylex();
  printf("number of lines = %d\nnumber of characters = %d\nnumber of spaces = %d\nnumber of words = %d\n", l, c, s, w);
  fclose(yyin);
}

int yywrap(){
  return 1;
}
