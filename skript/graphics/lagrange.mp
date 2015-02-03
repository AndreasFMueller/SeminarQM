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

%
% Herleitung der Eulergleichungen
%
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

%
% Hamiltonscher Fluss f"ur den harmonischen Oszillator
%
beginfig(2)

numeric b;
b := sqrt(2.1);

def drawellipse(expr r, c) =
	path	p;
	p := (r, 0);
	for a = 1 step 1 until 359:
		p := p..(r * cosd(a), r * sind(a) / b);
	endfor;
	p := p..cycle;
	draw p withcolor c;
enddef;

def drawpath(expr r, c) =
	path	p;
	p := r * (cosd(45), sind(45) / b);
	for a = 46 step -1 until -70:
		p := p--(r * cosd(a), r * sind(a) / b);
	endfor;
	drawarrow p withcolor c;
enddef;

label.urt(btex $x$ etex, (160,0));
label.ulft(btex $p$ etex, (0,110));

pickup pencircle scaled 1pt;

z4 = 150 * (cosd(-120), sind(-120) / b);
z5 = z4 shifted (-8, -8);
label.llft(btex $H=\operatorname{const}$ etex, z5);
pickup pencircle scaled 0.5pt;
draw z4--z5;

color grey;
grey = (0.5,0.5,0.5);

pickup pencircle scaled 0.7pt;
for r = 25 step 25 until 150:
	drawellipse(r, grey);
endfor;

numeric a;
a := 45;
numeric r;
r := 100;
z1 = (r * cosd(a), r * sind(a) / b);

pickup pencircle scaled 1pt;
drawpath(100, (0,1,0));
z2 = 0.4 * (x1, b * b * y1);
z3 = (y2, -x2);
drawarrow z1--(z2 shifted z1) withcolor (1,0,0);
label.urt(btex $\operatorname{grad}H$ etex, z2 shifted z1) withcolor (1,0,0);
drawarrow z1--(z3 shifted z1) withcolor (0,0,1);
fill ((z3 shifted (0,-15))--(z3 shifted (29,-15))--(z3 shifted(29,14))
	--(z3 shifted(0,14))--cycle) shifted z1 withcolor (1,1,1);
label.rt(btex $\begin{pmatrix} \frac{\partial H}{\partial p}\\-\frac{\partial H}{\partial x}\end{pmatrix}$ etex,
	z3 shifted z1) withcolor (0,0,1);

pickup pencircle scaled 3.4pt;
draw z1 withcolor (0,0,1);
pickup pencircle scaled 2pt;
draw z1 withcolor (0,0,1);

z6 = r * (cosd(-70), sind(-70) / b);
label.bot(btex $(x(t),p(t))$ etex, z6) withcolor (0,1,0);

pickup pencircle scaled 0.7pt;
drawarrow (-160,0)--(160,0);
drawarrow (0,-110)--(0,110);

endfig;

end
