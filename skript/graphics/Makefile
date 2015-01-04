#
# Makefile --
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	pert analysator

pert_FILES = pert-1.pdf
pert:	$(pert_FILES)

analysator_FILES = analysator-1.pdf analysator-2.pdf
analysator:	$(analysator_FILES)

$(pert_FILES):	pert.mp
	TEX=latex mpost pert.mp
	for i in 1; \
	do \
		mptopdf pert.$${i}; \
	done

$(analysator_FILES):	analysator.mp
	TEX=latex mpost analysator.mp
	for i in 1 2 3 4 5 6 7 8 9 10 11; \
	do \
		mptopdf analysator.$${i}; \
	done
