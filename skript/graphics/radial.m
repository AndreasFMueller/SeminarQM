#
# radial.m -- 
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
function retval = w(n)
	retval = zeros(1,n);
	retval(n) = 1;
	for k = (1:n-1)
		retval(n-k) = retval(n-k+1) * (1-k/n)/(k*(k+1));
	endfor;
endfunction

N = 500;
maxn = 12;

data = zeros(N, maxn);
maxx = zeros(1, maxn);

x = (200/N) * ((1:N)-1);

for n = (1:maxn)
	c = w(n)
	m = 0;
	for i = (1:N)
		y = polyval(c, x(i)) * exp(-x(i) / (2 * n));
		if y > m
			m = y;
			maxx(n) = x(i);
		endif
		data(i, n) = y;
	endfor
	for i = (1:N)
		data(i, n) = (data(i, n) / m) ^ 2;
	endfor
endfor

data

plot(data)

fid = fopen("radial.mp", "w");

fprintf(fid, "%%\n")
fprintf(fid, "%% radial.mp -- Radiale Funktionen des Wasserstoffatoms\n")
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
fprintf(fid, "%% Radiale Funktionen")
fprintf(fid, "%%\n")
fprintf(fid, "beginfig(1)\n")

fprintf(fid, "numeric vrange;\n")
fprintf(fid, "vrange = 200;\n")
fprintf(fid, "numeric xrange;\n")
fprintf(fid, "xrange = 380 / %f;\n", x(N))

fprintf(fid, "pickup pencircle scaled 1pt;\n")
for n = (1:maxn)
	fprintf(fid, "draw (xrange * %f, vrange * %f)\n", x(1), data(1, n))
	for i = (2:N)
		fprintf(fid, "--(xrange * %f, vrange * %f)\n", x(i), data(i,n))
	endfor
	fprintf(fid, "withcolor(1,0,0);\n")
endfor

fprintf(fid, "drawarrow (-5, 0)--(390, 0);\n")
fprintf(fid, "drawarrow (0,-2)--(0,vrange + 10);\n")
fprintf(fid, "label.bot(btex 0 etex, (0,-2));\n")
fprintf(fid, "label.top(btex $\\varrho$ etex, (390, 3));\n")
fprintf(fid, "label.ulft(btex $\\tilde R_n(\\varrho)$ etex, (0,vrange + 10));\n")

for i = 20 * (1:10)
	fprintf(fid, "draw (xrange * %f, -2)--(xrange * %f, 2);\n", i, i)
	fprintf(fid, "label.bot(btex $%d$ etex, (xrange * %d, -2));\n", i, i)
endfor

fprintf(fid, "draw (-2,vrange)--(2,vrange);\n")
fprintf(fid, "label.lft(btex 1 etex, (-2, vrange));\n")

for i = (3:maxn)
	fprintf(fid, "label.rt(btex $n=%d$ etex, (0,0)) rotated 45 shifted (xrange * %f - 4, vrange + 4) withcolor(1,0,0);\n", i, maxx(i))
endfor

fprintf(fid, "endfig;\n")
fprintf(fid, "end\n")






