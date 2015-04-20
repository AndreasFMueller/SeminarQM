%
% spin.mp -- Illustrationen zum spin
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
% Termschema von Natrim für die D-Linie
%
beginfig(2)


numeric w;
w := 70;

pickup pencircle scaled 1pt;
drawarrow (w/2 - 3,120)--(w/2 - 3,0) withcolor red;

pickup pencircle scaled 1.5pt;
draw (0,120)--(w,120);

pickup pencircle scaled 1pt;
drawarrow (w/2 + 3,140)--(w/2 + 3,0) withcolor red;

pickup pencircle scaled 1.5pt;
draw (0,140)--(w,140);

pickup pencircle scaled 1.5pt;
draw (0,  0)--(w,  0);

label.lft(btex $\mathstrut^2\text{P}_{3/2}$ etex, (0,140));
label.lft(btex $\mathstrut^2\text{P}_{1/2}$ etex, (0,120));
label.lft(btex $\mathstrut^2\text{S}_{1/2}$ etex, (0,  0));

label.rt(btex $\Delta E = 0.0021\text{eV}$ etex, (w,130));

label.lft(btex $589.6\text{nm}$ etex, (w/2 - 5, 60)) withcolor red;
label.rt(btex $589.0\text{nm}$ etex, (w/2 + 5, 60)) withcolor red;

label.top(btex 3p etex, (w/4, 140));
label.top(btex 3s etex, (w/4,   0));

endfig;

end
