%
% heisenberg.mp -- illustrationen fuer das Kapitel ueber Heisenberg
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

pickup pencircle scaled 1pt;

draw (-20,-10)--(20,-10)--(20,10)--(-20,10)--cycle;
label(btex Quelle etex, (0,0));

pickup pencircle scaled 0.1pt;
draw (-100,0)--(-20,0);
draw ( 100,0)--( 20,0);

pickup pencircle scaled 3pt;
draw (-100,0);
draw ( 100,0);

label.bot(btex $x_1$ etex, (-100,0));
label.bot(btex $x_2$ etex, ( 100,0));

pickup pencircle scaled 1pt;

drawarrow (-85,10)--(-115,10);
drawarrow ( 85,10)--( 115,10);
label.top(btex $p_1$ etex, (-100,10));
label.top(btex $p_2$ etex, ( 100,10));

endfig;

end
