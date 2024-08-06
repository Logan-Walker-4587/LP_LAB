%{
#include<stdio.h>
%}

%%

[a-zA-Z_][_a-zA-Z0-9]* { printf("\nValid identifier\n"); return 0;}
.* { printf("Not a valid identifier\n"); return 0; }

%%

int main() 
{
    printf("Enter a string : ");
    yylex();
}
