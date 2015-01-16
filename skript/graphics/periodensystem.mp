%
% periodensystem.mp
%
% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
verbatimtex
\documentclass{book}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

numeric linewidth;
linewidth = 0.5pt;
numeric	unit;
unit := 20;

def element(expr Z, symbol, position) =
	pickup pencircle scaled linewidth;
	path p;
	p := ((0,0)--(unit,0)--(unit,unit)--(0,unit)--cycle)
		shifted (unit * position);
%	fill p withcolor (1,1,1);
	draw p;
	label(symbol, (0.5 * unit, 0.5 * unit) shifted (unit * position));
	label.lrt(Z, (0,unit) shifted (unit * position));
enddef;

beginfig(1)

fill ((0,0)--(2,0)--(2,1)--(0,1)--cycle) scaled unit withcolor(1,0.9,0.9);
element(btex \tiny  1 etex, btex H  etex, ( 0,0));
element(btex \tiny  2 etex, btex He etex, ( 1,0));

label.lft(btex $n=0$ etex, (0, 0.5) scaled unit);

endfig;

beginfig(2)

fill ((0,0)--(1,0)--(1,3)--(0,3)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((7,0)--(8,0)--(8,3)--(7,3)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((1,0)--(7,0)--(7,2)--(1,2)--cycle) scaled unit withcolor(0.9,1.0,0.9);

label.lft(btex $n=0$ etex, (0, 2.5) scaled unit);
label.lft(btex $n=1$ etex, (0, 1.5) scaled unit);
label.lft(btex $n=2$ etex, (0, 0.5) scaled unit);

element(btex \tiny  1 etex, btex H  etex, ( 0,2));
element(btex \tiny  2 etex, btex He etex, ( 7,2));

element(btex \tiny  3 etex, btex Li etex, ( 0,1));
element(btex \tiny  4 etex, btex Be etex, ( 1,1));
element(btex \tiny  5 etex, btex B  etex, ( 2,1));
element(btex \tiny  6 etex, btex C  etex, ( 3,1));
element(btex \tiny  7 etex, btex N  etex, ( 4,1));
element(btex \tiny  8 etex, btex O  etex, ( 5,1));
element(btex \tiny  9 etex, btex F  etex, ( 6,1));
element(btex \tiny 10 etex, btex Ne etex, ( 7,1));

element(btex \tiny 11 etex, btex Na etex, ( 0,0));
element(btex \tiny 12 etex, btex Mg etex, ( 1,0));
element(btex \tiny 13 etex, btex Al etex, ( 2,0));
element(btex \tiny 14 etex, btex Si etex, ( 3,0));
element(btex \tiny 15 etex, btex P  etex, ( 4,0));
element(btex \tiny 16 etex, btex S  etex, ( 5,0));
element(btex \tiny 17 etex, btex Cl etex, ( 6,0));
element(btex \tiny 18 etex, btex Ar etex, ( 7,0));

endfig;

beginfig(3)

fill ((0,0)--(1,0)--(1,5)--(0,5)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((17,0)--(18,0)--(18,5)--(17,5)--cycle) scaled unit withcolor(1.0,0.9,0.9);

fill ((1,0)--(2,0)--(2,4)--(1,4)--cycle) scaled unit withcolor(0.9,1.0,0.9);
fill ((12,0)--(17,0)--(17,4)--(12,4)--cycle) scaled unit withcolor(0.9,1.0,0.9);

fill ((2,0)--(12,0)--(12,2)--(2,2)--cycle) scaled unit withcolor(0.9,0.9,1.0);

label.lft(btex $n=0$ etex, (0, 4.5) scaled unit);
label.lft(btex $n=1$ etex, (0, 3.5) scaled unit);
label.lft(btex $n=2$ etex, (0, 2.5) scaled unit);
label.lft(btex $n=3$ etex, (0, 1.5) scaled unit);
label.lft(btex $n=4$ etex, (0, 0.5) scaled unit);

element(btex \tiny  1 etex, btex H  etex, ( 0,4));
element(btex \tiny  2 etex, btex He etex, (17,4));

element(btex \tiny  3 etex, btex Li etex, ( 0,3));
element(btex \tiny  4 etex, btex Be etex, ( 1,3));
element(btex \tiny  5 etex, btex B  etex, (12,3));
element(btex \tiny  6 etex, btex C  etex, (13,3));
element(btex \tiny  7 etex, btex N  etex, (14,3));
element(btex \tiny  8 etex, btex O  etex, (15,3));
element(btex \tiny  9 etex, btex F  etex, (16,3));
element(btex \tiny 10 etex, btex Ne etex, (17,3));

element(btex \tiny 11 etex, btex Na etex, ( 0,2));
element(btex \tiny 12 etex, btex Mg etex, ( 1,2));
element(btex \tiny 13 etex, btex Al etex, (12,2));
element(btex \tiny 14 etex, btex Si etex, (13,2));
element(btex \tiny 15 etex, btex P  etex, (14,2));
element(btex \tiny 16 etex, btex S  etex, (15,2));
element(btex \tiny 17 etex, btex Cl etex, (16,2));
element(btex \tiny 18 etex, btex Ar etex, (17,2));

element(btex \tiny 19 etex, btex K  etex, ( 0,1));
element(btex \tiny 20 etex, btex Ca etex, ( 1,1));
element(btex \tiny 21 etex, btex Sc etex, ( 2,1));
element(btex \tiny 22 etex, btex Ti etex, ( 3,1));
element(btex \tiny 23 etex, btex V  etex, ( 4,1));
element(btex \tiny 24 etex, btex Cr etex, ( 5,1));
element(btex \tiny 25 etex, btex Mn etex, ( 6,1));
element(btex \tiny 26 etex, btex Fe etex, ( 7,1));
element(btex \tiny 27 etex, btex Co etex, ( 8,1));
element(btex \tiny 28 etex, btex Ni etex, ( 9,1));
element(btex \tiny 29 etex, btex Cu etex, (10,1));
element(btex \tiny 30 etex, btex Zn etex, (11,1));
element(btex \tiny 31 etex, btex Ga etex, (12,1));
element(btex \tiny 32 etex, btex Ge etex, (13,1));
element(btex \tiny 33 etex, btex As etex, (14,1));
element(btex \tiny 34 etex, btex Se etex, (15,1));
element(btex \tiny 35 etex, btex Br etex, (16,1));
element(btex \tiny 36 etex, btex Kr etex, (17,1));

element(btex \tiny 37 etex, btex Rb etex, ( 0,0));
element(btex \tiny 38 etex, btex Sr etex, ( 1,0));
element(btex \tiny 39 etex, btex Yb etex, ( 2,0));
element(btex \tiny 40 etex, btex Zr etex, ( 3,0));
element(btex \tiny 41 etex, btex Nb etex, ( 4,0));
element(btex \tiny 42 etex, btex Mo etex, ( 5,0));
element(btex \tiny 43 etex, btex Tc etex, ( 6,0));
element(btex \tiny 44 etex, btex Ru etex, ( 7,0));
element(btex \tiny 45 etex, btex Rh etex, ( 8,0));
element(btex \tiny 46 etex, btex Pd etex, ( 9,0));
element(btex \tiny 47 etex, btex Ag etex, (10,0));
element(btex \tiny 48 etex, btex Cd etex, (11,0));
element(btex \tiny 49 etex, btex In etex, (12,0));
element(btex \tiny 50 etex, btex Sn etex, (13,0));
element(btex \tiny 51 etex, btex Sb etex, (14,0));
element(btex \tiny 52 etex, btex Te etex, (15,0));
element(btex \tiny 53 etex, btex I  etex, (16,0));
element(btex \tiny 54 etex, btex Xe etex, (17,0));

endfig;

beginfig(4)

fill ((0,0)--(1,0)--(1,7)--(0,7)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((31,0)--(32,0)--(32,7)--(31,7)--cycle) scaled unit withcolor(1.0,0.9,0.9);

fill ((1,0)--(2,0)--(2,6)--(1,6)--cycle) scaled unit withcolor(0.9,1.0,0.9);
fill ((26,0)--(31,0)--(31,6)--(26,6)--cycle) scaled unit withcolor(0.9,1.0,0.9);

fill ((2,0)--(3,0)--(3,4)--(2,4)--cycle) scaled unit withcolor(0.9,0.9,1.0);
fill ((17,0)--(26,0)--(26,4)--(17,4)--cycle) scaled unit withcolor(0.9,0.9,1.0);

fill ((3,0)--(17,0)--(17,2)--(3,2)--cycle) scaled unit withcolor(1.0,1.0,0.9);

label.lft(btex $n=0$ etex, (0, 6.5) scaled unit);
label.lft(btex $n=1$ etex, (0, 5.5) scaled unit);
label.lft(btex $n=2$ etex, (0, 4.5) scaled unit);
label.lft(btex $n=3$ etex, (0, 3.5) scaled unit);
label.lft(btex $n=4$ etex, (0, 2.5) scaled unit);
label.lft(btex $n=5$ etex, (0, 1.5) scaled unit);
label.lft(btex $n=6$ etex, (0, 0.5) scaled unit);

element(btex \tiny   1 etex, btex H  etex, ( 0,6));
element(btex \tiny   2 etex, btex He etex, (31,6));

element(btex \tiny   3 etex, btex Li etex, ( 0,5));
element(btex \tiny   4 etex, btex Be etex, ( 1,5));
element(btex \tiny   5 etex, btex B  etex, (26,5));
element(btex \tiny   6 etex, btex C  etex, (27,5));
element(btex \tiny   7 etex, btex N  etex, (28,5));
element(btex \tiny   8 etex, btex O  etex, (29,5));
element(btex \tiny   9 etex, btex F  etex, (30,5));
element(btex \tiny  10 etex, btex Ne etex, (31,5));

element(btex \tiny  11 etex, btex Na etex, ( 0,4));
element(btex \tiny  12 etex, btex Mg etex, ( 1,4));
element(btex \tiny  13 etex, btex Al etex, (26,4));
element(btex \tiny  14 etex, btex Si etex, (27,4));
element(btex \tiny  15 etex, btex P  etex, (28,4));
element(btex \tiny  16 etex, btex S  etex, (29,4));
element(btex \tiny  17 etex, btex Cl etex, (30,4));
element(btex \tiny  18 etex, btex Ar etex, (31,4));

element(btex \tiny  19 etex, btex K  etex, ( 0,3));
element(btex \tiny  20 etex, btex Ca etex, ( 1,3));
element(btex \tiny  21 etex, btex Sc etex, ( 2,3));
element(btex \tiny  22 etex, btex Ti etex, (17,3));
element(btex \tiny  23 etex, btex V  etex, (18,3));
element(btex \tiny  24 etex, btex Cr etex, (19,3));
element(btex \tiny  25 etex, btex Mn etex, (20,3));
element(btex \tiny  26 etex, btex Fe etex, (21,3));
element(btex \tiny  27 etex, btex Co etex, (22,3));
element(btex \tiny  28 etex, btex Ni etex, (23,3));
element(btex \tiny  29 etex, btex Cu etex, (24,3));
element(btex \tiny  30 etex, btex Zn etex, (25,3));
element(btex \tiny  31 etex, btex Ga etex, (26,3));
element(btex \tiny  32 etex, btex Ge etex, (27,3));
element(btex \tiny  33 etex, btex As etex, (28,3));
element(btex \tiny  34 etex, btex Se etex, (29,3));
element(btex \tiny  35 etex, btex Br etex, (30,3));
element(btex \tiny  36 etex, btex Kr etex, (31,3));

element(btex \tiny  37 etex, btex Rb etex, ( 0,2));
element(btex \tiny  38 etex, btex Sr etex, ( 1,2));
element(btex \tiny  39 etex, btex Yb etex, ( 2,2));
element(btex \tiny  40 etex, btex Zr etex, (17,2));
element(btex \tiny  41 etex, btex Nb etex, (18,2));
element(btex \tiny  42 etex, btex Mo etex, (19,2));
element(btex \tiny  43 etex, btex Tc etex, (20,2));
element(btex \tiny  44 etex, btex Ru etex, (21,2));
element(btex \tiny  45 etex, btex Rh etex, (22,2));
element(btex \tiny  46 etex, btex Pd etex, (23,2));
element(btex \tiny  47 etex, btex Ag etex, (24,2));
element(btex \tiny  48 etex, btex Cd etex, (25,2));
element(btex \tiny  49 etex, btex In etex, (26,2));
element(btex \tiny  50 etex, btex Sn etex, (27,2));
element(btex \tiny  51 etex, btex Sb etex, (28,2));
element(btex \tiny  52 etex, btex Te etex, (29,2));
element(btex \tiny  53 etex, btex I  etex, (30,2));
element(btex \tiny  54 etex, btex Xe etex, (31,2));
  
element(btex \tiny  55 etex, btex Cs etex, ( 0,1));
element(btex \tiny  56 etex, btex Ba etex, ( 1,1));
element(btex \tiny  57 etex, btex La etex, ( 2,1));
element(btex \tiny  58 etex, btex Ce etex, ( 3,1));
element(btex \tiny  59 etex, btex Pr etex, ( 4,1));
element(btex \tiny  60 etex, btex Nd etex, ( 5,1));
element(btex \tiny  61 etex, btex Pm etex, ( 6,1));
element(btex \tiny  62 etex, btex Sm etex, ( 7,1));
element(btex \tiny  63 etex, btex Eu etex, ( 8,1));
element(btex \tiny  64 etex, btex Gd etex, ( 9,1));
element(btex \tiny  65 etex, btex Tb etex, (10,1));
element(btex \tiny  66 etex, btex Dy etex, (11,1));
element(btex \tiny  67 etex, btex Ho etex, (12,1));
element(btex \tiny  68 etex, btex Er etex, (13,1));
element(btex \tiny  69 etex, btex Tm etex, (14,1));
element(btex \tiny  70 etex, btex Yb etex, (15,1));
element(btex \tiny  71 etex, btex Lu etex, (16,1));
element(btex \tiny  72 etex, btex Hf etex, (17,1));
element(btex \tiny  73 etex, btex Ta etex, (18,1));
element(btex \tiny  74 etex, btex W  etex, (19,1));
element(btex \tiny  75 etex, btex Re etex, (20,1));
element(btex \tiny  76 etex, btex Os etex, (21,1));
element(btex \tiny  77 etex, btex Ir etex, (22,1));
element(btex \tiny  78 etex, btex Pt etex, (23,1));
element(btex \tiny  79 etex, btex Au etex, (24,1));
element(btex \tiny  80 etex, btex Hg etex, (25,1));
element(btex \tiny  81 etex, btex Tl etex, (26,1));
element(btex \tiny  82 etex, btex Pb etex, (27,1));
element(btex \tiny  83 etex, btex Bi etex, (28,1));
element(btex \tiny  84 etex, btex Po etex, (29,1));
element(btex \tiny  85 etex, btex At etex, (30,1));
element(btex \tiny  86 etex, btex Rn etex, (31,1));

element(btex \tiny  87 etex, btex Fr etex, ( 0,0));
element(btex \tiny  88 etex, btex Ra etex, ( 1,0));
element(btex \tiny  89 etex, btex Ac etex, ( 2,0));
element(btex \tiny  90 etex, btex Th etex, ( 3,0));
element(btex \tiny  91 etex, btex Pa etex, ( 4,0));
element(btex \tiny  92 etex, btex U  etex, ( 5,0));
element(btex \tiny  93 etex, btex Np etex, ( 6,0));
element(btex \tiny  94 etex, btex Pu etex, ( 7,0));
element(btex \tiny  95 etex, btex Am etex, ( 8,0));
element(btex \tiny  96 etex, btex Cm etex, ( 9,0));
element(btex \tiny  97 etex, btex Bk etex, (10,0));
element(btex \tiny  98 etex, btex Cf etex, (11,0));
element(btex \tiny  99 etex, btex Es etex, (12,0));
element(btex \tiny 100 etex, btex Fm etex, (13,0));
element(btex \tiny 101 etex, btex Md etex, (14,0));
element(btex \tiny 102 etex, btex No etex, (15,0));
element(btex \tiny 103 etex, btex Lr etex, (16,0));
element(btex \tiny 104 etex, btex Rf etex, (17,0));
element(btex \tiny 105 etex, btex Db etex, (18,0));
element(btex \tiny 106 etex, btex Sg etex, (19,0));
element(btex \tiny 107 etex, btex Bh etex, (20,0));
element(btex \tiny 108 etex, btex Hs etex, (21,0));
element(btex \tiny 109 etex, btex Mt etex, (22,0));
element(btex \tiny 110 etex, btex Ds etex, (23,0));
element(btex \tiny 111 etex, btex Rg etex, (24,0));
element(btex \tiny 112 etex, btex Cn etex, (25,0));
element(btex \tiny 113 etex, btex Uut etex, (26,0));
element(btex \tiny 114 etex, btex Fl etex, (27,0));
element(btex \tiny 115 etex, btex UUp etex, (28,0));
element(btex \tiny 116 etex, btex Lv etex, (29,0));
element(btex \tiny 117 etex, btex UUs etex, (30,0));
element(btex \tiny 118 etex, btex Uuo etex, (31,0));

endfig;

end
