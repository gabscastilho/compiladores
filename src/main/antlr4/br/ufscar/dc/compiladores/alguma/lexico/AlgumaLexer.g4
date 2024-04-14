lexer grammar AlgumaLexer;

ERRO : ('~')* | '$' 
	;	

PALAVRA_CHAVE 
	:	'algoritmo' | 'declare' | 'literal' | 'inteiro' | 'leia' | 'escreva' | 'fim_algoritmo' | 'real' | 'literal' 
	| 'logico' | 'fim_se' | 'senao' | 'entao' | 'se' | 'ou' | 'fim_caso' | 'para' | 'ate' | 'faca' | 'fim_para'
	| 'fim_enquanto' | 'fim_para' | 'seja' | 'caso' | 'enquanto' | 'registro' | 'fim_registro'
	| 'tipo' | 'fim_procedimento' | 'procedimento' | 'var' | 'funcao' | 'fim_funcao'
	| 'retorne' | 'constante' | 'falso' | 'verdadeiro'
	; 

PONTUACAO : ',' | '(' | ')' | '/' | '+' | '<-' | '-' | '*' | 'e' | 'nao' | '=' | '<=' | '>=' | '..' | '<' 
	| '<>' | '>' | '%' | '^' | '&' | '.' | '[' | ']' | ':'
	;

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

CADEIA_NAO_FECHADA: '"' ( ~('\n') )*? 
	;

COMENTARIO_ABERTO:  '{' ~('\n'|'\r' | '}')* ('\n')
	;