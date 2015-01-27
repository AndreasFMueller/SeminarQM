%
% h.mp -- bilder zum Wasserstoff-Atom
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


numeric u;
u := 80;

path p;
path q;

numeric a;
a = 0.25;

p = (4 * u, -0.25 * u);
q = (4 * u, -0.25 * u + a * u / 16);
for x = 3.99 step -0.01 until 0.1:
	p := p..(x * u, -u/x);
	q := q..(x * u, -u/x + a * u/(x * x));
endfor

pickup pencircle scaled 1.5pt;

draw p;
draw q;

clip currentpicture to (0, -2 * u)--(4 * u, -2 * u)--(4 * u, 1 * u)
	--( 0, 1 * u)--cycle;

pickup pencircle scaled 1pt;

drawarrow (-10,           0)--(4 * u + 10,      0);
drawarrow (  0, -2 * u - 10)--(         0, u + 10);

label.lrt(btex $V(r)\sim \displaystyle-\frac1r$ etex, (u, -u));
label.top(btex $r$ etex, (4 * u + 5, 5));
label.ulft(btex $V(r)\sim \displaystyle-\frac1r+\frac{a}{r^2}$ etex, (2 * u, (-0.5 + a / 4) * u));

label.lft(btex $V$ etex, (-5,u + 5));

pickup pencircle scaled 4pt;

draw(2 * a * u, (-1/(2 * a)  + a/(4 * a * a)) * u);

endfig;

end
