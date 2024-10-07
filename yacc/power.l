%{
    #include "y.tab.h"  // Include the YACC header file
%}

%%
a   return A;
b   return B;

\n  return 0;  // Handle newline to indicate end of input

.   yyerror("Invalid character");  // Handle invalid characters

%%
int yywrap() {
    return 1;
}

