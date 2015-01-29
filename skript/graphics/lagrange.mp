%
% lagrange.mp -- Illustrations for the Lagrange mechanics part
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

beginfig(1)

z0 = (0,0);
z1 = (240,160);

pickup pencircle scaled 1.5pt;

path p;
p = z0{dir 60}..{dir 80}z1;

draw p;

numeric e;
e := 1;

def curvepoint(expr e, t) =
	(point t of p shifted (sind(180 * t) * e * (-40,30 + 20 * cosd(180 * t))))
enddef;

for e = -1 step 0.5 until 1.5:
	path q;
	q = point 0 of p;
	for t = 0.01 step 0.01 until 1:
		q := q..curvepoint(e, t);
	endfor;
	pickup pencircle scaled 0.1pt;
	draw q;
endfor;

label.lrt(btex $\varepsilon = -1$ etex, curvepoint(-0.5, 0.5));
label.lrt(btex $\varepsilon = -2$ etex, curvepoint(-1, 0.5));

label.ulft(btex $\varepsilon = 3$ etex, curvepoint(1.5, 0.7));
label.ulft(btex $\varepsilon = 2$ etex, curvepoint(1.0, 0.65));
label.ulft(btex $\varepsilon = 1$ etex, curvepoint(0.5, 0.6));

pickup pencircle scaled 3pt;

z2 = point 0.4 of p;
z3 = curvepoint(1.5, 0.4);

label.lrt(btex $q(t)$ etex, z2);
label.ulft(btex $q(t)+\varepsilon\eta(t)$ etex, z3);
label.llft(btex $q_0=q(t_0)$ etex, z0);
label.urt(btex $q_1=q(t_1)$ etex, z1);

def redarrow(expr t) =
	pickup pencircle scaled 3pt;
	draw curvepoint(0, t) withcolor (1,0,0);
	draw curvepoint(1.5, t)  withcolor (1,0,0);
	pickup pencircle scaled 1pt;
	drawarrow curvepoint(0, t)--curvepoint(1.5,t) withcolor(1,0,0);
enddef;

for t = 0.1 step 0.1 until 0.95:
	redarrow(t);
endfor;

pickup pencircle scaled 4pt;
draw z0;
draw z1;

endfig;

end
