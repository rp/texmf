\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csci1933}[2017/12/29 v0.2 CSCI 1933 LaTeX class]

%
% This class is a h4x written by Rahul Parhi (parhi003@umn.edu). If something
% breaks, you may or may not consider contacting him, or just fix it yourself.
%
% Created: 2017/01/19
%       Initial document setup
% Revised: 2017/12/29
%       Increase resistance n00bism. Also, memes
%

\LoadClass[11pt,letterpaper]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amssymb,amsthm,mathtools} % maths
\RequirePackage[headheight=110pt,margin=1in]{geometry}
\RequirePackage[sf,bf,pagestyles]{titlesec}
\RequirePackage{titling}
\RequirePackage{abstract}
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage{listings, lstautogobble}
\RequirePackage[symbol,bottom]{footmisc}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage[plain]{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{tocloft}
\RequirePackage[colorlinks,
                bookmarks=false,
                pdfusetitle,
                pdfproducer={look, you found a meme},
                pdfcreator={oh manz, another meme in the wild!}]{hyperref}

% the number of the lab/project
\def \num#1{\def\@number{#1}}
\def \@number {??}

\def \@course {CSCI 1933}
\def \@lefthead {} % by default empty

\def \due#1{\def\@duedate{#1}}
\def \@duedate {??}

% header setup for specific document typs {{{

\DeclareOption{lab}{
  \def \@lefthead {{\@course} Lab {\@number}}

  \patchcmd{\@maketitle}{\@title}{{\@lefthead} \\ \Large \@title{}}{}{}

  \renewcommand{\sectionmark}[1]{\markright{\thesection.\ \MakeUppercase{#1}}}
  \renewcommand{\subsectionmark}[1]{}
  \renewcommand{\subsubsectionmark}[1]{}

  \lhead{\MakeUppercase{\@lefthead}}
  \rhead{\rightmark}
  \renewcommand{\headrulewidth}{0.4pt}
}

\DeclareOption{project}{
  \def \@lefthead {{\@course} Project {\@number}}

  \patchcmd{\@maketitle}{\@title}{{\@lefthead} \\ \Large \@title{} \\ \vspace{0.5em}
    \large Due Date: {\@duedate}}{}{}

  \renewcommand{\sectionmark}[1]{\markright{\thesection.\ \MakeUppercase{#1}}}
  \renewcommand{\subsectionmark}[1]{}
  \renewcommand{\subsubsectionmark}[1]{}

  \lhead{\MakeUppercase{\@lefthead}}
  \rhead{\rightmark}
  \renewcommand{\headrulewidth}{0.4pt}
}

\DeclareOption{rubric}{
  \def \@lefthead {{\@course} Project {\@number} Rubric}
  \lhead{}
  \rhead{}
  \renewcommand{\headrulewidth}{0pt}

  \patchcmd{\@maketitle}{\@title}{{\@lefthead} \\ \Large \@title{}}{}{}
}

\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}

\renewcommand{\headrulewidth}{0pt}
\lhead{}
\rhead{}

\cfoot{\thepage}
\pagestyle{fancy}

\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \lhead{}
  \rhead{}
}

% }}}

\ProcessOptions

% section/tite font setup {{{

% make title elements \sffamily
\pretitle{\begin{center}\bfseries\sffamily\LARGE}

  % move title to top of page
\posttitle{\par\end{center}}
\setlength{\droptitle}{-60pt}
\title{} % default title is empty

% don't need author or date in these types of documents
\preauthor{}
\postauthor{}
\predate{}
\postdate{}
\date{\vspace{-35pt}} % not the best way to do it, but meh
\author{}

\let\oldsection\section
\def\section{\@ifstar\@unstarredsection\oldsection}
\def\@unstarredsection#1{\oldsection*{#1}\markright{\MakeUppercase{#1}}}

% make abstract title \sffamily and fix spacing with vspace h4xing
\renewcommand\abstractnamefont{\sffamily}
\addto{\captionsenglish}{\renewcommand{\abstractname}{\vspace{20pt}Abstract\vspace{-20pt}}}

% make description title \bfseries\sffamily
\setlist[description]{%
  font={\bfseries\sffamily}, % set the label font
}
% }}}

\setlength\parindent{0pt} % no indent by default
\setlength{\parskip}{\baselineskip} % add space between paragraphs
\titlespacing\section{0pt}{5pt}{1pt}       % \
\titlespacing\subsection{0pt}{5pt}{1pt}    %  |- decrease spacing around section headings
\titlespacing\subsubsection{0pt}{5pt}{1pt} % /

\newcommand{\forceindent}{\leavevmode{\parindent=1em\indent}} % force an indent

\linespread{1.1} % aesthetics, yo

% java syntax highlighting colors
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

% java setup
\lstset{
  autogobble              = true,
  basicstyle              = \ttfamily,
  breaklines              = true,
  columns                 = fullflexible,
  commentstyle            = \color{mygreen},
  keywordstyle            = \color{blue},
  language                = Java,
  mathescape,
  moredelim               = **[is][\color{mygreen}]{@}{@},
  moredelim               = [s][\color{mygreen}]{`}{'},
  numberstyle             = \tiny\color{mygray},
  showspaces              = false,
  showstringspaces        = false,
  showtabs                = false,
  stringstyle             = \color{mymauve},
  xleftmargin             =1cm,
}

\newcommand{\java}[1]{\lstinline{#1}}
\newcommand{\code}[1]{\lstinline{#1}}

% All the boxes. This had to be added because peeps can't seem to follow a
% simple colorscheme
% {{{

\newtcolorbox{notebox}[3][]{
  colback                 = #3!5,
  colframe                = black!70!#3,
  coltitle                = black!40!#3,
  arc                     = 1pt,
  boxrule                 = 0.5pt,
  attach title to upper,
  after title             = {:\ },
  title                   = {#2},
  fonttitle               = \bfseries\sffamily,
  #1,
}

\newenvironment{milestone}
{\begin{notebox}{Milestone \thesection}{violet}
\\
}
{
\end{notebox}
}

\newenvironment{constraint}
{\begin{notebox}{Constraint}{orange}
}
{
\end{notebox}
}

\newenvironment{hint}
{\begin{notebox}{Hint}{blue}
}
{
\end{notebox}
}

\newenvironment{note}
{\begin{notebox}{Note}{green}
}
{
\end{notebox}
}

\newenvironment{important}
{\begin{notebox}{IMPORTANT}{red}
}
{
\end{notebox}
}

\newenvironment{reflection}
{\begin{notebox}{Reflection}{teal}
}
{
\end{notebox}
}

\newenvironment{caution}
{\begin{notebox}{Caution}{yellow}
}
{
\end{notebox}
}

\newenvironment{example}
{\begin{notebox}{Example}{gray}
}
{
\end{notebox}
}

\newenvironment{tip}
{\begin{notebox}{Tip}{green}
}
{
\end{notebox}
}

\newenvironment{exploration}
{\begin{notebox}{Exploration}{cyan}
}
{
\end{notebox}
}

% }}}

% table of contents formatting
\addto\captionsenglish{
  \renewcommand{\contentsname}{\bfseries\sffamily Contents}
}
\renewcommand{\cftsecfont}{\bfseries\sffamily}
\renewcommand{\cftsubsecfont}{\sffamily}
\renewcommand{\cftsubsubsecfont}{\sffamily}
\renewcommand{\cftsecpagefont}{\bfseries\sffamily}
\renewcommand{\cftsubsecpagefont}{\sffamily}
\renewcommand{\cftsubsubsecpagefont}{\sffamily}

% h4x to fix old version of some package deleting section numbers
% I don't know why this works so don't touch it
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}

% tighter `itemize`s and other list like environments
\setitemize{itemsep=0pt,topsep=0pt}
\setlist[1]{itemsep=0pt, topsep=0pt}
\setlist[2]{itemsep=0pt, topsep=0pt}

