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

%
% Darstellung der Potentialbarriere
%

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

label.bot(btex $-a\mathstrut$ etex, (-30,0));
label.bot(btex $a\mathstrut$ etex, ( 30,0));

pickup pencircle scaled 1pt;

drawarrow (-210,0)..(210,0);
drawarrow (0,-10)..(0,210);
label.rt(btex $V$ etex, (0,210));
label.top(btex $x$ etex, (210,0));

pickup pencircle scaled 1.5pt;

draw (-200,0)--(-30,0)--(-30,150)--(30,150)--(30,0)--(200,0);

label.top(btex $V_0$ etex, (15,150));

endfig;

%
% Funktionen für die Kennlinien
%
def tunneldiode(expr vunit, iunit) =
  (  0 * vunit, 0.00 * iunit)
--(  4 * vunit, 2.63 * iunit)
--( 10 * vunit, 6.93 * iunit)
--( 15 * vunit, 9.18 * iunit)
--( 21 * vunit,12.14 * iunit)
--( 26 * vunit,14.2  * iunit)
--( 31 * vunit,16.08 * iunit)
--( 37 * vunit,18.01 * iunit)
--( 42 * vunit,19.09 * iunit)
--( 48 * vunit,20.29 * iunit)
--( 55 * vunit,20.86 * iunit)
--( 61 * vunit,21.29 * iunit)
--( 74 * vunit,21.2  * iunit)
--(129 * vunit,16.09 * iunit)
--(140 * vunit,15.46 * iunit)
--(185 * vunit,13.56 * iunit)
--(208 * vunit,12.9  * iunit)
--(229 * vunit,12.31 * iunit)
--(252 * vunit,11.7  * iunit)
--(289 * vunit, 9.62 * iunit)
--(326 * vunit, 6.85 * iunit)
--(382 * vunit, 2.75 * iunit)
--(402 * vunit, 2.43 * iunit)
--(418 * vunit, 2.53 * iunit)
--(433 * vunit, 2.74 * iunit)
--(453 * vunit, 3.23 * iunit)
--(469 * vunit, 4.11 * iunit)
--(480 * vunit, 5.17 * iunit)
--(488 * vunit, 6.33 * iunit)
--(497 * vunit, 8.36 * iunit)
--(506 * vunit,10.93 * iunit)
--(514 * vunit,14.15 * iunit)
--(520 * vunit,17.6  * iunit)
--(525 * vunit,20.85 * iunit)
--(530 * vunit,25.84 * iunit)
enddef;

def germaniumdiodeAA(expr vunit, iunit) =
  ( 21 * vunit, 0.01 * iunit)
..( 60 * vunit, 0.02 * iunit)
..(104 * vunit, 0.03 * iunit)
..(121 * vunit, 0.04 * iunit)
..(130 * vunit, 0.05 * iunit)
..(139 * vunit, 0.06 * iunit)
..(151 * vunit, 0.09 * iunit)
..(164 * vunit, 0.12 * iunit)
..(172 * vunit, 0.14 * iunit)
..(181 * vunit, 0.18 * iunit)
..(189 * vunit, 0.22 * iunit)
..(200 * vunit, 0.28 * iunit)
..(213 * vunit, 0.38 * iunit)
..(222 * vunit, 0.47 * iunit)
..(235 * vunit, 0.62 * iunit)
..(249 * vunit, 0.82 * iunit)
..(263 * vunit, 1.08 * iunit)
..(275 * vunit, 1.37 * iunit)
..(288 * vunit, 1.72 * iunit)
..(310 * vunit, 2.5  * iunit)
..(324 * vunit, 3.14 * iunit)
..(339 * vunit, 3.92 * iunit)
..(356 * vunit, 5.02 * iunit)
..(368 * vunit, 5.87 * iunit)
..(385 * vunit, 7.32 * iunit)
..(399 * vunit, 8.71 * iunit)
..(414 * vunit,10.4  * iunit)
..(429 * vunit,12.33 * iunit)
..(445 * vunit,14.61 * iunit)
..(460 * vunit,17.28 * iunit)
..(472 * vunit,19.27 * iunit)
..(490 * vunit,22.95 * iunit)
..(505 * vunit,26.13 * iunit)
enddef;

def germaniumdiodeNT(expr vunit, iunit) =
  ( 21 * vunit,  0.01 * iunit)
..( 52 * vunit,  0.02 * iunit)
..( 77 * vunit,  0.01 * iunit)
..(105 * vunit,  0.01 * iunit)
..(128 * vunit,  0.01 * iunit)
..(156 * vunit,  0.02 * iunit)
..(201 * vunit,  0.02 * iunit)
..(227 * vunit,  0.03 * iunit)
..(252 * vunit,  0.06 * iunit)
..(278 * vunit,  0.11 * iunit)
..(301 * vunit,  0.2  * iunit)
..(352 * vunit,  0.49 * iunit)
..(400 * vunit,  0.88 * iunit)
..(451 * vunit,  1.33 * iunit)
..(499 * vunit,  1.81 * iunit)
..(548 * vunit,  2.32 * iunit)
..(600 * vunit,  2.91 * iunit)
..(647 * vunit,  3.69 * iunit)
..(696 * vunit,  5.36 * iunit)
..(721 * vunit,  6.94 * iunit)
..(737 * vunit,  8.34 * iunit)
..(751 * vunit,  9.97 * iunit)
..(774 * vunit, 14.28 * iunit)
..(785 * vunit, 16.82 * iunit)
..(795 * vunit, 19.52 * iunit)
..(830 * vunit, 34.64 * iunit)
enddef;

def germaniumdiodeSpitzen(expr vunit, iunit) =
  (  0 * vunit,0.00 * iunit)
..( 24 * vunit,0.02 * iunit)
..( 30 * vunit,0.02 * iunit)
..( 45 * vunit,0.02 * iunit)
..( 60 * vunit,0.02 * iunit)
..( 85 * vunit,0.02 * iunit)
..(100 * vunit,0.03 * iunit)
..(150 * vunit,0.06 * iunit)
..(175 * vunit,0.11 * iunit)
..(201 * vunit,0.18 * iunit)
..(220 * vunit,0.26 * iunit)
..(250 * vunit,0.43 * iunit)
..(275 * vunit,0.61 * iunit)
..(299 * vunit,0.83 * iunit)
..(350 * vunit,1.36 * iunit)
..(400 * vunit,2.01 * iunit)
..(453 * vunit,2.73 * iunit)
..(503 * vunit,3.51 * iunit)
..(552 * vunit,4.3  * iunit)
..(602 * vunit,5.19 * iunit)
..(650 * vunit,6.08 * iunit)
..(725 * vunit,7.5  * iunit)
..(814 * vunit,9.3  * iunit)
..(902 * vunit,11.2 * iunit)
enddef;

color gray;
gray = (0.8,0.8,0.8);

def grid(expr vunit, iunit) =
	pickup pencircle scaled 0.5pt;

	for vf = 100 step 100 until 900:
		draw (vf * vunit, 0)--(vf * vunit, 27 * iunit) withcolor gray;
	endfor;
	pickup pencircle scaled 0.2pt;
	for iforward = 1 step 1 until 26:
		draw (0, iforward * iunit)--(950 * vunit, iforward * iunit)
			withcolor gray;
	endfor;
	pickup pencircle scaled 0.5pt;
	for iforward = 5 step 5 until 25:
		draw (0, iforward * iunit)--(950 * vunit, iforward * iunit)
			withcolor gray;
	endfor;
enddef;

def koordinatensystem(expr vunit, iunit) =
	clip currentpicture to
		(0,0)--(915 * vunit, 0)--(915 * vunit, 26.5 * iunit)
			--(0, 26.5 * iunit)--cycle;

	pickup pencircle scaled 1pt;

	drawarrow (-5, 0)--(930 * vunit,  0 * iunit);
	drawarrow ( 0,-5)--(  0 * vunit, 27 * iunit);

	label.top(btex $V_F\text{\,[m\/V]}$ etex, (930 * vunit, 3));
	label.lft(btex $I_F\text{\,[mA]}$ etex, (-3, 27 * iunit));

	draw (200 * vunit, -2)--(200 * vunit, 2);
	draw (400 * vunit, -2)--(400 * vunit, 2);
	draw (600 * vunit, -2)--(600 * vunit, 2);
	draw (800 * vunit, -2)--(800 * vunit, 2);

	label.bot(btex 200 etex, (200 * vunit, -2));
	label.bot(btex 400 etex, (400 * vunit, -2));
	label.bot(btex 600 etex, (600 * vunit, -2));
	label.bot(btex 800 etex, (800 * vunit, -2));

	draw (-2,  5 * iunit)--(2,  5 * iunit);
	draw (-2, 10 * iunit)--(2, 10 * iunit);
	draw (-2, 15 * iunit)--(2, 15 * iunit);
	draw (-2, 20 * iunit)--(2, 20 * iunit);
	draw (-2, 25 * iunit)--(2, 25 * iunit);

	label.lft(btex  5 etex, (-2,  5 * iunit));
	label.lft(btex 10 etex, (-2, 10 * iunit));
	label.lft(btex 15 etex, (-2, 15 * iunit));
	label.lft(btex 20 etex, (-2, 20 * iunit));
	label.lft(btex 25 etex, (-2, 25 * iunit));
enddef;

numeric iunit, vunit;
vunit := 0.4;
iunit := 10;

beginfig(5)

fill germaniumdiodeNT(vunit,  1 * iunit)
	-- (reverse (germaniumdiodeAA(vunit,  1 * iunit)))
	--cycle withcolor (1,0.98,0.98);
clip currentpicture to
	(0,0)--(915 * vunit, 0)--(915 * vunit, 26 * iunit)--(0, 26 * iunit)
		--cycle;

grid(vunit, iunit);

pickup pencircle scaled 1.5pt;

draw germaniumdiodeAA(vunit,  1 * iunit) withcolor red;
label(btex AA143 etex, (0,0)) rotated 80
	shifted (455 * vunit, 20 * iunit) withcolor red;
draw germaniumdiodeNT(vunit,  1 * iunit) withcolor red;
label(btex NTE109 etex, (0,0)) rotated 84
	shifted (820 * vunit, 20 * iunit) withcolor red;
%draw germaniumdiodeSpitzen(vunit,  1 * iunit) withcolor red;
draw tunneldiode(vunit, iunit) withcolor blue;
label.top(btex 1N3721 etex, (80 * vunit, 21.3 * iunit)) withcolor blue;

koordinatensystem(vunit, iunit);


endfig;

beginfig(6)

fill germaniumdiodeNT(vunit,  1 * iunit)
	-- (reverse (germaniumdiodeAA(vunit,  1 * iunit)))
	--cycle withcolor (1,0.98,0.98);
clip currentpicture to
	(0,0)--(915 * vunit, 0)--(915 * vunit, 26 * iunit)--(0, 26 * iunit)
		--cycle;

grid(vunit, iunit);

pickup pencircle scaled 1.5pt;

draw germaniumdiodeAA(vunit,  1 * iunit) withcolor red;
label(btex AA143 etex, (0,0)) rotated 80
	shifted (455 * vunit, 20 * iunit) withcolor red;
draw germaniumdiodeNT(vunit,  1 * iunit) withcolor red;
label(btex NTE109 etex, (0,0)) rotated 84
	shifted (820 * vunit, 20 * iunit) withcolor red;

koordinatensystem(vunit, iunit);

endfig;

beginfig(7)

grid(vunit, iunit);

pickup pencircle scaled 1.5pt;

draw tunneldiode(vunit, iunit) withcolor blue;
label.top(btex 1N3721 etex, (80 * vunit, 21.3 * iunit)) withcolor blue;

koordinatensystem(vunit, iunit);

endfig;


def omega(expr Omega) =
	sqrt(2 * Omega)
enddef;

def hyp(expr x, Omega) =
	Omega / x
enddef;

def hyperbola(expr Omega, c, m) =
	numeric x;
	x := 3;
	path p;
	p := (x, hyp(x,Omega));
	for x = 4 step 1 until m:
		p := p..(x, hyp(x,Omega));
	endfor;
	draw p withcolor c;
enddef;


beginfig(8)

numeric width;
numeric height;
width := 200;
height := 140;

numeric A;
A := 0.25;
numeric a;
a := 2 * sqrt(A);

pickup pencircle scaled 1.5pt;

fill (0.6 * width,0)--(width,0)--(width,height)--(0.6*width,height)--cycle
	withcolor (0.7,0.7,0.7);

z2 = (0.8 * width, 0.67 * height);
fill ((z2 shifted(-20,-13))--(z2 shifted(20,-13))--(z2 shifted(20,13))
	--(z2 shifted(-20,13))--cycle) withcolor white;
label(btex $\displaystyle L \ge \frac1{a\omega}$ etex, z2);

hyperbola(500 *  1, black, width);
hyperbola(500 *  4, black, width);
hyperbola(500 *  9, black, width);
hyperbola(500 * 16, black, width);
hyperbola(500 * 25, black, width);
hyperbola(500 * 36, black, width);
hyperbola(500 * 49, black, width);

pickup pencircle scaled 1pt;

fill (0,0)--(width + 5,0)--(width + 5,0.25 * (width + 5))--cycle
	withcolor (0.9,0.9,0.9);

clip currentpicture to (0,0)--(width,0)--(width,height)--(0,height)--cycle;

drawarrow (-5, 0)--(width + 5,         0);
drawarrow ( 0,-5)--(        0,height + 5);

label.top(btex $L$ etex, (width + 5,         0));
label.lft(btex $C$ etex, (        0,height + 5));

label(btex $\displaystyle \frac{C}{L}\le \frac{a^2}4$ etex, (0.8 * width, 0.1 * width));

z0 = (0.5 * width, hyp(0.5 * width, 9 * 500));
z1 = z0 shifted (10,0);

endfig;

%
% Baendermodell-Bilder für Erklaerung der Charakteristik
%
path p;
path q;
def band(expr Eup, Edown, w, l) =
	p := (-l, Eup)--(-w, Eup);
	numeric delta;
	delta := 2 * w / 40;
	for x = -w + delta step delta until w:
		p := p--(x, (Eup + Edown) / 2
			+ sind(90 * x / w) * (Edown - Eup) / 2);
	endfor;
	p := p--(l,Edown);
enddef;

def bands(expr Eup, Edown, w, l) =
	pickup pencircle scaled 1pt;
	band(Eup,Edown,w,l); draw p;
	q := p;
	band(-Edown,-Eup,w,l); draw p;
	fill p..reverse q..cycle withcolor (1,1,1);
	label.rt(btex $E_c$ etex, (80,Edown));
	label.rt(btex $E_v$ etex, (80,-Eup));
enddef;

def fermi(expr Eup, Edown, w, l) =
	path p;
	p := (-l, Eup)--(-w, Eup);
	numeric delta;
	delta := 2 * w / 40;
	for x = -w + delta step delta until w:
		p := p--(x, (Eup + Edown) / 2
			+ sind(90 * x / w) * (Edown - Eup) / 2);
	endfor;
	p := p--(l,Edown);
	pickup pencircle scaled 0.3pt;
	draw p dashed evenly;
enddef;

def backgrounds(expr l, h, w) =
	fill (-l,-h)--(-w,-h)--(-w,h)--(-l,h)--cycle withcolor (1,0.9,0.9);
	fill ( w,-h)--( l,-h)--( l,h)--( w,h)--cycle withcolor (0.9,0.9,1);
	numeric delta;
	delta := 2 * w / 10;
	for i = 0 step 1 until 9:
		fill (-w + i * delta, -h)
			--(-w + i * delta + delta, -h)
			--(-w + i * delta + delta,  h)
			--(-w + i * delta, h)--cycle
			withcolor (0.995 - i * 0.01,0.9,0.905 + i * 0.01);
	endfor;
	label.top(btex $p\mathstrut$ etex, (-l/2, h)) withcolor red;
	label.top(btex $n\mathstrut$ etex, ( l/2, h)) withcolor blue;
enddef;

numeric diodewidth, tunnelwidth;
diodewidth = 20;
tunnelwidth = 5;

%
% Keine Spannung, normale Diode
%
beginfig(9)

backgrounds(80,45, diodewidth);

bands(40, 5, diodewidth, 80);

fermi(0, 0, diodewidth, 80);
label.ulft(btex $E_F$ etex, (-80,0));

endfig;

%
% Keine Spannung, Tunneldiode (w klein)
%
beginfig(10)

backgrounds(80,45, tunnelwidth);

bands(40, -20, tunnelwidth, 80);

fermi(0, 0, tunnelwidth, 80);
label.llft(btex $E_F$ etex, (-80,0));

endfig;

%
% Diodenleitung, normale Diode
%
beginfig(11)

backgrounds(80,45,diodewidth);

bands(40,20,diodewidth,80);

fermi(-10,10, diodewidth, 80);
label.ulft(btex $E_F$ etex, (-80,-10));

label(btex $\ominus$ etex, ( 74, 37)) withcolor blue;
label(btex $\ominus$ etex, ( 69, 29)) withcolor blue;
label(btex $\ominus$ etex, ( 64, 37)) withcolor blue;
label(btex $\ominus$ etex, ( 59, 29)) withcolor blue;
label(btex $\ominus$ etex, ( 54, 37)) withcolor blue;
label(btex $\ominus$ etex, ( 49, 29)) withcolor blue;
label(btex $\ominus$ etex, ( 44, 37)) withcolor blue;
label(btex $\ominus$ etex, ( 39, 29)) withcolor blue;
label(btex $\ominus$ etex, ( 34, 37)) withcolor blue;
label(btex $\ominus$ etex, ( 29, 29)) withcolor blue;
label(btex $\ominus$ etex, ( 24, 37)) withcolor blue;
label(btex $\ominus$ etex, ( 19, 29)) withcolor blue;
label(btex $\ominus$ etex, ( 14, 37)) withcolor blue;
label(btex $\ominus$ etex, (  9, 29)) withcolor blue;
label(btex $\ominus$ etex, (  4, 37)) withcolor blue;
%label(btex $\ominus$ etex, (  0, 28)) withcolor blue;
label(btex $\oplus$ etex, (-74,-37)) withcolor red;
label(btex $\oplus$ etex, (-69,-29)) withcolor red;
label(btex $\oplus$ etex, (-64,-37)) withcolor red;
label(btex $\oplus$ etex, (-59,-29)) withcolor red;
label(btex $\oplus$ etex, (-54,-37)) withcolor red;
label(btex $\oplus$ etex, (-49,-29)) withcolor red;
label(btex $\oplus$ etex, (-44,-37)) withcolor red;
label(btex $\oplus$ etex, (-39,-29)) withcolor red;
label(btex $\oplus$ etex, (-34,-37)) withcolor red;
label(btex $\oplus$ etex, (-29,-29)) withcolor red;
label(btex $\oplus$ etex, (-24,-37)) withcolor red;
label(btex $\oplus$ etex, (-19,-29)) withcolor red;
label(btex $\oplus$ etex, (-14,-37)) withcolor red;
label(btex $\oplus$ etex, (- 9,-29)) withcolor red;
label(btex $\oplus$ etex, (- 4,-37)) withcolor red;

endfig;

%
% Tunneldiode, maximaler Tunnelstrom
%
beginfig(12)

backgrounds(80,45,tunnelwidth);

bands(40,-10,tunnelwidth,80);

fermi(-10,10,  tunnelwidth, 80);
label.llft(btex $E_F$ etex, (-80,-10));

label(btex $\ominus$ etex, ( 10, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 15,-4)) withcolor blue;
label(btex $\ominus$ etex, ( 20, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 25,-4)) withcolor blue;
label(btex $\ominus$ etex, ( 30, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 35,-4)) withcolor blue;
label(btex $\ominus$ etex, ( 40, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 45,-4)) withcolor blue;
label(btex $\ominus$ etex, ( 50, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 55,-4)) withcolor blue;
label(btex $\ominus$ etex, ( 60, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 65,-4)) withcolor blue;
label(btex $\ominus$ etex, ( 70, 4)) withcolor blue;
label(btex $\ominus$ etex, ( 75,-4)) withcolor blue;
label(btex $\oplus$ etex, (-10, 4)) withcolor red;
label(btex $\oplus$ etex, (-15,-4)) withcolor red;
label(btex $\oplus$ etex, (-20, 4)) withcolor red;
label(btex $\oplus$ etex, (-25,-4)) withcolor red;
label(btex $\oplus$ etex, (-30, 4)) withcolor red;
label(btex $\oplus$ etex, (-35,-4)) withcolor red;
label(btex $\oplus$ etex, (-40, 4)) withcolor red;
label(btex $\oplus$ etex, (-45,-4)) withcolor red;
label(btex $\oplus$ etex, (-50, 4)) withcolor red;
label(btex $\oplus$ etex, (-55,-4)) withcolor red;
label(btex $\oplus$ etex, (-60, 4)) withcolor red;
label(btex $\oplus$ etex, (-65,-4)) withcolor red;
label(btex $\oplus$ etex, (-70, 4)) withcolor red;
label(btex $\oplus$ etex, (-75,-4)) withcolor red;
pickup pencircle scaled 2pt;
drawarrow (-10,-5)--( 10,-5);
pickup pencircle scaled 0.5pt;
draw (0,-5)--(5,-15);
label.rt(btex $I_{\text{Tunnel}}$ etex, (5,-15));

endfig;

%
% Tunnel-Strom bricht zusammen
%
beginfig(13)

backgrounds(80,45,tunnelwidth);

bands(40,0,tunnelwidth,80);

fermi(-20,20,  tunnelwidth, 80);
label.llft(btex $E_F$ etex, (-80,-20));

endfig;

%
% Tunnel-Strom bricht zusammen
%
beginfig(14)

backgrounds(80,45,tunnelwidth);

bands(40,20,tunnelwidth,80);

fermi(-40,40,  tunnelwidth, 80);
label.lft(btex $E_F$ etex, (-80,-40));

label(btex $\ominus$ etex, ( 74, 35)) withcolor blue;
label(btex $\ominus$ etex, ( 69, 27)) withcolor blue;
label(btex $\ominus$ etex, ( 64, 35)) withcolor blue;
label(btex $\ominus$ etex, ( 59, 27)) withcolor blue;
label(btex $\ominus$ etex, ( 54, 35)) withcolor blue;
label(btex $\ominus$ etex, ( 49, 27)) withcolor blue;
label(btex $\ominus$ etex, ( 44, 35)) withcolor blue;
label(btex $\ominus$ etex, ( 39, 27)) withcolor blue;
label(btex $\ominus$ etex, ( 34, 35)) withcolor blue;
label(btex $\ominus$ etex, ( 29, 27)) withcolor blue;
label(btex $\ominus$ etex, ( 24, 35)) withcolor blue;
label(btex $\ominus$ etex, ( 19, 27)) withcolor blue;
label(btex $\ominus$ etex, ( 14, 35)) withcolor blue;
label(btex $\ominus$ etex, (  9, 27)) withcolor blue;
label(btex $\ominus$ etex, (  4, 35)) withcolor blue;
%label(btex $\ominus$ etex, (  0, 28)) withcolor blue;
label(btex $\oplus$ etex, (-74,-35)) withcolor red;
label(btex $\oplus$ etex, (-69,-27)) withcolor red;
label(btex $\oplus$ etex, (-64,-35)) withcolor red;
label(btex $\oplus$ etex, (-59,-27)) withcolor red;
label(btex $\oplus$ etex, (-54,-35)) withcolor red;
label(btex $\oplus$ etex, (-49,-27)) withcolor red;
label(btex $\oplus$ etex, (-44,-35)) withcolor red;
label(btex $\oplus$ etex, (-39,-27)) withcolor red;
label(btex $\oplus$ etex, (-34,-35)) withcolor red;
label(btex $\oplus$ etex, (-29,-27)) withcolor red;
label(btex $\oplus$ etex, (-24,-35)) withcolor red;
label(btex $\oplus$ etex, (-19,-27)) withcolor red;
label(btex $\oplus$ etex, (-14,-35)) withcolor red;
label(btex $\oplus$ etex, (- 9,-27)) withcolor red;
label(btex $\oplus$ etex, (- 4,-35)) withcolor red;

endfig;

%
% L in Abhaengigkeit von C
%
beginfig(15)

numeric width;
numeric height;
width := 200;
height := 140;

numeric A;
A := 0.25; % A = a^2/4
numeric a;
a := 2 * sqrt(A);

def omegapoint(expr omega) =
	(1 / (omega * a), a / (2 * omega))
enddef;

pickup pencircle scaled 0.5pt;

draw omegapoint(1. / 20)--( 20, 2 * 225 *  1 / 20) withcolor (0.8,0.8,0.8);
draw omegapoint(1. / 40)--( 40, 2 * 225 *  4 / 40) withcolor (0.8,0.8,0.8);
draw omegapoint(1. / 60)--( 60, 2 * 225 *  9 / 60) withcolor (0.8,0.8,0.8);
draw omegapoint(1. / 80)--( 80, 2 * 225 * 16 / 80) withcolor (0.8,0.8,0.8);
draw omegapoint(1. /100)--(100, 2 * 225 * 25 /100) withcolor (0.8,0.8,0.8);

pickup pencircle scaled 1pt;

hyperbola(2 * 225 *  1, (0.7,0.7,0.7),  20);
hyperbola(2 * 225 *  4, (0.7,0.7,0.7),  40);
hyperbola(2 * 225 *  9, (0.7,0.7,0.7),  60);
hyperbola(2 * 225 * 16, (0.7,0.7,0.7),  80);
hyperbola(2 * 225 * 25, (0.7,0.7,0.7), 100);

z2 = (0.8 * width, 0.67 * height);

pickup pencircle scaled 1pt;

fill (0.6 * width,0)--(width + 2,0)--(width + 2,height)--(0.6*width,height)--cycle
	withcolor (0.7,0.7,0.7);

z2 = (0.8 * width, 0.67 * height);
%fill ((z2 shifted(-20,-13))--(z2 shifted(20,-13))--(z2 shifted(20,13))
%	--(z2 shifted(-20,13))--cycle) withcolor white;
%label(btex $\displaystyle L \ge \frac1{a\omega}$ etex, z2);

fill (0,0)--(width + 5,0)--(width + 5,0.25 * (width + 5))--cycle
	withcolor (0.9,0.9,0.9);

draw (0,0)--(omegapoint(1. / 210)) withcolor (0.8,0.8,0.8);

def ckurvepunkt(expr omega, C) =
	(C / (C * omega * C * omega + A), C)
enddef;

def ckurve(expr omega) =
	path	p;
	p := (0,0);
	for C = 1 step 1 until height:
		p := p..(ckurvepunkt(omega, C));
	endfor;
	if omega = (1 / 160):
		pickup pencircle scaled 1.5pt;
	else:
		pickup pencircle scaled 1pt;
	fi;
	draw p;
	pickup pencircle scaled 3pt;
	draw omegapoint(omega);
enddef;

for iomega = 20 step 20 until 200:
	ckurve(1. / iomega);
endfor;

pickup pencircle scaled 4pt;
draw omegapoint(1 / 160);

pickup pencircle scaled 1pt;

clip currentpicture to (0,0)--(width + 2,0)--(width + 2,height)--(0,height)--cycle;

drawarrow (-5, 0)--(width + 7,         0);
drawarrow ( 0,-5)--(        0,height + 5);

label.top(btex $L$ etex, (width + 7,         0));
label.lft(btex $C$ etex, (        0,height + 5));

z0 = (0.5 * width, hyp(0.5 * width, 9 * 500));
z1 = z0 shifted (10,0);

fill ((3,-6)--(37,-6)--(37,6)--(3,6)--cycle) shifted omegapoint(1./160) withcolor white;
label.rt(btex $(L_\omega,C_\omega)$ etex, omegapoint(1./160));
label.top(btex $\omega$ etex, ckurvepunkt(1./160, height));

endfig;

end
