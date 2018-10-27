\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asgmt}[2018-10-12 Rahul's Note LaTeX Class]

\LoadClass[11pt,letterpaper]{article}

\RequirePackage{amsmath}
\RequirePackage[font=footnotesize, skip=6pt]{caption}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage[headheight=110pt,margin=1in]{geometry}
\RequirePackage{lastpage}
\RequirePackage[sf,bf,compact]{titlesec}
\RequirePackage{titling}

\def\name#1{\def\@name{#1}}
\def\@name{??}

\allowdisplaybreaks

\pagestyle{fancy}

\lhead{\textit{\@title}}
\chead{}
\rhead{\textit{Page {\thepage} of \pageref{LastPage}}}
\lfoot{}
\cfoot{}
\rfoot{}

\fancypagestyle{plain}{
  \lhead{}
  \chead{}
  \rhead{}
  \lfoot{}
  \cfoot{}
  \rfoot{\textit{Page {\thepage} of \pageref{LastPage}}}
}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\setlength{\droptitle}{-60pt}

\linespread{1.1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

\patchcmd{\@maketitle}{\@title}{
  \textbf{\sffamily\@title} \\ [9pt]
  \small\textsf{\@name} \\
}{}{}

\preauthor{}
\postauthor{}
\predate{}
\postdate{}
\date{\vspace{-35pt}}
\author{}

