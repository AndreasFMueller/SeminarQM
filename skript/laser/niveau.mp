%
% niveau.mp -- Darstellung der Niveaus eines Lasers
%
% (c) 2015
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
unit := 10;
numeric breite;
breite = 34 * unit;

% Makros zum Zeichnen eines gewellten Pfeils (als Symbol fÃ¼r emittiertes
% bzw. absorbiertes Licht
numeric s;
s := 4;

def wigglyarrow(expr p, c) =
	pickup pencircle scaled 1pt;
	path q;
	q := p;
	for i = 1 step 2 until 9:
		q := q{dir 45}..{dir -45}(p shifted (i * s, 0));
		q := q{dir -45}..{dir 45}(p shifted ((i + 1) * s, 0));
	endfor;
	draw q withcolor c;
	drawarrow (p shifted (10 * s,0))--(p shifted (11 * s, 0)) withcolor c;
enddef;

%
% Bild 1: Zweiniveau-System
%
beginfig(1)

% Energieniveaus festlegen
numeric Eeins;
numeric Ezwei;

Eeins = 0;
Ezwei = 10 * unit;

% horizontale positionen
numeric mitte;
mitte = breite / 2;

numeric links;
links = mitte / 2 - 20;
numeric rechts;
rechts = 0.75 * breite + 20;

% Niveaus mit Strichbreite 1.5pt zeichnen
pickup pencircle scaled 1.5pt;

draw (0,Eeins)--(breite,Eeins);
draw (0,Ezwei)--(breite,Ezwei);

label.rt(btex $E_1,\;|1\rangle$ etex, (breite,Eeins));
label.rt(btex $E_2,\;|2\rangle$ etex, (breite,Ezwei));

% Niveauuebergange mit Strichbreite 1
pickup pencircle scaled 1pt;
drawarrow (mitte,Ezwei)--(mitte,Eeins) withcolor blue;
% Punkt am Beginn des Niveauuebergangs
pickup pencircle scaled 3pt;
draw (mitte,Ezwei) withcolor blue;

pickup pencircle scaled 1pt;
drawarrow (links,Ezwei)--(links,Eeins) withcolor red;
drawarrow (rechts,Eeins)--(rechts,Ezwei) withcolor red;
pickup pencircle scaled 3pt;
draw (links,Ezwei) withcolor red;
draw (rechts,Eeins) withcolor red;

numeric Emitte;
Emitte = (Ezwei + Eeins) / 2;

% Stimulierte Emission
wigglyarrow((links - 50, Emitte), red);

wigglyarrow((links + 5, Emitte + 3), red);
wigglyarrow((links + 5, Emitte - 3), red);
%label.top(btex stimulierte Emission etex, (links, Ezwei)) withcolor red;
label.lft(btex $B_{21}$ etex, (links, (3 * Ezwei + Eeins) / 4)) withcolor red;

% Stimulierte Absorbtion
wigglyarrow((rechts - 50, Emitte + 3), red);
wigglyarrow((rechts - 50, Emitte - 3), red);

wigglyarrow((rechts + 5, Emitte), red);
%label.top(btex stimulierte Absorbtion etex, (rechts, Ezwei)) withcolor red;
label.lft(btex $B_{12}$ etex, (rechts, (3 * Ezwei + Eeins) / 4)) withcolor red;

% Spontane Emission
wigglyarrow((mitte + 5, Emitte), blue);
%label.bot(btex spontane Emission etex, (mitte, Eeins)) withcolor blue;
label.lft(btex $A_{21}$ etex, (mitte, (3 * Ezwei + Eeins) / 4)) withcolor blue;

endfig;

%
% Bild 2: Dreizustandssystem
%
beginfig(2)

numeric Edrei;
Edrei = 1.2 * Ezwei;
numeric Emitte;
Emitte = (Ezwei + Eeins) / 2;

links := 0.4 * breite;
mitte := 0.6 * breite;
rechts := 0.8 * breite;

pickup pencircle scaled 1.5pt;

draw (0,Eeins)--(breite,Eeins);
draw (0,Ezwei)--(breite,Ezwei);
draw (0,Edrei)--(breite,Edrei);

label.rt(btex $E_1,\;|1\rangle$ etex, (breite,Eeins));
label.rt(btex $E_2,\;|2\rangle$ etex, (breite,Ezwei));
label.rt(btex $E_3,\;|3\rangle$ etex, (breite,Edrei));

% spontane Emission
pickup pencircle scaled 1pt;
drawarrow (links,Ezwei)--(links,Eeins) withcolor blue;
drawarrow (links,Edrei)--(links,Ezwei) withcolor blue;
pickup pencircle scaled 3pt;
draw (links,Ezwei) withcolor blue;
draw (links,Edrei) withcolor blue;
wigglyarrow((links + 5, 0.5 * (Edrei + Ezwei)), blue);
label.lft(btex $A_{32}$ etex, (links, (Edrei + Ezwei) / 2)) withcolor blue;
wigglyarrow((links + 5, 0.25 * Ezwei), blue);
label.lft(btex $A_{21}$ etex, (links, (3 * Ezwei + Eeins) / 4)) withcolor blue;

% stimulierte Prozesse
pickup pencircle scaled 1pt;
drawarrow (mitte,Ezwei)--(mitte,Eeins) withcolor red;
drawarrow (rechts,Eeins)--(rechts,Ezwei) withcolor red;
pickup pencircle scaled 3pt;
draw (mitte,Ezwei) withcolor red;
draw (rechts,Eeins) withcolor red;

% Stimulierte Emission
wigglyarrow((mitte - 50, Emitte), red);

wigglyarrow((mitte + 5, Emitte + 3), red);
wigglyarrow((mitte + 5, Emitte - 3), red);
label.lft(btex $B_{21}$ etex, (mitte, (3 * Ezwei + Eeins) / 4)) withcolor red;

% Stimulierte Absorbtion
wigglyarrow((rechts - 50, Emitte + 3 - 30), red);
wigglyarrow((rechts - 50, Emitte - 3 - 30), red);

wigglyarrow((rechts + 5, Emitte - 30), red);
label.lft(btex $B_{12}$ etex, (rechts, (3 * Ezwei + Eeins) / 4)) withcolor red;

% Spontane Emission

% Pumpe
numeric pumpe;
pumpe = 0.2 * breite;
wigglyarrow((pumpe - 50, (Edrei + Eeins)/2), green);
drawarrow (pumpe, Eeins)--(pumpe,Edrei) withcolor green;
pickup pencircle scaled 3pt;
draw (pumpe, Eeins) withcolor green;
label.lft(btex $B_{13}$ etex, (pumpe, (3 * Ezwei + Eeins) / 4)) withcolor green;

endfig;

%
% Bild 3: spontane Emission
%
beginfig(3)
numeric unit;
unit := 10;
numeric breite;
breite = 15 * unit;

numeric Emitte;
Emitte = (Ezwei + Eeins) / 2;


mitte := 0.5 * breite;


pickup pencircle scaled 1.5pt;

draw (0,Eeins)--(breite,Eeins);
draw (0,Ezwei)--(breite,Ezwei);

label.rt(btex $E_1,\;|1\rangle$ etex, (breite,Eeins));
label.rt(btex $E_2,\;|2\rangle$ etex, (breite,Ezwei));

% spontane Emission
pickup pencircle scaled 1pt;
drawarrow (mitte,Ezwei)--(mitte,Eeins) withcolor blue;
pickup pencircle scaled 3pt;
draw (mitte,Ezwei) withcolor blue;
wigglyarrow((mitte + 5, 0.5* Ezwei), blue);
label.lft(btex $A_{21}$ etex, (mitte, (Ezwei + Eeins) / 2+20)) withcolor blue;

endfig;



%
% Bild 4: stimulierte Emission
%
beginfig(4)
numeric unit;
unit := 10;
numeric breite;
breite = 15 * unit;

numeric Emitte;
Emitte = (Ezwei + Eeins) / 2;


mitte := 0.5 * breite;


pickup pencircle scaled 1.5pt;

draw (0,Eeins)--(breite,Eeins);
draw (0,Ezwei)--(breite,Ezwei);

label.rt(btex $E_1,\;|1\rangle$ etex, (breite,Eeins));
label.rt(btex $E_2,\;|2\rangle$ etex, (breite,Ezwei));

pickup pencircle scaled 1pt;
drawarrow (mitte,Ezwei)--(mitte,Eeins) withcolor red;
pickup pencircle scaled 3pt;
draw (mitte,Ezwei) withcolor red;
wigglyarrow((mitte + 5, 0.5* Ezwei+5), red);
wigglyarrow((mitte + 5, 0.5* Ezwei-5), red);
wigglyarrow((mitte -50, 0.5* Ezwei), red);
label.lft(btex $B_{21}$ etex, (mitte, (Ezwei + Eeins) / 2+20)) withcolor red;

endfig;


%
% Bild 5: stimulierte Absorption
%
beginfig(5)
numeric unit;
unit := 10;
numeric breite;
breite = 15 * unit;

numeric Emitte;
Emitte = (Ezwei + Eeins) / 2;


mitte := 0.5 * breite;


pickup pencircle scaled 1.5pt;

draw (0,Eeins)--(breite,Eeins);
draw (0,Ezwei)--(breite,Ezwei);

label.rt(btex $E_1,\;|1\rangle$ etex, (breite,Eeins));
label.rt(btex $E_2,\;|2\rangle$ etex, (breite,Ezwei));

pickup pencircle scaled 1pt;
drawarrow (mitte,Eeins)--(mitte,Ezwei) withcolor red;
pickup pencircle scaled 3pt;
draw (mitte,Eeins) withcolor red;
wigglyarrow((mitte -50, 0.5* Ezwei+5), red);
wigglyarrow((mitte -50, 0.5* Ezwei-5), red);
wigglyarrow((mitte +5, 0.5* Ezwei), red);
label.lft(btex $B_{12}$ etex, (mitte, (Ezwei + Eeins) / 2+20)) withcolor red;

endfig;



% NEU!!
% Bild 6: stimulierte Prozesse
%
beginfig(6)
numeric unit;
unit := 10;

numeric breite;
breite = 30 * unit;

numeric Eeins;
numeric Ezwei;
numeric Emitte;

Eeins = 0;
Ezwei = 10 * unit;
Emitte = (Ezwei + Eeins) / 2;

numeric links;
numeric rechts;
links := 0.25*breite;
rechts := 0.75*breite;

pickup pencircle scaled 1.5pt;

draw (0,Eeins)--(breite,Eeins);
draw (0,Ezwei)--(breite,Ezwei);

label.rt(btex $E_1,\;|1\rangle$ etex, (breite,Eeins));
label.rt(btex $E_2,\;|2\rangle$ etex, (breite,Ezwei));

%---------------------
%Stimulierte Emission

pickup pencircle scaled 1pt;
drawarrow (links,Ezwei)--(links,Eeins) withcolor red;
pickup pencircle scaled 3pt;
draw (links,Ezwei) withcolor red;
wigglyarrow((links + 5, 0.5* Ezwei+5), red);
wigglyarrow((links + 5, 0.5* Ezwei-5), red);
wigglyarrow((links -50, 0.5* Ezwei), red);
label.lft(btex $B_{21}$ etex, (links, (Ezwei + Eeins) / 2+20)) withcolor red;

%---------------------
%Stimulierte Absorption

pickup pencircle scaled 1pt;
drawarrow (rechts,Eeins)--(rechts,Ezwei) withcolor red;
pickup pencircle scaled 3pt;
draw (rechts,Eeins) withcolor red;
wigglyarrow((rechts -50, 0.5* Ezwei+5), red);
wigglyarrow((rechts -50, 0.5* Ezwei-5), red);
wigglyarrow((rechts +5, 0.5* Ezwei), red);
label.lft(btex $B_{12}$ etex, (rechts, (Ezwei + Eeins) / 2+20)) withcolor red;

endfig;

end

