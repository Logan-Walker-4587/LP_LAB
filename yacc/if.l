%{
    #include "y.tab.h"
%}

%%
"if"            { return IF; }
"end"           { return END; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }

">="            { return GE; }
"<="            { return LE; }
"=="            { return EQ; }
"!="            { return NEQ; }
">"             { return GT; }
"<"             { return LT; }
"="             { return EQUALS; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }
";"             { return SEMICOLON; }

[0-9]+          { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

[\t\n ]+        ;  // Ignore whitespace

.               { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}

