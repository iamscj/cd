%{
#include<stdio.h>
int lines=1,words=0,chars=0,spaces=0;
%}

%%
"\n" {lines++;}
[a-zA-Z]+ {chars+=yyleng; words++;}
[ ] {spaces++;}
"$" {return 0;}
%%

int yywrap() {
    return 1;
}

int main()
{
    printf("Enter text\n");
    yylex();
    printf("%d %d %d %d",lines,words,spaces,chars);
}