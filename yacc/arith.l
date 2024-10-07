%{
    #include "y.tab.h"
%}

%%
[0-9]+            { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }

"+"               { return PLUS; }
"-"               { return MINUS; }
"*"               { return MUL; }
"/"               { return DIV; }
"="               { return EQUALS; }
";"               { return SEMICOLON; }

[\t\n ]+          ;  // Ignore whitespaces

.                 { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}

