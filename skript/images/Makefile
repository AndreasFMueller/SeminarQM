#
# Makefile --
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	pert

pert_FILES = pert-1.pdf
pert:	$(pert_FILES)

$(pert_FILES):	pert.mp
	TEX=latex mpost pert.mp
	for i in 1; \
	do \
		mptopdf pert.$${i}; \
	done
