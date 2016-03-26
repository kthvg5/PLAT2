/* ---- Kyle Hatfield's PROLOGUE ---- */
%{
#include <iostream>
using namespace std;

int token_no = 0;
int no_lines = 0;
int no_comments = 0;
%}
		              /* ---- DEFINITIONS ---- */
%option noyywrap
DIGIT		[0-9]

%%  		              /* ---- REGULAR EXPRESSIONS ---- */

[ \t]           ;
\n              { no_lines++; }
\%(.)*          {no_comments++;}
(\+|\-)?{DIGIT}+        { cout << "#" << token_no <<": TOKEN: INTCONST  LEXEME: " << yytext << endl; token_no++; }
(\+|\-)?{DIGIT}+\.{DIGIT}+  { cout << "#" << token_no << ": TOKEN: DECCONST LEXEME: " << yytext << endl; token_no++;}
(\+|\-)?{DIGIT}+\.{DIGIT}+E(\+|\-)?{DIGIT}+ {cout << "#" << token_no << ": TOKEN: SCICONST  LEXEME: " << yytext << endl; token_no++;}
[A-F0-9]+H   { cout << "#" << token_no << ": TOKEN: HEXCONST  LEXEME: " << yytext << endl; token_no++;}
(0|1)+B {cout << "#" << token_no << ": TOKEN: BINCONST  LEXEME: " << yytext << endl; token_no++;}
("if"|"else"|"func"|"let"|"print"|"while") {cout << "#" << token_no << ": TOKEN: KEYWORD  LEXEME: " << yytext << endl; token_no++;}
[a-zA-Z][a-zA-Z0-9]*    { cout << "#" << token_no << ": TOKEN: IDENT  LEXEME: " << yytext << endl; token_no++; }
\"[a-zA-Z0-9 ]*\" { cout << "#" << token_no << ": TOKEN: STRCONST LEXEME: " << yytext << endl; token_no++; }
(\+|\-|\*|\/|\<|\>|\&) {cout << "#" << token_no << ": TOKEN: OPERATOR  LEXEME: " << yytext << endl; token_no++; }
. {cout << "#" << token_no << ": TOKEN: ? LEXEME: " << yytext << endl; token_no++;}
%%  		              /* ---- EPILOGUE ---- */

int main()
{
    yylex();
    cout << no_lines << "lines processed." << endl;
    return 0;
}
