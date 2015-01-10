#
# Makefile --
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	pert analysator arctan drehimpuls

pert_FILES = pert-1.pdf
pert:	$(pert_FILES)

analysator_FILES = analysator-1.pdf analysator-2.pdf analysator-3.pdf \
	analysator-4.pdf analysator-5.pdf analysator-6.pdf analysator-7.pdf \
	analysator-8.pdf analysator-9.pdf analysator-10.pdf analysator-11.pdf
analysator:	$(analysator_FILES)

arctan_FILES = arctan-1.pdf
arctan:	$(arctan_FILES)

drehimpuls_FILES = drehimpuls-1.pdf drehimpuls-2.pdf
drehimpuls: $(drehimpuls_FILES)

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

$(arctan_FILES):	arctan.mp
	TEX=latex mpost arctan.mp
	for i in 1; \
	do \
		mptopdf arctan.$${i}; \
	done

$(drehimpuls_FILES):	drehimpuls.mp
	TEX=latex mpost drehimpuls.mp
	for i in 1 2; \
	do \
		mptopdf drehimpuls.$${i}; \
	done
	
