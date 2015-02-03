%
% komplex.mp -- Bilder zum Anhang komplexe Zahlen
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
% komplexe Ebene, Argument, Radius
%
beginfig(1)

z0 = (0,0);
numeric a;
a := 37;
numeric r;
r := 180;
z1 = r * (cosd(a), sind(a));

numeric b;
b := 0.3;
path p;
p := (b * r, 0)..(b * r *(cosd(a/2),sind(a/2)))..(b * z1);
fill z0--p--cycle withcolor (0.95,0.95,0.95);

label.urt(btex $\varphi = \operatorname{arg}z$ etex,
	(b * r * (cosd(a/2),sind(a/2))) shifted (0,0));
label.ulft(btex $r=|z|$ etex, 0.7 * z1);
label.top(btex $z=\operatorname{Re}z+i\operatorname{Im}z=re^{i\varphi}$ etex, z1);
label(btex $\mathbb C$ etex, (200,150));
label.llft(btex $0$ etex, (0,0));
label.bot(btex $\operatorname{Re}z$ etex, (x1,0));
label.lft(btex $i\operatorname{Im}z$ etex, (0,y1));

pickup pencircle scaled 0.7pt;

drawarrow (-10,0)--(210,0);
drawarrow (0,-10)--(0,160);
draw (x1,-2)--(x1,2);
draw (-2,y1)--(2,y1);

label.urt(btex $\operatorname{Re}z$ etex, (210,0));
label.ulft(btex $\operatorname{Im}z$ etex, (0,160));

pickup pencircle scaled 1pt;

draw z0--z1;

pickup pencircle scaled 0.5pt;
draw (x1,0)--z1;
draw (0,y1)--z1;

pickup pencircle scaled 3.4pt;
draw z1;
draw z0;
pickup pencircle scaled 2pt;
draw z1 withcolor(1,1,1);
draw z0 withcolor(1,1,1);

endfig;

end
