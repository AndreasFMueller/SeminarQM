%
% gitter.mp -- Gitter-Darstellung für Cooper Paare
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
unit = 30; % Gitterkonstante
path frame;
frame = ((0.5,0.5)--(6.5,0.5)--(6.5,4.5)--(0.5,4.5)--cycle) scaled unit;

def gitter(expr col) =
	pickup pencircle scaled 0.5pt;
	for x = 0 step 1 until 8:
		for y = 0 step 1 until 8:
			draw ((x,y) * unit)--((x+1,y) * unit) withcolor col;
			draw ((x,y) * unit)--((x,y+1) * unit) withcolor col;
		endfor;
	endfor;
	for x = 0 step 1 until 8:
		for y = 0 step 1 until 8:
			pickup pencircle scaled 4pt;
			draw ((x,y) * unit) withcolor white;
			pickup pencircle scaled 3pt;
			draw ((x,y) * unit) withcolor col;;
			pickup pencircle scaled 2pt;
			draw ((x,y) * unit) withcolor white;
		endfor;
	endfor;
enddef;

def gitteroffset(expr x, y, wox, woy, wieviel) =
	if (((x < wox) or (x > wox + 1)) or ((y < woy) or (y > woy + 1))):
		0
	else:
		wieviel
	fi
enddef;

def gitterpunkt(expr x, y, wox, woy, wieviel) =
	(x * unit + gitteroffset(x,y,wox,woy,wieviel), y * unit)
enddef;

color yellow;
yellow = (1,1,0);

% verschobenes Gitter
% wox        x-Position der linken unteren Ecke des verschobenen Quadrates
% woy        y-Position der linken unteren Ecke des verschobenen Quadrates
% wieviel    Offset des verschobenen Quadrates
% col        Farbe des Gitters
% colversch  Farbe des verschobenen Quadrates
def gitterverschoben(expr wox, woy, wieviel,col,colversch) =
	pickup pencircle scaled 0.5pt;
	color	c;
	c := col;
	for x = 0 step 1 until 8:
		for y = 0 step 1 until 8:
			pickup pencircle scaled 0.5pt;
			if (x = wox) and ((y = woy) or (y = woy + 1)):
				pickup pencircle scaled 1.5pt;				
				c := colversch;
			else:
				c := col;
			fi;
			draw gitterpunkt(x,y,wox,woy,wieviel)
				--gitterpunkt(x+1,y,wox,woy,wieviel)
					withcolor c;
			pickup pencircle scaled 0.5pt;
			if (y = woy) and ((x = wox) or (x = wox + 1)):
				pickup pencircle scaled 1.5pt;
				c := colversch;
			else:
				c := col;
			fi;
			draw gitterpunkt(x,y,wox,woy,wieviel)
				--gitterpunkt(x,y+1,wox,woy,wieviel)
					withcolor c;
		endfor;
	endfor;
	for x = 0 step 1 until 8:
		for y = 0 step 1 until 8:
			pickup pencircle scaled 4pt;
			draw gitterpunkt(x,y,wox,woy,wieviel) withcolor white;
			pickup pencircle scaled 3pt;
			if (x < wox) or (x > wox+1) or (y < woy) or (y > woy+1):
				c := col;
			else:
				pickup pencircle scaled 4pt;
				c := colversch; 
			fi;
			draw gitterpunkt(x,y,wox,woy,wieviel) withcolor c;
			pickup pencircle scaled 2pt;
			draw gitterpunkt(x,y,wox,woy,wieviel) withcolor white;
		endfor;
	endfor;
enddef;

%
% ungestörtes Gitter
%
beginfig(1)

gitter(red);
clip currentpicture to frame;

endfig;

%
% verschobenes Gitter
%
beginfig(2)

gitterverschoben(2,2,0.2*unit,red,(1,0.55,0));
clip currentpicture to frame;

pickup pencircle scaled 1pt;
drawarrow ((1.2,5  )*unit)--((  2,2.5)*unit) withcolor blue;
drawarrow ((  2,2.5)*unit)--((1.2,0  )*unit) withcolor (0.5,0,0.5);
label.top(btex $k'  $ etex, (1.5,4.5)*unit) withcolor blue;
label.bot(btex $k'-q$ etex, (1.8,0.5)*unit) withcolor (0.5,0,0.5);
label(btex \textbf{\textit{q}} etex, (2.7,2.5)*unit) withcolor (1,0.55,0);

endfig;

beginfig(3)
gitterverschoben(3,2,0.2*unit,red,(1,0.55,0));
clip currentpicture to frame;
label(btex \textbf{\textit{q}} etex, (3.7,2.5)*unit) withcolor (1,0.55,0);
endfig;

beginfig(4)
gitterverschoben(4,2,0,red,(1,0.55,0));
clip currentpicture to frame;
pickup pencircle scaled 1pt;
drawarrow ((6.0,5  )*unit)--((5.2,2.5)*unit) withcolor blue;
drawarrow ((5.2,2.5)*unit)--((6.0,0  )*unit) withcolor (0.5,0,0.5);
label.top(btex $k  $ etex, (5.7,4.5)*unit) withcolor blue;
label.bot(btex $k+q$ etex, (5.4,0.5)*unit) withcolor (0.5,0,0.5);
endfig;

end
