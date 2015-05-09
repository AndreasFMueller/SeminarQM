#
# Makefile -- Gitter-Graphiken
#
gitter_FILES = gitter-1.pdf gitter-2.pdf gitter-3.pdf gitter-4.pdf

$(gitter_FILES):	gitter.mp
	TEX=latex mpost gitter.mp
	for i in 1 2 3 4; \
	do \
		mptopdf gitter.$${i}; \
	done
