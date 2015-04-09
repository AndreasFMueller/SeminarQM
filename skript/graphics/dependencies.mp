%
% dependencies.mp -- Abhaengigkeiten der Kapitel untereinander
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

def box(expr position, labelstring, col) =
	pickup pencircle scaled linewidth;
	path	p;
	p := ((-4 * unit, -1.5 * unit)--(4 * unit, -1.5 * unit)
		--(4 * unit, 1.5 * unit)--(-4 * unit, 1.5 * unit)--cycle)
			shifted position;
	fill p withcolor col;
	draw p;
	label(labelstring, (0,0) shifted position);
enddef;

beginfig(1)
pickup pencircle scaled linewidth;

% einfache Quantensysteme
	z1 = (0, 7 * unit);
	z2 = (0, 0 * unit);
		z15 = (10 * unit, 0 * unit);

z4 = (-10 * unit, -7 * unit);
	z5 = (0, -7 * unit);
		z3 = (10 * unit, -7 * unit);

z10 = (-15 * unit, -14 * unit);
	z6 = (0, -14 * unit);
		z16 = (15 * unit, -14 * unit);

z7 = (-15 * unit, -21 * unit);
	z8 = (-5 * unit, -21 * unit);
		z11 = (5 * unit, -21 * unit);
			z9 = (15 * unit, -21 * unit);

		z12 = (15 * unit, -28 * unit);
		z13 = (10 * unit, -35 * unit);

	z14 = (0, -42 * unit);

draw z1--z2;
draw z2--z5;
draw z15--z3;
draw z3--z6;
draw z2--z4;
draw z5--z6;
draw z6--z9;
draw z6--z8;
draw z6--z7;
draw z6--z11;
draw z16--z9;
draw z9--z12;
draw z12--z13;
draw z11--z13;
draw z5--z10;
draw z6--z14;
draw z13--z14;

box(z1, btex \vbox{\centering\hsize80pt 1. Einleitung} etex, (1,1,1));
box(z2, btex \vbox{\centering \hsize 80pt 2. Einfache \\ Quantensysteme} etex, (1,1,1));
box(z3, btex \vbox{\centering\hsize80pt 3. Hilbertraum} etex, (1,1,1));
box(z4, btex \vbox{\centering\hsize80pt 4. Quantencomputer} etex, (1,1,1));
box(z5, btex \vbox{\centering\hsize80pt 5. Mechanik} etex, (1,1,1));
box(z6, btex \vbox{\centering\hsize80pt 6. Quantisierung} etex, (1,1,1));
box(z7, btex \vbox{\centering\hsize80pt 7. Unsch\"arfe} etex, (1,1,1));
box(z8, btex \vbox{\centering\hsize80pt 8. Harmonischer\\Oszillator} etex, (1,1,1));
box(z9, btex \vbox{\centering\hsize80pt 9. Wasserstoff} etex, (1,1,1));
box(z15, btex \vbox{\centering\hsize80pt A. Komplexe Zahlen} etex, (0.9,0.9,0.9));
box(z16, btex \vbox{\centering\hsize80pt B. Kugelkoordinaten} etex, (0.9,0.9,0.9));
box(z10, btex \vbox{\centering\hsize80pt 10. St\"orungstheorie} etex, (1,1,1));
box(z11, btex \vbox{\centering\hsize80pt 11. Magnetfeld} etex, (1,1,1));
box(z12, btex \vbox{\centering\hsize80pt 12. Drehimpuls} etex, (1,1,1));
box(z13, btex \vbox{\centering\hsize80pt 13. Spin} etex, (1,1,1));
box(z14, btex \vbox{\centering\hsize80pt 14. Festk\"orper} etex, (1,1,1));

endfig;

end
