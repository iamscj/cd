%{
    #include<stdio.h>
    extern int yylex();
    int yyerror();
%}

%%
S : A B
  |
  ;
A : 'a' A 'b'
  |
  ;
B : 'b' B 'c'
  |
  ;
%%

int yyerror()
{
    printf("Invalid");
    exit(0);
}

int main()
{
    printf("Enter \n");
    yyparse();
    printf("Valid\n");
    return 0;
}