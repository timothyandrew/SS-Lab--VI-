%{
  int block_count = 0, n = 0;
  int comment_block = 0, comment_line = 0; //flags
%}

%%
^[/][/] n++; comment_line++;
^[/][*] {
          block_count++;
          comment_block = 1;
        }
[*][/] {
          n += block_count;
          comment_block = 2; //End of block, but newline hasn't been counted.
          block_count = 0;
        }
\n      {
          if(comment_block == 1){
            block_count++;
          }
          else if(comment_line == 1){
            comment_line = 0;
          } else if (comment_block == 2){
            comment_block = 0;
          } 
          else {
            fprintf(yyout, "\n");  
          }
        }
.       {
          if(comment_block == 0 && comment_line == 0){
            fprintf(yyout, "%s", yytext);
          }
        }
%%
int main(){
  yyin = fopen("file1b.txt", "r");
  yyout = fopen("file1bwithoutcomments.txt", "w");
  yylex();
  printf("number of comment lines = %d\n", n);
  fclose(yyin);
  fclose(yyout);
}

int yywrap(){
  return 1;
}
