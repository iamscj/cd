%{
#include <stdio.h>
#include <stdlib.h>
int pi = 0, ni = 0, pf = 0, nf = 0;
%}

num [0-9]+
posInt \+?{num}
negInt -{num}
posFrac \+?{num}\.{num}?|\+?\.{num}
negFrac -{num}\.{num}?|-\.{num}

%%
{posInt} {pi++;}
{negInt} {ni++;}
{posFrac} {pf++;}
{negFrac} {nf++;}
{posInt}\/{posInt} {pf++;}
{negInt}\/{negInt} {pf++;}
{posFrac}\/{posFrac} {pf++;}
{negFrac}\/{negFrac} {pf++;}
{posFrac}\/{posInt} {pf++;}
{posInt}\/{posFrac} {pf++;}
{negFrac}\/{negInt} {pf++;}
{negInt}\/{negFrac} {pf++;}
{posInt}\/{negInt} {nf++;}
{negInt}\/{posInt} {nf++;}
{posFrac}\/{negFrac} {nf++;}
{negFrac}\/{posFrac} {nf++;}
{posInt}\/{negFrac} {nf++;}
{posFrac}\/{negInt} {nf++;}
{negInt}\/{posFrac} {nf++;}
{negFrac}\/{posInt} {nf++;}
[ \t] ;
[\n] {return 0;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter input\n");
    yylex();
    printf("%d %d %d %d",pi,ni,pf,nf);
}