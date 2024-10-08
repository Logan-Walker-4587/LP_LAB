%{
    #include <stdio.h>
    #include <stdlib.h>

    extern int yylex();
    extern int yyerror(const char *s);
%}

%token IF ELSE END
%token LPAREN RPAREN LBRACE RBRACE
%token ID REL_OP ASSIGN_OP ADD_OP SUB_OP MUL_OP DIV_OP MOD_OP SEMICOLON NUM
%token EQ_OP

%left ADD_OP SUB_OP
%left MUL_OP DIV_OP MOD_OP
%right ASSIGN_OP

%%
stmt:
    if_stmt
    ;

if_stmt:
    IF LPAREN condition RPAREN LBRACE statements RBRACE END
    {
        printf("Valid if statement.\n");
        exit(0);  // Exit the program immediately after a valid statement
    }
    | error
    {
        printf("Error: Invalid if statement format.\n");
        YYABORT;  // Abort parsing on error
    }
    ;

condition:
    expression REL_OP expression
    ;

expression:
    ID
    | NUM
    | expression ADD_OP expression
    | expression SUB_OP expression
    | expression MUL_OP expression
    | expression DIV_OP expression
    | expression MOD_OP expression
    ;

statements:
    statement
    | statements statement
    ;

statement:
    assignment SEMICOLON
    | expression SEMICOLON
    ;

assignment:
    ID ASSIGN_OP expression
    ;

%%

int main(void) {
    printf("Enter an if statement:\n");
    return yyparse();
}

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}

