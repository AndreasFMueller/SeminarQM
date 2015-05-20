%
% potential.mp -- Loesungen der Schroedingergleichung f"ur verschiedene
%                 Potentiale
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
% Energieniveaus und Wellenfunktionen eines Teilchens in einem Potentialkasten
%
beginfig(1)

pickup pencircle scaled 0.1pt;

numeric u;
u = 6pt;

fill (-140, 175)--(-140,-15)--(120,-15)--(120,175)--(100,175)
	--(100,0)--(-100,0)--(-100,175)--cycle withcolor (0.95,0.95,0.95);

pickup pencircle scaled 1.5pt;
draw (-100,160)--(-100,0)--(100,0)--(100,160);
draw (-100,160)--(-100,175) dashed withdots;
draw (100,160)--(100,175) dashed withdots;

pickup pencircle scaled 0.71pt;

drawarrow (-145, 0)--( 110,  0);
drawarrow (   0,-5)--(   0,165);
drawarrow (-120,-5)--(-120,165);
%label.ulft(btex $\psi$ etex, (0,165));
label.ulft(btex $E$ etex, (-120,165));
label.urt(btex $x$ etex, (110,0));

draw (-100,-2)--(-100,2);
draw ( 100,-2)--( 100,2);
label.bot(btex $-l$ etex, (-100,-2));
label.bot(btex $ l$ etex, ( 100,-2));

numeric V;
V := 50;
pickup pencircle scaled 1pt;
draw (-100,V)--(0,V)--(0,0)--(100,0) withcolor red;
label.top(btex $V_0$ etex, (-50,V)) withcolor red;

endfig;

end
