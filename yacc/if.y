%{
    #include <stdio.h>
    void yyerror(const char *);
%}

%token IF LPAREN RPAREN LBRACE RBRACE END SEMICOLON
%token ID NUM EQUALS PLUS MINUS MUL DIV EQ NEQ GT LT GE LE

%% 

program: if_stmt END SEMICOLON { printf("Valid IF statement\n"); }
;

if_stmt: IF LPAREN condition RPAREN LBRACE statements RBRACE
;

condition: expression
;

expression: ID GT ID
          | ID LT ID
          | ID GE ID
          | ID LE ID
          | ID EQ ID
          | ID NEQ ID
          | ID // Simple identifier as condition
;

statements: statement
          | statements statement
;

statement: ID EQUALS term SEMICOLON // Correctly define assignment
;

term: ID
    | NUM
;

%% 

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an IF statement:\n");
    return yyparse();
}

