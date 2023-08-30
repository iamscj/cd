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

I : FOR A B   {count++;}
  ;

A : '(' INIT ';' COND ';' UPD ')'
  ;
  
INIT : IDEN '=' IDEN
     | IDEN '=' NUM
     |
     ;

COND : IDEN REL IDEN
     | IDEN REL NUM
     |
     ;

UPD : IDEN '+''+'
    | IDEN '-''-'
    |
    ;

B : B B
  | '{' B '}'
  | I
  | IDEN '=' E ';' B
  | IDEN '=' E ';'
  |
  ;

E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | IDEN
  | NUM
  ;

REL : '>''='
    | '<''='
    | '!''='
    | '=''='
    | '>'
    | '<'
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

