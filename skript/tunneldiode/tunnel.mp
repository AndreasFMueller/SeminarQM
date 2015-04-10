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

numeric u;
u = 0.1;

def exp(expr x) = mexp(x / u) enddef;

def cosh(expr x) =
	(exp(x) + exp(-x)) / 2
enddef;
def sinh(expr x) =
	(exp(x) - exp(-x)) / 2
enddef;

numeric deg;
deg = 180. / (256 * 3.1415926535);

def cos(expr x) =
	cosd(deg * x / u)
enddef;
def sin(expr x) =
	sind(deg * x / u)
enddef;

numeric kappa;
kappa := 1;
numeric k;
k := 1;

numeric lambda;
lambda = k / kappa;

numeric a;
a = 15;
numeric l;
l = 2 * a;

%
% Bild 1, Fall k = kappa
%
beginfig(1)

numeric U;
U = 100;
numeric w;
w = 2 * a;

z0 = (-200,0);
z1 = (-w/2,0);
z2 = (-w/2,U);
z3 = (w/2, U);
z4 = (w/2,0);
z5 = (100,0);

fill z1--z4--z3--z2--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10, 0))--(z5 shifted (10,0));
pickup pencircle scaled 1.5pt;
draw z0--z1--z2--z3--z4--z5;

numeric C;
C = 10;

path psi;
psi = (-a, C * cosh(4 * k * a));
for x = -a + 1 step 1 until a:
	psi := psi--(x, C * cosh(2 * k * (x - a)));
endfor;
draw psi withcolor red;

numeric Ain, Aout;
Ain = cosh(2 * a * kappa);
Aout = sinh(2 * a * kappa);
show Ain;
show Aout;

draw (a,C)--(100,C) withcolor red;

def Realpart(expr x) =
	(cos(k * (x + l)) * Ain - sin(k * x) * Aout)
enddef;
def Imaginarypart(expr x) =
	(sin(k * (x + l)) * Ain - cos(k * x) * Aout)
enddef;

def sqr(expr x) = (x * x) enddef;

def psileft(expr x) =
	C * sqr(Realpart(x)) + sqr(Imaginarypart(x))
enddef;

psi := (-a, C * cosh(4 * k * a));
for x = -a - 1 step -0.1 until -200:
	psi := psi--(x, psileft(x));
endfor;
draw psi withcolor red;

endfig;

%
% Bild fuer den Fall kappa != k
%
beginfig(2)

numeric U;
U = 100;
numeric w;
w = 2 * a;

k := 2;
kappa := 0.2;
lambda := k / kappa;

numeric	Kp, Km;
Kp = kappa / k + k / kappa;
Km = kappa / k - k / kappa;
show Kp;
show Km;

numeric Ain, Aout;
Ain = cosh(l * kappa);
Aout = sinh(l * kappa);
show Ain;
show Aout;

z0 = (-200,0);
z1 = (-w/2,0);
z2 = (-w/2,U);
z3 = (w/2, U);
z4 = (w/2,0);
z5 = (100,0);

fill z1--z4--z3--z2--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10, 0))--(z5 shifted (10,0));
pickup pencircle scaled 1.5pt;
draw z0--z1--z2--z3--z4--z5;

numeric C;
C := 13;

def BarrierProbability(expr x) =
	0.5 * (
		(1 + sqr(lambda)) * cosh(2 * kappa * (x - a))
			+ (1 - sqr(lambda))
	)
enddef;

path psi;
psi = (-a, C * BarrierProbability(-a));
for x = -a + 1 step 1 until a:
	psi := psi--(x, C * BarrierProbability(x));
endfor;
draw psi withcolor red;
draw (a,C)--(100,C) withcolor red;

def RealPart(expr x) =
	(Ain * cos(k * (x + l))
		- 0.5 * Aout * (Km * sin(k * (x + l)) + Kp * sin(k * x)))
enddef;

def ImaginaryPart(expr x) =
	(Ain * sin(k * (x + l))
		+ 0.5 * Aout * (Km * cos(k * (x + l)) - Kp * cos(k * x)))
enddef;

def sqr(expr x) = (x * x) enddef;

def Psileft(expr x) =
	C * (sqr(RealPart(x)) + sqr(ImaginaryPart(x)))
enddef;

path psi;
psi := (-a, Psileft(-a));
for x = -a - 1 step -0.1 until -200:
	psi := psi--(x, Psileft(x));
endfor;
draw psi withcolor red;

numeric Cin, Cout;
Cin  := sqr(Ain) + sqr(0.5 * Km * Aout);
Cout :=            sqr(0.5 * Kp * Aout);

endfig;

%
% Bild fuer den Fall kappa != k
%
beginfig(3)

numeric U;
U = 100;
numeric w;
w = 10.5;
a := w / 2;
l := 2 * a;

k := 3;
kappa := 0.2;
lambda := k / kappa;

numeric	Kp, Km;
Kp = (sqr(kappa) + sqr(k)) / (2 * kappa * k);
Km = (sqr(kappa) - sqr(k)) / (2 * kappa * k);
show Kp;
show Km;

numeric Ain, Aout;
Ain := cosh(l * kappa);
Aout := sinh(l * kappa);
show Ain;
show Aout;

z0 = (-500,0);
z1 = (-w/2,0);
z2 = (-w/2,U);
z3 = (w/2, U);
z4 = (w/2,0);
z5 = (120,0);

color lightblue;
lightblue = (0.95,0.95,1);

fill (z0 shifted(-20,-20))--(z5 shifted (20,-20))--(140,120)--(-520,120)--cycle
	withcolor lightblue;

fill z1--z4--z3--z2--cycle withcolor (0.9,0.9,0.9);
fill z1--z4--z3--z2--cycle withcolor (1.0,1.0,0.7);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10, 0))--(z5 shifted (10,0));
pickup pencircle scaled 1.5pt;
draw z0--z1--z2--z3--z4--z5;

numeric C;
C := 30;

def BarrierProbability(expr x) =
	0.5 * (
		(1 + sqr(lambda)) * cosh(2 * kappa * (x - a))
		+ (1 - sqr(lambda))
	)
enddef;

path psi;
psi = (-a, C * BarrierProbability(-a));
for x = -a + 1 step 1 until a:
	psi := psi--(x, C * BarrierProbability(x));
endfor;
draw psi withcolor red;
drawarrow (a,C)--(120,C) withcolor red;

def sqr(expr x) = (x * x) enddef;

numeric A;
A := cosh(2 * l * kappa);
B := sinh(2 * l * kappa);

def Psileft(expr x) =
	C * (
		- Kp      * B * sin(2 * k * (x + a))
		+ Kp * Kp * A
		- Km * Kp * (A - 1) * cos(2 * k * (x + a))
		- Km * Km
	)
enddef;

path psi;
psi := (-a, Psileft(-a));
for x = -a - 1 step -0.2 until -520:
	psi := psi--(x, Psileft(x));
endfor;
draw psi withcolor red;

numeric Cin, Cout;
Cin  := sqr(A) + sqr(0.5 * (kappa/k - k/kappa) * B);
Cout :=          sqr(0.5 * (kappa/k + k/kappa) * B);

fill (-50 - 20, C * Cin + 2)--(-50 + 20, C * Cin + 2)
	--(-50 + 20, C * Cin + 14)--(-50 - 20, C * Cin + 14)--cycle
	withcolor lightblue;
label.top(btex $|\psi_{\text{in}}(x)|^2$ etex, (-50, C * Cin)) withcolor blue;
drawarrow (-100, C * Cin )--(-a - 5, C * Cin ) withcolor blue;

fill (-50 + 25, C * Cout - 14)--(-50 - 25, C * Cout - 14)
	--(-50 - 25, C * Cout - 2)--(-50 + 25, C * Cout - 2)--cycle
	withcolor lightblue;
label.bot(btex $|\psi_{\text{reflect}}(x)|^2$ etex, (-50, C * Cout)) withcolor blue;
%drawarrow (-80, C * Cin + 37)--(-40, C * Cin + 37) withcolor green;
drawarrow (-a - 5, C * Cout)--(-100, C * Cout) withcolor blue;
%drawarrow (-40, C * Cout - 37)--(-80, C * Cout - 37) withcolor blue;

%label.top(btex $
%|\psi|^2
%=
%\displaystyle \frac{4\kappa k \coth l\kappa
%+(k-\kappa)^2}{(k+\kappa)^2}$ etex, (60 + a/2, C));

%label.top(btex $\displaystyle
%i\hbar\frac{\partial\psi}{\partial t}
%=-\frac{\hbar^2}{2m}\Delta\psi + V(x)\psi$ etex, 
%(60 + a/2, C));

label.top(btex $|\psi_{\text{Tunnel}}(x)|^2$ etex, (0,0)) scaled 1.5
shifted (60 + a/2, C);

pickup pencircle scaled 0.2pt;
draw (-a,0)--(-a,-20);
draw ( a,0)--( a,-20);
draw (-a-3,-15)--(a+3,-15);
label.top(btex $l$ etex, (0,-15));
label.top(btex $V_0$ etex, (0, U));
label.top(btex $x$ etex, z5 shifted (10, 3));

clip currentpicture to 
(z0 shifted(0,-20))--(z5 shifted (20,-20))--(140,120)--(-500,120)--cycle;

endfig;

beginfig(4)

fill (-200,-10)--(-30,-10)--(-30,200)--(-200,200)--cycle
	withcolor (0.95,0.95,1);
fill (30,-10)--(200,-10)--(200,200)--(30,200)--cycle
	withcolor (0.95,1,0.95);
fill (-30,-10)--(30,-10)--(30,200)--(-30,200)--cycle
	withcolor (1,0.95,0.95);

label(btex   I etex, (-115,180)) withcolor blue;
label(btex  II etex, ( -10,180)) withcolor red;
label(btex III etex, ( 115,180)) withcolor green;

pickup pencircle scaled 1pt;

drawarrow (-210,0)..(210,0);
drawarrow (0,-10)..(0,210);
label.rt(btex $V$ etex, (0,210));
label.top(btex $x$ etex, (210,0));

pickup pencircle scaled 1.5pt;

draw (-200,0)--(-30,0)--(-30,150)--(30,150)--(30,0)--(200,0);

label.top(btex $V_0$ etex, (15,150));

endfig;

end
