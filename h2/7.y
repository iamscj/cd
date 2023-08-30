%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    int yyerror();
%}

%token KEY IDEN RET NUM

%%
S : I
  ;
I : KEY IDEN '(' A ')' '{' B '}'
  ;
A : KEY IDEN ',' A
  | KEY IDEN
  |
  ;
E : IDEN '+' IDEN
  ;
B : IDEN '=' E
  | IDEN '=' NUM
  | RET E
  | RET NUM
  |
  ;
%%

int yyerror()
{
    printf("Invalid\n");
    exit(0);
    return 1;
}
int main() {
    printf("Enter the function definition\n");
    yyparse();
    printf("Valid function definition\n");
    return 0;
}