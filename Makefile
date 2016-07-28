SRCSLIDES=macros.tex main.tex content/*.tex
SRCTIKZ=

all: mcts_slides_en.pdf

mcts_slides_en.pdf: $(SRCSLIDES) $(SRCTIKZ)
	pdflatex  -jobname=mcts_slides_en main.tex
	pdflatex  -jobname=mcts_slides_en main.tex

clean:
	@echo "suppression des fichiers de compilation"
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.out *.nav *.snm *.bbl *.blg

init: clean
	@echo "suppression des fichiers cibles"
	@rm -f *.pdf
