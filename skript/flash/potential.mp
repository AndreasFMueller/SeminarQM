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

fill (-140, 140)--(-140,-15)--(120,-15)--(120,140)--(100,140)
	--(100,0)--(-100,0)--(-100,140)--cycle withcolor (0.95,0.95,0.95);

%Elektron
pickup pencircle scaled 0.7pt;
drawarrow (-110,120)--(0,120);
label.ulft(btex Elektron etex, (-30,120));

pickup pencircle scaled 1.5pt;
draw (-100,100)--(-100,0)--(100,0)--(100,100);
draw (-100,100)--(-100,115) dashed withdots;
draw (100,100)--(100,115) dashed withdots;

pickup pencircle scaled 0.71pt;

drawarrow (-145, 0)--( 110,  0);
drawarrow (   0,-5)--(   0,100);
drawarrow (-120,-5)--(-120,100);
%label.ulft(btex $\psi$ etex, (0,100));
label.ulft(btex $E$ etex, (-120,100));
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
