include meta.make

###############################################################################

all: $(FILE_BASE_NAME).pdf

.PHONY : all clean init slides notes handout jdhp publish

SRCSLIDES=macros_common.tex\
		  macros.tex\
		  meta.tex\
		  bibliography.bib\
		  setup_packages.tex\
		  setup_package_listings.tex\
		  setup_package_tikz.tex\
		  main.tex\
		  content/*.tex

SRCTIKZ=

###############################################################################

slides: $(FILE_BASE_NAME).pdf

$(FILE_BASE_NAME).pdf: $(SRCSLIDES) $(SRCTIKZ) slides.tex
	pdflatex -jobname=$(FILE_BASE_NAME) slides.tex
	bibtex $(FILE_BASE_NAME)            # this is the name of the .aux file, not the .bib file !
	pdflatex -jobname=$(FILE_BASE_NAME) slides.tex
	pdflatex -jobname=$(FILE_BASE_NAME) slides.tex

notes: $(FILE_BASE_NAME)_notes.pdf

$(FILE_BASE_NAME)_notes.pdf: $(SRCSLIDES) $(SRCTIKZ) notes.tex
	pdflatex -jobname=$(FILE_BASE_NAME)_notes notes.tex
	#bibtex $(FILE_BASE_NAME)_notes      # this is the name of the .aux file, not the .bib file !
	#pdflatex -jobname=$(FILE_BASE_NAME)_notes notes.tex
	pdflatex -jobname=$(FILE_BASE_NAME)_notes notes.tex

handout: $(FILE_BASE_NAME)_handout.pdf

$(FILE_BASE_NAME)_handout.pdf: $(SRCSLIDES) $(SRCTIKZ) handout.tex
	pdflatex -jobname=$(FILE_BASE_NAME)_handout handout.tex
	#bibtex $(FILE_BASE_NAME)_handout    # this is the name of the .aux file, not the .bib file !
	#pdflatex -jobname=$(FILE_BASE_NAME)_handout handout.tex
	pdflatex -jobname=$(FILE_BASE_NAME)_handout handout.tex

# PUBLISH #####################################################################

publish: jdhp

jdhp:$(FILE_BASE_NAME).pdf
	
	########
	# HTML #
	########
	
	# JDHP_DOCS_URI is a shell environment variable that contains the
	# destination URI of the HTML files.
	@if test -z $$JDHP_DOCS_URI ; then exit 1 ; fi
	
	# Copy HTML
	# TODO...
	
	
	#######
	# PDF #
	#######
	
	# JDHP_DL_URI is a shell environment variable that contains the destination
	# URI of the PDF files.
	@if test -z $$JDHP_DL_URI ; then exit 1 ; fi
	
	# Upload the PDF file
	rsync -v -e ssh $(FILE_BASE_NAME).pdf ${JDHP_DL_URI}/pdf/

## CLEAN ######################################################################

clean:
	@echo "Remove generated files"
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.out *.nav *.snm *.bbl *.blg *.vrb

init: clean
	@echo "Remove target files"
	@rm -f $(FILE_BASE_NAME).pdf
	@rm -f $(FILE_BASE_NAME)_notes.pdf
	@rm -f $(FILE_BASE_NAME)_handout.pdf
