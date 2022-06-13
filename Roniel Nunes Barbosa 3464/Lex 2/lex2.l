%{ 
    /*Definições de constantes em manifesto.*/
    /*codigo colocado aqui aparece no arquivo gerado pelo flex*/
#include <stdio.h>
%} 
/* /mnt/c/Users/ronie/OneDrive/'Área de Trabalho'/'9° Período'/'CCF 441 - Compiladores'/'05 - Trabalhos'/'Trabalho 0'/'Lex 2'*/
/* This tells flex to read only one input file */ 
/*isso diz ao flex para ler apenas um arquivo de entrada*/
%option noyywrap 

/* definicoes regulares */ 

delim		            [ \t\n] 
ws		                {delim}+ 

palavra                 [A-Za-z]+

rg                      [A-Z]{2}[-][0-9]{2}[.][0-9]{3}[.][0-9]{3}
data                    [0-9]{2}[/][0-9]{2}[/][0-9]{4}
nome                    {palavra}[" "]{palavra}[" "]{palavra}[" "]{palavra}*       
cpf                     [0-9]{3}[.][0-9]{3}[.][0-9]{3}[-][0-9]{2}
naturalidade            [A-Z]+[\-][A-Z]{2}
doc_origem              [A-Z]{4}[.][" "][A-Z]{2}[-][0-9]{3}[" "][A-Z]{2}[-][0-9]{2}
via                     [1-9]+[.][V][I][A]

%% 
 
{ws}		                     {/*nenhuma acao e nenhum retorno*/} 
{rg}                             printf("Foi encontrado um registo geral. LEXEMA: %s\n", yytext);
{data}                           printf("Foi encontrado uma data. LEXEMA: %s\n", yytext);
{nome}                           printf("Foi encontrado um nome proprio. LEXEMA: %s\n", yytext);
{cpf}                            printf("Foi encontrado um CPF. LEXEMA: %s\n", yytext);  
{naturalidade}                   printf("Foi encontrado uma naturalidade. LEXEMA: %s\n", yytext);  
{doc_origem}                     printf("Foi encontrado o doc origem. LEXEMA: %s\n", yytext);
{via}                            printf("Foi encontrado a via. LEXEMA %s\n", yytext);

%% 

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/ 

int main(void) 
{ 
    /* Call the lexer, then quit. */ 
    yylex(); 
    return 0; 
}
