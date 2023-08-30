%{
#include<stdio.h>
#include<stdlib.h>
extern FILE *yyin, *yyout;
int s=0,m=0;
int flag1=0,flag2=0;
%}

%%
[/][*] {if(flag1 == 0 && flag2 == 0){flag1=1; m++;}}
[*][/] {if(flag1 == 1){flag1=0;}}
[/][/] {if(flag2 == 0 && flag1==0){s++; flag2=1;}}
["\n"] {flag2=0;}
"$" {return 0;}
. {fprintf(yyout, "%c", yytext[0]);}
%%

int yywrap()
{
    return 1;
}

int main(){
yyin = fopen("foo.txt", "r");
yyout = fopen("bar.txt", "w");
yylex();
printf("Single Count : %d, Multiple Count : %d\n",s, m);
return 0;
}