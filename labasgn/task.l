%{
#include <stdio.h>
#include <stdlib.h>

int keyword_count = 0;
int identifier_count = 0;
int number_count = 0;
int symbol_count = 0;
int string_count=0;
int line_number = 1;

%}

%%

"appoint"|"identical"|"add"|"subtract"|"divide"|"multiply"|"power" { 
    printf(" (Line %3d)   KEYWORD : %s\n",line_number, yytext); 
    keyword_count++; 
}

"gt" { 
    printf(" (Line %3d)   KEYWORD: gt\n",line_number); 
    keyword_count++; 
}

"lt" { 
    printf("(Line %3d)   KEYWORD: lt\n",line_number); 
    keyword_count++; 
}

"gte" { 
    printf("(Line %3d)   KEYWORD: gte\n",line_number); 
    keyword_count++; 
}

"lte" { 
    printf("(Line %3d)   KEYWORD: lte\n",line_number); 
    keyword_count++; 
}

"notidentical" { 
    printf("(Line %3d)   KEYWORD: not identical\n",line_number); 
    keyword_count++; 
}


"when"|"otherwise"|"eotherwise"|"show"|"button"|"cease"|"standby"|"endless"|"let"|"start"|"cycle"|"sweep"|"case" { 
    printf("(Line %3d)   KEYWORD: %s\n",line_number, yytext); 
    keyword_count++; 
}

"=="|"+"|"-"|"/"|"\\*"|">"|"<"|">="|"<="|"!=" { 
    printf("(Line %3d)   KEYWWORD: %s\n",line_number, yytext); 
    keyword_count++; 
}

[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("(Line %3d)   Identifier: %s\n",line_number, yytext); 
    identifier_count++; 
}

[0-9]+ { 
    printf("(Line %3d)   Number: %s\n",line_number, yytext); 
    number_count++; 
}

[\{\}\(\)] { 
    printf("(Line %3d)   Symbol: %s\n",line_number, yytext); 
    symbol_count++; 
}

\"[^\"]*\" { 
    printf("(Line %3d)   String: %s\n",line_number, yytext); 
    string_count++; 
}

[ \t\r]+ { 
    
}

\n                      { line_number++; }

. { 
    printf(" (Line %3d)   Unknown  syntax error  %s\n",line_number, yytext); 
   
}

%%

int main(int argc, char *argv[]) {
    yyin = freopen("m.txt", "r", stdin);
    freopen("n.txt", "w", stdout);   
    yylex();

    printf("\nToken Counts:\n");
    printf("Keywords: %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    printf("Numbers: %d\n", number_count);
    printf("Symbols: %d\n", symbol_count);
    
    
    printf("Strings: %d\n", string_count);
    return 0;
}

int yywrap() {
    return 1;
}
