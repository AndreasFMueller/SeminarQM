#
# Makefile -- build components for book cover
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	$(tunnel_files) schematic.pdf

tunnel_files = tunnel-1.pdf tunnel-2.pdf tunnel-3.pdf tunnel-4.pdf \
	tunnel-5.pdf tunnel-6.pdf tunnel-7.pdf

$(tunnel_files): tunnel.mp
	TEX=latex mpost tunnel.mp
	for i in 1 2 3 4 5 6 7 8; \
	do \
		mptopdf tunnel.$${i}; \
	done

schematic.pdf:	schematic.tex
	pdflatex schematic.tex
