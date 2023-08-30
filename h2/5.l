%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
"int" {return KEY;}
"float" {return KEY;}
[a-zA-Z][a-zA-Z0-9]* {return IDEN;}
[0-9]+ {return NUM;}
[ \n\t] ;
"$" {return 0;}
. {return yytext[0];}
%%