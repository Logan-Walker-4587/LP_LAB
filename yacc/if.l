%{
    #include "y.tab.h"
%}

%%
"if"          { return IF; }
"else"        { return ELSE; }
"end"         { return END; }
"("           { return LPAREN; }
")"           { return RPAREN; }
"{"           { return LBRACE; }
"}"           { return RBRACE; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
">="          { return REL_OP; }    /* Greater than or equal to */
"<="          { return REL_OP; }    /* Less than or equal to */
"=="          { return REL_OP; }    /* Equal to */
"!="          { return REL_OP; }    /* Not equal to */
">"           { return REL_OP; }    /* Greater than */
"<"           { return REL_OP; }    /* Less than */
"="           { return ASSIGN_OP; } /* Assignment operator */
"+"           { return ADD_OP; }     /* Addition */
"-"           { return SUB_OP; }     /* Subtraction */
"*"           { return MUL_OP; }     /* Multiplication */
"/"           { return DIV_OP; }     /* Division */
"%"           { return MOD_OP; }     /* Modulo */
";"           { return SEMICOLON; }  /* End of statement */
[0-9]+        { return NUM; }        /* Numbers */
[ \t\n]       { /* Ignore whitespace */ }
.             { printf("Unexpected character: %s\n", yytext); return 0; }
%%

int yywrap() {
    return 1;
}

