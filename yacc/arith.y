%{
    #include <stdio.h>
    void yyerror(const char *);
%}

%token ID NUM
%token PLUS MINUS MUL DIV EQUALS SEMICOLON

%%

expression: ID EQUALS term operator term SEMICOLON { printf("Valid expression\n"); }
;

term: ID
    | NUM
;

operator: PLUS
        | MINUS
        | MUL
        | DIV
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an arithmetic expression: ");
    return yyparse();
}

