TEX=rahulparhi_cv.tex
BIB=$(basename $(TEX))

all:
	pdflatex $(TEX)
	bibtex $(BIB)
	pdflatex $(TEX)
	pdflatex $(TEX)

clean:
	rm -f *.pdf *.aux *.bbl *.log *.dvi *.ps *.blg *.bcf *.out *-blx.bib *.run.xml
