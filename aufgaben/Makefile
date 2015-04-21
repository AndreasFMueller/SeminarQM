#
# Makefile -- build the instructions
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	vortragsnoten.txt

zuteilung.pdf:	zuteilung.tex
	pdflatex zuteilung.tex

seminararbeit.pdf:	seminararbeit.tex aufgaben.tex
	pdflatex seminararbeit.tex

praesentation.pdf:	praesentation.tex
	pdflatex praesentation.tex

planung.pdf:	planung.tex
	pdflatex planung.tex

vortragsnoten.txt:	vortragsnoten.R vortraege.csv
	R --vanilla --quite --slave -f vortragsnoten.R | tee vortragsnoten.txt
