%{
#include<stdio.h>
int spaces=0,words=0,lines=0,chars=0;
%}

%%
\n {lines++;}
\t {spaces+=4;}
[ ] {spaces++;}
[^ \n\t#] {chars+=yyleng;words++;}
# {return 0;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter : \n");
    yylex();
    printf("%d %d %d %d\n",spaces,words,lines,chars);
}