#
# Makefile -- build graphics for the book on quantum mechanics
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	pert analysator arctan drehimpuls gatter dependencies periodensystem \
	potential harmonisch heisenberg lagrange h linear fest

fest_FILES = fest-1.pdf
fest: $(fest_FILES)

linear_FILES = linear-1.pdf
linear:	$(linear_FILES)

h_FILES = h-1.pdf
h:	$(h_FILES)

lagrange_FILES = lagrange-1.pdf
lagrange:	$(lagrange_FILES)

heisenberg_FILES = heisenberg-1.pdf
heisenberg:	$(heisenberg_FILES)

harmonisch_FILES = harmonisch-1.pdf
harmonisch:	$(harmonisch_FILES)

potential_FILES = potential-1.pdf potential-2.pdf potential-3.pdf
potential:	$(potential_FILES)

dependencies_FILES = dependencies-1.pdf
dependencies: $(dependencies_FILES)

pert_FILES = pert-1.pdf pert-2.pdf pert-3.pdf
pert:	$(pert_FILES)

analysator_FILES = analysator-1.pdf analysator-2.pdf analysator-3.pdf \
	analysator-4.pdf analysator-5.pdf analysator-6.pdf analysator-7.pdf \
	analysator-8.pdf analysator-9.pdf analysator-10.pdf analysator-11.pdf
analysator:	$(analysator_FILES)

arctan_FILES = arctan-1.pdf
arctan:	$(arctan_FILES)

drehimpuls_FILES = drehimpuls-1.pdf drehimpuls-2.pdf drehimpuls-3.pdf
drehimpuls: $(drehimpuls_FILES)

gatter_FILES = gatter-1.pdf gatter-2.pdf gatter-3.pdf gatter-4.pdf \
	gatter-5.pdf gatter-6.pdf gatter-7.pdf gatter-8.pdf gatter-9.pdf \
	gatter-10.pdf gatter-11.pdf gatter-12.pdf
gatter: $(gatter_FILES)

periodensystem_FILES = periodensystem-1.pdf
periodensystem: $(periodensystem_FILES)

$(pert_FILES):	pert.mp
	TEX=latex mpost pert.mp
	for i in 1 2 3; \
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
	for i in 1 2 3; \
	do \
		mptopdf drehimpuls.$${i}; \
	done

$(gatter_FILES):	gatter.mp
	TEX=latex mpost gatter.mp
	for i in 1 2 3 4 5 6 7 8 9 10 11 12; \
	do \
		mptopdf gatter.$${i}; \
	done

$(dependencies_FILES):	dependencies.mp
	TEX=latex mpost dependencies.mp
	for i in 1; \
	do \
		mptopdf dependencies.$${i}; \
	done

$(periodensystem_FILES):	periodensystem.mp
	TEX=latex mpost periodensystem.mp
	for i in 1 2 3 4; \
	do \
		mptopdf periodensystem.$${i}; \
	done

$(potential_FILES):	potential.mp
	TEX=latex mpost potential.mp
	for i in 1 2 3 4 5; \
	do \
		mptopdf potential.$${i}; \
	done

$(harmonisch_FILES):	harmonisch.mp
	TEX=latex mpost harmonisch.mp
	for i in 1; \
	do \
		mptopdf harmonisch.$${i}; \
	done

$(heisenberg_FILES):	heisenberg.mp
	TEX=latex mpost heisenberg.mp
	for i in 1; \
	do \
		mptopdf heisenberg.$${i}; \
	done

$(lagrange_FILES):	lagrange.mp
	TEX=latex mpost lagrange.mp
	for i in 1; \
	do \
		mptopdf lagrange.$${i}; \
	done

$(h_FILES):	h.mp
	TEX=latex mpost h.mp
	for i in 1; \
	do \
		mptopdf h.$${i}; \
	done

$(linear_FILES):	linear.mp
	TEX=latex mpost linear.mp
	for i in 1; \
	do \
		mptopdf linear.$${i}; \
	done

$(fest_FILES):	fest.mp
	TEX=latex mpost fest.mp
	for i in 1; \
	do \
		mptopdf fest.$${i}; \
	done

airyzeros:	airyzeros.c
	gcc -o airyzeros airyzeros.c -l gsl -lgslcblas -lm
