#
# Makefile zum Skript ueber High Performance Computing
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	subdirs skript.pdf

subdirs:
	for d in graphics ; \
	do \
		cd $${d}; make; cd ..; \
	done

TEXFILES = vorwort.tex einleitung.tex hamilton.tex stoerungstheorie.tex \
	drehimpuls.tex komplex.tex quantisierung.tex hilbert.tex \
	spin.tex magnetfeld.tex h.tex harmonisch.tex einfach.tex \
	quantencomputer.tex heisenberg.tex kugelkoordinaten.tex \
	potentialkasten.tex potentialtopf.tex \
	references.bib

BLXFILES = skript1-blx.bbl

skript.pdf:	skript.tex $(TEXFILES) skript.ind $(IMAGES) $(BLXFILES)
	pdflatex skript.tex
	bibtex skript

skript.ind:	skript.tex $(TEXFILES)
	touch skript.ind
	pdflatex skript.tex
	makeindex skript.idx

# References

skript.bbl:		skript.aux
	bibtex skript

skript1-blx.bbl:	skript1-blx.aux
	bibtex skript1-blx
