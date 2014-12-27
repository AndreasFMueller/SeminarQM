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

pickup pencircle scaled 3pt;

draw (0,0) withcolor(1.0,0.0,0.0);

pickup pencircle scaled 1.5pt;

draw	(-100, 81.24)..
	( -90, 72.50)..
	( -80, 63.91)..
	( -70, 55.46)..
	( -60, 47.15)..
	( -50, 38.98)..
	( -40, 30.93)..
	( -30, 23.02)..
	( -20, 15.22)..
	( -10,  7.55)..
	(   0,  0.00)..
	(  10, -7.44)..
	(  20,-14.77)..
	(  30,-22.00)..
	(  40,-29.13)..
	(  50,-36.16)..
	(  60,-43.09)..
	(  70,-49.92)..
	(  80,-56.66)..
	(  90,-63.32)..
	( 100,-69.88) withcolor (1.0, 0.0, 0.0);

pickup pencircle scaled 1pt;

draw	(-100, 75.0)..
	( -90, 67.5)..
	( -80, 60.0)..
	( -70, 52.5)..
	( -60, 45.0)..
	( -50, 37.5)..
	( -40, 30.0)..
	( -30, 22.5)..
	( -20, 15.0)..
	( -10,  7.5)..
	(   0,  0.0)..
	(  10, -7.5)..
	(  20,-15.0)..
	(  30,-22.5)..
	(  40,-30.0)..
	(  50,-37.5)..
	(  60,-45.0)..
	(  70,-52.5)..
	(  80,-60.0)..
	(  90,-67.5)..
	( 100,-75.0) withcolor(0.0,0.0,1.0);

drawarrow (-110,-95)--(110,-95); label.urt(btex $\varepsilon$ etex, (110,-95));
draw (-100,-97)--(-100,-93); label.bot(btex $-0.10$ etex, (-100,-97));
draw ( -50,-97)--( -50,-93); label.bot(btex $-0.05$ etex, ( -50,-97));
draw (   0,-97)--(   0,-93); label.bot(btex $ 0.00$ etex, (   0,-97));
draw (  50,-97)--(  50,-93); label.bot(btex $ 0.05$ etex, (  50,-97));
draw ( 100,-97)--( 100,-93); label.bot(btex $ 0.10$ etex, ( 100,-97));

drawarrow (-105,-80)--(-105,85); label.lft(btex $x_\varepsilon$ etex, (-105,85));
draw (-107,  0)--(-103,  0); label.lft(btex $ 1.00$ etex, (-107,  0));
draw (-107, 50)--(-103, 50); label.lft(btex $ 1.10$ etex, (-107, 50));
draw (-107,-50)--(-103,-50); label.lft(btex $ 0.90$ etex, (-107,-50));

pickup pencircle scaled 0.1pt;
draw (-105,0)--(0,0);
draw (0,-95)--(0,0);
label.urt(btex $x_0$ etex, (0,0));


endfig;

end
