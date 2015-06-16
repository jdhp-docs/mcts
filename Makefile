SRCSLIDES=slides_packages.tex commands.tex slides_mcts.tex
SRCTIKZ=

all: mcts_slides.pdf

mcts_slides.pdf: $(SRCSLIDES) $(SRCTIKZ) mcts_slides.tex
	pdflatex mcts_slides.tex
	pdflatex mcts_slides.tex

clean:
	@echo "suppression des fichiers de compilation"
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.out *.nav *.snm *.bbl *.blg

init: clean
	@echo "suppression des fichiers cibles"
	@rm -f *.pdf
