lexer grammar AlgumaLexer;

//palavras chave verificada inicialmente, para que não fossem classificadas como cadeias
PALAVRA_CHAVE 
	:	'algoritmo' | 'declare' | 'literal' | 'inteiro' | 'leia' | 'escreva' | 'fim_algoritmo' | 'real' | 'literal' 
	| 'logico' | 'fim_se' | 'senao' | 'entao' | 'se' | 'ou' | 'fim_caso' | 'para' | 'ate' | 'faca' | 'fim_para'
	| 'fim_enquanto' | 'fim_para' | 'seja' | 'caso' | 'enquanto' | 'registro' | 'fim_registro'
	| 'tipo' | 'fim_procedimento' | 'procedimento' | 'var' | 'funcao' | 'fim_funcao'
	| 'retorne' | 'constante' | 'falso' | 'verdadeiro'
	; 

//todos os elementos que deveriam ser repetidos na saída foram colocasos em uma só classe, por isso alguns são operadores e delimitadores
PONTUACAO : ',' | '(' | ')' | '/' | '+' | '<-' | '-' | '*' | 'e' | 'nao' | '=' | '<=' | '>=' | '..' | '<' 
	| '<>' | '>' | '%' | '^' | '&' | '.' | '[' | ']' | ':'
	;

//aceita casos em que a variavel possui "_" no meio
IDENT : ('a'..'z'|'A'..'Z') ('a'..'z'|'A'..'Z'|'0'..'9' | '_')*
	;

NUM_INT	: ('0'..'9')+
	;
NUM_REAL : ('0'..'9')+ ('.' ('0'..'9')+)?
	;

CADEIA 	: '"' ( ~('\n') )*? '"'
	;
fragment
ESC_SEQ	: '\\\'';

//caso em que o comentario possui uma chave fechada a mais
//precisa vir antes da classe de comentário, senão o token seria identificado como um comentário primeiro e depois seria verificado o } a mais
//nesse caso como ainda não há o tipo comentário, o token reconhecido é o comentário + }
ERRO_COMENTARIO: '{' ~('\n'|'\r')* '\r'? '}}' ('\n' | ' ')
	;


COMENTARIO
    :   '{' ~('\n'|'\r')* '\r'? '}' ('\n' | ' ') {skip();} 
    ;


WS  :   ( ' '
        | '\t'
        | '\r'	
        | '\n'
        ) {skip();}
    ;

//trata o erro da cadeia sem aspas fechando
CADEIA_NAO_FECHADA: '"' ( ~('\n') )*? 
	;

//trata o erro do comentário sem chaves fechando
COMENTARIO_ABERTO:  '{' ~('\n'|'\r' | '}')* ('\n')
	;

//trata caracteres que não são reconhecidos
ERRO_CARACTER : ('~')* | '$' 
	;	