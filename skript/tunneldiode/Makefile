#
# Makefile -- build components for book cover
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
tunnel_files = tunnel-1.pdf tunnel-2.pdf tunnel-3.pdf tunnel-4.pdf \
	tunnel-5.pdf tunnel-6.pdf tunnel-7.pdf tunnel-8.pdf tunnel-9.pdf \
	tunnel-10.pdf tunnel-11.pdf tunnel-12.pdf tunnel-13.pdf tunnel-14.pdf \
	tunnel-15.pdf

all:	$(tunnel_files) schematic.pdf

$(tunnel_files): tunnel.mp
	TEX=latex mpost tunnel.mp
	for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; \
	do \
		mptopdf tunnel.$${i}; \
	done

schematic.pdf:	schematic.tex
	pdflatex schematic.tex
