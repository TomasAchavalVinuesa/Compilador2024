package codigo;
import static codigo.Tokens.*;

%% //todas las declaraciones

%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{

    public String lexeme;

%}
%% 

void {lexeme = yytext(); return Void;}
main {lexeme = yytext(); return Main;}
true | false {lexeme = yytext(); return Val_booleano;}
return {lexeme = yytext(); return Return;}
int {lexeme = yytext(); return Int;}
bool {lexeme = yytext(); return Bool;}
{espacio} {/* Ignore */}
"//".* {/* Ignore */}

"=" {lexeme = yytext(); return Igual;}
";" {lexeme = yytext(); return Punto_coma;}
"(" {lexeme = yytext(); return Parentesis_a;}
")" {lexeme = yytext(); return Parentesis_c;}
"{" {lexeme = yytext(); return Llave_a;}
"}" {lexeme = yytext(); return Llave_c;}
"[" {lexeme = yytext(); return Corchete_a;}
"]" {lexeme = yytext(); return Corchete_c;}
"+" {lexeme = yytext(); return Suma;}
"-" {lexeme = yytext(); return Resta;}
"*" {lexeme = yytext(); return Multiplicacion;}
"/" {lexeme = yytext(); return Division;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
"-"?{D}+(\.{D}+)? {lexeme=yytext(); return Numero;}
. {return ERROR;}