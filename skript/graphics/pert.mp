%
% pert.mp -- bilder zur Stoerungstheorie
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
% Störungstheorie for die Nullstellen eines quadratischen Polynoms
%
beginfig(1)


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

pickup pencircle scaled 0.4pt;
draw (-105,0)--(0,0);
draw (0,-95)--(0,0);
label.urt(btex $x_0$ etex, (0,0));

pickup pencircle scaled 4pt;
draw (0,0) withcolor(1.0,0.0,0.0);
pickup pencircle scaled 2.5pt;
draw (0,0) withcolor(0.0,0.0,1.0);

endfig;

%
% Aufspaltung der Energieneiveaus
%

beginfig(2)

pickup pencircle scaled 0.7pt;

numeric u;
u = 15;

drawarrow (-2.5 * u, 0)--(14.5 * u,  0);
drawarrow ( 0,-0.5 * u)--(  0,10.5 * u);

label.top(btex $\varepsilon$ etex, (14.5 * u, 0));
label.lft(btex $E$ etex, (0,10.5 * u));

pickup pencircle scaled 1.5pt;

draw (-2*u,2*u)--(0,2*u); draw (12*u,2.5*u)--(14*u,2.5*u);
draw (-2*u,6*u)--(0,6*u); draw (12*u,4.5*u)--(14*u,4.5*u);
                          draw (12*u,5.8*u)--(14*u,5.8*u);
draw (-2*u,8*u)--(0,8*u); draw (12*u,9.2*u)--(14*u,9.2*u);
                          draw (12*u,8.4*u)--(14*u,8.4*u);
                          draw (12*u,7.6*u)--(14*u,7.6*u);

pickup pencircle scaled 0.1pt;
draw (0,2*u)--(12*u,2.5*u);
draw (0,6*u)--(12*u,4.5*u);
draw (0,6*u)--(12*u,5.8*u);
draw (0,8*u)--(12*u,7.6*u);
draw (0,8*u)--(12*u,8.4*u);
draw (0,8*u)--(12*u,9.2*u);

label.top(btex   keine Entartung etex, (6*u, 2.25*u));
label.top(btex 2-fache Entartung etex, (6*u, 5.9*u));
label.top(btex 3-fache Entartung etex, (6*u, 8.6*u));

endfig;

%
% Aufspaltung einer doppelten Nullstelle
%
beginfig(3)

numeric u;
u := 50;

pickup pencircle scaled 1pt;

drawarrow (-10,0)--(210,0);
drawarrow (0,-60)--(0,160);

draw (    u, -2)--(    u, 2); label.bot(btex $1$ etex, (    u, -2));
draw (2 * u, -2)--(2 * u, 2); label.bot(btex $2$ etex, (2 * u, -2));
draw (3 * u, -2)--(3 * u, 2); label.bot(btex $3$ etex, (3 * u, -2));
draw (4 * u, -2)--(4 * u, 2); label.bot(btex $4$ etex, (4 * u, -2));

draw (-2,-1 * u)--(2,-1 * u); label.lft(btex $-1$ etex, (-2, -1 * u));
draw (-2, 1 * u)--(2, 1 * u); label.lft(btex $ 1$ etex, (-2,  1 * u));
draw (-2, 2 * u)--(2, 2 * u); label.lft(btex $ 2$ etex, (-2,  2 * u));
draw (-2, 3 * u)--(2, 3 * u); label.lft(btex $ 3$ etex, (-2,  3 * u));

label.llft(btex $0$ etex, (-2, -2));

path p;
path q;
p = (0,u);
q = (0,u);

for x = 0.01 step 0.01 until 4.005:
	p := p..(x * u, u * (1 + sqrt(x)));
	q := q..(x * u, u * (1 - sqrt(x)));
endfor;

pickup pencircle scaled 1.5pt;

draw p;
draw q;

label.top(btex $\varepsilon$ etex, (205,5));
label.lft(btex $x$ etex, (-3,160));

pickup pencircle scaled 4pt;
draw (0, u);
pickup pencircle scaled 2.5pt;
draw (0, u) withcolor (1,1,1);

label.rt(btex $\mathstrut x_0$ etex, (3, u));

numeric v;
v = 2.5;

label.ulft(btex $x_+(\varepsilon) = 1+\sqrt{\varepsilon}$ etex,
	(v * u, (1 + sqrt(v)) * u));
label.llft(btex $x_-(\varepsilon) = 1-\sqrt{\varepsilon}$ etex,
	(v * u, (1 - sqrt(v)) * u));

endfig;

end
