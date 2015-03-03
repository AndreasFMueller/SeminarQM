%
% potential.mp -- Loesungen der Schroedingergleichung f"ur verschiedene
%                 Potentiale
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
% Energieniveaus und Wellenfunktionen eines Teilchens in einem Potentialkasten
%
beginfig(1)

pickup pencircle scaled 0.1pt;

numeric u;
u = 6pt;

fill (-140, 175)--(-140,-15)--(120,-15)--(120,175)--(100,175)
	--(100,0)--(-100,0)--(-100,175)--cycle withcolor (0.95,0.95,0.95);

draw (-140,      u)--(100,      u); label.lft(btex $n=1$ etex, (-140,     u));
draw (-140,  4 * u)--(100,  4 * u); label.lft(btex $n=2$ etex, (-140, 4 * u));
draw (-140,  9 * u)--(100,  9 * u); label.lft(btex $n=3$ etex, (-140, 9 * u));
draw (-140, 16 * u)--(100, 16 * u); label.lft(btex $n=4$ etex, (-140,16 * u));
draw (-140, 25 * u)--(100, 25 * u); label.lft(btex $n=5$ etex, (-140,25 * u));

pickup pencircle scaled 1pt;
draw (-140,      u)--(-100,      u) withcolor (1,0,0);
draw (-140,  4 * u)--(-100,  4 * u) withcolor (1,0,0);
draw (-140,  9 * u)--(-100,  9 * u) withcolor (1,0,0);
draw (-140, 16 * u)--(-100, 16 * u) withcolor (1,0,0);
draw (-140, 25 * u)--(-100, 25 * u) withcolor (1,0,0);

pickup pencircle scaled 1.5pt;
draw (-100,160)--(-100,0)--(100,0)--(100,160);
draw (-100,160)--(-100,175) dashed withdots;
draw (100,160)--(100,175) dashed withdots;

def height(expr n) =
	(n * n * u)
enddef;

def phi(expr n, x) =
	(180 * (n / 2) * (x / 100))
enddef;

def cosine(expr n) =
	path p;
	p = (-100, height(n));
	for x = -95 step 5 until 100:
		p := p..(x,height(n) + 10 * cosd(phi(n, x)));
	endfor;
	pickup pencircle scaled 1pt;
	fill p--cycle withcolor (1,0.9,0.9);
	draw p withcolor (1,0,0);
	pickup pencircle scaled 0.1pt;
	draw (-100,height(n))--(100,height(n));
enddef;

def sine(expr n) =
	path p;
	p = (-100, height(n));
	for x = -95 step 5 until 100:
		p := p..(x,height(n) + 10 * sind(phi(n, x)));
	endfor;
	pickup pencircle scaled 1pt;
	fill p--cycle withcolor (1,0.9,0.9);
	draw p withcolor (1,0,0);
	pickup pencircle scaled 0.1pt;
	draw (-100,height(n))--(100,height(n));
enddef;

cosine(1);
sine(2);
cosine(3);
sine(4);
cosine(5);

pickup pencircle scaled 0.71pt;

drawarrow (-145, 0)--( 110,  0);
drawarrow (   0,-5)--(   0,165);
drawarrow (-120,-5)--(-120,165);
label.ulft(btex $\psi$ etex, (0,165));
label.ulft(btex $E$ etex, (-120,165));
label.urt(btex $x$ etex, (110,0));

draw (-100,-2)--(-100,2);
draw ( 100,-2)--( 100,2);
label.bot(btex $-l$ etex, (-100,-2));
label.bot(btex $ l$ etex, ( 100,-2));

endfig;

%
% Potentialtopf
%
beginfig(2)

pickup pencircle scaled 1pt;

fill (-140,0)--(-140,-165)--(140,-165)--(140,0)
	--(100,0)--(100,-150)--(-100,-150)--(-100,0)--cycle
		withcolor(0.95,0.95,0.95);

drawarrow (-150,0)--(150,0);
label.top(btex $x$ etex, (150,0));
drawarrow (0,-160)--(0,20);
label.lft(btex $V$ etex, (0,20));
draw (-100,-2)--(-100,2);
draw ( 100,-2)--( 100,2);

pickup pencircle scaled 2pt;
draw (-140,0)--(-100,0)--(-100,-150)--(100,-150)--(100,0)--(140,0);

label.ulft(btex $-V_0$ etex, (0,-150));

label.top(btex $-l$ etex, (-100,3));
label.top(btex $ l$ etex, ( 100,3));

endfig;

%
% Wellenfunktionen und Energieniveaus eines Teilchens in einem 
% Potentialtopf
%
beginfig(3)

%symmetrisch:
%   1.53152,   0.48750,  -0.99846, 153151657300160.062500
%   4.59431,   1.46241,  -0.98612, 459431213404546.437500
%   7.65638,   2.43710,  -0.96146, 765638087351760.000000
%  10.71719,   3.41139,  -0.92449, 1071719284427410.250000
%  13.77614,   4.38508,  -0.87523, 1377614090516700.500000
%  16.83249,   5.35795,  -0.81372, 1683249144220125.750000
%  19.88531,   6.32969,  -0.74002, 1988530761387639.250000
%  22.93332,   7.29990,  -0.65422, 2293332017633127.500000
%  25.97468,   8.26800,  -0.55642, 2597468167304788.000000
%  29.00646,   9.23304,  -0.44683, 2900646125325223.000000
%  32.02337,  10.19335,  -0.32578, 3202336882194729.000000
%  35.01361,  11.14518,  -0.19398, 3501360530478447.000000
%  37.93351,  12.07461,  -0.05394, 3793351447813826.000000
%antisymmetrisch:
%   3.22436,   1.02635,  -0.99316, 322436303414780.250000
%   6.44932,   2.05288,  -0.97265, 644931551280309.500000
%   9.67549,   3.07980,  -0.93845, 967548539655128.250000
%  12.90359,   4.10734,  -0.89053, 1290358657242065.000000
%  16.13448,   5.13577,  -0.82885, 1613448277428306.250000
%  19.36929,   6.16544,  -0.75334, 1936928871504324.750000
%  22.60955,   7.19684,  -0.66391, 2260954778489834.500000
%  25.85758,   8.23072,  -0.56041, 2585757810728052.000000
%  29.11726,   9.26831,  -0.44259, 2911726288658001.500000
%  32.39624,  10.31204,  -0.30998, 3239623933961796.000000
%  35.71493,  11.36841,  -0.16137, 3571492883836251.000000

numeric amplitude;
amplitude := 5;
numeric A;
A := 39;

def EE(expr E) =
	%-E*E
	E
enddef;

def kprime(expr k) =
	sqrt(A * A - k * k)
enddef;

numeric omega;
omega := 180 / 3.14159;

numeric depth;
depth := 480;

def symsolution(expr k, E) =
	numeric h;
	h := depth * EE(E);

	numeric a;
	a := amplitude * cosd(omega * k);
	numeric kp;
	kp := kprime(k);

	path p;

	% left exponential part
	p := (-155, h + a * mexp(-(kp * 55 * 2.56)));
	for x = 154 step -1 until 101:
		p := p--(-x, h + a * mexp(-(kp * (x - 100) * 2.56)));
	endfor

	% oscillating part of solution
	for x = -100 step 1 until 100:
		p := p--(x, h + amplitude * cosd(omega * k * (x/100)));
	endfor;

	% exponential decay in boundary
	for x = 101 step 1 until 190:
		p := p--(x, h + a * mexp(-(kp * (x - 100) * 2.56)));
	endfor;

	pickup pencircle scaled 1pt
	fill p--(190,h)--(-150,h)--cycle withcolor (0.9,0.9,1);
	draw p withcolor(0,0,1);
	% zero line
	pickup pencircle scaled 0.1pt;
	draw (-150, h)--(190, h) withcolor (0,0,1);
enddef;

def antisymsolution(expr k, E) =
	numeric h;
	h := depth * EE(E);

	numeric a;
	a := amplitude * sind(omega * k);
	numeric kp;
	kp := kprime(k);

	path p;

	% exponential decay in boundary
	p := (-155, h - a * mexp(-(kp * 55 * 2.56)));

	for x = 154 step -1 until 101:
		p := p--(-x, h - a * mexp(-(kp * (x - 100) * 2.56)));
	endfor;

	for x = -100 step 1 until 100:
		p := p--(x, h + amplitude * sind(omega * k * (x/100)));
	endfor;

	for x = 100 step 1 until 190:
		p := p--(x, h + a * mexp(-(kp * (x - 100) * 2.56)));
	endfor;

	pickup pencircle scaled 1pt
	fill p--(190,h)--(-150,h)--cycle withcolor (0.9,1,0.9);
	draw p withcolor(0,1,0);
	
	% zero line
	pickup pencircle scaled 0.1pt;
	draw (-155, h)--(190, h) withcolor (0,1,0);

enddef;

def symlabel(expr E, l) =
	numeric h;
	h := 480 * EE(E);
	label.lft(l, (-155, h)) withcolor (0,0,1);
enddef;

def antisymlabel(expr E, l) =
	numeric h;
	h := 480 * EE(E);
	label.lft(l, (-155, h)) withcolor (0,1,0);
enddef;

fill (-155,0)--(-155,-495)--(190,-495)--(190,0)--(100,0)--(100,-480)
	--(-100,-480)--(-100,0)--cycle withcolor(0.95,0.95,0.95);

fill (-100,-480)--(100,-480)--(100,-448)--(-100,-448)--cycle
	withcolor(1,1,0.90);
pickup pencircle scaled 1pt;
draw (-100,-448)--(100,-448)
	withcolor(1,1,0);

%symsolution(       1.53152, -0.99846);
%symsolution(       4.59431, -0.98612);
%symsolution(       7.65638, -0.96146);
symsolution(      10.71719, -0.92449);
symsolution(      13.77614, -0.87523);
symsolution(      16.83249, -0.81372);
symsolution(      19.88531, -0.74002);
symsolution(      22.93332, -0.65422);
symsolution(      25.97468, -0.55642);
symsolution(      29.00646, -0.44683);
symsolution(      32.02337, -0.32578);
symsolution(      35.01361, -0.19398);
symsolution(      37.93351, -0.05394);

%symlabel(-0.99846, btex $n=1$ etex);
%symlabel(-0.98612, btex $n=3$ etex);
%symlabel(-0.96146, btex $n=5$ etex);
symlabel(-0.92449, btex $n=\phantom{0}7$ etex);
symlabel(-0.87523, btex $n=\phantom{0}9$ etex);
symlabel(-0.81372, btex $n=11$ etex);
symlabel(-0.74002, btex $n=13$ etex);
symlabel(-0.65422, btex $n=15$ etex);
symlabel(-0.55642, btex $n=17$ etex);
symlabel(-0.44683, btex $n=19$ etex);
symlabel(-0.32578, btex $n=21$ etex);
symlabel(-0.19398, btex $n=23$ etex);
symlabel(-0.05394, btex $n=25$ etex);

%antisymsolution(   3.06297, -0.99383);
%antisymsolution(   6.12547, -0.97533);
%antisymsolution(   9.18698, -0.94451);
antisymsolution(  12.24694, -0.90139);
antisymsolution(  15.30469, -0.84600);
antisymsolution(  18.35941, -0.77839);
antisymsolution(  21.41001, -0.69863);
antisymsolution(  24.45498, -0.60681);
antisymsolution(  27.49202, -0.50308);
antisymsolution(  30.51726, -0.38770);
antisymsolution(  33.52310, -0.26115);
antisymsolution(  36.48911, -0.12462);

%antisymlabel(-0.99383, btex $n=2$ etex);
%antisymlabel(-0.97533, btex $n=4$ etex);
%antisymlabel(-0.94451, btex $n=6$ etex);
antisymlabel(-0.90139, btex $n=\phantom{0}8$ etex);
antisymlabel(-0.84600, btex $n=10$ etex);
antisymlabel(-0.77839, btex $n=12$ etex);
antisymlabel(-0.69863, btex $n=14$ etex);
antisymlabel(-0.60681, btex $n=16$ etex);
antisymlabel(-0.50308, btex $n=18$ etex);
antisymlabel(-0.38770, btex $n=20$ etex);
antisymlabel(-0.26115, btex $n=22$ etex);
antisymlabel(-0.12462, btex $n=24$ etex);

pickup pencircle scaled 0.7pt;

drawarrow (-198,   0)--(198, 0);
drawarrow (   0,-490)--(  0,20);
label.llft(btex $-l$ etex, (-100,0));
label.lrt(btex $ l$ etex, ( 100,0));
label.top(btex $x$ etex, (198,3));
label.lft(btex $V$ etex, (0,20));

pickup pencircle scaled 1.5pt;

draw (-155,0)--(-100,0)--(-100,-480)--(100,-480)--(100,0)--(190,0);

label.llft(btex $-V_0$ etex, (0,-480));
label.top(btex $V=0$ etex, (-122.5,0));
label.top(btex $V=0$ etex, (145,0));

endfig;

%
% Tangens/Cotangens und sqrt(A^2-xi^2)/xi zur Bestimmung der
% Energieniveaus eines Potentialtopfs
%
beginfig(4)

numeric A;
A := 380;
numeric s;
s = 10;

path qcurve;
qcurve = (A,0);
for x = 375 step -1 until 20:
	qcurve := qcurve--(x,s * sqrt((A/100)*(A/100) - (x/100)*(x/100))/(x/100));
endfor;
pickup pencircle scaled 1pt;
draw qcurve withcolor(1,0,0);

def xcoord(expr k, x) =
	(k * 3.14159 + x)
enddef;

def xcoordcot(expr k, x) =
	((k + 0.5) * 3.14159 + x)
enddef;

def tand(expr x) =
	(sind(x)/cosd(x))
enddef;

def tanpoint(expr k, x) =
	(s * xcoord(k, x), s * tand(180 * xcoord(k, x) / 3.14159))
enddef;

def cotpoint(expr k, x) =
	(s * xcoordcot(k, x), s * tand(180 * xcoord(k, x) / 3.14159))
enddef;

def tancurve(expr k) =
	path	p;
	p := tanpoint(k, -0.1);
	for x = -0.09 step 0.01 until 1.57:
		p := p--(tanpoint(k, x));
	endfor;
	pickup pencircle scaled 1pt;
	draw p withcolor(0,0,1);
	if k > 0:
		pickup pencircle scaled 3pt;
		draw p intersectionpoint qcurve;
		pickup pencircle scaled 2pt;
		draw p intersectionpoint (qcurve) withcolor(1,1,1);
	fi;
enddef;

def cotcurve(expr k) =
	path	p;
	p := cotpoint(k, -0.1);
	for x = -0.09 step 0.01 until 1.57:
		p := p--(cotpoint(k, x));
	endfor;
	pickup pencircle scaled 1pt;
	draw p withcolor (0,1,0);
	if (k < 12):
		pickup pencircle scaled 3pt;
		draw p intersectionpoint qcurve;
		pickup pencircle scaled 2pt;
		draw p intersectionpoint (qcurve) withcolor(1,1,1);
	fi;
enddef;

def asymptote(expr k) =
	pickup pencircle scaled 0.1pt;
	draw (s * xcoord(k+1, 0),-5)--(s * xcoord(k+1,0), 200);
enddef;

for k = 0 step 1 until 11:
tancurve(k);
cotcurve(k);
asymptote(k);
endfor;

clip currentpicture to (-10,-10)--(390,-10)--(390,190)--(-10,190)--cycle;

pickup pencircle scaled 1pt;

drawarrow (-5, 0)--(390,  0); label.ulft(btex $\xi$ etex, (390,0));
drawarrow ( 0,-5)--(  0,200); label.lft(btex $\frac{k'}{k}$ etex, (0,200));

label.bot(btex $  \pi\mathstrut$ etex, (s * xcoord( 1,0), 0));
label.bot(btex $ 2\pi\mathstrut$ etex, (s * xcoord( 2,0), 0));
label.bot(btex $ 3\pi\mathstrut$ etex, (s * xcoord( 3,0), 0));
label.bot(btex $ 4\pi\mathstrut$ etex, (s * xcoord( 4,0), 0));
label.bot(btex $ 5\pi\mathstrut$ etex, (s * xcoord( 5,0), 0));
label.bot(btex $ 6\pi\mathstrut$ etex, (s * xcoord( 6,0), 0));
label.bot(btex $ 7\pi\mathstrut$ etex, (s * xcoord( 7,0), 0));
label.bot(btex $ 8\pi\mathstrut$ etex, (s * xcoord( 8,0), 0));
label.bot(btex $ 9\pi\mathstrut$ etex, (s * xcoord( 9,0), 0));
label.bot(btex $10\pi\mathstrut$ etex, (s * xcoord(10,0), 0));
label.bot(btex $11\pi\mathstrut$ etex, (s * xcoord(11,0), 0));
label.bot(btex $12\pi\mathstrut$ etex, (s * xcoord(12,0), 0));

endfig;

beginfig(5)

%symmetrisch:
%   1.53152,   0.48750,  -0.99846, 153151657300160.062500
%   4.59431,   1.46241,  -0.98612, 459431213404546.437500
%   7.65638,   2.43710,  -0.96146, 765638087351760.000000
%  10.71719,   3.41139,  -0.92449, 1071719284427410.250000
%  13.77614,   4.38508,  -0.87523, 1377614090516700.500000
%  16.83249,   5.35795,  -0.81372, 1683249144220125.750000
%  19.88531,   6.32969,  -0.74002, 1988530761387639.250000
%  22.93332,   7.29990,  -0.65422, 2293332017633127.500000
%  25.97468,   8.26800,  -0.55642, 2597468167304788.000000
%  29.00646,   9.23304,  -0.44683, 2900646125325223.000000
%  32.02337,  10.19335,  -0.32578, 3202336882194729.000000
%  35.01361,  11.14518,  -0.19398, 3501360530478447.000000
%  37.93351,  12.07461,  -0.05394, 3793351447813826.000000
%antisymmetrisch:
%   3.22436,   1.02635,  -0.99316, 322436303414780.250000
%   6.44932,   2.05288,  -0.97265, 644931551280309.500000
%   9.67549,   3.07980,  -0.93845, 967548539655128.250000
%  12.90359,   4.10734,  -0.89053, 1290358657242065.000000
%  16.13448,   5.13577,  -0.82885, 1613448277428306.250000
%  19.36929,   6.16544,  -0.75334, 1936928871504324.750000
%  22.60955,   7.19684,  -0.66391, 2260954778489834.500000
%  25.85758,   8.23072,  -0.56041, 2585757810728052.000000
%  29.11726,   9.26831,  -0.44259, 2911726288658001.500000
%  32.39624,  10.31204,  -0.30998, 3239623933961796.000000
%  35.71493,  11.36841,  -0.16137, 3571492883836251.000000

numeric amplitude;
amplitude := 15;
numeric A;
A := 39;
depth := 450;

def EE(expr E) =
	((15 * (1+E)) -1)
enddef;

def kprime(expr k) =
	sqrt(A * A - k * k)
enddef;

numeric omega;
omega := 180 / 3.14159;

def symlabel(expr E, l) =
	numeric h;
	h := 450 * EE(E);
	fill (-195,h-8)--(-155,h-8)--(-155,h+8)--(-195,h+8)--cycle
		withcolor(1,1,1);
	label.lft(l, (-155, h)) withcolor (0,0,1);
enddef;

def antisymlabel(expr E, l) =
	numeric h;
	h := 450 * EE(E);
	fill (-195,h-8)--(-155,h-8)--(-155,h+8)--(-195,h+8)--cycle
		withcolor(1,1,1);
	label.lft(l, (-155, h)) withcolor (0,1,0);
enddef;

fill (-190,25)--(-190,-50)--(-190,-465)--(190,-465)
	--(190,25)--(100,25)--(100,-450)
	--(-100,-450)--(-100,25)--cycle withcolor(0.95,0.95,0.95);

fill (-100,-450)--(100,-450)--(100,0)--(-100,0)--cycle
	withcolor(1,1,0.95);

symsolution(       1.53152, -0.99846);
symsolution(       4.59431, -0.98612);
symsolution(       7.65638, -0.96146);
%symsolution(      10.71719, -0.92449);
%symsolution(      13.77614, -0.87523);
%symsolution(      16.83249, -0.81372);
%symsolution(      19.88531, -0.74002);
%symsolution(      22.93332, -0.65422);
%symsolution(      25.97468, -0.55642);
%symsolution(      29.00646, -0.44683);
%symsolution(      32.02337, -0.32578);
%symsolution(      35.01361, -0.19398);
%symsolution(      37.93351, -0.05394);

symlabel(-0.99846, btex $n=\phantom{0}1$ etex);
symlabel(-0.98612, btex $n=\phantom{0}3$ etex);
symlabel(-0.96146, btex $n=\phantom{0}5$ etex);
%symlabel(-0.92449, btex $n=7$ etex);
%symlabel(-0.87523, btex $n=9$ etex);
%symlabel(-0.81372, btex $n=11$ etex);
%symlabel(-0.74002, btex $n=13$ etex);
%symlabel(-0.65422, btex $n=15$ etex);
%symlabel(-0.55642, btex $n=17$ etex);
%symlabel(-0.44683, btex $n=19$ etex);
%symlabel(-0.32578, btex $n=21$ etex);
%symlabel(-0.19398, btex $n=23$ etex);
%symlabel(-0.05394, btex $n=25$ etex);

antisymsolution(   3.06297, -0.99383);
antisymsolution(   6.12547, -0.97533);
antisymsolution(   9.18698, -0.94451);
%antisymsolution(  12.24694, -0.90139);
%antisymsolution(  15.30469, -0.84600);
%antisymsolution(  18.35941, -0.77839);
%antisymsolution(  21.41001, -0.69863);
%antisymsolution(  24.45498, -0.60681);
%antisymsolution(  27.49202, -0.50308);
%antisymsolution(  30.51726, -0.38770);
%antisymsolution(  33.52310, -0.26115);
%antisymsolution(  36.48911, -0.12462);

antisymlabel(-0.99383, btex $n=\phantom{0}2$ etex);
antisymlabel(-0.97533, btex $n=\phantom{0}4$ etex);
antisymlabel(-0.94451, btex $n=\phantom{0}6$ etex);
%antisymlabel(-0.90139, btex $n=8$ etex);
%antisymlabel(-0.84600, btex $n=10$ etex);
%antisymlabel(-0.77839, btex $n=12$ etex);
%antisymlabel(-0.69863, btex $n=14$ etex);
%antisymlabel(-0.60681, btex $n=16$ etex);
%antisymlabel(-0.50308, btex $n=18$ etex);
%antisymlabel(-0.38770, btex $n=20$ etex);
%antisymlabel(-0.26115, btex $n=22$ etex);
%antisymlabel(-0.12462, btex $n=24$ etex);

pickup pencircle scaled 0.7pt;

drawarrow (-198,   0)--(198, 0);
drawarrow (   0,-460)--(  0,20);
label.llft(btex $-l$ etex, (-100,0));
label.lrt(btex $ l$ etex, ( 100,0));
label.top(btex $x$ etex, (198,3));
label.lft(btex $V$ etex, (0,20));

pickup pencircle scaled 1.5pt;

draw (-100,25)--(-100,   0) dashed withdots;
draw ( 100,25)--( 100,   0) dashed withdots;
draw (-100, 0)--(-100,-450)--(100,-450)--(100,0);

label.llft(btex $-V_0$ etex, (0,-450));

label.top(btex $V=-\frac{14}{15}V_0$ etex, (-145,0));
label.top(btex $V=-\frac{14}{15}V_0$ etex, ( 145,0));


endfig;

end
