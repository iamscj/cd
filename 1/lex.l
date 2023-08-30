%{
#include<stdio.h>
int l=1,s=0,w=0,c=0;
%}

%%
"\n" {l++;}
[\t] {s+=4;}
[^ \n$\t] {c+=yyleng; w++;}
[ ] {s++;}
"$" {return 0;}
%%