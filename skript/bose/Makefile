#
# Makefile -- build graphics for the book on quantum mechanics
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	prob

.SUFFIXES:

prob_FILES = prob-1.pdf
prob: $(prob_FILES)

$(prob_FILES):	prob.mp
	TEX=latex mpost prob.mp
	for i in 1 2 3; \
	do \
		mptopdf prob.$${i}; \
	done

