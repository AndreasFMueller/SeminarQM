#
# linear_potential.m -- 
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
global xn = [
-1.018793, 0.292320;
-2.338107, 0.491697;
-3.248198, 0.570299;
-4.087949, 0.644988;
-4.820099, 0.697512;
-5.520560, 0.748578;
-6.163307, 0.789508;
-6.786708, 0.829649;
-7.372177, 0.863799;
-7.944134, 0.897445;
-8.488487, 0.927066;
-9.022651, 0.956333;
-9.535449, 0.982679;
-10.040174, 1.008759;
-10.527660, 1.032607;
-11.008524, 1.056247;
-11.475057, 1.078114;
-11.936016, 1.099815;
];

s = zeros(401,19);
deltax = 0.7;

function retval = psi(x,n)
	global xn;
	if (x > 0)
		retval = airy(0, x + xn(n,1));
	else
		if (mod(n, 2) == 1)
			retval = airy(0, -x + xn(n,1));
		else
			retval = -airy(0, -x + xn(n,1));
		endif;
	endif
endfunction

for i = (-200:200)
	x = i * 0.1;
	s(201 + i, 1) = deltax * x;
	for n = 1:18
		s(201 + i, 1 + n) = psi(deltax * x, n);
	endfor;
endfor

#s
#for k = (1:18)
#	plot(s(:,1), s(:,k + 1))
#	sleep(0.1)
#endfor
#plot(s(:,2:19))
#sleep(10)

fid = fopen("linear.mp", "w");

fprintf(fid, "%%\n")
fprintf(fid, "%% linear.mp -- Wellenfunktionen im linearen Potential\n")
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
fprintf(fid, "%% Energieniveaus und Wellenfunktionen im linearen Potential\n")
fprintf(fid, "%%\n")
fprintf(fid, "beginfig(1)\n")
fprintf(fid, "numeric vrange;\n")
fprintf(fid, "vrange := 12.5;\n")
fprintf(fid, "numeric unit;\n")
fprintf(fid, "unit := 190/14;\n")
fprintf(fid, "numeric v;\n")
fprintf(fid, "v := 490 / vrange;\n")
fprintf(fid, "def E(expr En) =\n")
fprintf(fid, "    (-En)\n")
fprintf(fid, "enddef;\n")

fprintf(fid, "path r;\n")
fprintf(fid, "r := (-vrange * unit,vrange * v)--(0,0)--(vrange * unit, vrange * v);\n")
fprintf(fid, "fill r--(14 * unit, vrange * v)--(14 * unit, 0)--(-14 * unit, 0)--(-14 * unit, vrange * v)--cycle\n")
fprintf(fid, "        withcolor(0.95,0.95,0.95);\n")
fprintf(fid, "pickup pencircle scaled 1pt;\n")
fprintf(fid, "numeric amplitude;\n")
fprintf(fid, "amplitude := 18;\n")
fprintf(fid, "numeric h;\n")

for n = (1:18)
	fprintf(fid, "h := v * E(%f);\n", xn(n,1))
	fprintf(fid, "pickup pencircle scaled 1pt;\n")

	y = zeros(401);
	x = zeros(401);
	for i = (1:401)
		x(i) = s(i,1);
		y(i) = s(i,1+n);
	endfor
	y = y / xn(n,2);
	fprintf(fid, "path p;\n")
	fprintf(fid, "p := (%f * unit, h + amplitude * %f)", x(1), y(1))
	for i = (2:401)
		fprintf(fid, "..(%f * unit, h + amplitude * %f)\n", x(i), y(i))
	endfor
	fprintf(fid, ";\n")
	fprintf(fid, "path q;\n")
	fprintf(fid, "q := p--(14 * unit, h)--(-14 * unit, h)--cycle;\n")
	fprintf(fid, "fill q withcolor(1,0.9,0.9);\n")
	fprintf(fid, "pickup pencircle scaled 0.1pt;\n")
	fprintf(fid, "draw (-14 * unit, h)--(14 * unit,h);\n")
	fprintf(fid, "pickup pencircle scaled 1pt;\n")
	fprintf(fid, "draw p withcolor(1,0,0);\n")
endfor
fprintf(fid, "pickup pencircle scaled 0.7pt;\n")
for x = (-7:7)
	fprintf(fid, "draw(%d * unit,-2)--(%d * unit,2);\n", 2 * x, 2 * x)
	fprintf(fid, "label.bot(btex $%d$ etex, (%d * unit,-2));\n", 2 * x, 2 * x)
endfor;
fprintf(fid, "drawarrow (-195, 0)--(195,0);\n")
fprintf(fid, "drawarrow (   0,-2)--(  0,495);\n")
fprintf(fid, "label.top(btex $x$ etex, (195, 4));\n")
fprintf(fid, "label.lft(btex $E$ etex, (-3,495));\n")

fprintf(fid, "numeric w;\n")
fprintf(fid, "w := 29;\n")
for n = (1:18)
	fprintf(fid, "h := v * E(%f);\n", xn(n,1))
	fprintf(fid, "fill (14 * unit - w, h - 1)\n")
	fprintf(fid, "--(14 * unit - w, h - 11)\n")
	fprintf(fid, "--(14 * unit    , h - 11)\n")
	fprintf(fid, "--(14 * unit    , h -  1)\n")
	fprintf(fid, "--cycle withcolor(1,1,1);\n")

	if (n < 10)
		fprintf(fid, "label.llft(btex $n = \\phantom{0}%d$ etex, (14 * unit + 2, h));\n", n, n)
	else
		fprintf(fid, "label.llft(btex $n = %d$ etex, (14 * unit + 2, h));\n", n, n)
	endif
endfor;

fprintf(fid, "pickup pencircle scaled 1pt;\n")
fprintf(fid, "draw r;\n")

fprintf(fid, "endfig;\n")
fprintf(fid, "end\n")





