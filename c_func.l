%{
#include <stdio.h>
#include <stdlib.h>

enum tokentype {
	EOFT, IDENTT, NUMT, ADDT, SUBT, MULT, DIVT, MODT, ASSIGNT, BACKSLT,
	GTT, LTT, NGTT, NLTT, EQT, NEQT, DOTT, COMT, COLT, SEMCOLT, QUOTET,
	LPARENT, RPARENT, LBRACET, RBRACET, LBRACKETT, RBRACKETT, AMPERT,
	IFSMB, ELSESMB, FORSMB, DOSMB, WHILESMB, SWITCHSMB, CASESMB, 
	RETURNSMB, EXITSMB, BREAKSMB, CONTSMB, VOIDSMB, INTSMB, CHARSMB, 
	FLOATSMB, DOUBLESMB, FILESMB, NULLSMB, ERRT
};

#undef yywrap
%}
letter 	[_a-zA-Z]
digit	[0-9]
%%
"+"				return(ADDT);
"-"				return(SUBT);
"*"				return(MULT);
"/"				return(DIVT);
"%"				return(MODT);
"&"				return(AMPERT);
"="				return(ASSIGNT);
">"				return(GTT);
"<"				return(LTT);
">="				return(NLTT);
"<="				return(NGTT);
"=="				return(EQT);
"!="				return(NEQT);
"."				return(DOTT);
","				return(COMT);
":"				return(COLT);
";"				return(SEMCOLT);
"("				return(LPARENT);
")"				return(RPARENT);
"{"				return(LBRACET);
"}"				return(RBRACET);
"["				return(LBRACKETT);
"]"				return(RBRACKETT);
\"				return(QUOTET);
\\				return(BACKSLT);

if				return(IFSMB);
else				return(ELSESMB);
for				return(FORSMB);
do				return(DOSMB);
while				return(WHILESMB);
switch				return(SWITCHSMB);
case				return(CASESMB);
return				return(RETURNSMB);
exit				return(EXITSMB);
break				return(BREAKSMB);
continue			return(CONTSMB);
void				return(VOIDSMB);
int				return(INTSMB);
char				return(CHARSMB);
float				return(FLOATSMB);
double				return(DOUBLESMB);
NULL				return(NULLSMB);
FILE				return(FILESMB);

{letter}({letter}|{digit})*	return(IDENTT);
{digit}+			return(NUMT);
[ \t\r\n]			;
.				return(ERRT);
%%
main() {
	enum tokentype tkt;

	while((tkt = yylex()) != EOFT) {
		switch(tkt) {
		case IDENTT:
		case NUMT:
			printf("\t(%2i, %s)\n", tkt, yytext);
			break;
		case ERRT:
			printf("error : %c\n", yytext[0]);
			break;
		default:
			printf("\t(%2i, 0)\n", tkt);
		}
	}
}

yywrap() { return 1; }