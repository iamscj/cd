%{
#include<stdio.h>
%}

%%
"a" {return 'a';}
"b" {return 'b';}
"c" {return 'c';}
\n {return 0;}
%%