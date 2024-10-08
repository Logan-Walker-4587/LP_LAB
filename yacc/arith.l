%{
    #include "y.tab.h"
    #include <ctype.h>
%}

%%
[0-9]+            { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { return ID; }
"="               { return '='; }
"+"               { return '+'; }
"-"               { return '-'; }
"*"               { return '*'; }
"/"               { return '/'; }
"%"               { return '%'; }
";"               { return ';'; }
"("               { return '('; }
")"               { return ')'; }
[ \t\n]           ; /* Ignore whitespace */
.                 { return yytext[0]; } /* For any other character */

%%

int yywrap() {
    return 1;
}

