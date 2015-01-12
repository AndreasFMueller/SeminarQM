%
% analysator.mp -- 
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

numeric linewidth;
linewidth := 0.5pt;

%
% Analysator
%
beginfig(1)

label.lft(btex $a_1$ etex, (0, 50));
label.lft(btex $a_2$ etex, (0, 40));
label.lft(btex $a_3$ etex, (0, 30));
label.lft(btex $a_n$ etex, (0,  0));

pickup pencircle scaled linewidth;

drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,50)--(0,50);
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,40)--(0,40);
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,30)--(0,30);
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10, 0)--(0, 0);

draw (0,10);
draw (0,15);
draw (0,20);

endfig;

%
% Analysatorkreis
%
beginfig(2)

pickup pencircle scaled linewidth;

drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,50)--(0,50)
	--(-10,50){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_1$ etex, (0,50));
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,35)--(0,35)
	--(-10,35){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_2$ etex, (0,35));
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,0)--(0,0)
	--(-10,0){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_n$ etex, (0,0));
draw (0,15);
draw (0,19);
draw (0,23);

endfig;

%
% Projektor
%
beginfig(3)

pickup pencircle scaled linewidth;

drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,50)--(0,50)
	--(-10,50){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_1$ etex, (0,50));
draw (40,25)--(30,25){dir 180}..{dir 180}(10,35)--(0,35);
draw (0,33)--(0,37);
label.lft(btex $a_2$ etex, (0,35));
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,0)--(0,0)
	--(-10,0){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_n$ etex, (0,0));
draw (0,15);
draw (0,19);
draw (0,23);

endfig;

%
% Verknuepfung von Projektoren: P^2 = P
%
beginfig(4)

pickup pencircle scaled linewidth;

drawarrow ((40,25)--(30,25){dir 180}..{dir 180}(10,50)--(0,50)
	--(-10,50){dir 180}..{dir 180}(-30,25)--(-40,25)) shifted (-80,0);
label.top(btex $a_1$ etex, (0,50)) shifted (-80,0);
draw ((40,25)--(30,25){dir 180}..{dir 180}(10,35)--(0,35)) shifted(-80,0);
draw ((0,33)--(0,37)) shifted(-80,0);
label.lft(btex $a_2$ etex, (0,35)) shifted(-80,0);
drawarrow ((40,25)--(30,25){dir 180}..{dir 180}(10,0)--(0,0)
	--(-10,0){dir 180}..{dir 180}(-30,25)--(-40,25)) shifted(-80,0);
label.top(btex $a_n$ etex, (0,0)) shifted(-80,0);
draw (0,15) shifted(-80,0);
draw (0,19) shifted(-80,0);
draw (0,23) shifted(-80,0);

drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,50)--(0,50)
	--(-10,50){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_1$ etex, (0,50));
draw (40,25)--(30,25){dir 180}..{dir 180}(10,35)--(0,35);
draw (0,33)--(0,37);
label.lft(btex $a_2$ etex, (0,35));
drawarrow (40,25)--(30,25){dir 180}..{dir 180}(10,0)--(0,0)
	--(-10,0){dir 180}..{dir 180}(-30,25)--(-40,25);
label.top(btex $a_n$ etex, (0,0));
draw (0,15);
draw (0,19);
draw (0,23);

label(btex $=$ etex, (50,25));

drawarrow ((40,25)--(30,25){dir 180}..{dir 180}(10,50)--(0,50)
	--(-10,50){dir 180}..{dir 180}(-30,25)--(-40,25)) shifted(100,0);
label.top(btex $a_1$ etex, (0,50)) shifted(100,0);
draw ((40,25)--(30,25){dir 180}..{dir 180}(10,35)--(0,35)) shifted(100,0);
draw ((0,33)--(0,37)) shifted(100,0);
label.lft(btex $a_2$ etex, (0,35)) shifted(100,0);
drawarrow ((40,25)--(30,25){dir 180}..{dir 180}(10,0)--(0,0)
	--(-10,0){dir 180}..{dir 180}(-30,25)--(-40,25)) shifted(100,0);
label.top(btex $a_n$ etex, (0,0)) shifted(100,0);
draw (0,15) shifted(100,0);
draw (0,19) shifted(100,0);
draw (0,23) shifted(100,0);

pickup pencircle scaled 0.1pt;
draw (-110,-5)--(-50,-5)--(-50,63)--(-110,63)--cycle;
draw (-30,-5)--(30,-5)--(30,63)--(-30,63)--cycle;
draw (70,-5)--(130,-5)--(130,63)--(70,63)--cycle;

label.bot(btex $P$ etex, (-80, -5));
label.bot(btex $P$ etex, (0, -5));
label.bot(btex $P$ etex, (100, -5));

endfig;

%
% verdrehte Achsen von Photonenpolarisatoren
%
beginfig(5)

pickup pencircle scaled linewidth;

drawarrow (0,0)--(100,0); label.top(btex $a_1$ etex, (100,0));
drawarrow (0,0)--(0,100); label.top(btex $a_2$ etex, (0,100));
draw (40,0){dir 90}..{dir 120}((40,0) rotated 30);
draw (0,40){dir 180}..{dir 210}((0,40) rotated 30);
label(btex $\alpha$ etex, (34,0) rotated 15);
label(btex $\alpha$ etex, (0,34) rotated 15);

drawarrow (0,0)--(100,0) rotated 30;
label.top(btex $b_1$ etex, (100,0) rotated 30);
drawarrow (0,0)--(0,100) rotated 30;
label.top(btex $b_2$ etex, (0,100) rotated 30);

label.top(btex $\sin\alpha$ etex, (25,0)) rotated 30 withcolor (1,0,0);
label.bot(btex $\cos\alpha$ etex, (-25 * sqrt(3), 0)) rotated -60
	withcolor(1,0,0);

pickup pencircle scaled 1.5pt;

draw (0,0)--((50,0) rotated 30) withcolor (1,0,0);
draw (0,0)--((0,50 * sqrt(3)) rotated 30) withcolor (1,0,0);

pickup pencircle scaled 0.1pt;

draw (0,100)--((50,0) rotated 30) withcolor (1,0,0);
draw (0,100)--((0,50 * sqrt(3)) rotated 30) withcolor (1,0,0);

pickup pencircle scaled 3pt;
draw (0,0);

endfig;

%
% Kombination von Analysatoren fuer <a_2|c_L><c_L|a_2>
%
beginfig(6)

pickup pencircle scaled linewidth;

draw ((40,0)--(30,0){dir 180}..{dir 180}(10,10)
	--(0,10)) shifted (-80,0);
draw ((0,8.5)--(0,11.5)) shifted (-80,0);
label.lft(btex $a_1$ etex, (0,10) shifted (-80,0));
drawarrow ((40,0)--(30,0){dir 180}..{dir 180}(10,-10)
	--(-10,-10){dir 180}..{dir 180}(-30,0)--(-40,0)) shifted (-80,0);
label.top(btex $a_2$ etex, (0,-10) shifted (-80,0));

drawarrow (40,0)--(30,0){dir 180}..{dir 180}(10,10)
	--(-10,10){dir 180}..{dir 180}(-30,0)--(-40,0);
label.top(btex $c_L$ etex, (0,10));
draw (40,0)--(30,0){dir 180}..{dir 180}(10,-10)
	--(0,-10);
draw (0,-8.5)--(0,-11.5);
label.lft(btex $c_R$ etex, (0,-10));

draw ((40,0)--(30,0){dir 180}..{dir 180}(10,10)
	--(0,10)) shifted (80,0);
draw ((0,8.5)--(0,11.5)) shifted (80,0);
label.lft(btex $a_1$ etex, (0,10) shifted (80,0));
drawarrow ((40,0)--(30,0){dir 180}..{dir 180}(10,-10)
	--(-10,-10){dir 180}..{dir 180}(-30,0)--(-40,0)) shifted (80,0);
label.top(btex $a_2$ etex, (0,-10) shifted (80,0));

label.top(btex $1$ etex, (40,0));
label.top(btex $2$ etex, (-40,0));

pickup pencircle scaled 0.1pt;
draw (-80,-18)--(80,-18)--(80,23)--(-80,23)--cycle withcolor (1,0,0);
label.bot(btex $\langle a_2|c_L\rangle\langle c_L|a_2\rangle$ etex, (0,-20))
	withcolor(1,0,0);

endfig;

%
% Doppelspaltexperiment
%
beginfig(7)

pickup pencircle scaled linewidth;

fill (-2, 16)--( 2, 16)--( 2, 50)--(-2, 50)--cycle withcolor(0.5,0.5,0.5);
fill (-2,-10)--( 2,-10)--( 2, 10)--(-2, 10)--cycle withcolor(0.5,0.5,0.5);
fill (-2,-16)--( 2,-16)--( 2,-50)--(-2,-50)--cycle withcolor(0.5,0.5,0.5);
draw (-2, 16)--( 2, 16)--( 2, 50)--(-2, 50)--cycle;
draw (-2,-10)--( 2,-10)--( 2, 10)--(-2, 10)--cycle;
draw (-2,-16)--( 2,-16)--( 2,-50)--(-2,-50)--cycle;

pickup pencircle scaled 3pt;
draw (-100,50)--(-100,-50);

pickup pencircle scaled 0.1pt;
def verticalline(expr x) =
	draw (x,-50)--(x,50);
enddef;
def circleline(expr x, offset) =
	draw (((x, 0) rotated -20)..(x,0)..((x,0) rotated 20))
		shifted(0,offset);;
enddef;

numeric delta;
delta = 5.8512660;

for t = delta step delta until 100:
	verticalline(t);
endfor

for t = delta step delta until 100:
	circleline(-t,  13);
	circleline(-t, -13);
endfor

def blockwithcolor(expr y, c) =
	fill (-120,y-0.5)--(-105,y-0.5)--(-105,y+0.5)--(-120,y+0.5)--cycle
		withcolor (c,c,c);
enddef;

def colorblock(expr y) =
	blockwithcolor(y, cosd(8 * y) * cosd(8 * y));
enddef;

for t = -50 step 1 until 50:
	colorblock(t);
endfor

pickup pencircle scaled 3pt;
draw (-98.5,0) withcolor(1,0,0);
draw (-98.5,11.25) withcolor(0,0,1);

pickup pencircle scaled linewidth;
draw (0, 13)--(-98.5,0) withcolor(1,0,0);
draw (0,-13)--(-98.5,0) withcolor(1,0,0);
draw (0, 13)--(-98.5,11.25) withcolor(0,0,1);
draw (0,-13)--(-98.5,11.25) withcolor(0,0,1);

pickup pencircle scaled 0.1pt;
draw (-120,-50.5)--(-105,-50.5)--(-105,50.5)--(-120,50.5)--cycle;

fill (-5,-5)--(5,-5)--(5,5)--(-5,5)--cycle shifted (10, 33) withcolor (1,1,1);
fill (-5,-5)--(5,-5)--(5,5)--(-5,5)--cycle shifted (10, 13) withcolor (1,1,1);
fill (-5,-5)--(5,-5)--(5,5)--(-5,5)--cycle shifted (10,  0) withcolor (1,1,1);
fill (-5,-5)--(5,-5)--(5,5)--(-5,5)--cycle shifted (10,-13) withcolor (1,1,1);
fill (-5,-5)--(5,-5)--(5,5)--(-5,5)--cycle shifted (10,-33) withcolor (1,1,1);
label(btex $B_1$ etex, (10, 33));
label(btex $S_1$ etex, (10, 13));
label(btex $B_2$ etex, (10,  0));
label(btex $S_2$ etex, (10,-13));
label(btex $B_3$ etex, (10,-33));

endfig;

%
% Doppelspaltexperiment Darstellung als Analystoren
%
beginfig(8)

pickup pencircle scaled linewidth;

draw (100,0)--(90,0){dir 180}..{dir 180}(60,40)--(50,40);
draw (50,38)--(50,42);
drawarrow (100,0)--(90,0){dir 180}..{dir 180}(60,20)--(50,20)
	--(40,20){dir 180}..{dir 180}(10,0)--(0,0);
draw (100,0)--(90,0){dir 180}..{dir 180}(60,0)--(50,0);
draw (50,-2)--(50,2);
drawarrow (100,0)--(90,0){dir 180}..{dir 180}(60,-20)--(50,-20)
	--(40,-20){dir 180}..{dir 180}(10,0)--(0,0);
draw (100,0)--(90,0){dir 180}..{dir 180}(60,-40)--(50,-40);
draw (50,-38)--(50,-42);
label.lft(btex $B_1$ etex, (50, 40));
label.ulft(btex $S_1$ etex, (40, 20));
label.lft(btex $B_2$ etex, (50,  0));
label.llft(btex $S_2$ etex, (40,-20));
label.lft(btex $B_3$ etex, (50,-40));

draw (0,0)--(-10,0){dir 180}..{dir 180}(-40,40)--(-50,40);
draw (-50,38)--(-50,42);
label.lft(btex $y_n$ etex, (-50,40));

draw (0,0)--(-10,0){dir 180}..{dir 180}(-40,30)--(-50,30);
draw (-50,28)--(-50,32);
label.lft(btex $y_{n-1}$ etex, (-50,30));

draw (0,0)--(-10,0){dir 180}..{dir 180}(-40,0)--(-50,0);
draw (-50,-2)--(-50,2);
label.lft(btex $y_0$ etex, (-50,0));

draw (-50,-28)--(-50,-32);
draw (0,0)--(-10,0){dir 180}..{dir 180}(-40,-30)--(-50,-30);
label.lft(btex $y_{-n}$ etex, (-50,-40));

draw (-50,-38)--(-50,-42);
draw (0,0)--(-10,0){dir 180}..{dir 180}(-40,-40)--(-50,-40);
label.lft(btex $y_{-n+1}$ etex, (-50,-30));

drawarrow (-10,0){dir 180}..{dir 180}(-40,10)--(-50,10)
	--(-60,10){dir 180}..{dir 180}(-90,0)--(-100,0) withcolor(0,0,1);
label.top(btex $y_i$ etex, (-50,10)) withcolor (0,0,1);

endfig;

%
% Operator
%
beginfig(9)

pickup pencircle scaled linewidth;

draw (-20,-15)--(20,-15)--(20,15)--(-20,15)--cycle;
draw (20,0)--(40,0);
drawarrow (-20,0)--(-40,0);
label(btex $A$ etex, (0,0));

endfig;

%
% Operator Matrixelement
%
beginfig(10)

pickup pencircle scaled linewidth;

draw (-20,-15)--(20,-15)--(20,15)--(-20,15)--cycle;
draw (20,0)--(40,0);
draw (-20,0)--(-40,0);
label(btex $A$ etex, (0,0));

draw (120,0)--(100,0){dir 180}..{dir 180}(80,10)
	--(60,10){dir 180}..{dir 180}(40,0);
label.top(btex $a_i$ etex, (70,10));
draw (100,0){dir 180}..{dir 180}(80,-10)--(70,-10);
draw (70,-8)--(70,-12);

drawarrow (-20,0)--(-40,0){dir 180}..{dir 180}(-60,10)
	--(-80,10){dir 180}..{dir 180}(-100,0)--(-120,0);
label.top(btex $a_j$ etex, (-70,10));
draw (-40,0){dir 180}..{dir 180}(-60,-10)--(-70,-10);
draw (-70,-8)--(-70,-12);

endfig;

%
% Zeitentwicklung
%
beginfig(11)

pickup pencircle scaled linewidth;

label.lft(btex $|\psi(t)\rangle$ etex, (-50,0));
drawarrow (-30,0)--(-50,0);
draw (50,0)--(30,0);
draw (-30,-20)--(30,-20)--(30,20)--(-30,20)--cycle;
label(btex $t$ etex, (0,0));
label.rt(btex $|\psi(0)\rangle$ etex, (50,0));

endfig;


end
