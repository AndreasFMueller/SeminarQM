%
% exercise.mp -- Bilder zu Uebungsaufgaben
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
% Fuenfeck
%
beginfig(1)

numeric r;
r := 100;

z0 = (0,0);
z1 = r*((1+sqrt(5))/4, sqrt(10-2*sqrt(5))/4);
z2 = r*((1-sqrt(5))/4, sqrt(10+2*sqrt(5))/4);
z3 = r*(-1,0);
z4 = (x2, -y2);
z5 = (x1, -y1);

fill ((0,0)--(1,0)..(cosd(18),sind(18))..(cosd(36),sind(36))--cycle)
	scaled (0.35 * r) withcolor (0.9,0.9,0.9);
label.rt(btex $\displaystyle\frac{\pi}5$ etex,
	0.35 * r * (cosd(18),sind(18)) shifted (0,3));

pickup pencircle scaled 0.7pt;

drawarrow (-r - 10, 0)--(r+10,0);
drawarrow (0, -r-10)--(0,r+10);

pickup pencircle scaled 1pt;
draw (r,0)..(0,r)..(-r,0)..(0,-r)..cycle;

pickup pencircle scaled 0.5pt;

draw  z0--z1;
draw  z0--z2;
draw  z0--z3;
draw  z0--z4;
draw  z0--z5;

pickup pencircle scaled 3.4pt;

draw z1;
draw z2;
draw z3;
draw z4;
draw z5;

pickup pencircle scaled 2pt;
draw z1 withcolor (1,1,1);
draw z2 withcolor (1,1,1);
draw z3 withcolor (1,1,1);
draw z4 withcolor (1,1,1);
draw z5 withcolor (1,1,1);

label.urt(btex $\displaystyle z_1=2e^{\frac{\pi i}5}$ etex, z1);
label.ulft(btex $\displaystyle z_2=2e^{\frac{3\pi i}5}$ etex, z2);
label.urt(btex $\displaystyle z_3=-2$ etex, z3);
label.llft(btex $\displaystyle z_4=2e^{\frac{7\pi i}5}$ etex, z4);
label.lrt(btex $\displaystyle z_5=2e^{\frac{9\pi i}5}$ etex, z5);

label.urt(btex $\operatorname{Re} z$ etex, (r+10,0));
label.urt(btex $\operatorname{Im} z$ etex, (0, r+10));

label.ulft(btex $r=2$ etex, 0.8 * r * (cosd(36), sind(36)));

endfig;

end
