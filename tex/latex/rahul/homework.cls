\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asgmt}[2018-07-28 Rahul Parhi's Assignment LaTeX Class]

\LoadClass[11pt,letterpaper]{article}

\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage{extramarks}
\RequirePackage{fancyhdr}
\RequirePackage[headheight=110pt,margin=1in]{geometry}
\RequirePackage{lastpage}
\RequirePackage{hyperref}
\RequirePackage[sf,bf,compact]{titlesec}
\RequirePackage{titling}
\RequirePackage{tcolorbox}

% Set up a toggle so that solutions can be omitted upon compilation
% if needed. By default it is false
\newtoggle{show_solution}
\togglefalse{show_solution}

\newtheorem{@solution}{\normalfont\fontsize{12}{15}\bfseries\sffamily Solution}
\NewEnviron{solution}{
  \iftoggle{show_solution}{
    \color{blue} 
    \@solution
    \BODY
    \end@solution
  }{}
}

\def\assignment#1{\def\@assignment{#1}}
\def\@assignment{??}

\def\class#1{\def\@class{#1}}
\def\@class{??}

\def\due#1{\def\@due{#1}}
\def\@due{??}

\newcommand{\setcolor}[1]{\def\@color{#1}}
\def\@color{black}

\allowdisplaybreaks

\pagestyle{fancy}

\lhead{\@class}
\chead{\@assignment}
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
    \def\currentproblem{Problem \arabic{problemcounter} (\problemoverride)}
  \fi
  \extramarks{\currentproblem}{}
  \section{\currentproblem}
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
  \textbf{\sffamily\color{\@color}\@class:\ \@assignment} \\ [12pt]
  \small Due\ on\ \@due \\
}
\preauthor{}
\postauthor{}
\predate{}
\postdate{}
\date{\vspace{-35pt}}
\author{}

