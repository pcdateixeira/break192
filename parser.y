
%token KW_CHAR
%token KW_INT
%token KW_FLOAT
%token KW_BOOL
%token KW_BYTE
%token KW_LONG

%token KW_IF
%token KW_THEN
%token KW_ELSE
%token KW_WHILE
%token KW_LOOP
%token KW_READ
%token KW_PRINT
%token KW_RETURN

%token OPERATOR_LE
%token OPERATOR_GE
%token OPERATOR_EQ
%token OPERATOR_DIF
%token TK_IDENTIFIER

%token LIT_INTEGER
%token LIT_FLOAT
%token LIT_TRUE
%token LIT_FALSE
%token LIT_CHAR
%token LIT_STRING

%token TOKEN_ERROR

%%

programa: ldec
	;
	
ldec: globalvar ';' ldec
	| cmd ';' ldec
	|
	;

globalvar: type TK_IDENTIFIER '=' initvalue
	| type TK_IDENTIFIER '[' LIT_INTEGER ']' initvecvalue
	;

type: KW_INT
	| KW_FLOAT
	| KW_BOOL
	| KW_BYTE
	| KW_LONG
	;

initvalue: LIT_INTEGER
	| LIT_FLOAT
	| LIT_CHAR
	| LIT_TRUE
	| LIT_FALSE
	;

initvecvalue: ':' initvalue rvecvalue
	|
	;

rvecvalue: initvalue rvecvalue
	|
	;

cmd: TK_IDENTIFIER '=' expr
	| TK_IDENTIFIER '[' expr ']' '=' expr
	|
	;

expr: TK_IDENTIFIER
	| TK_IDENTIFIER '[' expr ']'
	| initvalue
	| expr '+' expr
	| expr '-' expr
	| expr '*' expr
	| expr '/' expr
	| expr '<' expr
	| expr '>' expr
	| expr '~' expr
	| expr OPERATOR_LE expr
	| expr OPERATOR_GE expr
	| expr OPERATOR_EQ expr
	| expr OPERATOR_DIF expr
	| '(' expr ')'
	;

%%

int yyerror(){
	fprintf(stderr, "Syntax error at line %d.\n", getLineNumber());
	exit(3);
}


