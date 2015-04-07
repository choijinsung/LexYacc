%{
/*
	Mini C LEX input file
*/

#include "y.tab.h"
%}

letter	[a-zA-Z_]
digit	[0-9]

%%
\=	return(TASSIGN);
"+"	return(TPLUS);
"-"	return(TMINUS);
"*"	return(TMUL);
"/"	return(TDIV);
";"	return(TSEMI);
\(	return(TLPAREN);
\)	return(TRPAREN);
\.	return(TDOT);
\,	return(TCOMMA);
"{"	return(TBEGIN);
"}"	return(TEND);
"["	return(TLBRACKET);
"]"	return(TRBRACKET);
"<"	return(TLT);
">"	return(TGT);
"<="	return(TNGT);
">="	return(TNLT);
"=="	return(TEQUAL);
"&&"	return(TAND);
"||"	return(TOR);
for	return(TFOR);
if	return(TIF);
else	return(TELSE);
void	return(SVOID);
int	return(SINT);
char	return(SCHAR);
float	return(SFLOAT);
double	return(SDOUBLE);

{digit}+	return(TNUMBER);
{letter}({letter}|{digit})*	return(TIDENT);

[ \t\n\r]	;
.	return(TERROR);
%%
int yywrap() { return 1; }

/* empty */