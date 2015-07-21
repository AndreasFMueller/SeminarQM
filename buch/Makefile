#
# Makefile -- build components for book cover
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
imagefiles = tunnel-1.pdf tunnel-2.pdf tunnel-3.pdf

all:	$(imagefiles) anschlag.pdf

timestamp:	$(imagefiles)
	touch timestamp

$(imagefiles):	tunnel.mp
	TEX=latex mpost tunnel.mp
	mptopdf tunnel.1
	mptopdf tunnel.2
	mptopdf tunnel.3

anschlag.pdf:	anschlag.tex qm-title.png
	pdflatex anschlag.tex
