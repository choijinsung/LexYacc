%{
/*
	Ultra-mini PASCAL parser
*/
#include <stdio.h>
%}

%token	TIDENT TNUMBER TASSIGN TSEMI TDOT TCOMMA TBEGIN TEND TIF TELSE TFOR TERROR
%token	TLPAREN TRPAREN TLBRACKET TRBRACKET TLT TGT TNGT TNLT SVOID SINT SCHAR SFLOAT SDOUBLE

%left	TPLUS TMINUS
%left	TMUL TDIV TMOD

%%
func_stmt:	type_specifier TIDENT TLPAREN param_list TRPAREN compound_stmt	{ puts("1"); }
		;
param_list: param { puts("2-1"); }
	    | param_list TCOMMA param { puts("2-2"); }
	    ;
param: /* empty statement */ { puts("3-1"); }
       | type_specifier identifier { puts("3-2"); }
       ;
identifier: TIDENT { puts("4-1"); }
	    | identifier TLBRACKET expone TRBRACKET { puts("4-2"); }
	    ;
type_specifier:	SVOID { puts("5-1"); }
		| SINT { puts("5-2"); }
		| SCHAR { puts("5-3"); }
		| SFLOAT { puts("5-4"); }
		| SDOUBLE { puts("5-5"); }
		;
compound_stmt:	TBEGIN stmt_list TEND	{ puts("6-1"); }
		;
stmt_list: stmt { puts("7-1"); }
	   | stmt TSEMI stmt_list { puts("7-2"); }
	   ;
stmt: /* empty statement */ { puts("8-1"); }
      | decl_stmt { puts("8-2"); }
      | for_stmt { puts("8-3"); }
      | assign_stmt { puts("8-4"); }
      ;
decl_stmt: type_specifier decl_ident { puts("9-1"); }
	   | decl_stmt TCOMMA decl_ident { puts("9-2"); }
	   ;
decl_ident: identifier { puts("10-1"); }
	    | assign_stmt { puts("10-2"); }
	    | identifier TASSIGN TBEGIN expone TEND { puts("10-3"); }
	    ;
for_stmt: TFOR TLPAREN assign_stmt TSEMI exptwo TSEMI exptwo TRPAREN stmt { puts("11-1"); }
	  | TFOR TLPAREN assign_stmt TSEMI exptwo TSEMI exptwo TRPAREN compound_stmt { puts("11-2"); }
	  ;
assign_stmt: identifier TASSIGN exptwo { puts("12-1"); }
	     ;
exptwo: identifier TNGT exptwo { puts("13-1"); }
	| identifier TMINUS exptwo { puts("13-2"); }
	| expzero { puts("13-3"); }
	;  
expone: /* empty statement */ { puts("14-1"); }
	| exptwo { puts("14-2"); }
	;
expzero: TNUMBER { puts("15-1"); }
	| identifier { puts("15-2"); }
	| expzero TPLUS TPLUS { puts("15-3"); }
	;
%%

main()
{
	yyparse();
}

yyerror(s)
char *s;
{	
	fprintf(stderr, "%s\n", s);
}