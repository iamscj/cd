%{
    #include<stdio.h>
    extern int yylex();
    int yyerror();
    int cnt=0;
%}

%token IDEN NUM KEY

%%
S : D ';' S
  |
  ;
D : D ',' I
  | T I
  ;
T :  KEY
  ;
I : IDEN {cnt++;}
  | IDEN C {cnt++;}
  ;
C : '[' NUM ']' C
  |
  ;
%%

int yyerror()
{
    return 1;
}

int main()
{
    yyparse();
    printf("count %d\n",cnt);
}