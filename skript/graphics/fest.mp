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

for x = (-10.5 * u) step u until (10.5 * u):
	for y = (-10.5 * u) step u until (10.5 * u):
		if EF > r(x, y):
			fill (x-0.5*u, y-0.5*u)--(x+0.5*u, y-0.5*u)
				--(x+0.5*u, y+0.5*u)--(x-0.5*u, y+0.5*u)--cycle
			withcolor (0.9,0.9,0.9);
			label(btex $\downarrow\uparrow$ etex, (x,y));
		fi;
	endfor;
endfor;

for x = -10 * u step u until 10 * u:
	draw (x,-10 * u - 5)--(x,10 * u + 5);
endfor;

for y = -10 * u step u until 10 * u:
	draw (-10 * u - 5,y)--(10 * u + 5,y);
endfor;

pickup pencircle scaled 1pt;

draw (EF, 0)..(0,EF)..(-EF,0)..(0,-EF)..cycle withcolor (1,0,0);

label.urt(btex $E_F$ etex, (6 * u, 6 * u)) withcolor (1,0,0);

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

end
