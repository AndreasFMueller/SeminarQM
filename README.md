SeminarQM
=========

Das mathematische Seminar 2015 an der HSR befasst sich mit
Quantenmechanik. Ziel ist, die Grundlagen der Quantenmechanik soweit zu
verstehen, dass man die Funktion interessanter technischer Anwendungen
nachvollziehen kann, zum Beispiel Laser, Atomuhr, Tunneldiode, MRI oder
Flash-Speicher.

Erstmals wird auch ein Master-Seminar durchgeführt, das Skript trägt
diesem Umstand durch ein erweitertes Stoff-Angebot Rechnung.

Dieses GIT-Modul beinhaltet alle im Laufe des Seminars angefallenen
Artefakte, und alle zur Produktion des Buches notwendigen Objekte.
Die Unterverzeichnisse enthalten Folgendes:

aufgaben
	Eine Anleitung zur Seminar-Arbeit und eine Kurzbeschreibung
	der vorgeschlagenen Seminar-Arbeitsthemen.

buch
	Objekte für die Produktion des Buches, insbesondere das Umschlagsbild

skript
	Das vollständige Skript im Source-Code sowie der Source-Code für
	alle Seminar-Arbeiten


Git einrichten
--------------

Um Git auf Linux zu installieren, sollte das Repository der jeweiligen
Distribution verwendet werden.

Beispiel Debian oder Ubuntu:

	sudo apt-get install git

Um das Projekt auf den Rechner zu kopieren, legen sie zuerst auf
Github einen Fork des Originals
(https://github.com/AndreasFMueller/SeminarQM) an.

Um beim Projekt mit ssh arbeiten zu können wird ein Schlüssel
benötigt, Sie können diesen mit folgendem Befehl generieren:

	ssh-keygen -t rsa -b 4096

Der Schlüssel muss auf Github in ihrem Account hinterlegt werden.

Klonen Sie nun das Projekt von ihrem eigen Account:

	git clone git@github.com:${AccountName}/SeminarQM.git

Wechseln Sie in das frisch angelegte Verzeichnis und fügen sie das
Original Repository dazu:

	git remote add -t master original https://github.com/AndreasFMueller/SeminarQM.git

Ab jetzt können Sie den aktuellen Stand des Repos mit folgendem Befehl
einpflegen:

	git pull original master


TeX-Installation
----------------

Das Skript ist vollständig mit Werkzeugen gebaut, welche sich in einer
TeX-Installation normalerweise leicht einfügen lassen. Zum Beispiel
sind die Graphiken wenn immer möglich mit Metapost erzeugt, und wenn
Metapost selbst nicht die nötigen mathematischen Fähigkeiten verfügt,
wurde ein Octave-Skript vorgesehen, welches das Metapost-Skript berechnet.
Das Makefile im skript-Verzeichnis trägt diesen Abhängigkeiten Rechnung,
und erzeugt PDF-Versionen der Bilder 

Eine TeX-Standardinstallation enthält nicht unbedingt alle Packages,
die man zum Kompilieren des Skriptes braucht. Hier eine Liste der
Zusatzpackages, mit denen wir gestern eine Ubuntu-Installation dazu
gebracht haben, das Skript zu kompilieren:

	texlive
	texlive-lang-european
	texlive-metapost
	texlive-lang-german
	texlive-science
	texlive-bibtex-extra
	texlive-latex-extra
	texlive-xetex

Alle diese Packages kann man mit dem Befehl 

	sudo apt-get install <packagename>

installieren. Damit sollte dann alles vorhanden sein, um im
Unterverzeichnis "skript" des Github-Repository mit dem Befehl "make"
das Skript neu bauen zu können.


Unterverzeichnisse für Seminararbeiten
--------------------------------------

Die von den Seminarteilnehmern beigesteuerten Seminar-Arbeiten befinden
sich jeweils in einem Unterverzeichnis des skript-Verzeichnisses.
Das File skript.tex liest für jedes Seminar-Arbeits-Thema jeweils
das File <thema>/main.tex ein. Eventuelle weitere Files müssen mit
\input <thema>/weiteresfile.tex eingelesen werden, das Thema-Verzeichnis
muss also jeweils mit angegeben werden. 
