%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}

%%
"\n" {return 0;}
. {return yytext[0];}
%%