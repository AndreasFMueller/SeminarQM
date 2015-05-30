#
# Makefile MathSem Praesentation
#
# TStauber
#

presentation.pdf: main.tex
	mkdir -p temp
	xelatex -output-directory=temp -halt-on-error main.tex
	mv temp/main.pdf presentation.pdf

clean:
	rm temp/*
