TEX       = xelatex
TEXFLAGS  = -shell-escape -file-line-error -halt-on-error
BIB       = bibtex
BIBFLAGS  = -terse
REFS      = references.bib

.PHONY: all
all: slides.pdf paper.pdf

.PHONY: clean
clean:
	-$(RM) -r *.aux *.bbl *.blg *.lof *.log *.lol *.lot *.nav *.out *.pdf \
	          *.pyg *.snm *.synctex *.toc *.thm *.vrb _minted*

paper.pdf: paper.tex paper.bbl paper.blg

%.pdf: %.tex
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<

%_handout.pdf: %.tex
	$(TEX) $(TEXFLAGS) -jobname "$(@:.pdf=)" "\PassOptionsToClass{handout}{beamer}\input{$<}"
	$(TEX) $(TEXFLAGS) -jobname "$(@:.pdf=)" "\PassOptionsToClass{handout}{beamer}\input{$<}"

%.bbl %.blg: $(REFS) %.aux
	$(BIB) $(BIBFLAGS) $*

%.aux: %.tex
	$(TEX) $(TEXFLAGS) $<
