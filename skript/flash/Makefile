#
# Makefile -- build graphics for the book on quantum mechanics
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	potential

.SUFFIXES:

potential_FILES = potential-1.pdf
potential:	$(potential_FILES)

$(potential_FILES):	potential.mp
	TEX=latex mpost potential.mp
	for i in 1; \
	do \
		mptopdf potential.$${i}; \
	done

