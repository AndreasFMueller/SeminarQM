%
% periodensystem.mp -- Darstellungen des Periodensystems fuer die Diskussion
%                      der Spinzustaende im Kapitel Spin
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
\def\el#1{\raisebox{0pt}[11pt]{\strut\smash{\textsf{#1}}}}
\def\no#1{\tiny\textsf{#1}}
etex;

numeric linewidth;
linewidth := 0.5pt;
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
	label.lrt(Z, (0,unit) shifted (unit * position + (-1,1)));
enddef;

beginfig(1)

fill ((0,0)--(2,0)--(2,1)--(0,1)--cycle) scaled unit withcolor(1,0.9,0.9);
element(btex \no{1} etex, btex \el{H}  etex, ( 0,0));
element(btex \no{2} etex, btex \el{He} etex, ( 1,0));

label.lft(btex $n=1$ etex, (0, 0.5) scaled unit);

endfig;

beginfig(2)

fill ((0,0)--(1,0)--(1,3)--(0,3)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((7,0)--(8,0)--(8,3)--(7,3)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((1,0)--(7,0)--(7,2)--(1,2)--cycle) scaled unit withcolor(0.9,1.0,0.9);

label.lft(btex $n=1$ etex, (0, 2.5) scaled unit);
label.lft(btex $n=2$ etex, (0, 1.5) scaled unit);
label.lft(btex $n=3$ etex, (0, 0.5) scaled unit);

element(btex \no{1} etex, btex \el{H}  etex, ( 0,2));
element(btex \no{2} etex, btex \el{He} etex, ( 7,2));

element(btex \no{3} etex, btex \el{Li} etex, ( 0,1));
element(btex \no{4} etex, btex \el{Be} etex, ( 1,1));
element(btex \no{5} etex, btex \el{B}  etex, ( 2,1));
element(btex \no{6} etex, btex \el{C}  etex, ( 3,1));
element(btex \no{7} etex, btex \el{N}  etex, ( 4,1));
element(btex \no{8} etex, btex \el{O}  etex, ( 5,1));
element(btex \no{9} etex, btex \el{F}  etex, ( 6,1));
element(btex \no{10} etex, btex \el{Ne} etex, ( 7,1));

element(btex \no{11} etex, btex \el{Na} etex, ( 0,0));
element(btex \no{12} etex, btex \el{Mg} etex, ( 1,0));
element(btex \no{13} etex, btex \el{Al} etex, ( 2,0));
element(btex \no{14} etex, btex \el{Si} etex, ( 3,0));
element(btex \no{15} etex, btex \el{P}  etex, ( 4,0));
element(btex \no{16} etex, btex \el{S}  etex, ( 5,0));
element(btex \no{17} etex, btex \el{Cl} etex, ( 6,0));
element(btex \no{18} etex, btex \el{Ar} etex, ( 7,0));

endfig;

beginfig(3)

fill ((0,0)--(1,0)--(1,5)--(0,5)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((17,0)--(18,0)--(18,5)--(17,5)--cycle) scaled unit withcolor(1.0,0.9,0.9);

fill ((1,0)--(2,0)--(2,4)--(1,4)--cycle) scaled unit withcolor(0.9,1.0,0.9);
fill ((12,0)--(17,0)--(17,4)--(12,4)--cycle) scaled unit withcolor(0.9,1.0,0.9);

fill ((2,0)--(12,0)--(12,2)--(2,2)--cycle) scaled unit withcolor(0.9,0.9,1.0);

label.lft(btex $n=1$ etex, (0, 4.5) scaled unit);
label.lft(btex $n=2$ etex, (0, 3.5) scaled unit);
label.lft(btex $n=3$ etex, (0, 2.5) scaled unit);
label.lft(btex $n=4$ etex, (0, 1.5) scaled unit);
label.lft(btex $n=5$ etex, (0, 0.5) scaled unit);

element(btex \no{1} etex, btex \el{H}  etex, ( 0,4));
element(btex \no{2} etex, btex \el{He} etex, (17,4));

element(btex \no{3} etex, btex \el{Li} etex, ( 0,3));
element(btex \no{4} etex, btex \el{Be} etex, ( 1,3));
element(btex \no{5} etex, btex \el{B}  etex, (12,3));
element(btex \no{6} etex, btex \el{C}  etex, (13,3));
element(btex \no{7} etex, btex \el{N}  etex, (14,3));
element(btex \no{8} etex, btex \el{O}  etex, (15,3));
element(btex \no{9} etex, btex \el{F}  etex, (16,3));
element(btex \no{10} etex, btex \el{Ne} etex, (17,3));

element(btex \no{11} etex, btex \el{Na} etex, ( 0,2));
element(btex \no{12} etex, btex \el{Mg} etex, ( 1,2));
element(btex \no{13} etex, btex \el{Al} etex, (12,2));
element(btex \no{14} etex, btex \el{Si} etex, (13,2));
element(btex \no{15} etex, btex \el{P}  etex, (14,2));
element(btex \no{16} etex, btex \el{S}  etex, (15,2));
element(btex \no{17} etex, btex \el{Cl} etex, (16,2));
element(btex \no{18} etex, btex \el{Ar} etex, (17,2));

element(btex \no{19} etex, btex \el{K}  etex, ( 0,1));
element(btex \no{20} etex, btex \el{Ca} etex, ( 1,1));
element(btex \no{21} etex, btex \el{Sc} etex, ( 2,1));
element(btex \no{22} etex, btex \el{Ti} etex, ( 3,1));
element(btex \no{23} etex, btex \el{V}  etex, ( 4,1));
element(btex \no{24} etex, btex \el{Cr} etex, ( 5,1));
element(btex \no{25} etex, btex \el{Mn} etex, ( 6,1));
element(btex \no{26} etex, btex \el{Fe} etex, ( 7,1));
element(btex \no{27} etex, btex \el{Co} etex, ( 8,1));
element(btex \no{28} etex, btex \el{Ni} etex, ( 9,1));
element(btex \no{29} etex, btex \el{Cu} etex, (10,1));
element(btex \no{30} etex, btex \el{Zn} etex, (11,1));
element(btex \no{31} etex, btex \el{Ga} etex, (12,1));
element(btex \no{32} etex, btex \el{Ge} etex, (13,1));
element(btex \no{33} etex, btex \el{As} etex, (14,1));
element(btex \no{34} etex, btex \el{Se} etex, (15,1));
element(btex \no{35} etex, btex \el{Br} etex, (16,1));
element(btex \no{36} etex, btex \el{Kr} etex, (17,1));

element(btex \no{37} etex, btex \el{Rb} etex, ( 0,0));
element(btex \no{38} etex, btex \el{Sr} etex, ( 1,0));
element(btex \no{39} etex, btex \el{Yb} etex, ( 2,0));
element(btex \no{40} etex, btex \el{Zr} etex, ( 3,0));
element(btex \no{41} etex, btex \el{Nb} etex, ( 4,0));
element(btex \no{42} etex, btex \el{Mo} etex, ( 5,0));
element(btex \no{43} etex, btex \el{Tc} etex, ( 6,0));
element(btex \no{44} etex, btex \el{Ru} etex, ( 7,0));
element(btex \no{45} etex, btex \el{Rh} etex, ( 8,0));
element(btex \no{46} etex, btex \el{Pd} etex, ( 9,0));
element(btex \no{47} etex, btex \el{Ag} etex, (10,0));
element(btex \no{48} etex, btex \el{Cd} etex, (11,0));
element(btex \no{49} etex, btex \el{In} etex, (12,0));
element(btex \no{50} etex, btex \el{Sn} etex, (13,0));
element(btex \no{51} etex, btex \el{Sb} etex, (14,0));
element(btex \no{52} etex, btex \el{Te} etex, (15,0));
element(btex \no{53} etex, btex \el{I}  etex, (16,0));
element(btex \no{54} etex, btex \el{Xe} etex, (17,0));

endfig;

beginfig(4)

fill ((0,0)--(1,0)--(1,7)--(0,7)--cycle) scaled unit withcolor(1.0,0.9,0.9);
fill ((31,0)--(32,0)--(32,7)--(31,7)--cycle) scaled unit withcolor(1.0,0.9,0.9);

fill ((1,0)--(2,0)--(2,6)--(1,6)--cycle) scaled unit withcolor(0.9,1.0,0.9);
fill ((26,0)--(31,0)--(31,6)--(26,6)--cycle) scaled unit withcolor(0.9,1.0,0.9);

fill ((2,0)--(3,0)--(3,4)--(2,4)--cycle) scaled unit withcolor(0.9,0.9,1.0);
fill ((17,0)--(26,0)--(26,4)--(17,4)--cycle) scaled unit withcolor(0.9,0.9,1.0);

fill ((3,0)--(17,0)--(17,2)--(3,2)--cycle) scaled unit withcolor(1.0,1.0,0.9);

label.lft(btex $n=1$ etex, (0, 6.5) scaled unit);
label.lft(btex $n=2$ etex, (0, 5.5) scaled unit);
label.lft(btex $n=3$ etex, (0, 4.5) scaled unit);
label.lft(btex $n=4$ etex, (0, 3.5) scaled unit);
label.lft(btex $n=5$ etex, (0, 2.5) scaled unit);
label.lft(btex $n=6$ etex, (0, 1.5) scaled unit);
label.lft(btex $n=7$ etex, (0, 0.5) scaled unit);

element(btex \no{1} etex, btex \el{H}   etex, ( 0,6));
element(btex \no{2} etex, btex \el{He}  etex, (31,6));

element(btex \no{3} etex, btex \el{Li}  etex, ( 0,5));
element(btex \no{4} etex, btex \el{Be}  etex, ( 1,5));
element(btex \no{5} etex, btex \el{B}   etex, (26,5));
element(btex \no{6} etex, btex \el{C}   etex, (27,5));
element(btex \no{7} etex, btex \el{N}   etex, (28,5));
element(btex \no{8} etex, btex \el{O}   etex, (29,5));
element(btex \no{9} etex, btex \el{F}   etex, (30,5));
element(btex \no{10} etex, btex \el{Ne}  etex, (31,5));

element(btex \no{11} etex, btex \el{Na}  etex, ( 0,4));
element(btex \no{12} etex, btex \el{Mg}  etex, ( 1,4));
element(btex \no{13} etex, btex \el{Al}  etex, (26,4));
element(btex \no{14} etex, btex \el{Si}  etex, (27,4));
element(btex \no{15} etex, btex \el{P}   etex, (28,4));
element(btex \no{16} etex, btex \el{S}   etex, (29,4));
element(btex \no{17} etex, btex \el{Cl}  etex, (30,4));
element(btex \no{18} etex, btex \el{Ar}  etex, (31,4));

element(btex \no{19} etex, btex \el{K}   etex, ( 0,3));
element(btex \no{20} etex, btex \el{Ca}  etex, ( 1,3));
element(btex \no{21} etex, btex \el{Sc}  etex, ( 2,3));
element(btex \no{22} etex, btex \el{Ti}  etex, (17,3));
element(btex \no{23} etex, btex \el{V}   etex, (18,3));
element(btex \no{24} etex, btex \el{Cr}  etex, (19,3));
element(btex \no{25} etex, btex \el{Mn}  etex, (20,3));
element(btex \no{26} etex, btex \el{Fe}  etex, (21,3));
element(btex \no{27} etex, btex \el{Co}  etex, (22,3));
element(btex \no{28} etex, btex \el{Ni}  etex, (23,3));
element(btex \no{29} etex, btex \el{Cu}  etex, (24,3));
element(btex \no{30} etex, btex \el{Zn}  etex, (25,3));
element(btex \no{31} etex, btex \el{Ga}  etex, (26,3));
element(btex \no{32} etex, btex \el{Ge}  etex, (27,3));
element(btex \no{33} etex, btex \el{As}  etex, (28,3));
element(btex \no{34} etex, btex \el{Se}  etex, (29,3));
element(btex \no{35} etex, btex \el{Br}  etex, (30,3));
element(btex \no{36} etex, btex \el{Kr}  etex, (31,3));

element(btex \no{37} etex, btex \el{Rb}  etex, ( 0,2));
element(btex \no{38} etex, btex \el{Sr}  etex, ( 1,2));
element(btex \no{39} etex, btex \el{Yb}  etex, ( 2,2));
element(btex \no{40} etex, btex \el{Zr}  etex, (17,2));
element(btex \no{41} etex, btex \el{Nb}  etex, (18,2));
element(btex \no{42} etex, btex \el{Mo}  etex, (19,2));
element(btex \no{43} etex, btex \el{Tc}  etex, (20,2));
element(btex \no{44} etex, btex \el{Ru}  etex, (21,2));
element(btex \no{45} etex, btex \el{Rh}  etex, (22,2));
element(btex \no{46} etex, btex \el{Pd}  etex, (23,2));
element(btex \no{47} etex, btex \el{Ag}  etex, (24,2));
element(btex \no{48} etex, btex \el{Cd}  etex, (25,2));
element(btex \no{49} etex, btex \el{In}  etex, (26,2));
element(btex \no{50} etex, btex \el{Sn}  etex, (27,2));
element(btex \no{51} etex, btex \el{Sb}  etex, (28,2));
element(btex \no{52} etex, btex \el{Te}  etex, (29,2));
element(btex \no{53} etex, btex \el{I}   etex, (30,2));
element(btex \no{54} etex, btex \el{Xe}  etex, (31,2));
  
element(btex \no{55} etex, btex \el{Cs}  etex, ( 0,1));
element(btex \no{56} etex, btex \el{Ba}  etex, ( 1,1));
element(btex \no{57} etex, btex \el{La}  etex, ( 2,1));
element(btex \no{58} etex, btex \el{Ce}  etex, ( 3,1));
element(btex \no{59} etex, btex \el{Pr}  etex, ( 4,1));
element(btex \no{60} etex, btex \el{Nd}  etex, ( 5,1));
element(btex \no{61} etex, btex \el{Pm}  etex, ( 6,1));
element(btex \no{62} etex, btex \el{Sm}  etex, ( 7,1));
element(btex \no{63} etex, btex \el{Eu}  etex, ( 8,1));
element(btex \no{64} etex, btex \el{Gd}  etex, ( 9,1));
element(btex \no{65} etex, btex \el{Tb}  etex, (10,1));
element(btex \no{66} etex, btex \el{Dy}  etex, (11,1));
element(btex \no{67} etex, btex \el{Ho}  etex, (12,1));
element(btex \no{68} etex, btex \el{Er}  etex, (13,1));
element(btex \no{69} etex, btex \el{Tm}  etex, (14,1));
element(btex \no{70} etex, btex \el{Yb}  etex, (15,1));
element(btex \no{71} etex, btex \el{Lu}  etex, (16,1));
element(btex \no{72} etex, btex \el{Hf}  etex, (17,1));
element(btex \no{73} etex, btex \el{Ta}  etex, (18,1));
element(btex \no{74} etex, btex \el{W}   etex, (19,1));
element(btex \no{75} etex, btex \el{Re}  etex, (20,1));
element(btex \no{76} etex, btex \el{Os}  etex, (21,1));
element(btex \no{77} etex, btex \el{Ir}  etex, (22,1));
element(btex \no{78} etex, btex \el{Pt}  etex, (23,1));
element(btex \no{79} etex, btex \el{Au}  etex, (24,1));
element(btex \no{80} etex, btex \el{Hg}  etex, (25,1));
element(btex \no{81} etex, btex \el{Tl}  etex, (26,1));
element(btex \no{82} etex, btex \el{Pb}  etex, (27,1));
element(btex \no{83} etex, btex \el{Bi}  etex, (28,1));
element(btex \no{84} etex, btex \el{Po}  etex, (29,1));
element(btex \no{85} etex, btex \el{At}  etex, (30,1));
element(btex \no{86} etex, btex \el{Rn}  etex, (31,1));

element(btex \no{87} etex, btex \el{Fr}  etex, ( 0,0));
element(btex \no{88} etex, btex \el{Ra}  etex, ( 1,0));
element(btex \no{89} etex, btex \el{Ac}  etex, ( 2,0));
element(btex \no{90} etex, btex \el{Th}  etex, ( 3,0));
element(btex \no{91} etex, btex \el{Pa}  etex, ( 4,0));
element(btex \no{92} etex, btex \el{U}   etex, ( 5,0));
element(btex \no{93} etex, btex \el{Np}  etex, ( 6,0));
element(btex \no{94} etex, btex \el{Pu}  etex, ( 7,0));
element(btex \no{95} etex, btex \el{Am}  etex, ( 8,0));
element(btex \no{96} etex, btex \el{Cm}  etex, ( 9,0));
element(btex \no{97} etex, btex \el{Bk}  etex, (10,0));
element(btex \no{98} etex, btex \el{Cf}  etex, (11,0));
element(btex \no{99} etex, btex \el{Es}  etex, (12,0));
element(btex \no{100} etex, btex \el{Fm}  etex, (13,0));
element(btex \no{101} etex, btex \el{Md}  etex, (14,0));
element(btex \no{102} etex, btex \el{No}  etex, (15,0));
element(btex \no{103} etex, btex \el{Lr}  etex, (16,0));
element(btex \no{104} etex, btex \el{Rf}  etex, (17,0));
element(btex \no{105} etex, btex \el{Db}  etex, (18,0));
element(btex \no{106} etex, btex \el{Sg}  etex, (19,0));
element(btex \no{107} etex, btex \el{Bh}  etex, (20,0));
element(btex \no{108} etex, btex \el{Hs}  etex, (21,0));
element(btex \no{109} etex, btex \el{Mt}  etex, (22,0));
element(btex \no{110} etex, btex \el{Ds}  etex, (23,0));
element(btex \no{111} etex, btex \el{Rg}  etex, (24,0));
element(btex \no{112} etex, btex \el{Cn}  etex, (25,0));
element(btex \no{113} etex, btex \el{Uut} etex, (26,0));
element(btex \no{114} etex, btex \el{Fl}  etex, (27,0));
element(btex \no{115} etex, btex \el{Uup} etex, (28,0));
element(btex \no{116} etex, btex \el{Lv}  etex, (29,0));
element(btex \no{117} etex, btex \el{Uus} etex, (30,0));
element(btex \no{118} etex, btex \el{Uuo} etex, (31,0));

endfig;

end
