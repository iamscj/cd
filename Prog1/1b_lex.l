%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}

%%
"a" {return 'a';}
"b" {return 'b';}
[\n] {return 0;}
. {return yytext[0];}
%%