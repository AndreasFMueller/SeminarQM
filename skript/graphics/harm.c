/*
 * harm.c -- harmonic oscillator for large n
 *
 * (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int	n = 100;
double	N = 1e-95;

double	Hn(double x, int n) {
	double	h[2] = { 1, 2 * x };
	for (int k = 1; k < 100; k++) {
		double	newvalue = 2 * (x * h[1] - k * h[0]);
		h[0] = h[1];
		h[1] = newvalue;
	}
	return h[1];
}

int	main(int argc, char *argv[]) {
	printf("%%\n");
	printf("%% harm.mp -- Wellenfunktion des harmonischen Oszillators\n");
	printf("%%            fuer grosses n\n");
	printf("%%\n");
	printf("%% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil\n");
	printf("%%\n");

	printf("verbatimtex\n");
	printf("\\documentclass{book}\n");
	printf("\\usepackage{times}\n");
	printf("\\usepackage{amsmath}\n");
	printf("\\usepackage{amssymb}\n");
	printf("\\usepackage{amsfonts}\n");
	printf("\\usepackage{txfonts}\n");
	printf("\\begin{document}\n");
	printf("etex;\n");

	printf("beginfig(1)\n");
	printf("numeric unit;\n");
	printf("unit := 190/20;\n");
	printf("pickup pencircle scaled 1pt;\n");
	printf("numeric amplitude;\n");
	printf("amplitude := 200;\n");
	printf("numeric h;\n");
	printf("h := 0;\n");
	printf("pickup pencircle scaled 1pt;\n");
	printf("path p;\n");

	int	l = 5000;
	double	m = 20;
	double	delta = m / l;
	double	maxy = 0;
	double	x = -m;
	while (x <= m) {
		double	y = N * Hn(x, n) * exp(-x * x / 2.);
		if (fabs(y) > maxy) {
			maxy = fabs(y);
		}
		x += delta;
	}
	x = -m;
	printf("p := (%.3f * unit, h + amplitude * %f)\n", -m, 0.);
	while (x <= m) {
		double	y = N * Hn(x, n) * exp(-x * x / 2.) / maxy;
		printf("--(%.3f * unit, h + amplitude * %f)\n", x, y * y);
		x += delta;
	}
	printf(";\n");
	printf("draw p withcolor red;\n");

	double a = N * Hn(0, n) / maxy;
	a *= a;

	printf("path q;\n");
	printf("path r;\n");
	printf("q := (0, h + amplitude * %.3f)\n", a);
	double	xscale = sqrt(2) * 10;
	double	dx = 0.001;
	x = dx;
	double y = 0;
	while ((x < 1) && (y <= 1)) {
		y = a / sqrt(1 - x * x);
		printf("--(%.3f * unit, h + amplitude * %f)\n", x * xscale, y);
		x += dx;
	}
	printf(";\n");
	printf("r := (0, h + amplitude * %.3f)\n", a);
	x = dx;
	y = 0;
	while ((x < 1) && (y < 1)) {
		y = a / sqrt(1 - x * x);
		printf("--(%.3f * unit, h + amplitude * %f)\n", -x * xscale, y);
		x += dx;
	}
	printf(";\n");
	printf("pickup pencircle scaled 1.5pt;\n");
	printf("draw q withcolor blue;\n");
	printf("draw r withcolor blue;\n");
	
	printf("pickup pencircle scaled 1pt;\n");
	printf("drawarrow (-195, 0)--(195,0);\n");
	printf("drawarrow (   0,-2)--(  0,210);\n");
	printf("label.top(btex $x$ etex, (190,3));\n");
	printf("label.lft(btex $|\\psi|^2$ etex, (-2,210));\n");
	printf("endfig;\n");
	printf("end\n");

	return EXIT_SUCCESS;
}
