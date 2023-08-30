%{
#include<stdio.h>
#include<stdlib.h>
int spaces = 0,chars = 0, words = 0, lines = 1;
%}

%%
[\n] {lines++;}
[a-zA-Z]+ {chars+=yyleng; words++;}
[ ] {spaces++; chars++;}
"$" {return 0;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter String \n");
    yylex();
    printf("%d %d %d %d",lines,words,spaces,chars);
}