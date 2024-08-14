%{
#include <stdio.h>
#include <string.h>

// Counters for various elements
int statement_count = 0;
int integer_count = 0;
int assignment_operator_count = 0;
int relational_operator_count = 0;
int identifier_count = 0;

%}

%%

";"              { statement_count++; }

[0-9]+           { integer_count++; }

"="              { assignment_operator_count++; }

"=="|"<"|"<="|">"|">="|"!="  { relational_operator_count++; }

"include"|"stdio.h"|"if"|"else"|"while"|"for"|"printf"|"int"|"char"|"float"|"do"|"static" {

}

[a-zA-Z_][a-zA-Z0-9_]*   { identifier_count++; }

[ \t\n\r]+       { /* Ignore whitespace */ }

.                { /* Ignore everything else */ }

%%

int yywrap();
int main(int argc, char** argv)
{
    if (argc != 2) {
        printf("Usage: %s <C program file>\n", argv[0]);
        return 1;
    }

    FILE* fd = fopen(argv[1], "r");
    if (!fd) {
        perror("File opening failed");
        return 1;
    }

    yyin = fd;
    yylex();

    fclose(fd);

    // Output the results
    printf("Number of statements: %d\n", statement_count);
    printf("Number of integers: %d\n", integer_count);
    printf("Number of assignment operators: %d\n", assignment_operator_count);
    printf("Number of relational operators: %d\n", relational_operator_count);
    printf("Number of identifiers: %d\n", identifier_count);

    return 0;
}
