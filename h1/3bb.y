%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    int yyerror();
    
    int count = 0;
%}

%token FOR IDEN NUM

%%
S : I
  ;
I : FOR A B {count++;}
  ;
A : '('COND ')'
  ;
INIT : IDEN '=' IDEN
     |
     ;
COND : IDEN REL IDEN
     |
     ;
REL : '<'
    |
    ;
UPD : '+''+'
    | '-''-'
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
    return 1;
}
int main()
{
    printf("Enter \n");
    yyparse();
    printf("%d\n",count);
}