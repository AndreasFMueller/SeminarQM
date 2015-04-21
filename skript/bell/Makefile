# Makefile for Bell
# 21.04.2015 / HB

all:
	for d in experiment_setup.tex hidden_vars.tex; \
	do \
	    cd images; \
		xelatex -synctex=1 -interaction=nonstopmode $${d}; \
		cd ..; \
	done