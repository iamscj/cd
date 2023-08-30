%{
    #include<stdio.h>
    int words=0,chars=0,spaces=0,lines=0;
%}

%%
\n {lines++;}
\t {spaces+=4;}
[ ] {spaces++;}
[^ \n\t#] {chars+=yyleng; words++;}
# {return 0;}
%%

int yywrap(){
    return 1;
}

int main()
{
    printf("Enter : \n");
    yylex();
    printf("%d %d %d %d", words, chars, spaces, lines);
}