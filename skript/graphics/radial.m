#
# radial.m -- Berechnung der Radial-Funktionen
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
function retval = w(n)
	retval = zeros(1,n);
	retval(n) = 1;
	for k = (1:n-1)
		retval(n-k) = -retval(n-k+1) * (1-k/n)/(k*(k+1));
	endfor;
endfunction

N = 500;
maxn = 3;

data = zeros(N, maxn);
maxx = zeros(1, maxn);
maxy = zeros(1, maxn);

x = (20/N) * ((1:N)-1);

for n = (1:maxn)
	c = w(n);
	m = 0;
	for i = (1:N)
		y = polyval(c, x(i)) * exp(-x(i) / n);
		if y > m
			m = y;
			maxx(n) = x(i);
		endif
		data(i, n) = y;
	endfor
	for i = (1:N)
		data(i, n) = 490 * (data(i, n)) ^ 2;
%		data(i, n) = (data(i, n) / m) ^ 2;
	endfor
	m = 0;
	i = N;
	while (i > 0) && (data(i, n) > m);
		m = data(i, n);
		maxx(n) = x(i);
		maxy(n) = data(i, n);
		i = i - 1;
	endwhile
endfor

maxx
maxy

maxx(1) = 2.1;
maxy(1) = 1;

%data

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
fprintf(fid, "numeric vrange;\n")
fprintf(fid, "vrange = 200;\n")
fprintf(fid, "numeric xrange;\n")
fprintf(fid, "xrange = 380 / %f;\n", x(N))

fprintf(fid, "beginfig(1)\n")
fprintf(fid, "%% Radialfunktion fuer l = 0\n")

mini = 50;

function color = a2rgb(hue)
	r = zeros(1,3)
	h = hue * 240;
	h = h - 360 * floor(h / 360);
	hprime = h / 60;
	x = hprime;
	x = x - 2 * floor(x / 2);
	x = 1 - abs(x - 1);
	
	if ((0. <= hprime) && (hprime < 1.))
		r(1) = 1;
		r(2) = x;
	endif
	if ((1. <= hprime) && (hprime < 2.))
		r(1) = x;
		r(2) = 1;
	endif
	if ((2. <= hprime) && (hprime < 3.))
		r(2) = 1;
		r(3) = x;
	endif
	if ((3. <= hprime) && (hprime < 4.))
		r(2) = x;
		r(3) = 1;
	endif
	if ((4. <= hprime) && (hprime < 5.))
		r(1) = x;
		r(3) = 1;
	endif
	if ((5. <= hprime) && (hprime < 6.))
		r(1) = 1;
		r(3) = x;
	endif
	color = r
endfunction

fprintf(fid, "pickup pencircle scaled 1pt;\n")
for n = (1:maxn)
	c = a2rgb((n - 1) / (maxn - 1))
	fprintf(fid, "draw (xrange * %f, vrange * %f)\n", x(mini), data(mini, n))
	for i = (mini+1:N)
		fprintf(fid, "--(xrange * %f, vrange * %f)\n", x(i), data(i,n))
	endfor
	fprintf(fid, "withcolor(%.2f,%.2f,%.2f);\n", c(1), c(2), c(3))
endfor

fprintf(fid, "clip currentpicture to (0,0)--(380,0)--(380,200)--(0,200)--cycle;\n")

fprintf(fid, "drawarrow (-5, 0)--(390, 0);\n")
fprintf(fid, "drawarrow (0,-2)--(0,vrange + 10);\n")
fprintf(fid, "label.bot(btex 0 etex, (0,-2));\n")
fprintf(fid, "label.top(btex $\\varrho$ etex, (390, 3));\n")
fprintf(fid, "label.ulft(btex $\\tilde R_{n0}(\\varrho)$ etex, (0,vrange + 10));\n")

for i = 2 * (1:10)
	fprintf(fid, "draw (xrange * %f, -2)--(xrange * %f, 2);\n", i, i)
	fprintf(fid, "label.bot(btex $%d$ etex, (xrange * %d, -2));\n", i, i)
endfor

for i = (1:maxn)
	fprintf(fid, "label.top(btex $n=%d$ etex, (0,0)) shifted (xrange * %f, vrange * %f)", i, maxx(i), maxy(i))
	c = a2rgb((i - 1) / (maxn - 1))
	fprintf(fid, "withcolor(%.2f,%.2f,%.2f);\n", c(1), c(2), c(3))
endfor

fprintf(fid, "label.llft(btex $l=0$ etex, (xrange * %f, vrange));\n", x(N))

fprintf(fid, "endfig;\n")

%
% Radialfunktionen für l = n-1, d.h. maximaler Drehimpuls
%

maxn = 6;

data = zeros(N, maxn);
maxx = zeros(1, maxn);
maxy = zeros(1, maxn);

x = (40/N) * ((1:N)-1);
fprintf(fid, "xrange := 380 / %f;\n", x(N))

for n = (2:maxn)
	for i = (1:N)
		y = x(i)^(n-1) * exp(-x(i) / n);
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

fprintf(fid, "beginfig(2);\n")
fprintf(fid, "%% Radialfunktion fuer l = n\n")
fprintf(fid, "pickup pencircle scaled 1pt;\n")

for n = (2:maxn)
	color = a2rgb((n - 2) / (maxn - 2))
	fprintf(fid, "draw (xrange * %f, vrange * %f)\n", x(1), data(1, n))
	for i = (2:N)
		fprintf(fid, "--(xrange * %f, vrange * %f)\n", x(i), data(i,n))
	endfor
	fprintf(fid, "withcolor(%.2f,%.2f,%.2f);\n", color(1), color(2), color(3))
endfor

fprintf(fid, "drawarrow (-5, 0)--(390, 0);\n")
fprintf(fid, "drawarrow (0,-2)--(0,vrange + 10);\n")
fprintf(fid, "label.top(btex $\\varrho$ etex, (390, 3));\n")
fprintf(fid, "label.ulft(btex $\\tilde R_{n,n-1}(\\varrho)$ etex, (0,vrange + 10));\n")

for i = 5 * (1:8)
	fprintf(fid, "draw (xrange * %f, -2)--(xrange * %f, 2);\n", i, i)
	fprintf(fid, "label.bot(btex $%d$ etex, (xrange * %d, -2));\n", i, i)
endfor

for i = (2:maxn)
	color = a2rgb((i - 2) / (maxn - 2))
	fprintf(fid, "label.top(btex $n=%d$ etex, (0,0)) shifted (xrange * %f, vrange) withcolor (%.2f,%.2f,%.2f);\n", i, maxx(i), color(1), color(2), color(3))
endfor

fprintf(fid, "label.llft(btex $l=n-1$ etex, (xrange * %f, vrange));\n", x(N))

fprintf(fid, "endfig;\n")

fprintf(fid, "end\n")






