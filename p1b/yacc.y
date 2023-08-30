%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
int yyerror(char*);
%}

%%
S : A B
  ;
A : 'a' A 'b'
  |
  ;
B : 'b' B 'c'
  |
  ;
%%

int yyerror(char * msg)
{
    printf("Invalid\n");
    exit(0);
}

int main()
{
    printf("Enter String\n");
    yyparse();
    printf("Valid\n");
    return 0;
}