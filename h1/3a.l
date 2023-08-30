%{
#include<stdio.h>
#include<stdlib.h>
extern FILE *yyin, *yyout;
int s=0,m=0;
int flag1=0,flag2=0;
%}

%%
[/][*] {if(flag1==0 && flag2==0){flag1=1;m++;}}
[*][/] {if(flag1==1){flag1=0;}}
[/][/] {if(flag1==0 && flag2==0){flag2=1;s++;}}
\n {if(flag2==1){flag2=0;}}
"$" {return 0;}
. {fprintf(yyout , "%c", yytext[0]);}
%%

int yywrap(){
    return 1;
}

int main()
{

    // printf("Enter : \n");
    yyin = fopen("in.txt","r");
    yyout = fopen("out.txt","w");
    yylex();
    printf("%d %d\n",s,m);
}