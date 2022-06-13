%{ 
    /*Definições de constantes em manifesto.*/
    /*codigo colocado aqui aparece no arquivo gerado pelo flex*/
#include <stdio.h>
%} 
/* /mnt/c/Users/ronie/OneDrive/'Área de Trabalho'/'9° Período'/'CCF 441 - Compiladores'/'05 - Trabalhos'/'Trabalho 0'/'Lex 1'*/
/* This tells flex to read only one input file */ 
/*isso diz ao flex para ler apenas um arquivo de entrada*/
%option noyywrap 

/* definicoes regulares */ 

delim		            [ \t\n] 
ws		                {delim}+ 
 
inteiro_positivo         (\+?)[0-9]+
inteiro_negativo         (\-?)[0-9]+
numero_decimal           ((\-|\+)?)[0-9]+(\.)[0-9]+
placa                    [A-Z][A-Z][A-Z](\-)[0-9][0-9][0-9][0-9]
palavra                  [A-Za-z]+
telefone                 [0-9][0-9][0-9][0-9](\-)[0-9][0-9][0-9][0-9]
nome_proprio             {palavra}[" "]{palavra}[" "]{palavra}[" "]{palavra}*

%% 
 
{ws}		                     {/*nenhuma acao e nenhum retorno*/} 
{inteiro_positivo}               printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext);
{inteiro_negativo}               printf("Foi encontrado um numero negativo negativo. LEXEMA: %s\n", yytext);
{numero_decimal}                 printf("Foi encontrado um numero com parte decinal. LEXEMA: %s\n", yytext);
{placa}                          printf("Foi encontrado uma placa. LEXEMA: %s\n", yytext);
{palavra}                        printf("Foi encontrado uma palavra. LEXEMA: %s\n", yytext);
{telefone}                       printf("Foi encontrado um telefone. LEXEMA: %s\n", yytext);
{nome_proprio}                   printf("Foi encontrado um nome proprio. LEXEMA: %s\n", yytext);

%% 

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/ 

int main(void) 
{ 
    /* Call the lexer, then quit. */ 
    yylex(); 
    return 0; 
}
