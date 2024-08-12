%{
#include<stdio.h>
int v = 0;
int c = 0;
%}

%%

[AEIOUaeiou] { v++; }
[A-Za-z] { c++; }
[^A-Za-z \n] ;
\n { return 0; }

%%
int yywrap(){}
int main()
{
     printf("\nEnter a sentence : ");
     yylex();
     printf("\nno.of vowels = %d",v);
     printf("\nno.of consonants = %d",c);
     return 0 ;
}
