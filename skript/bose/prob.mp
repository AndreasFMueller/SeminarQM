%
% prob.mp -- Wahrscheinlichkeitsverteilung für BEC Paper
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
u = 45;

numeric q;
q = 18.9;

z0 = (   0,   0);
z1 = (-180,   0);
z2 = ( 180,   0);
z3 = (   0, 180);

def gauss(expr x, s) =
	if ((x/s) * (x/s) > 16):
		0
	else:
		(mexp(- 256 * (x / s) * (x / s) / 2) / s)
	fi
enddef;

def igauss(expr y, s, gmin) =
	if ((y * s) > 2):
		0
	else:
		if (y < gmin):
			4
		else:
			sqrt(-2 * (s / 16) * (s / 16) * mlog(y * s))
		fi
	fi
enddef;

def quanta =
	for i = -9 step 1 until 9:
		pickup pencircle scaled 4pt yscaled 0.1;
		draw (i * q, 0)--(i * q, 100) withcolor (0.7,0.7,0.7);
	endfor;
enddef;

def common =
	clip currentpicture to (z1 shifted (0,-10))--(z2 shifted (0,-10))--(z2 shifted (0,100))--(z1 shifted (0,100))--cycle;

	for i = -9 step 1 until 9:
		pickup pencircle scaled 4pt;
		draw (i * q, 0);
	endfor;

	pickup pencircle scaled 1pt;

	drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
	drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));

	label.top(btex $v$ etex, z2 shifted (10,0));
%	label.lft(btex $\frac{1}{\pi\sqrt{kT}}e^{-E(v)/kT}$ etex, z3 shifted (0,10));
label.lft(btex Wahrscheinlichkeitsdichte etex, z3 shifted (0,10));
enddef;

def drawgraph(expr s) =
	numeric gmin, xmin, xmax;
	gmin = gauss(-4, s);
	xmin = igauss(0.001, s, gmin);
	xmax = igauss(3, s, gmin);

	p := (-4 * u, gauss(-4, s) * u);
	for x = -4 + 0.02 step 0.02 until -xmax:
		p := p--(x * u, gauss(x, s) * u);
	endfor;
	for x = xmax step 0.02 until 4:
		p := p--(x * u, gauss(x, s) * u);
	endfor;

	path f;
	f := (z2 shifted (0,-10))--(z1 shifted (0,-10))--p--cycle;
	clip currentpicture to f;

	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

%
% 
%
beginfig(1)

z0 = (   0,   0);
z1 = (-180,   0);
z2 = ( 180,   0);
z3 = (   0, 100);

path r;
r = z1--z2--(z2 shifted (0,100))--(z1 shifted (0,100))--cycle;

fill r withcolor (0.95,0.95,0.95);

quanta;

% compute the path
numeric s;
s := 0.8;
s := 0.1;
s := 3;
path p;

drawgraph(s);

common;

endfig;

% 
%
beginfig(2)

z0 = (   0,   0);
z1 = (-180,   0);
z2 = ( 180,   0);
z3 = (   0, 100);

path r;
r = z1--z2--(z2 shifted (0,100))--(z1 shifted (0,100))--cycle;

fill r withcolor (0.95,0.95,0.95);

quanta;

% compute the path
numeric s;
s := 0.8;
s := 0.1;
path p;

drawgraph(s);

common;

endfig;

% 
%
%
beginfig(3)

z0 = (   0,   0);
z1 = (-180,   0);
z2 = ( 180,   0);
z3 = (   0, 100);

path r;
r = z1--z2--(z2 shifted (0,100))--(z1 shifted (0,100))--cycle;

fill r withcolor (0.95,0.95,0.95);

quanta;

% compute the path
numeric s;
s := 0.8;
path p;

drawgraph(s);

common;

endfig;

end
