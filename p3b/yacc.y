%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    int yyerror(char*);
    
    int count = 0;
%}

%token FOR IDEN NUM

%%
S : I 
  ;
I : FOR A B {count++;}
  ;
A : '(' ')' 
  ;
B   : B B
    | '{' B '}'
    | I
    |
    ;
%%

int main()
{
    printf("Enter the code snippet\n");
    yyparse();
    printf("Valid for loop\n");
    printf("Count of for loops = %d\n", count);
    return 0;
}

int yyerror(char* mesg)
{
    printf("Invalid\n");
    exit(0);
}