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

drawarrow (0,-10)--(0,120);
label.ulft(btex $\sqrt{\lambda}$ etex,(0,120));
drawarrow (-120,0)--(120,0);
label.urt(btex $l_3$ etex, (120,0));

drawarrow (30,45)--(45,45) withcolor (1,0,0);
label.bot(btex $L_+$ etex, (45,45)) withcolor (1,0,0);
drawarrow (-30,45)--(-45,45) withcolor (1,0,0);
label.bot(btex $L_-$ etex, (-45,45)) withcolor (1,0,0);

pickup pencircle scaled 3pt;

draw (0,0);

for l = 0 step 15 until 105:
	for m = -l step 15 until l:
		draw(m,l);
	endfor
endfor

endfig;

beginfig(2)

pickup pencircle scaled 1pt;

drawarrow (-10,0)--(120,0);
drawarrow (0,-10)--(0,120);
label.ulft(btex $a_2$ etex, (0,120));
label.urt(btex $a_1$ etex, (120,0));

drawarrow (22.5 * sqrt(2), 37.5 * sqrt(2))--(22.5 * sqrt(2), 52.5 * sqrt(2))
	withcolor (1,0,0);
label.rt(btex $a_2^+$ etex, (22.5 * sqrt(2), 52.5 * sqrt(2))) withcolor(1,0,0);

drawarrow (45 * sqrt(2), 15 * sqrt(2))--(60 * sqrt(2), 15 * sqrt(2))
	withcolor (1,0,0);
label.top(btex $a_1^+$ etex, (60 * sqrt(2), 15 * sqrt(2))) withcolor(1,0,0);

pickup pencircle scaled 3pt;

for a = 0 step 15 until 75:
	for b = 0 step 15 until 75 - a:
		draw(a * sqrt(2),b * sqrt(2));
	endfor;
endfor;
for a = 0 step 15 until 75:
	for b = 0 step 15 until 60 - a:
		draw((a + 7.5) * sqrt(2), (b + 7.5) * sqrt(2));
	endfor;
endfor;

endfig;

end
