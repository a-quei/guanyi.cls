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
%% ----- Options -----
%%

\RequirePackage{ifthen}

\newboolean{ling}
\setboolean{ling}{false}
\newboolean{palatino}
\setboolean{palatino}{false}

\DeclareOption{linguistics}{\setboolean{ling}{true}}
\DeclareOption{palatino}{\setboolean{ling}{true}}

\ProcessOptions

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
\RequirePackage{url}
\RequirePackage{apacite}
\RequirePackage{natbib}
\RequirePackage{microtype}

% figures

% linguistic packages
\ifthenelse{\boolean{ling}}
    {\RequirePackage{gb4e}%
    \noautomath%
    \RequirePackage{qtree}%
    \usepackage{tikz-dependency}}
    {}

% fonts
\ifthenelse{\boolean{palatino}}
    {\RequirePackage{palatino}}
    {}