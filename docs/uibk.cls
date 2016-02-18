% vim:set filetype=tex:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uibk}[2015/11/01 UIBK Class]
\RequirePackage{etoolbox}

% class switches
\newbool{short}\booltrue{short}
\newbool{article}
\newbool{book}
\newbool{report}
\newbool{beamer}

% process options
\DeclareOption{article}{
    \boolfalse{short}
    \booltrue{article}
    \boolfalse{book}
    \boolfalse{report}
    \boolfalse{beamer}
}
\DeclareOption{book}{
    \boolfalse{short}
    \boolfalse{article}
    \booltrue{book}
    \boolfalse{report}
    \boolfalse{beamer}
}
\DeclareOption{report}{
    \boolfalse{short}
    \boolfalse{article}
    \boolfalse{book}
    \booltrue{report}
    \boolfalse{beamer}
}
\DeclareOption{beamer}{
    \boolfalse{short}
    \boolfalse{article}
    \boolfalse{book}
    \boolfalse{report}
    \booltrue{beamer}
}
\ProcessOptions\relax

% load class
\ifbool{short}{
    \LoadClass[10pt,a4paper,parskip=half]{scrartcl}
}{}
\ifbool{article}{
    \LoadClass[10pt,a4paper,parskip=half,titlepage]{scrartcl}
}{}
\ifbool{book}{
    \LoadClass[10pt,a4paper,parskip=half]{scrbook}
}{}
\ifbool{report}{
    \LoadClass[10pt,a4paper,parskip=half]{scrreprt}
}{}
\ifbool{beamer}{
    \LoadClass[xetex,aspectratio=169]{beamer}
    \usepackage{sty/beamercolor}
    \usepackage{sty/beamerouter}
}{}

% fixes pre
\usepackage{fixltx2e}
\usepackage{microtype}

% font
\usepackage[math]{iwona}
\usepackage[no-math]{fontspec}
    \setmainfont{DroidSerif}
    \setsansfont{Ubuntu Light}
    \setmonofont{DroidSansMono}[Scale=0.8]
    \renewcommand{\familydefault}{\sfdefault}

% font sizes
\newcommand*{\@uibkLarge}{\sffamily\mdseries\upshape\fontsize{12}{12}\selectfont}
\newcommand*{\@uibkLARGE}{\sffamily\mdseries\upshape\fontsize{16}{16}\selectfont}

% unicode abbr
\usepackage{newunicodechar}
    \newunicodechar{〈}{$\langle$}
    \newunicodechar{〉}{$\rangle$}

% color
\usepackage{xcolor}
    \definecolor{uibkblue}{cmyk}{1.0, 0.6, 0.0, 0.56}

% page
\ifbool{short}{
    \usepackage[cm,plain]{fullpage}
}{}
\ifbool{article}{
    \usepackage{anysize}
}{}
\ifboolexpr{bool{book} or bool{report}}{
    \usepackage{anysize}
    \usepackage{chngcntr}
        \counterwithin{section}{chapter}
        \counterwithout{equation}{chapter}
        \counterwithout{figure}{chapter}
        \counterwithout{table}{chapter}
    \usepackage{etoolbox}
    \appto\mainmatter{
        \pagestyle{headings}
    }
}{}
\ifbool{beamer}{
    \beamertemplatenavigationsymbolsempty
    \setbeamercovered{transparent}
}{}

% basics
\usepackage{soul}
\newcommand{\rom}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

% sidenote
\ifbool{beamer}{
    \usepackage[absolute,overlay]{textpos}
        \newcommand\sidenote[1]{
            \begin{textblock*}{\paperwidth}(0pt, 1.05\textheight)
                \raggedleft\scriptsize #1\hspace{.3em}
            \end{textblock*}}
}{}

% math
\usepackage{amsmath}
\usepackage{amssymb}
    \let\emptyset\varnothing
\usepackage{mathtools}
    \mathtoolsset{centercolon}
\usepackage{amsthm}
    \newtheoremstyle{plain}{\topsep}{\topsep}{\normalfont}{10pt}{\bfseries}{\normalfont:}{5pt}{}
    \theoremstyle{plain}
    \ifbool{beamer}{
        \renewcommand{\proofname}{Proof\nopunct}
    }{
        \newtheorem{theorem}{Theorem}[section]
        \newtheorem{corollary}[theorem]{Corollary}
        \newtheorem{definition}[theorem]{Definition}
        \renewcommand{\proofname}{Proof:}
    }
    \newtheorem{notation}[theorem]{Notation}

% SI units
\usepackage[binary-units,per-mode=symbol]{siunitx}
    \sisetup{detect-all}

% keys and menus
\usepackage[os=win]{menukeys}
    \changemenuelement{hyphenatepathswithfolder}{sep}{ / }
    \renewmenumacro{\menu}[>]{angularmenus}
    \renewmenumacro{\directory}[/]{hyphenatepathswithfolder}

% graphics
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{graphicx}
    \graphicspath{{gfx/}}

% quote
\usepackage{mdframed}
    \newmdenv[
        topline=false,
        bottomline=false,
        rightline=false,
    ]{blockquote}
\renewenvironment{quote}
    {\hfill\begin{minipage}{0.95\textwidth}\begin{blockquote}}
    {\end{blockquote}\end{minipage}}

% links
\ifbool{beamer}{}{
    \usepackage{hyperref}
    \usepackage[all]{hypcap}
    \renewcommand{\equationautorefname}{equation}
    \renewcommand{\figureautorefname}{figure}
    \renewcommand{\tableautorefname}{table}
}
    \hypersetup{
        colorlinks      = true,
        citecolor       = uibkblue,
        citebordercolor = uibkblue,
        linkcolor       = uibkblue,
        linkbordercolor = uibkblue!40,
        urlcolor        = uibkblue,
        pdfstartview    = {XYZ null null null},
        pdfpagemode     = UseOutlines,
    }
    \urlstyle{same}

% PDFs
\usepackage{pdfpages}

% references
\usepackage[capitalise,noabbrev]{cleveref}
\usepackage[numbers]{natbib}
    \bibliographystyle{plainnat}

% additional symbols
\usepackage{MnSymbol}

% source code
\usepackage{listings}
    \lstset{
        basicstyle=\scriptsize\ttfamily,
        breaklines=true,
        breakindent=0pt,
        prebreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\lcurvearrowdown}},
        xleftmargin=0.05\linewidth,
        xrightmargin=0.05\linewidth,
    }
    \newcommand{\exec}[1]{\lstinputlisting{|#1}}

\usepackage{minted}
    \renewcommand{\theFancyVerbLine}{\normalfont{\tiny\arabic{FancyVerbLine}}}
    \renewcommand{\listingscaption}{\normalfont Listing}
    \renewcommand{\listoflistingscaption}{List of Listings}
    \newminted[code]{text}{
        fontsize=\scriptsize,
        frame=leftline,
        framesep=2mm,
        autogobble,
        linenos}
    \newmintedfile[codefile]{text}{
        fontsize=\scriptsize,
        frame=leftline,
        framesep=2mm,
        linenos}
    \newminted{c}{
        fontsize=\scriptsize,
        frame=leftline,
        framesep=2mm,
        autogobble,
        linenos}
    \newmintedfile{c}{
        fontsize=\scriptsize,
        frame=leftline,
        framesep=2mm,
        linenos}

% tables
\let\@uibktoc\tableofcontents
\def\tableofcontents{
    \phantomsection
    \@uibktoc
}
\let\@uibktof\listoffigures
\def\listoffigures{
    \phantomsection
    \@uibktof
}
\let\@uibktot\listoftables
\def\listoftables{
    \phantomsection
    \@uibktot
}
\let\@uibktol\listoflistings
\def\listoflistings{
    \phantomsection
    \@uibktol
}
\let\@uibkbib\bibliography
\def\bibliography{
    \phantomsection
    \@uibkbib
}

% title
\ifboolexpr{bool{article} or bool{book} or bool{report}}{
    \renewcommand\and{\\[\baselineskip]}
    \usepackage{sty/titlepage}
}{}
\ifbool{short}{
    \makeatletter
    \def\maketitle{%
        \begin{minipage}[t]{0.8\linewidth}%
            \flushleft%
            \LARGE\sffamily\@title\\
            \large\sffamily\@subtitle
        \end{minipage}%
        \hfill%
        \begin{minipage}[t]{0.2\linewidth}%
            \flushright\sffamily%
            \begin{tabular}[t]{r}\@author\\\@date\end{tabular}\\
        \end{minipage}%
    }
    \makeatother
}{}

% fixes post
\usepackage{scrhack}
