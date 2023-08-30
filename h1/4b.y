%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    int yyerror();
    
    int count = 0;
%}

%token IF NUM IDEN

%%
S : I
  ;
I : IF A B {count++;}
  ;
A : '(' COND ')'
  ;
COND : IDEN '<' IDEN
     | 
     ;
B : B B
  | '{' B '}'
  | I
  |
  ;
%%

int yyerror()
{
    printf("Invalid\n");
    return 1;
}

int main()
{
    printf("Enter \n");
    yyparse();
    printf("%d\n",count);
}