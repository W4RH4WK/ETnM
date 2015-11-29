TEX       = xelatex
TEXFLAGS  = -shell-escape -file-line-error -halt-on-error
BIB       = bibtex
BIBFLAGS  = -terse

.PHONY: all
all: slides.pdf

.PHONY: clean
clean:
	-$(RM) -r *.aux *.bbl *.blg *.lof *.log *.lol *.lot *.nav *.out *.pdf \
	          *.snm *.synctex *.toc *.thm *.pyg _minted*

%.pdf: %.tex
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<

%_handout.pdf: %.tex
	$(TEX) $(TEXFLAGS) -jobname "$(@:.pdf=)" "\PassOptionsToClass{handout}{beamer}\input{$<}"
	$(TEX) $(TEXFLAGS) -jobname "$(@:.pdf=)" "\PassOptionsToClass{handout}{beamer}\input{$<}"

%.bbl %.blg: %.bib %.aux
	$(BIB) $(BIBFLAGS) $*

%.aux: %.tex
	$(TEX) $(TEXFLAGS) $<
