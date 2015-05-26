#
# Makefile zum Skript ueber Quantenmechanik
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	subdirs skript.pdf

subdirs:
	for d in graphics uebungsaufgaben bell supraleitung flash laser; \
	do \
		cd $${d}; make; cd ..; \
	done

SKRIPTFILES = vorwort.tex einleitung.tex hamilton.tex stoerungstheorie.tex \
	drehimpuls.tex komplex.tex quantisierung.tex hilbert.tex \
	spin.tex magnetfeld.tex h.tex harmonisch.tex einfach.tex \
	quantencomputer.tex heisenberg.tex kugelkoordinaten.tex \
	potentialkasten.tex potentialtopf.tex uebersicht.tex \
	references.bib

ANHARMONISCHFILES = anharmonisch/main.tex
ATOMUHRFILES = atomuhr/main.tex
BELLFILES = bell/main.tex
BOSEFILES = bose/main.tex
CRYPTOFILES = crypto/main.tex
EFELDFILES = efeld/main.tex
FELDQUANTISIERUNGFILES = feldquantisierung/main.tex
FLASHFILES = flash/main.tex
FRANCKHERTZFILES = franckhertz/main.tex
HEISENBERGFILES = heisenberg/main.tex
KUGELFILES = kugel/main.tex
LASERFILES = laser/main.tex
MASERFILES = maser/main.tex
MRIFILES = mri/main.tex
ORBITALEFILES = orbitale/main.tex
QUANTUMDOTFILES = quantumdotfiles/main.tex
RTMFILES = rtm/main.tex
SIMONFILES = simon/main.tex
STARKFILES = stark/main.tex
SUPRALEITUNG = supraleitung/main.tex
TELEPORTFILES = teleport/main.tex
TUNNELDIODEFILES = tunneldiode/main.tex

TEXFILES = $(SKRIPTFILES) \
	$(ANHARMONISCHFILES) \
	$(ATOMUHRFILES) \
	$(BELLFILES) \
	$(BOSEFILES) \
	$(CRYPTOFILES) \
	$(EFELDFILES) \
	$(FELDQUANTISIERUNGFILES) \
	$(FLASHFILES) \
	$(FRANCKHERTZFILES) \
	$(HEISENBERGFILES) \
	$(KUGELFILES) \
	$(LASERFILES) \
	$(MASERFILES) \
	$(MRIFILES) \
	$(ORBITALEFILES) \
	$(RTMFILES) \
	$(SIMONFILES) \
	$(STARKFILES) \
	$(SUPRALEITUNG) \
	$(TELEPORTFILES) \
	$(TUNNELFILES)

BLXFILES = skript1-blx.bbl skript2-blx.bbl skript3-blx.bbl skript4-blx.bbl \
	skript5-blx.bbl skript6-blx.bbl skript7-blx.bbl skript8-blx.bbl \
	skript9-blx.bbl skript10-blx.bbl skript11-blx.bbl skript12-blx.bbl \
	skript13-blx.bbl skript14-blx.bbl skript15-blx.bbl skript16-blx.bbl \
	skript17-blx.bbl

imagetimestamps = tunneldiode_timestamp

articleimages:	$(imagetimestamps)

tunneldiode_timestamp:
	cd tunneldiode; make
	touch tunneldiode/timestamp

skript.pdf:	articleimages skript.tex $(TEXFILES) skript.ind $(IMAGES) \
			$(BLXFILES)
	pdflatex skript.tex
	bibtex skript

skript.ind:	articleimages skript.tex $(TEXFILES)
	touch skript.ind
	pdflatex skript.tex
	(cd supraleitung; mpost phonon.mp)
	makeindex skript.idx

# References

skript.bbl:		skript.aux
	bibtex skript

skript1-blx.bbl:	skript1-blx.aux
	bibtex skript1-blx

skript2-blx.bbl:	skript2-blx.aux
	bibtex skript2-blx

skript3-blx.bbl:	skript3-blx.aux
	bibtex skript3-blx

skript4-blx.bbl:	skript4-blx.aux
	bibtex skript4-blx

skript5-blx.bbl:	skript5-blx.aux
	bibtex skript5-blx

skript6-blx.bbl:	skript6-blx.aux
	bibtex skript6-blx

skript7-blx.bbl:	skript7-blx.aux
	bibtex skript7-blx

skript8-blx.bbl:	skript8-blx.aux
	bibtex skript8-blx

skript9-blx.bbl:	skript9-blx.aux
	bibtex skript9-blx

skript10-blx.bbl:	skript10-blx.aux
	bibtex skript10-blx

skript11-blx.bbl:	skript11-blx.aux
	bibtex skript11-blx

skript12-blx.bbl:	skript12-blx.aux
	bibtex skript12-blx

skript13-blx.bbl:	skript13-blx.aux
	bibtex skript13-blx

skript14-blx.bbl:	skript14-blx.aux
	bibtex skript14-blx

skript15-blx.bbl:	skript15-blx.aux
	bibtex skript15-blx

skript16-blx.bbl:	skript16-blx.aux
	bibtex skript16-blx

skript17-blx.bbl:	skript17-blx.aux
	bibtex skript17-blx


