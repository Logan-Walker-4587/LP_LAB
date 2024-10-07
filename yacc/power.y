%{
    #include <stdio.h>
    void yyerror(const char *);
%}

%token A B

%%

S: A L B { printf("Accepted: a^n b^n\n"); }
;

L: A L B  { /* Recursive for a^n b^n */ }
| /* epsilon (empty string) */
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("enter a string : ");
    return yyparse();
}

