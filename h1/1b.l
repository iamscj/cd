%{
#include<stdio.h>
%}

%%
"a" {return 'a';}
"b" {return 'b';}
\n {return 0;}
. {return yytext[0];}
%%