\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asgmt}[2018-07-28 Rahul Parhi's Assignment LaTeX Class]

\LoadClass[11pt,letterpaper]{article}

\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage{extramarks}
\RequirePackage{fancyhdr}
\RequirePackage[headheight=110pt,margin=1in]{geometry}
\RequirePackage{lastpage}
\RequirePackage[sf,bf,compact]{titlesec}
\RequirePackage{tcolorbox}
\RequirePackage{titling}

\tcbuselibrary{breakable, skins}

\def\assignment#1{\def\@assignment{#1}}
\def\@assignment{??}

\def\class#1{\def\@class{#1}}
\def\@class{??}

\newif\ifnodue
\noduefalse

\def\due#1{\def\@due{#1}}
\def\@due{??}

\def\name#1{\def\@name{#1}}
\def\@name{??}

\DeclareOption{nodue}{
  \noduetrue
}

\ProcessOptions

\def\identnostar#1{\def\@ident{\texttt{#1}}}
\def\identstar#1{\def\@ident{ID: \texttt{#1}}}
\def\ident{\@ifstar\identstar\identnostar}
\def\@ident{??}

\allowdisplaybreaks

\pagestyle{fancy}

\lhead{\@name}
\chead{\@class: \@assignment}
\rhead{\firstxmark}
\lfoot{\lastxmark}
\cfoot{}
\rfoot{Page {\thepage} of \pageref*{LastPage}}

\fancypagestyle{plain}{
  \lhead{}
  \chead{}
  \rhead{}
  \lfoot{\lastxmark}
  \cfoot{}
  \rfoot{Page {\thepage} of \pageref*{LastPage}}
  \renewcommand{\headrulewidth}{0pt}
}

\renewcommand\headrulewidth{0.5pt}
\renewcommand\footrulewidth{0.5pt}

\newcommand{\problementer}{
  \extramarks{\currentproblem}{{\currentproblem} continued on next page\ldots}
  \extramarks{{\currentproblem} (continued)}{{\currentproblem} continued on next page\ldots}
}

\newcommand{\problemexit}{
  \extramarks{{\currentproblem} (continued)}{{\currentproblem} continued on next page\ldots}
  \ifx\problemoverride\empty
    \stepcounter{problemcounter}
  \fi
  \extramarks{}{}
}

\setcounter{secnumdepth}{0}
\newcounter{problemcounter}
\setcounter{problemcounter}{1}

\newenvironment{problem}[1][]{
  \def\problemoverride{#1}
  \ifx\problemoverride\empty
    \def\currentproblem{Problem \arabic{problemcounter}}
  \else
    \def\currentproblem{\problemoverride}
  \fi
  \extramarks{\currentproblem}{}
  \section{\currentproblem}
  \problementer
}{
  \problemexit
}

\newenvironment{problem*}[1][]{
  \def\problemoverride{#1}
  \ifx\problemoverride\empty
    \def\currentproblem{Problem \arabic{problemcounter}}
  \else
    \def\currentproblem{\problemoverride}
  \fi
  \extramarks{\currentproblem}{}

  \newtcolorbox{question}[1][\currentproblem]{
    skin=enhanced,
    attach boxed title to top center={yshift=-2.5mm},
    colback=white,
    colframe=black,
    colbacktitle=white,
    coltitle=black,
    boxed title style={size=small,
      colframe=white,
    },
    fonttitle=\bfseries\sffamily,
    sharp corners=all,
    breakable,
    title=##1,
  }
  \problementer
}{
  \problemexit
}

\setlength{\droptitle}{-60pt}

\linespread{1.1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

% make description title \bfseries\sffamily
\setlist[description]{%
  font={\bfseries\sffamily},
}

\title{
  \textbf{\sffamily\@class:\ \@assignment} \\ [12pt]
  \small \ifnodue \vspace{-3pt} \else Due\ on\ \@due \\ [9pt] \fi
  \textbf{\sffamily\@name} \\ [3pt]
  \textbf{\sffamily\@ident} \\
}
\preauthor{}
\postauthor{}
\predate{}
\postdate{}
\date{\vspace{-35pt}}
\author{}

