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

end
