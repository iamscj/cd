%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}

%%
"if" {return IF;}
[a-zA-Z][a-zA-Z0-9]* {return IDEN;}
[0-9]+ {return NUM;}
[ \n\t] ;
# {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
    return 1;
}
