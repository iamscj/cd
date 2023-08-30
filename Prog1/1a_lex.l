%{
#include <stdio.h>
int words = 0, chars = 0, lines = 1, spaces = 0;
%}

%%
\n	{lines++;} 
\t	{spaces+=4;}
[ ]	{spaces++;}
[^ \t\n#]+ {words++;chars+=yyleng;}
# {return 0;}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter the string\n");
    yylex();
    printf("Number of words = %d\n", words);
    printf("Number of chars = %d\n", chars);
    printf("Number of lines = %d\n", lines);
    printf("Number of spaces = %d\n", spaces);
    return 0;
}
