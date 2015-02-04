%
% gatter.mp -- darstellung verschiedener logischer Gatter, klassisch und
%              quanten-
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

numeric unit;
unit := 10;
numeric linewidth;
linewidth := 0.7pt;

def negation(expr position) =
	pickup pencircle scaled linewidth;
	path p;
	p := ((0,0)..(unit/4,-unit/4)..(unit/2,0)..(unit/4,unit/4)
		..cycle) shifted position;
	fill p withcolor (1,1,1);
	draw p;
enddef;

def xorline(expr position) =
	path p;
	p = (((0,1.5 * unit){dir 0}..(0.9 * unit,0)..{dir 180}(0,-1.5 * unit))
		shifted (-unit/2,0)) shifted position;
	draw p;
enddef;

def orgate(expr position) =
	pickup pencircle scaled linewidth;
	draw ((-unit,unit)--(unit,unit)) shifted position;
	draw ((-unit,-unit)--(unit,-unit)) shifted position;
	path p;
	p = ((0,-1.5 * unit){dir 0}..{dir 60}(3.25 * unit,0){dir 120}
		..{dir 180}(0,1.5 * unit){dir 0}..(0.9 * unit,0)
		..{dir 180}(0,-1.5 * unit)..cycle) shifted position;
	fill p withcolor(1,1,1);
	draw ((3.25 * unit,0)--(4.25 * unit,0)) shifted position;
	draw p;
enddef;

def xorgate(expr position) =
	orgate(position);
	xorline(position);
enddef;

def norgate(expr position) =
	orgate(position);
	negation((3.25 * unit,0) shifted position);
enddef;

def xnorgate(expr position) =
	xorgate(position);
	negation((3.25 * unit,0) shifted position);
enddef;

def andgate(expr position) =
	pickup pencircle scaled linewidth;
	draw ((0,unit)--(unit,unit)) shifted position;
	draw ((0,-unit)--(unit,-unit)) shifted position;
	path p;
	p = ((unit,-1.5 * unit)
		--(1.75 * unit,-1.5 * unit){dir 0}
		..{dir 90}(3.25 * unit,0){dir 90}
		..{dir 180}(1.75 * unit, 1.5*unit)
		--(unit,1.5 * unit)--cycle) shifted position;
	draw ((3.25 * unit,0)--(4.25 * unit,0)) shifted position;
	draw p;
enddef;

def nandgate(expr position) =
	andgate(position);
	negation((3.25 * unit,0) shifted position);
enddef;

beginfig(1)
andgate((0,0));
endfig;

beginfig(2)
orgate((0,0));
endfig;

beginfig(3)
nandgate((0,0));
endfig;

beginfig(4)
norgate((0,0));
endfig;

beginfig(5)
xorgate((0,0));
endfig;

beginfig(6)
xnorgate((0,0));
endfig;

beginfig(7)
xorgate((0,unit));
xorgate((10.5 * unit,0));
draw (4.25 * unit,unit)--(9.5 * unit,unit);
andgate((0, -4 * unit));
draw (4.25 * unit,-4 * unit)--(7 * unit,-4 * unit);
draw (9.5 * unit,-1 * unit)--(7 * unit,-1 * unit)--(7 * unit,-7 * unit)
	--(9.5 * unit,-7 * unit);
andgate((0,-8 * unit));
andgate((0,-12 * unit));
orgate((5.25 * unit,-9 * unit));
orgate((10.5 * unit,-8 * unit));
draw (4.25 * unit,-12 * unit)--(4.25 * unit,-10 * unit);
label.rt(btex $\Sigma$ etex, (14.75 * unit,0));
label.rt(btex $C_{\text{out}}$ etex, (14.75 * unit,-8 * unit));
draw (-7 * unit,2 * unit)--(-unit,2 * unit);
draw (-7 * unit,0)--(-unit,0);
draw (-7 * unit,-2 * unit)--(-5 * unit, -2 * unit)--(-5 * unit, -1 * unit)
	--(7 * unit, -1 * unit);
draw (-5 * unit, -2 * unit)--(-5 * unit, -13 * unit)
	--(0 * unit, -13 * unit);
draw (-5 * unit, -9 * unit)--(0, -9 * unit);
draw (-3.5 * unit, 0)--(-3.5 * unit, -11 * unit)--(0, -11 * unit);
draw (-2 * unit, 2 * unit)--(-2 * unit, -3 * unit)--(0, -3 * unit);
draw (-2 * unit, -3 * unit)--(-2 * unit, -7 * unit)--(0, -7 * unit);
draw (-3.5 * unit, -5 * unit)--(0, -5 * unit);
pickup pencircle scaled 3pt;
draw (7 * unit, -1 * unit);
draw (7 * unit, -4 * unit);
draw (-5 * unit, -2 * unit);
draw (-5 * unit, -9 * unit);
draw (-3.5 * unit, 0);
draw (-3.5 * unit, -5 * unit);
draw (-2 * unit, 2 * unit);
draw (-2 * unit, -3 * unit);
label.lft(btex $A$ etex, (-7 * unit, 2 * unit));
label.lft(btex $B$ etex, (-7 * unit, 0 * unit));
label.lft(btex $C_\text{in}$ etex, (-7 * unit, -2 * unit));
endfig;

beginfig(8)
xorgate((0,0));
andgate((0,-4 * unit));
label.rt(btex $\Sigma$ etex, (4.25 * unit,0));
label.rt(btex $C_{\text{out}}$ etex, (4.25 * unit,-4 * unit));
draw (-4 * unit, unit)--(-1 * unit, unit);
draw (-4 * unit, -5 * unit)--(0, -5 * unit);
draw (-3 * unit, unit)--(-3 * unit, -3 * unit)--(0, -3 * unit);
draw (-1.5 * unit, -5 * unit)--(-1.5 * unit, -1 * unit)--(-1 * unit, -1 * unit);
pickup pencircle scaled 3pt;
draw (-3 * unit, unit);
draw (-1.5 * unit, -5 * unit);
label.lft(btex $A$ etex, (-4 * unit, unit));
label.lft(btex $B$ etex, (-4 * unit, -5 * unit));
endfig;

beginfig(9)
pickup pencircle scaled linewidth;
draw (-20,-15)--(20,-15)--(20,15)--(-20,15)--cycle;
draw (60,0)--(20,0);
label.rt(btex $|\psi\rangle$ etex, (60,0));
draw (-20,0)--(-40,0){dir 180}..{dir 180}(-60,10)--(-80,10);
draw (-20,0)--(-40,0){dir 180}..{dir 180}(-60,-10)--(-80,-10);
label.lft(btex $Y$ etex, (-80,10));
label.lft(btex $N$ etex, (-80,-10));
label(btex $Q$ etex, (0,0));
endfig;

%
% CNOT gate
%
beginfig(10)
pickup pencircle scaled linewidth;

draw (-50,40)--(50, 40);
draw (-50, 0)--(50,  0);

draw (4,0)..(0,4)..(-4,0)..(0,-4)..cycle;
draw (0,-4)--(0,40);

pickup pencircle scaled 4pt;
draw (0,40);

label.lft(btex $c$ etex, (-50,40));
label.lft(btex $t$ etex, (-50, 0));

label.rt(btex $c$ etex, (50,40));
label.rt(btex $c\oplus t$ etex, (50,0));

endfig;

% Tofoli
beginfig(11)

pickup pencircle scaled linewidth;

draw (-50, 20)--(-20, 20); draw (20, 20)--(50, 20);
draw (-50,  0)--(-20,  0); draw (20,  0)--(50,  0);
draw (-50,-20)--(-20,-20); draw (20,-20)--(50,-20);

label.lft(btex $a$ etex, (-50, 20));
label.lft(btex $b$ etex, (-50,  0));
label.lft(btex $c$ etex, (-50,-20));

label.rt(btex $a$ etex, (50, 20));
label.rt(btex $b$ etex, (50,  0));
label.rt(btex $(a\wedge b)\oplus c$ etex, (50,-20));

draw (-20,-25)--(20,-25)--(20,25)--(-20,25)--cycle;

label(btex AND etex, (0,0));

endfig;

%
% CNOT and Tofoli
%
beginfig(12)

pickup pencircle scaled linewidth;

% Tofoli part
draw (-150, 20)--(-120, 20); draw (-80, 20)--(-50, 20);
draw (-150,  0)--(-120,  0); draw (-80,  0)--(-50,  0);
draw (-150,-20)--(-120,-20); draw (-80,-20)--(-50,-20);

label.lft(btex $|0\rangle$ etex, (-150, 20));
label.lft(btex $b$ etex, (-150,  0));
label.lft(btex $c$ etex, (-150,-20));

label.rt(btex $|0\rangle$ etex, (-50, 20));
label.rt(btex $b$ etex, (-50,  0));
label.rt(btex $b\oplus c$ etex, (-50,-20));

draw (-120,-25)--(-80,-25)--(-80,25)--(-120,25)--cycle;

label(btex AND etex, (-100,0));

label(btex $=$ etex, (0,0));

% CNOT part
draw ( 50, 20)--(150, 20);
draw ( 50,  0)--(150,  0);
draw ( 50,-20)--(150,-20);

draw ((4,0)..(0,4)..(-4,0)..(0,-4)..cycle) shifted (100,-20);
draw (100,-24)--(100,0);

pickup pencircle scaled 4pt;
draw (100,0);

label.lft(btex $|0\rangle$ etex, (50,20));
label.lft(btex $b$ etex, ( 50,  0));
label.lft(btex $c$ etex, ( 50,-20));

label.rt(btex $|0\rangle$ etex, (150,20));
label.rt(btex $b$ etex, (150,0));
label.rt(btex $c\oplus b$ etex, (150,-20));

endfig;

%
% Drehung als Zusammensetzung von Achsenspiegelungen
%
beginfig(13)

pickup pencircle scaled 1pt;

numeric r;
r := 100;

numeric theta;
theta = 8;
numeric phi;
phi = 32;

z0 = (0,0);

z1 = r * (1,0);
z2 = r * (cosd(theta), sind(theta));

z3 = r * (cosd(phi), sind(phi));
z4 = r * (cosd(-phi), sind(-phi));
z5 = r * (cosd(phi + 2 * theta), sind(phi + 2 * theta));

z6 = r * (cosd(phi/2), sind(phi/2));
z7 = r * (cosd(-phi/2), sind(-phi/2));

z8 = r * (cosd(phi/2 + theta/2), sind(phi/2 + theta/2));
z9 = r * (cosd(-phi/2 + theta/2), sind(-phi/2 + theta/2));

label.rt(btex $\vec w$ etex, 1.5 * z3);
label.rt(btex $\vec w'$ etex, 1.5 * z4);
%label.rt(btex $\vec w''$ etex, 1.5 * z5);

fill z0--(0.7 * z1)..(0.7 * r * (cosd(theta/2), sind(theta/2)))..(0.7 * z2)
	--cycle withcolor (0.9,0.9,0.9);
%fill z0--(0.7 * z3)..(0.7 * r * (cosd(phi + theta), sind(phi + theta)))
%	..(0.7 * z5)--cycle withcolor (0.9,0.9,0.9);

drawarrow z0--z2 withcolor(0.9,0.9,0.9);
label.rt(btex $\vec v_2$ etex, z2) withcolor (0.9,0.9,0.9);

drawarrow z0--z1 withcolor(1,0,0);
label.rt(btex $\vec v_1$ etex, z1) withcolor(1,0,0);

label.rt(btex $\alpha$ etex, 0.7 * r * (cosd(theta/2), sind(theta/2)));
%label.urt(btex $2\vartheta$ etex,
%	0.7 * r * (cosd(phi + theta), sind(phi + theta)));

drawarrow (0.85 * z1)..(0.85 * z6)..(0.85 * z3) withcolor (1,0,0);
drawarrow (0.85 * z1)..(0.85 * z7)..(0.85 * z4) withcolor (1,0,0);
pickup pencircle scaled 3pt; draw 0.85 * z1 withcolor(1,0,0);

pickup pencircle scaled 1pt;
drawarrow z0--(1.5 * z3);
drawarrow z0--(1.5 * z4);
%drawarrow z0--(1.5 * z5);

%pickup pencircle scaled 1pt;
%drawarrow (0.9 * z2)..(0.9 * z8)..(0.9 * z5) withcolor (0,0,1);
%drawarrow (0.9 * z2)..(0.9 * z9)..(0.9 * z4) withcolor (0,0,1);
%pickup pencircle scaled 3pt; draw 0.9 * z2 withcolor(0,0,1);

pickup pencircle scaled 3pt;
draw z0

endfig;
%
% Drehung als Zusammensetzung von Achsenspiegelungen
%
beginfig(14)

pickup pencircle scaled 1pt;

numeric r;
r := 100;

numeric theta;
theta = 8;
numeric phi;
phi = 32;

z0 = (0,0);

z1 = r * (1,0);
z2 = r * (cosd(theta), sind(theta));

z3 = r * (cosd(phi), sind(phi));
z4 = r * (cosd(-phi), sind(-phi));
z5 = r * (cosd(phi + 2 * theta), sind(phi + 2 * theta));

z6 = r * (cosd(phi/2), sind(phi/2));
z7 = r * (cosd(-phi/2), sind(-phi/2));

z8 = r * (cosd(phi/2 + theta/2), sind(phi/2 + theta/2));
z9 = r * (cosd(-phi/2 + theta/2), sind(-phi/2 + theta/2));

label.rt(btex $\vec w$ etex, 1.5 * z3) withcolor(0.9,0.9,0.9);
label.rt(btex $\vec w'$ etex, 1.5 * z4);
label.rt(btex $\vec w''$ etex, 1.5 * z5);

fill z0--(0.7 * z1)..(0.7 * r * (cosd(theta/2), sind(theta/2)))..(0.7 * z2)
	--cycle withcolor (0.9,0.9,0.9);
fill z0--(0.7 * z3)..(0.7 * r * (cosd(phi + theta), sind(phi + theta)))
	..(0.7 * z5)--cycle withcolor (0.9,0.9,0.9);

drawarrow z0--z1 withcolor(0.9,0.9,0.9);
label.rt(btex $\vec v_1$ etex, z1) withcolor(0.9,0.9,0.9);

label.rt(btex $\alpha$ etex, 0.7 * r * (cosd(theta/2), sind(theta/2)));
label.urt(btex $2\alpha$ etex,
	0.7 * r * (cosd(phi + theta), sind(phi + theta)));

drawarrow z0--(1.5 * z3) withcolor(0.9,0.9,0.9);

drawarrow z0--z2 withcolor (0,0,1);
label.rt(btex $\vec v_2$ etex, z2) withcolor(0,0,1);

drawarrow z0--(1.5 * z4);
drawarrow z0--(1.5 * z5);

%drawarrow (0.85 * z1)..(0.85 * z6)..(0.85 * z3) withcolor (1,0,0);
%drawarrow (0.85 * z1)..(0.85 * z7)..(0.85 * z4) withcolor (1,0,0);
%pickup pencircle scaled 3pt; draw 0.85 * z1 withcolor(1,0,0);

pickup pencircle scaled 1pt;
drawarrow (0.9 * z2)..(0.9 * z8)..(0.9 * z5) withcolor (0,0,1);
drawarrow (0.9 * z2)..(0.9 * z9)..(0.9 * z4) withcolor (0,0,1);
pickup pencircle scaled 3pt; draw 0.9 * z2 withcolor(0,0,1);

pickup pencircle scaled 3pt;
draw z0

endfig;

end
