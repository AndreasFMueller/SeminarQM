verbatimtex
\documentclass{book}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

pickup pencircle scaled 1pt;

numeric a;
a := 63.661977;

def f(expr t) =
	2 * a * ((mexp(t) / (mexp(t) + 1)) - 0.5)
enddef;

numeric s;
s := 10;
numeric l;
l := 1;
numeric c;
c := 8;
for b = 0 step 1 until 8:
	l := 2 * l;
	draw (-200 * c / l, f(-200 * s))
	for t = -198 step 2 until 200:
		..(c * t / l, f(s * t))
	endfor;
endfor;
clip currentpicture to (-200,-a)--(200,-a)--(200,a)--(-200,a)--cycle;

pickup pencircle scaled 0.5pt;

drawarrow (-210,0)--(210,0);
draw (-200,-2)--(-200,2);
draw (200,-2)--(200,2);

label.bot(btex $-\pi$ etex, (-200,0));
label.bot(btex $ \pi$ etex, ( 200,0));

drawarrow (0, -a - 10)--(0,a + 10);
draw (-3,-a)--(3,-a);
draw (-3, a)--(3, a);

pickup pencircle scaled 1.5pt;
draw (-200,-a)--(0,-a) withcolor (1,0,0);
draw ( 200, a)--(0, a) withcolor (1,0,0);

pickup pencircle scaled 4pt;
draw (0,-a) withcolor (1,0,0);
draw (0, a) withcolor (1,0,0);
draw (0, 0) withcolor (1,0,0);

pickup pencircle scaled 2pt;
draw (0,-a) withcolor (1,1,1);
draw (0, a) withcolor (1,1,1);

label.lft(btex $1$ etex, (-3,a));
label.rt(btex $-1$ etex, (3,-a));

label.top(btex $x$ etex, (205,3));
label.lft(btex $y$ etex, (0,a + 10));

endfig;

end
