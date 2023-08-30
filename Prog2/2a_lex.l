%{
#include <stdio.h>
#include <stdlib.h>
int posIntCount = 0, negIntCount = 0, posFracCount = 0, negFracCount = 0;
%}

num [0-9]+
posInt \+?{num}
negInt -{num}
posFrac \+?{num}\.{num}?|\+?\.{num}
negFrac -{num}\.{num}?|-\.{num}

%%
{posInt} {posIntCount++;}
{negInt} {negIntCount++;}
{posFrac} {posFracCount++;}
{negFrac} {negFracCount++;}
{posInt}\/{posInt} {posFracCount++;}
{negInt}\/{negInt} {posFracCount++;}
{posFrac}\/{posFrac} {posFracCount++;}
{negFrac}\/{negFrac} {posFracCount++;}
{posFrac}\/{posInt} {posFracCount++;}
{posInt}\/{posFrac} {posFracCount++;}
{negFrac}\/{negInt} {posFracCount++;}
{negInt}\/{negFrac} {posFracCount++;}
{posInt}\/{negInt} {negFracCount++;}
{negInt}\/{posInt} {negFracCount++;}
{posFrac}\/{negFrac} {negFracCount++;}
{negFrac}\/{posFrac} {negFracCount++;}
{posInt}\/{negFrac} {negFracCount++;}
{posFrac}\/{negInt} {negFracCount++;}
{negInt}\/{posFrac} {negFracCount++;}
{negFrac}\/{posInt} {negFracCount++;}
[ \t] ;
[\n] {return 0;}
%%

int yywrap() {
   return 1;
}

int main() {
   printf("Enter the sequence of numbers\n");
   yylex();
   printf("Positive Integer Count = %d\n", posIntCount);
   printf("Negative Integer Count = %d\n", negIntCount);
   printf("Positive Fraction Count = %d\n", posFracCount);
   printf("Negative Fraction Count = %d\n", negFracCount);
   return 0;
}