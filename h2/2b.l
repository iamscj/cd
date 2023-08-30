%{
#include<stdio.h>
#include"y.tab.h"
%}

%%
[0-9]+ {yylval = atoi(yytext);return NUM;}
[-+*/()] {return yytext[0];}
[ \n\t] ;
"$" {return 0;}
%%