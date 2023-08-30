%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
int idx = -1;
typedef char* string;
struct {
    string res;
    string op1;
    string op2;
    char op;
} code[100];

void printQuadruples();
void printTriples();
string addToTable(string,string,char);
int yyerror();
%}

%union{
    char* exp;
}

%token <exp> IDEN NUM
%type <exp> EXP

%%
STMTS : STMTS STMT
      |
      ;
STMT : EXP '\n'
     ;
EXP : EXP '+' EXP {$$=addToTable($1,$3,'+');}
    | EXP '-' EXP {$$=addToTable($1,$3,'-');}
    | EXP '*' EXP {$$=addToTable($1,$3,'*');}
    | EXP '/' EXP {$$=addToTable($1,$3,'/');}
    | IDEN '=' EXP {$$=addToTable($1,$3,'=');}
    | '(' EXP ')' {$$=$2;}
    | IDEN {$$=$1;}
    | NUM {$$=$1;}
    ;
%%

int yyerror()
{
    return 1;
}

int main() {
	printf("Enter : \n");
  	yyparse();
  	
  	printf("Three address code\n");
  	printTriples();
  	
  	printf("\nQuadruples\n");
  	printQuadruples();
  	
  	return 0;
}

string addToTable(string op1,string op2,char op)
{
    idx++;
    if(op == '=')
    {
        code[idx].res = op1;
        code[idx].op1 = op2;
        code[idx].op=op;
        return op1;
    }
    string res = malloc(3);
    sprintf( res ,"@%c",idx+'A');
    code[idx].res = res;
    code[idx].op1=op1;
    code[idx].op2=op2;
    code[idx].op=op;
    return res;
}

void printQuadruples()
{
    for(int i=0;i<=idx;i++)
    {
        if(code[i].op == '=')
        {
            printf("%d : %s %s %c\n",i,code[i].res,code[i].op1,code[i].op);
        }
        else{
            printf("%d : %s %s %s %c\n",i,code[i].res,code[i].op1,code[i].op2,code[i].op);
        }
    }
}

void printTriples()
{
    for(int i=0;i<=idx;i++)
    {
        if(code[i].op == '=')
        {
            printf("%s = %s\n",code[i].res,code[i].op1);
        } 
        else{
            printf("%s = %s %c %s\n",code[i].res,code[i].op1,code[i].op,code[i].op2);
        }
    }
}