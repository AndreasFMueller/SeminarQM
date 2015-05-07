# Makefile for Bell
# 21.04.2015 / HB

all: xelatex latex

xelatex:
	for d in experiment_setup.tex hidden_vars.tex what_if.tex raum_korr.tex; \
	do \
	    cd images; \
		xelatex -synctex=1 -interaction=nonstopmode $${d}; \
		cd ..; \
	done
    
latex:
	for d in freedman.tex; \
	do \
		cd images; \
		pdflatex -synctex=1 -interaction=nonstopmode $${d}; \
		cd ..; \
	done