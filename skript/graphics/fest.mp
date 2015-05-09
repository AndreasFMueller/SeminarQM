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
% Fermi-Kugel
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

%
% Reflexion eines Wellenzahlvektors
%
beginfig(7)

numeric unit;
unit := 30;

z0 = ( 0, 0);
z1 = ( 0, 2) * unit;
z2 = (-4, 0) * unit;
z3 = ( 4, 0) * unit;
z4 = (-4,-1) * unit;
z5 = ( 4,-1) * unit;

pickup pencircle scaled 1pt;

drawarrow z0--z1;
label.rt(btex $\vec K$ etex, 0.8[z0,z1]);

pickup pencircle scaled 0.5pt;

draw z2--z3;
draw z4--z5;
draw z0--(z0 shifted (0,-1.5 * unit));

pickup pencircle scaled 3pt;
draw (z0 shifted (0,0));

z6 = (-4, 1.5) * unit;
z7 = ( 4, 1.5) * unit;
z8 = (-4, 0.5) * unit;
z9 = ( 4, 0.5) * unit;

pickup pencircle scaled 0.2pt;

draw z6--z0--z7;
z10 = 0.3333[z6,z0];
z11 = 0.6666[z0,z7];
draw z10--z11;
drawarrow z10--(0.5[z10,z11]);
drawarrow (0.5[z10,z11])--z0;

label.top(btex $\vec k_{\|}$  etex, (0.2[z10,z11]));
label.top(btex $\vec k'_{\|}$ etex, (0.8[z10,z11]));
label.rt(btex $\vec k_{\perp}$ etex, (0,unit * 0.6));

pickup pencircle scaled 1pt;

drawarrow (0.3333[z6,z0])--z0;
drawarrow z0--(0.6666[z0,z7]);

label.llft(btex $\vec k$ etex, (0.5[z6,z0]));
label.lrt(btex $\vec k'$ etex, (0.5[z0,z7]));


endfig;

%
% Phasenbedingung f"ur Bragg-Reflexion
%
beginfig(8)

numeric unit;
unit := 30;

z0 = ( 0, 0);
z1 = ( 0, 2) * unit;
z2 = (-4, 0) * unit;
z3 = ( 4, 0) * unit;
z4 = (-4,-1) * unit;
z5 = ( 4,-1) * unit;

pickup pencircle scaled 1pt;

drawarrow z0--z1;
label.rt(btex $\vec K$ etex, 0.8[z0,z1]);

pickup pencircle scaled 0.5pt;

draw z2--z3;
draw z4--z5;
draw z0--(z0 shifted (0,-1.5 * unit));

pickup pencircle scaled 3pt;
draw (z0 shifted (0,0));

z6 = (-4, 1.5) * unit;
z7 = ( 4, 1.5) * unit;
z8 = (-4, 0.5) * unit;
z9 = ( 4, 0.5) * unit;

pickup pencircle scaled 0.2pt;

draw z6--z0--z7;
draw (z6--z0--z7) shifted (0,-unit);
z10 = 0.3333[z6,z0];
z11 = 0.6666[z0,z7];

z12 = (-1.5,-4) * unit;
z13 = ( 1.5,-4) * unit;

numeric t;
numeric s;

z14 = (z0--z12) intersectionpoint (z8--(z0 shifted (0,-unit)));
z15 = (z0--z13) intersectionpoint (z9--(z0 shifted (0,-unit)));

draw z0--z14;
draw z0--z15;

drawarrow (3 * unit, 0 * unit)--(3 * unit, -1 * unit);
drawarrow (3 * unit,-1 * unit)--(3 * unit,  0 * unit);
label.rt(btex $d$ etex, (3 * unit, -0.5 * unit));

pickup pencircle scaled 1.5pt;

draw z14--(z0 shifted (0,-unit))--z15 withcolor red;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (0,-unit))--z0 withcolor red;
label.rt(btex $\vec d$ etex, (0,-0.2*unit)) withcolor red;

drawarrow (0.3333[z6,z0])--z0;
drawarrow z0--(0.6666[z0,z7]);

label.llft(btex $\vec k$ etex, (0.5[z6,z0]));
label.lrt(btex $\vec k'$ etex, (0.5[z0,z7]));

label.llft(btex $s$ etex, 0.5[z14,z0 shifted (0,-unit)] shifted (0,-2)) withcolor red;
label.lrt( btex $s$ etex, 0.5[z15,z0 shifted (0,-unit)] shifted (0,-2)) withcolor red;

endfig;

%
% Baendermodell
%
beginfig(9)

numeric unit;
unit := 60;
numeric xmin;
numeric xmax;
path p;

numeric a;
a := 0.5;
numeric beta;
beta := 0.20;

def cos(expr x) = (beta / 90) * cosd(90 * x / beta)  enddef;

numeric l;
l := 0.5 * 180 / 3.1415926535;

def pfunc(expr x, c, xmin, xmax) =
	if (x - xmin) < beta:
		-2 * l * (xmin + beta - c) * cos(x - xmin)
			+ a * (xmin + beta - c) * (xmin + beta - c)
	elseif (xmax -x) < beta:
		2 * l * (xmax - beta - c) * cos(xmax - x)
			+ a * (xmax - beta - c) * (xmax - beta - c)
	else:
		a * (x - c) * (x - c)
	fi
enddef;

for xmin = 0 step 0.5 until 4:
	numeric ymin;
	ymin := pfunc(xmin      , 0, xmin, xmin + 0.5);
	numeric ymax;
	ymax := pfunc(xmin + 0.5, 0, xmin, xmin + 0.5);
	show xmin;
	show unit * ymin;
	show unit * ymax;
	fill ((-4, ymin)--( 4, ymin)--( 4, ymax)--(-4, ymax)--cycle)
		scaled unit withcolor (0.9,0.9,0.9);
endfor;

def parabola(expr c, xmin, xmax) =
	p := (xmin, pfunc(xmin, c, xmin, xmax));
	for x = xmin + 0.01 step 0.01 until xmax + 0.005:
		p := p--(x, pfunc(x, c, xmin, xmax));
	endfor;
	draw p scaled unit;
enddef;

def para(expr c) =
	p := (-5,16 * a);
	for x = -5.9 step 0.1 until 5:
		p := p--(x, x * x * a);
	endfor;
	draw p scaled unit shifted (c * unit, 0);
enddef;

%fill (-0.5*unit,0)--(0.5*unit,0)--(0.5*unit,5*unit)--(-0.5*unit,5*unit)--cycle
%	withcolor (0.95,0.95,0.95);

pickup pencircle scaled 1pt;
draw (-3.2 * unit,0)--(3.2*unit, 0);
draw (0,-5)--(0,5*unit);

for c = -5 step 1 until 5:
	pickup pencircle scaled 0.2pt;
	para(c);
	pickup pencircle scaled 0.7pt;
	for xmin = -5 step 0.5 until 5:
		parabola(c, xmin, xmin + 0.5);
	endfor;
	pickup pencircle scaled 0.2pt;
	draw ((c+0.5) * unit, -5)--((c+0.5)*unit, 300);
endfor;

pickup pencircle scaled 1.5pt;
for xmin = -5 step 0.5 until 5:
	parabola(0, xmin, xmin + 0.5);
endfor;

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

label.bot(btex   0                      etex, ( 0 * unit, -5));
label.bot(btex $ 1\cdot \frac{2\pi}{a}$ etex, ( 1 * unit, -2));
label.bot(btex $ 2\cdot \frac{2\pi}{a}$ etex, ( 2 * unit, -2));
label.bot(btex $ 3\cdot \frac{2\pi}{a}$ etex, ( 3 * unit, -2));
label.bot(btex $-1\cdot \frac{2\pi}{a}$ etex, (-1 * unit, -2));
label.bot(btex $-2\cdot \frac{2\pi}{a}$ etex, (-2 * unit, -2));
label.bot(btex $-3\cdot \frac{2\pi}{a}$ etex, (-3 * unit, -2));

pickup pencircle scaled 1pt;
drawarrow (3.2*unit,0)--(3.5*unit,0);
label.top(btex $K$ etex, (3.5*unit,0));
drawarrow (0,3.5*unit)--(0,3.7*unit);
label.rt(btex $E$ etex, (0,3.7*unit));

endfig;

%
% Zustandsdichte eines Bandes, dreidimensionaler Fall
%
beginfig(10)

numeric a;
a := 16;
def band(expr Eu) =
	path p;
	p := (Eu,0){dir 90}..(Eu + 1, a);
	for x = Eu + 2 step 1 until Eu + 30:
		p := p--(x, a * sqrt(x - Eu));
	endfor;
	p := p--(Eu + 31, a * sqrt(Eu + 31 - Eu));
	p := p{dir 45}..(Eu + 50,a * 6.2);
	p := p--(Eu + 50,a * 6.2);
	p := p..{dir -90}(Eu + 60,0);
	pickup pencircle scaled 1pt;
	fill p--cycle withcolor (0.9,0.9,0.9);
	draw p;
enddef;

band(30);
band(120);

label.bot(btex $E_{u_1}$ etex, (30,-2));
label.bot(btex $E_{u_2}$ etex, (120,-2));

pickup pencircle scaled 1pt;
drawarrow (-5,0)--(205,0);
drawarrow (0,-5)--(0,145);
label.lft(btex $Z$ etex, (0,145));
label.top(btex $E$ etex, (205,0));

endfig;

%
% Zustandsdichte eines Bandes, eindimensionaler Fall
% 
beginfig(11)

numeric a;
a := 16;
def band(expr Eu) =
	path p;
	p := (Eu,0)--(Eu, 110)--(Eu+30,110)--(Eu+30,0);
	pickup pencircle scaled 1pt;
	fill p--cycle withcolor (0.9,0.9,0.9);
	draw p;
enddef;

band(20);
band(90);
band(140);

label.bot(btex $E_{u_1}$ etex, (20,-2));
label.bot(btex $E_{u_2}$ etex, (90,-2));
label.bot(btex $E_{u_3}$ etex, (140,-2));

pickup pencircle scaled 1pt;
drawarrow (-5,0)--(205,0);
drawarrow (0,-5)--(0,145);
label.lft(btex $Z$ etex, (0,145));
label.top(btex $E$ etex, (205,0));

endfig;

%
% Wellenfunktionen im Orts- und k-Raum, nach einer Idee von 
% Nicola Ochsenbein und Simon Kuster
%
beginfig(12)

numeric u;
u := 10pt;
numeric n;
n := 8;

pickup pencircle scaled 0.2pt;

def r(expr x, y) =
	u * sqrt((x / u) * (x / u) + (y / u) * (y / u))
enddef;

pickup pencircle scaled 1pt;
drawarrow (-n * u, 0)--(n * u, 0);
drawarrow (0, -n * u)--(0, n * u);
label.urt(btex $k_x$ etex, (n * u, 0));
label.ulft(btex $k_y$ etex, (0, n * u));

def fillfield(expr x, y) =
	fill ((x-0.5)*u, (y-0.5)*u)
		--((x+0.5)*u, (y-0.5)*u)
		--((x+0.5)*u, (y+0.5)*u)
		--((x-0.5)*u, (y+0.5)*u)--cycle
		withcolor (1,0.9,0.9);
enddef;
fillfield(0, 2);
fillfield(0,-2);
fillfield(3, 0);
fillfield(3, 7);
fillfield(5,-5);

pickup pencircle scaled 0.2pt;
for x = -(n-0.5) * u step u until n * u:
	draw (x,-(n-0.5) * u - 5)--(x,(n-0.5) * u + 5);
endfor;

for y = -(n-0.5) * u step u until n * u:
	draw (-(n-0.5) * u - 5,y)--((n-0.5) * u + 5,y);
endfor;

pickup pencircle scaled 3pt;
draw (0,0);

pickup pencircle scaled 1pt;

z0 = (-n * u, -n * u) shifted (-(2*n+1) * u,0);
z1 = ( n * u, -n * u) shifted (-(2*n+1) * u,0);
z2 = ( n * u,  n * u) shifted (-(2*n+1) * u,0);
z3 = (-n * u,  n * u) shifted (-(2*n+1) * u,0);

fill z0--z1--z2--z3--cycle withcolor (0.95,0.95,0.95);
draw z0--z1--z2--z3--cycle;

label.bot(btex $-l$ etex, z0);
label.bot(btex $+l$ etex, z1);
label.lft(btex $-l$ etex, z0);
label.lft(btex $+l$ etex, z3);

def wave(expr l, m, a) =
	(((0,0){dir 60}
	for s = 1 step 2 until 2 * m:
		..         ((s-0.5) * u,  0.5 * u)
		..{dir -60}((s    ) * u,  0){dir -60}
		..         ((s+0.5) * u, -0.5 * u)
		..{dir  60}((s+1  ) * u,  0)
	endfor
	) xscaled (l/(u * m)) shifted (-u * l/u,0) rotated a)
enddef;

path	w;
w := (wave(n * u, 3, 0)) shifted (z0 shifted (n * u, 1.3 * n * u));
pickup pencircle scaled 1pt;
drawarrow w withcolor red;
pickup pencircle scaled 0.5pt;
drawarrow (point 7 of w)..(-5*u,-u)..(3 * u, 0) withcolor blue;
pickup pencircle scaled 3pt;
draw point 7 of w withcolor red;
draw (3 * u, 0) withcolor red;

%label.top(btex $k_3$ etex, point 6 of w) withcolor red;

w := (wave(sqrt(2) * n * u, 5, -45)) shifted (z0 shifted (n * u, n * u));
pickup pencircle scaled 1pt;
drawarrow w withcolor red;
pickup pencircle scaled 0.5pt;
drawarrow (point 17 of w)--(5 * u,  -5 * u) withcolor blue;
pickup pencircle scaled 3pt;
draw point 17 of w withcolor red;
draw (5 * u,  -5 * u) withcolor red;

w := (wave(n * u, 2,  90)) shifted (z0 shifted (0.3 * n * u, n * u));
pickup pencircle scaled 1pt;
drawarrow w withcolor red;
pickup pencircle scaled 0.5pt;
drawarrow (point 7 of w)--(0,  2 * u) withcolor blue;
pickup pencircle scaled 3pt;
draw point 7 of w withcolor red;
draw (0,  2 * u) withcolor red;

w := (wave(n * u, 2, -90)) shifted (z0 shifted (0.6 * n * u, n * u));
pickup pencircle scaled 1pt;
drawarrow w withcolor red;
pickup pencircle scaled 0.5pt;
drawarrow (point 6 of w)--(0, -2 * u) withcolor blue;
pickup pencircle scaled 3pt;
draw point 6 of w withcolor red;
draw (0, -2 * u) withcolor red;

w := (wave(1.08797 * n * u, 7, 180-113.199))
	shifted (z0 shifted (1.3 * n * u, n * u));
pickup pencircle scaled 1pt;
drawarrow w withcolor red;
pickup pencircle scaled 0.5pt;
drawarrow (point 24 of w)--(3 * u, 7 * u) withcolor blue;
pickup pencircle scaled 3pt;
draw point 24 of w withcolor red;
draw (3 * u, 7 * u) withcolor red;

endfig;

end
