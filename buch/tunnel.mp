%
% tunnel.mp -- tunnelstrom illustration fuer buchcover
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

numeric U;
U = 100;
numeric w;
w = 30;

z0 = (-200,0);
z1 = (0,0);
z2 = (0,U);
z3 = (w, U);
z4 = (w,0);
z5 = (100,0);

fill z1--z4--z3--z2--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10, 0))--(z5 shifted (10,0));
pickup pencircle scaled 1.5pt;
draw z0--z1--z2--z3--z4--z5;


endfig;

end
