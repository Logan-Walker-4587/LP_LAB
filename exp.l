%{
#include <stdio.h>
int p_count = 0;
int flag = 0;
int last_token = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (last_token == 1) {
        flag = 1;
    }
    last_token = 1;
}

[+\-*/%] {
    if (last_token == 2 || last_token == 0) {
        flag = 1;
    }
    last_token = 2;
}

[ \t] {}

\( {
    p_count++;
    last_token = 0;
}

\) {
    p_count--;
    if (p_count < 0) {
        flag = 1;
    }
    if (last_token == 1)
    {
      last_token = 0;
    }
}

\n {
    return 0;
}

. {
    flag = 1;
}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter an arithmetic expression: ");
    yylex();

    if (flag == 0) {
        if (p_count == 0 && last_token != 2) {
            printf("Valid expression\n");
        } else {
            printf("Not valid: Unmatched parentheses or incorrect structure\n");
        }
    } else {
        printf("Invalid expression\n");
    }
    return 0;
}

