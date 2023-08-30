%{
    #include <stdio.h>
    #include <stdlib.h>
    int keyCount = 0, idenCount = 0, opCount = 0;
%}

%%
"int"		{keyCount++; printf("Keyword is %s\n", yytext);}
"float"	{keyCount++; printf("Keyword is %s\n", yytext);}
"char"		{keyCount++; printf("Keyword is %s\n", yytext);}
"double"	{keyCount++; printf("Keyword is %s\n", yytext);}
"void"		{keyCount++; printf("Keyword is %s\n", yytext);}
"bool"		{keyCount++; printf("Keyword is %s\n", yytext);}
"if"		{keyCount++; printf("Keyword is %s\n", yytext);}
"else"		{keyCount++; printf("Keyword is %s\n", yytext);}
"while"	{keyCount++; printf("Keyword is %s\n", yytext);}
"for"		{keyCount++; printf("Keyword is %s\n", yytext);}
"do"		{keyCount++; printf("Keyword is %s\n", yytext);}
[a-zA-Z][a-zA-Z0-9]* {idenCount++; printf("Identifier is %s\n", yytext);}
">="	{opCount++; printf("Operator is %s\n", yytext);}
"<="	{opCount++; printf("Operator is %s\n", yytext);}
"=="	{opCount++; printf("Operator is %s\n", yytext);}
"!="	{opCount++; printf("Operator is %s\n", yytext);}
">"	{opCount++; printf("Operator is %s\n", yytext);}
"<"	{opCount++; printf("Operator is %s\n", yytext);}
"&&" 	{opCount++; printf("Operator is %s\n", yytext);}
"||" 	{opCount++; printf("Operator is %s\n", yytext);}
"!" 	{opCount++; printf("Operator is %s\n", yytext);}
"+"	{opCount++; printf("Operator is %s\n", yytext);}
"-" 	{opCount++; printf("Operator is %s\n", yytext);}
"*" 	{opCount++; printf("Operator is %s\n", yytext);}
"/" 	{opCount++; printf("Operator is %s\n", yytext);}
"%" 	{opCount++; printf("Operator is %s\n", yytext);}
"^" 	{opCount++; printf("Operator is %s\n", yytext);}
"=" 	{opCount++; printf("Operator is %s\n", yytext);}
"#" {return 0;}
. ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter code\n");
    yylex();
    printf("Count of identifiers = %d\n", idenCount);
    printf("Count of keywords = %d\n", keyCount);
    printf("Count of operators = %d\n", opCount);
    return 0;
}
