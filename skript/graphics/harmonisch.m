#
# harmonisch.m -- 
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

s = zeros(401,12);

N = zeros(11);

for n = 0:10
	N(n+1) = 2^n * sqrt(factorial(n) / factorial(2 * n));
endfor;

for i = (-200:200)
	x = i * 0.1;
	s(201 + i, 1) = x;
	for n = 0:10
		s(201 + i, 2 + n) = N(1 + n) * hermitepoly(n, x) * exp(-x^2 / 2);
	endfor;
endfor

#plot(s)
#sleep(3)
#
#for n = 0:10
#	plot(s(:,1), s(:,2 + n))
#	sleep(1)
#endfor

fid = fopen("harmonisch.mp", "w");

fprintf(fid, "%%\n")
fprintf(fid, "%%\n")
fprintf(fid, "%% harmonisch.mp -- Wellenfunktionen des harmonischen Oszillators\n")
fprintf(fid, "%%\n")
fprintf(fid, "%% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil\n")
fprintf(fid, "%%\n")
fprintf(fid, "verbatimtex\n")
fprintf(fid, "\\documentclass{book}\n")
fprintf(fid, "\\usepackage{times}\n")
fprintf(fid, "\\usepackage{amsmath}\n")
fprintf(fid, "\\usepackage{amssymb}\n")
fprintf(fid, "\\usepackage{amsfonts}\n")
fprintf(fid, "\\usepackage{txfonts}\n")
fprintf(fid, "\\begin{document}\n")
fprintf(fid, "etex;\n")
fprintf(fid, "\n")
fprintf(fid, "%%\n")
fprintf(fid, "%% Energieniveaus und Wellenfunktionen eines harmonischen Oszillators\n")
fprintf(fid, "%%\n")
fprintf(fid, "beginfig(1)\n")
fprintf(fid, "numeric unit;\n")
fprintf(fid, "unit := 190/4;\n")
fprintf(fid, "numeric v;\n")
fprintf(fid, "v := 490 / 16;\n")
fprintf(fid, "def potential(expr x) =\n")
fprintf(fid, "    (x * x * v)\n")
fprintf(fid, "enddef;\n")
fprintf(fid, "def E(expr k) =\n")
fprintf(fid, "    (k + 0.5)\n")
fprintf(fid, "enddef;\n")
#fprintf(fid, "pickup pencircle scaled 0.1pt;\n")
#fprintf(fid, "for k = 0 step 1 until 6:\n")
#fprintf(fid, "    draw (-4 * unit, v * E(k))--(4 * unit, v * E(k));\n")
#fprintf(fid, "endfor;\n")
fprintf(fid, "pickup pencircle scaled 1pt;\n")
fprintf(fid, "numeric amplitude;\n")
fprintf(fid, "amplitude := 25;\n")
fprintf(fid, "numeric h;\n")

for n = (0:7)
	fprintf(fid, "h := 2 * v * E(%d);\n", n)
	fprintf(fid, "label.llft(btex $n = %d$ etex, (sqrt(2 * (%d + 0.5)) * unit, h) shifted (-10, 0));\n", n, n)
	fprintf(fid, "pickup pencircle scaled 1pt;\n")
	N = 2^n * sqrt(factorial(n) / factorial(2 * n));
	y = zeros(161);
	x = zeros(161);
	for i = (-80:80)
		q = 0.05 * i;
		x(i + 81) = q;
		y(i + 81) = N * hermitepoly(n, q) * exp(-q^2 / 2);
	endfor
	y = y / max(y);
	fprintf(fid, "path p;\n")
	fprintf(fid, "p := (%f * unit, h + amplitude * %f)", x(1), y(1))
	for i = (2:161)
		fprintf(fid, "..(%f * unit, h + amplitude * %f)", x(i), y(i))
	endfor
	fprintf(fid, ";\n")
	fprintf(fid, "path q;\n")
	fprintf(fid, "q := p--(4 * unit, h)--(-4 * unit, h)--cycle;\n")
	fprintf(fid, "fill q withcolor(1,0.9,0.9);\n")
	fprintf(fid, "pickup pencircle scaled 0.1pt;\n")
	fprintf(fid, "draw (-4 * unit, h)--(4 * unit,h);\n")
	fprintf(fid, "pickup pencircle scaled 1pt;\n")
	fprintf(fid, "draw p withcolor(1,0,0);\n")
endfor
fprintf(fid, "pickup pencircle scaled 1pt;\n")
fprintf(fid, "draw (-4 * unit,potential(-4))\n")
fprintf(fid, "for x = -4 step 0.1 until 4.01:\n")
fprintf(fid, "    --(x * unit, potential(x))\n")
fprintf(fid, "endfor;\n")
fprintf(fid, "pickup pencircle scaled 1pt;\n")
fprintf(fid, "pickup pencircle scaled 0.7pt;\n")
for x = (-4:4)
	fprintf(fid, "draw(%d * unit,-2)--(%d * unit,2);\n", x, x)
	fprintf(fid, "label.bot(btex $%d$ etex, (%d * unit,-2));\n", x, x)
endfor;
fprintf(fid, "drawarrow (-195, 0)--(195,0);\n")
fprintf(fid, "drawarrow (   0,-2)--(  0,495);\n")
fprintf(fid, "label.ulft(btex $x$ etex, (195, 4));\n")
fprintf(fid, "label.llft(btex $\\psi$ etex, (0,495));\n")

fprintf(fid, "endfig;\n")
fprintf(fid, "end")


