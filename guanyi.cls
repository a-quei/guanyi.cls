%%
%%    File : guanyi.cls    (LaTeX2e class file)
%%  Author : Guanyi Chen (g.chen@uu.nl)
%% Version : 0.3
%% 
%% Some of the settings were adapted form the class of computational 
%% linguistic journal.
%%

\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{guanyi}[my custom article class]


%%
%% ----- Options -----
%%

\RequirePackage{ifthen}

\newboolean{ling}
\setboolean{ling}{false}
\newboolean{palatino}
\setboolean{palatino}{false}
\newboolean{tikz}
\setboolean{tikz}{false}
\newboolean{short}
\setboolean{short}{false}
\newboolean{mathcolor}
\setboolean{mathcolor}{false}

\DeclareOption{linguistics}{\setboolean{ling}{true}}
\DeclareOption{palatino}{\setboolean{palatino}{true}}
\DeclareOption{tikz}{\setboolean{tikz}{true}}
\DeclareOption{short}{\setboolean{short}{true}}
\DeclareOption{mathcolor}{\setboolean{mathcolor}{true}}

\ProcessOptions

%%
%% ----- Make Title -----
%%

% define title font
\ifthenelse{\boolean{short}}
    {\def\titlefont{\Large\bfseries\raggedright\mathversion{bold}}%
        \def\authorfont{\normalsize\raggedright}%
        \def\institutefont{\normalsize\raggedright}}
    {\def\titlefont{\LARGE\bfseries\raggedright\mathversion{bold}}%
        \def\authorfont{\large\raggedright}%
        \def\institutefont{\normalsize\raggedright}}

\ifthenelse{\boolean{short}}
    {\newcommand{\institute}[1]{\gdef\@institute{#1}}}
    {% redefine author
        \newcount\aucount%
        \newcount\tempcount%
        \def\author{\@dblarg{\@author}}%
        \def\@author[#1]#2{\global\advance\aucount\@ne%
           \expandafter\gdef\csname author\romannumeral\aucount\endcsname{#2}}%
        % define institute
        \def\institute#1{\expandafter\gdef\csname institute\romannumeral\aucount\endcsname{#1}}}

\def\printauthors{%
   \ifnum\aucount=\z@
      \gdef\@authors{}
   \else
      \gdef\@authors{%
         \tempcount\@ne
         \@whilenum\aucount>\z@
         \do{%
               {\authorfont\csname author\romannumeral\tempcount\endcsname\vphantom{pl}\par}
               {\reset@font\institutefont\csname institute\romannumeral\tempcount\endcsname\vphantom{pl}\par\vspace{10px}}%
            \advance\aucount\m@ne\advance\tempcount\@ne
         }%
      }
   \fi
}


\def\@maketitle{%
  \newpage
  \null
  \ifthenelse{\boolean{short}}{}%
    {\vskip 2em}%
  \begin{center}%
  \let \footnote \thanks
    \titlefont{\@title}%
    \vskip 1em%
    \ifthenelse{\boolean{short}}%
        {\authorfont{\@author}, \institutefont{\@institute}}%
        {\printauthors%
            \ifx\@authors\@empty\else\vskip 6pt%
            {\authorfont\@authors\par}\fi}%
  \end{center}%
  \par%
  \vskip 1.5em}
  
%%
%% ----- Page Layout -----
%%
\RequirePackage[margin=25mm]{geometry}

%%
%% ----- Make Title -----
%%
\def\abstractfont{\normalsize\setlength\baselineskip{13pt}\itshape}
\renewenvironment{abstract}{\par\abstractfont\noindent\ignorespaces}{\par\addvspace{12pt}}

%%
%% ----- Sections -----
%%
\RequirePackage{sectsty}
\sectionfont{\large\bfseries\mathversion{bold}}
\subsectionfont{\normalsize\bfseries\mathversion{bold}}

%%
%% ----- Always Used Packages -----
%%
\usepackage{url}
\usepackage{apacite}
\usepackage{natbib}
\usepackage{microtype}
\usepackage{amsmath}
\usepackage{enumitem}
\usepackage{booktabs}

% figures

% linguistic packages
\ifthenelse{\boolean{ling}}
    {\usepackage{gb4e}%
    \noautomath%
    \usepackage{tikz-qtree}%
    \usepackage{tikz-dependency}}
    {}

% fonts
\ifthenelse{\boolean{palatino}}
    {\usepackage{palatino}}
    {}

% tikz   
\ifthenelse{\boolean{tikz}}
    {\usepackage{tikz}}
    {}


\ifthenelse{\boolean{mathcolor}}
    {\everymath{\color{purple}}
\everydisplay{\color{purple}}}
    {}
    
%%
%% ----- Settings -----
%%
\renewcommand{\vec}[1]{\boldsymbol{#1}} % Uncomment for BOLD vectors.
