%%
%%    File : guanyi.cls    (LaTeX2e class file)
%%  Author : Guanyi Chen (g.chen@abdn.ac.uk)
%% Version : 0.1
%% 
%% Some of the settings were adapted form the class of computational 
%% linguistic journal.
%%


\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{guanyi}[my custom article class]

%%
%% ----- Make Title -----
%%

% define title font
\def\titlefont{\LARGE\bfseries\raggedright\mathversion{bold}}
\def\authorfont{\large\raggedright}
\def\institutefont{\normalsize\raggedright}

% define institute
\newcommand{\institute}[1]{\gdef\@institute{#1}}

\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    \titlefont{\@title}%
    \vskip 1em%
    \authorfont{\@author}\par%
    \institutefont{\@institute}%
  \end{center}%
  \par
  \vskip 1.5em}
  
%%
%% ----- Page Layout -----
%%
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

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