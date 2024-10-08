%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    int yylex(void);
    int yyerror(const char *s);
%}

%token NUMBER ID

// Define the operator precedence and associativity
%left '+' '-'
%left '*' '/' '%'

// Rule Section
%%
S : Assignment ';' { printf("Valid arithmetic expression\n"); }
  ;

Assignment : Term '=' Expression
           ;

Expression : Expression Operator Expression
           | '(' Expression ')'
           | Term
           ;

Term : NUMBER
     | ID
     ;

Operator : '+'
         | '-'
         | '*'
         | '/'
         | '%'
         ;

%%

int main() {
    printf("Enter the expression:\n");
    yyparse();  // Start the parsing process
    return 0;
}

int yyerror(const char* s) {
    if (s && strcmp(s, "syntax error") == 0) {
        printf("Invalid arithmetic expression: Missing semicolon or invalid format\n");
    } else {
        printf("Invalid arithmetic expression\n");
    }
    return 0;
}

