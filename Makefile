TEX=rahulparhi_cv.tex
BIB=$(basename $(TEX))

all:
	pdflatex -interaction=batchmode $(TEX)
	bibtex $(BIB)
	pdflatex -interaction=batchmode $(TEX)
	pdflatex -interaction=batchmode $(TEX)

clean:
	rm -f *.pdf *.aux *.bbl *.log *.dvi *.ps *.blg *.bcf *.out *-blx.bib *.run.xml
