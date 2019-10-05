TEX=pdflatex
BIB=biber

all: 	pdf 	clean

pdf:
	$(TEX) -shell-escape -enable-write18 main
	$(BIB) main
	$(TEX) main
	$(TEX) main


clean:
	\rm -f *.aux *.bbl *.bcl *.toc *.maf *.out *.bcf  *.lo? *.blg *.mtc* main-dot2tex-*  Icon\? || true
