#
# Makefile -- komponenten bauen
#
laser_files = niveau-1.pdf niveau-2.pdf niveau-3.pdf niveau-4.pdf\
	niveau-5.pdf niveau-6.pdf

all: $(laser_files)

$(laser_files):	niveau.mp
	TEX=latex mpost niveau.mp
	for i in 1 2 3 4 5 6; \
	do \
		mptopdf niveau.$${i}; \
	done
	