\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenote}[2012/02/22 For writing lecture notes]
\LoadClass[a4paper,11pt,style=printdev,extramargin,smallchapters]{tubsreprt}

\RequirePackage[utf8]{inputenc}
% \RequirePackage[T1]{fontenc}
% \RequirePackage{ae}
\RequirePackage{scrpage2}
\RequirePackage[sf]{caption}      % Captions in SansSerif ausgeben
  \renewcommand{\captionfont}{\sffamily}
\RequirePackage{tikz}
  \usetikzlibrary{calc,arrows,shapes,positioning,decorations.pathreplacing}
\RequirePackage{framed}
\RequirePackage{booktabs}
\RequirePackage{units}    % Einheiten
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage[colorlinks=true, linkcolor=blue!50!black]{hyperref}

% options section
\DeclareOption{outline}{%
  \relax
}
\ProcessOptions\relax

% Titlepage stuff
\newcommand{\@lecturer}{\hfill}
\newcommand{\lecturerstyle}{\LARGE}
\newcommand{\@university}{TU Braunschweig}
\newcommand{\universitystyle}{\Large}
\newcommand{\@course}{\hfill}
\newcommand{\coursestyle}{\Huge}
\newcommand{\@semester}{\hfill}
\newcommand{\semesterstyle}{\Large}
\newcommand{\@doctype}{-- Mitschrift --}
\newcommand{\doctypestyle}{\huge}
\newcommand{\authorstyle}{\Large}


% titlepage
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \centering\sffamily
    \phantom{x}
%     \vfill
    \vspace{2em}
    {\coursestyle \@course}\\
    \vspace{2em}
%     \vfill
    {\lecturerstyle \@lecturer}\\
    \vspace{2em}
    {\universitystyle \@university}
    \vfill
    {\doctypestyle \@doctype} \\
    \vspace{2em}
    {\authorstyle \@author} \\
    \vspace{2em}
    {\semesterstyle \@semester}


    \vfill\vfill\vfill
    \@date
  \end{titlepage}
}

\newcommand{\lecturer}[1]{\renewcommand{\@lecturer}{#1}}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\newcommand{\doctype}[1]{\renewcommand{\@doctype}{-- #1 --}}


% style settings...

% indention
\setlength{\parindent}{0pt}
\setlength{\parskip}\medskipamount

% Headings
% \pagestyle{scrheadings}
% \automark{chapter}
% \ihead{\headmark}
% \chead{}
% \setheadsepline{0.5pt}

%%% Farbscheme
% infobox
\colorlet{infoboxborder}{blue}
\colorlet{infoboxbg}{gray!20}
% tables
\colorlet{tableheadcolor}{gray!25} 

% Define box and box title style
\tikzstyle{mybox} = [draw=infoboxborder, fill=infoboxbg, very thick,
    rectangle, rounded corners, inner sep=10pt, inner ysep=12pt]
\tikzstyle{fancytitle} =[fill=infoboxborder, text=white, inner ysep=2.5pt]

% infobox with title
\newcommand{\infobox@Title}[2]{{
  \begin{center}%
   \begin{tikzpicture}%
    \node [mybox] (box){%
      \begin{minipage}{0.90\textwidth}%
        \tikzset{every path/.style={sharp corners}}% reset tikz style
        #2
      \end{minipage}};%
      \node[fancytitle, right=10pt] at (box.north west) {\sffamily #1};%
    \end{tikzpicture}%
  \end{center}
}}
% infobox without title
\newcommand{\infobox@NoTitle}[2][]{{
  \begin{center}%
   \begin{tikzpicture}%
    \node [mybox] (box){%
      \begin{minipage}{0.90\textwidth}%
        #2
      \end{minipage}};%
    \end{tikzpicture}%
  \end{center}%
}}
% infobox, title choosable by *
\newcommand{\infobox}{\@ifstar%
  \infobox@NoTitle%
  \infobox@Title%
}


% emph and example stuff
\newcommand{\eemph}[1]{{\bfseries\leavevmode\color{blue}#1}}
\newcommand{\keyword}[1]{\eemph{#1}\index{#1}} % put in index

\newcommand{\example}{\paragraph{Beispiel:}}

% \newenvironment{example}{\begin{frame}}
%   {\end{frame}}


% new tableofcontents
\let\origtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \phantomsection
%   \pdfbookmark[1]{Inhaltsverzeichnis}{toc}
  \origtableofcontents
  \pagestyle{scrheadings}
  \newpage
}


% % new versoin of starred section
% \let\stdsection\section
% \renewcommand{\section}{\@ifstar
%   \sectionStar%
%   \stdsection
% }
% \newcommand{\sectionStar}[2]{%
%   \addcontentsline{toc}{section}{#1}%
%   \stdsection*{#1}%
% }
% 
% % new versoin of starred chapter
% \let\std@chapter\chapter
% \renewcommand{\chapter}{\@ifstar
%   \chapter@NoStar
%   \std@chapter
% }
% 
% \def\chapter@NoStar#1{%
%   \addcontentsline{toc}{chapter}{#1}%
%   \std@chapter*{#1}%
% }


%\addsec{#1}\sectionstarorig{#1}}
% \addsec{Abkürzungsverzeichnis}
% % new table
% \let\origtabular\tabular
% \renewenvironment{tabular}{%
%   \rowcolors{2}{green!25}{yellow!50}
%   \origtabular
% }{%
%   \endtabular}


% TODO:
% - Kommando für nutzung der Farben aus Farbschem
