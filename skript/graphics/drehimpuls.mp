%
% drehimpuls.mp -- Illustrationen zum Drehimpulskapitel
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

%
% Drehimpuls in L_3, L^2
%
beginfig(1)

pickup pencircle scaled 0.7pt;

drawarrow (0,-10)--(0,120);
label.ulft(btex $l$ etex,(0,120));
drawarrow (-120,0)--(120,0);
label.urt(btex $m$ etex, (120,0));

pickup pencircle scaled 1pt;

drawarrow (30,45)--(45,45) withcolor (1,0,0);
label.bot(btex $L_+$ etex, (45,45)) withcolor (1,0,0);
drawarrow (-30,45)--(-45,45) withcolor (1,0,0);
label.bot(btex $L_-$ etex, (-45,45)) withcolor (1,0,0);

pickup pencircle scaled 3pt;

draw (0,0);

for l = 0 step 15 until 105:
	for m = -l step 15 until l:
		draw(m,l);
	endfor
endfor

endfig;

%
% Drehimpuls in a_1-a_2-Koordinaten
%
beginfig(2)

pickup pencircle scaled 0.7pt;

drawarrow (-10,0)--(120,0);
drawarrow (0,-10)--(0,120);
label.ulft(btex $a_2$ etex, (0,120));
label.urt(btex $a_1$ etex, (120,0));

pickup pencircle scaled 1pt;

numeric u;
u := 15;
numeric v;
v := sqrt(2) * u;

drawarrow (1.5 * v, 3 * v)--(1.5 * v, 3.5 * v) withcolor (0,0,1);
label.rt(btex $a_2^+$ etex, (1.5 * v, 3.5 * v)) withcolor(0,0,1);

drawarrow (3.5 * v, v)--(4 * v, v) withcolor (0,0,1);
label.top(btex $a_1^+$ etex, (4 * v, v)) withcolor(0,0,1);

drawarrow (2.5 * v, 0.5 * v)--(2.5 * v, 0) withcolor (0,0,1);
drawarrow (2.5 * v, 0)--(3 * v, 0) withcolor (0,0,1);

drawarrow (2.5 * v, 0.5 * v)--(3 * v,    0) withcolor (1,0,0);

drawarrow (0.5 * v, 2.5 * v)--(    0, 2.5 * v) withcolor(0,0,1);
drawarrow (      0, 2.5 * v)--(    0,   3 * v) withcolor(0,0,1);

drawarrow (0.5 * v, 2.5 * v)--(    0,3 * v) withcolor (1,0,0);

label.urt(btex $L_+$ etex, (2.75 * v, 0.25 * v)) withcolor (1,0,0);
label.urt(btex $L_-$ etex, (0.25 * v, 2.75 * v)) withcolor (1,0,0);

pickup pencircle scaled 3pt;

for a = 0 step u until 5 * u:
	for b = 0 step u until 5 * u - a:
		draw(a * sqrt(2),b * sqrt(2));
	endfor;
endfor;
for a = 0 step u until 5 * u:
	for b = 0 step u until 4 * u - a:
		draw((a + u / 2) * sqrt(2), (b + u / 2) * sqrt(2));
	endfor;
endfor;

endfig;

%
% mogliche Werte der Quantenzahlen l und m
%
beginfig(3)

numeric radius;
numeric unit;
unit := 20;
radius = unit * sqrt(4 * 5);

pickup pencircle scaled 1pt;

draw (radius,0)..(0,radius)..(-radius,0)..(0,-radius)..cycle withcolor(0,0,1);
label.urt(btex $l=4$ etex, (sqrt(radius * radius - 9 * unit * unit), 3 * unit))
	withcolor(0,0,1);

pickup pencircle scaled 0.1pt;
for h = -4 * unit step unit until 4 * unit:
	draw (-sqrt(radius * radius - h * h),h)--(sqrt(radius * radius - h * h),
		h) withcolor (1,0,0);
endfor;

pickup pencircle scaled 0.7pt;
drawarrow (-5 * unit,0)--(5 * unit,0);
drawarrow (0,-5 * unit)--(0,5 * unit);
label.urt(btex $m$ etex, (0,5 *unit));

vardef TEX primary s =
write "verbatimtex"                    to "mptextmp.mp";
write "\documentclass[12pt]{article}"  to "mptextmp.mp"; 
write "\usepackage[T1]{fontenc}"       to "mptextmp.mp";
write "\usepackage[ansinew]{inputenc}" to "mptextmp.mp";
write "\usepackage{amsmath,amssymb}"   to "mptextmp.mp";
write "\usepackage{txfonts}"           to "mptextmp.mp";
write "\begin{document}"               to "mptextmp.mp";
write "etex"                           to "mptextmp.mp";
write "btex "&s&" etex"                to "mptextmp.mp";
write EOF                              to "mptextmp.mp";
scantokens "input mptextmp"
enddef;

pickup pencircle scaled 3pt;
for m = -4 step 1 until 4:
	% draw (0,unit * m) withcolor(1,0,0);
	label.urt(TEX("$m = "&decimal(m)&"$"), (0,unit * m)) withcolor (1,0,0);
endfor;

endfig;

end
