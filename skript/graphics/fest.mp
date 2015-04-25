%
% fest.mp -- Bilder zu Festkörper
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
% Festkoerper
%
beginfig(1)

numeric u;
u := 15pt;
numeric 	EF;
EF := 8.4 * u;


pickup pencircle scaled 0.2pt;

def r(expr x, y) =
	u * sqrt((x / u) * (x / u) + (y / u) * (y / u))
enddef;

pickup pencircle scaled 1pt;
drawarrow (-10.5 * u, 0)--(10.5 * u, 0);
drawarrow (0, -10.5 * u)--(0, 10.5 * u);
label.top(btex $k_x$ etex, (10.5 * u, 0));
label.lft(btex $k_y$ etex, (0, 10.5 * u));

for x = (-10 * u) step u until (10 * u):
	for y = (-10 * u) step u until (10 * u):
		if EF > r(x, y):
			fill (x-0.5*u, y-0.5*u)--(x+0.5*u, y-0.5*u)
				--(x+0.5*u, y+0.5*u)--(x-0.5*u, y+0.5*u)--cycle
			withcolor (0.9,0.9,0.9);
			label(btex $\downarrow\uparrow$ etex, (x,y));
		fi;
	endfor;
endfor;

pickup pencircle scaled 0.2pt;
for x = -9.5 * u step u until 10 * u:
	draw (x,-9.5 * u - 5)--(x,9.5 * u + 5);
endfor;

for y = -9.5 * u step u until 10 * u:
	draw (-9.5 * u - 5,y)--(9.5 * u + 5,y);
endfor;

pickup pencircle scaled 3pt;
draw (0,0);

pickup pencircle scaled 1pt;

draw (EF, 0)..(0,EF)..(-EF,0)..(0,-EF)..cycle withcolor (1,0,0);

numeric d;
d = EF + 0.1 * u;
numeric a;
a = 50;
label.urt(btex $E_F$ etex, (d * cosd(a), d * sind(a))) withcolor (1,0,0);

endfig;

%
% "Auspressen" von Elektronen: weites Gitter
%
numeric a;
a := 200;
numeric levelstep;
levelstep := 24;

def phi(expr x) =
	if abs(x) > 1:
		(-a / abs(x))
	else:
		(-a)
	fi
enddef;

def plotpotential(expr a, b) =
	path p;
	p := (a + 1, potential(a + 1));
	for x = a + 2 step 0.2 until b - 1:
		p := p--(x, potential(x));
	endfor;
	fill p--cycle withcolor (1,1,1);
	pickup pencircle scaled 1pt;
	draw p;
enddef;

beginfig(2)

def potential(expr x) =
	(
		  phi(x -  50) + phi(x - 100)
		+ phi(x - 150) + phi(x - 200)
		+ phi(x - 250)
	)
enddef;

pickup pencircle scaled 1pt;
for E = -50 step -levelstep until -199:
	draw (-E/4, E)--(300 + E/4, E) withcolor(1,0,0);
endfor;

plotpotential(-10,  50);
for x = 50 step 50 until 200:
	plotpotential(x, x + 50);
endfor
plotpotential(250, 310);

clip currentpicture to (-10,-205)--(310,-205)--(310,0)--(-10,0)--cycle;

pickup pencircle scaled 0.2pt;
draw (-10,0)--(310,0);
draw (0,-210)--(0,10); label.ulft(btex $E$ etex, (0,0));

endfig;

%
% "Auspressen" von Elektronen: enges Gitter
%
beginfig(3)

def potential(expr x) =
	(
		  phi(x -  50) + phi(x -  60) + phi(x -  70) + phi(x -  80)
		+ phi(x -  90) + phi(x - 100) + phi(x - 110) + phi(x - 120)
		+ phi(x - 130) + phi(x - 140) + phi(x - 150) + phi(x - 160)
		+ phi(x - 170) + phi(x - 180) + phi(x - 190) + phi(x - 200)
		+ phi(x - 210) + phi(x - 220) + phi(x - 230) + phi(x - 240)
		+ phi(x - 250)
	)
enddef;

pickup pencircle scaled 1pt;
for E = -50 step -levelstep until -199:
	draw (-E/4, E)--(300 + E/4, E) withcolor(1,0,0);
endfor;

plotpotential(-10,  50);
for x = 50 step 10 until 240:
	plotpotential(x, x + 10);
endfor
plotpotential(250, 310);

clip currentpicture to (-10,-205)--(310,-205)--(310,0)--(-10,0)--cycle;

pickup pencircle scaled 0.2pt;
draw (-10,0)--(310,0);
draw (0,-210)--(0,10); label.ulft(btex $E$ etex, (0,0));

endfig;

%
% Hexagonales Gitter
%
def clipit(expr s) =
	clip currentpicture to (((-140,-100)--(140,-100)--(140,100)--(-140,100)--cycle) scaled s)
enddef;

beginfig(4)

numeric unit;
unit = 40;

z0 = (0,0);
z1 = (unit, 0);
z2 = (unit / 2, unit * sqrt(3) / 2);
z3 = z2 shifted -z1;

pickup pencircle scaled 1pt;
drawarrow z0--z1;
drawarrow z0--z2;

label.bot(btex $v_1$ etex, 0.5[z0,z1]);
label.ulft(btex $v_2$ etex, 0.5[z0,z2]);

pickup pencircle scaled 0.2pt;
for i = -5 step 1 until 5:
	draw (z0 shifted (i * z1) shifted (-5 * z2))--
		(z0 shifted (i * z1) shifted (5 * z2));
	draw (z0 shifted (-5 * z1) shifted (i * z2))--
		(z0 shifted (5 * z1) shifted (i * z2));
	draw (z0 shifted (i * z1) shifted (5 * z3))--
		(z0 shifted (i * z1) shifted (-5 * z3));
endfor;

for i = -5 step 1 until 5:
	for j = -5 step 1 until 5:
		pickup pencircle scaled 4pt;
		draw z0 shifted (i * z1) shifted (j * z2) withcolor white;
		pickup pencircle scaled 3pt;
		draw z0 shifted (i * z1) shifted (j * z2);
		pickup pencircle scaled 2pt;
		draw z0 shifted (i * z1) shifted (j * z2) withcolor white;
	endfor;
endfor;

clipit(1);

endfig;

%
% duales hexagonales Gitter
%
beginfig(5)

z0 = (0,0);

% duales gitter
z11 = 1.5 * unit * (1, -1/sqrt(3));
z12 = 1.5 * unit * (0,2/sqrt(3));
z13 = z12 shifted z11;

pickup pencircle scaled 1pt;
drawarrow z0--z11;
drawarrow z0--z12;

label.lft(btex $k_2$ etex, 0.5[z0,z12]);
label.llft(btex $k_1$ etex, 0.5[z0,z11]);

pickup pencircle scaled 0.2pt;
for i = -5 step 1 until 5:
	draw (z0 shifted (i * z11) shifted (-5 * z12))--
		(z0 shifted (i * z11) shifted (5 * z12));
	draw (z0 shifted (-5 * z11) shifted (i * z12))--
		(z0 shifted (5 * z11) shifted (i * z12));
	draw (z0 shifted (i * z11) shifted (5 * z13))--
		(z0 shifted (i * z11) shifted (-5 * z13));
endfor;

for i = -5 step 1 until 5:
	for j = -5 step 1 until 5:
		pickup pencircle scaled 4pt;
		draw z0 shifted (i * z11) shifted (j * z12) withcolor white;
		pickup pencircle scaled 3pt;
		draw z0 shifted (i * z11) shifted (j * z12);
		pickup pencircle scaled 2pt;
		draw z0 shifted (i * z11) shifted (j * z12) withcolor white;
	endfor;
endfor;

clipit(1);

endfig;

%
% Dispersionsrelation
%
beginfig(6)

numeric unit;
unit := 60;
numeric xmin;
numeric xmax;
path p;

numeric a;
a := 0.5;

def parabola(expr c) =
	p := (-5,16 * a);
	for x = -5.9 step 0.1 until 5:
		p := p--(x, x * x * a);
	endfor;
	draw p scaled unit shifted (c * unit, 0);
enddef;

fill (-0.5*unit,0)--(0.5*unit,0)--(0.5*unit,5*unit)--(-0.5*unit,5*unit)--cycle
	withcolor (0.95,0.95,0.95);

pickup pencircle scaled 1pt;
draw (-3.2 * unit,0)--(3.2*unit, 0);
draw (0,-5)--(0,5*unit);

for c = -5 step 1 until 5:
	pickup pencircle scaled 0.7pt;
	parabola(c)
	pickup pencircle scaled 0.2pt;
	draw ((c+0.5) * unit, -5)--((c+0.5)*unit, 300);
endfor;

pickup pencircle scaled 1.5pt;
parabola(0);

for c = -5 step 1 until 5:
	pickup pencircle scaled 4pt;
	draw (c * unit, 0) withcolor white;
	pickup pencircle scaled 3pt;
	draw (c * unit, 0);
	pickup pencircle scaled 2pt;
	draw (c * unit, 0) withcolor white;
endfor;

clip currentpicture to (-3.2 * unit, -5)--(3.2 * unit,-5)
		--(3.2*unit,3.5 * unit)--(-3.2*unit,3.5*unit)--cycle;

label.bot(btex 0 etex, (0 * unit, -5));
label.bot(btex $1\cdot \frac{2\pi}{a}$ etex, ( 1 * unit, -2));
label.bot(btex $2\cdot \frac{2\pi}{a}$ etex, ( 2 * unit, -2));
label.bot(btex $3\cdot \frac{2\pi}{a}$ etex, ( 3 * unit, -2));
label.bot(btex $-1\cdot \frac{2\pi}{a}$ etex, (-1 * unit, -2));
label.bot(btex $-2\cdot \frac{2\pi}{a}$ etex, (-2 * unit, -2));
label.bot(btex $-3\cdot \frac{2\pi}{a}$ etex, (-3 * unit, -2));

pickup pencircle scaled 1pt;
drawarrow (3.2*unit,0)--(3.5*unit,0);
label.top(btex $K$ etex, (3.5*unit,0));
drawarrow (0,3.5*unit)--(0,3.7*unit);
label.rt(btex $E$ etex, (0,3.7*unit));

endfig;

end
