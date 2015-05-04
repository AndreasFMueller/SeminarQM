#
# vortragsnoten.R -- auswerteskript fuer Benotung der Vortraege
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
d <- read.csv("vortraege.csv")
d

d$stimmen = d$sg + d$g + d$gn + d$ug
d$note = (6 * d$sg + 5 * d$g + 4 * d$gn + 3 * d$ug) / d$stimmen

d
d$Rubrik == "A1"
summary(d)

unique(d$Thema)
r <- data.frame(unique(d$Thema))
colnames(r)[1] = "Thema"

# Teilnoten hinzufügen
r$A1 = round(d$note[(d$Rubrik == "A1")], digits = 2)
r$A2 = round(d$note[(d$Rubrik == "A2")], digits = 2)
r$A3 = round(d$note[(d$Rubrik == "A3")], digits = 2)
r$A4 = round(d$note[(d$Rubrik == "A4")], digits = 2)
r$A5 = round(d$note[(d$Rubrik == "A5")], digits = 2)
r$B1 = round(d$note[(d$Rubrik == "B1")], digits = 2)
r$B2 = round(d$note[(d$Rubrik == "B2")], digits = 2)
r$B3 = round(d$note[(d$Rubrik == "B3")], digits = 2)
r$B4 = round(d$note[(d$Rubrik == "B4")], digits = 2)
r$B5 = round(d$note[(d$Rubrik == "B5")], digits = 2)

# Sortieren
r <- r[order(r$Thema),]
# Mittelwerte der Noten werden aus den nicht gerundeten Noten berechnet
# und dem Dataframe hinzugefügt
r$note = round(aggregate(d$note, by=list(d$Thema), FUN=mean)[2], digits = 2)
colnames(r)[12] = "Note"

# Resultate anzeigen
r
