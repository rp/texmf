\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asgmt}[2018-07-28 Rahul Parhi's Assignment LaTeX Class]

\LoadClass[11pt,letterpaper]{article}

\RequirePackage{amsmath}
\RequirePackage{extramarks}
\RequirePackage{fancyhdr}
\RequirePackage[headheight=110pt,margin=1in]{geometry}
\RequirePackage{lastpage}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage[sf,bf]{titlesec}
\RequirePackage{titling}

\def\assignment#1{\def\@assignment{#1}}
\def\@assignment{??}

\def\class#1{\def\@class{#1}}
\def\@class{??}

\def\due#1{\def\@due{#1}}
\def\@due{??}

\def\name#1{\def\@name{#1}}
\def\@name{??}

\def\identnostar#1{\def\@id{\texttt{#1}}}
\def\identstar#1{\def\@id{ID: \texttt{#1}}}
\def\ident{\@ifstar\identstar\identnostar}
\def\@id{??}

\allowdisplaybreaks[1]

\pagestyle{fancy}

\lhead{\@name}
\chead{\@class: \@assignment}
\rhead{\firstxmark}
\lfoot{\lastxmark}
\cfoot{}
\rfoot{Page {\thepage} of \pageref{LastPage}}

\fancypagestyle{plain}{
  \lhead{}
  \chead{}
  \rhead{}
  \lfoot{\lastxmark}
  \cfoot{}
  \rfoot{Page {\thepage} of \pageref{LastPage}}
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

\setlength{\droptitle}{-60pt}

\newenvironment{question}{
  \mdfsetup{
    frametitle={
      \tikz[baseline=(current bounding box.east),outer sep=0pt]
      \node[anchor=east,rectangle,fill=black!20] {\strut Question};
    },
    %innertopmargin=10pt,
    linecolor=black!40,
    linewidth=1pt,
    topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax,
  }
  \begin{mdframed}
}
{\end{mdframed}}

\title{
  \textbf{\sffamily\@class:\ \@assignment} \\ [12pt]
  \small{Due\ on\ \@due} \\ [9pt]
  \textbf{\sffamily\@name} \\ [3pt]
  \textbf{\sffamily\@id} \\
}
\preauthor{}
\postauthor{}
\predate{}
\postdate{}
\date{\vspace{-35pt}}
\author{}

