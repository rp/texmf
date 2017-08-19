\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rahul-cv}[2017/08/17 Rahul Parhi's CV/Resume class]
\LoadClass[10pt,letterpaper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage[headheight=110pt,margin=0.63in]{geometry}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}

\setlength\parindent{0pt} % no indent by default
\newcommand{\name}[1]{\centerline{\bfseries\huge{\MakeUppercase{#1}}}\nameskip}

\setlist{nosep}

% center environment without spacing
\newenvironment{nscenter}
  {\parskip=0pt\par\nopagebreak\centering}
  {\par\noindent\ignorespacesafterend}

\newcommand{\info}[2][\, $\circ$\,]{%
  \begin{nscenter}
    \def\nextitem{\def\nextitem{#1}}%
    \@for \el:=#2\do{\nextitem\el}%
  \end{nscenter}
}

\setlength{\multicolsep}{6.0pt plus 2.0pt minus 1.5pt}
\pagestyle{empty}

\renewcommand{\dotfill}
  {\leavevmode \cleaders \hb@xt@ .33em{\hss .\hss }\hfill \kern \z@}

\newcommand{\dotafter}[1]
  {#1\textnormal{\dotfill}}

\titleformat{\section}
  {\normalsize\bfseries\raggedright}
  {}
  {0pt}
  {\uppercase}
  [\sectionskip\titlerule]

\titleformat{\subsection}
  {\normalsize\scshape\raggedright}
  {}
  {0.5em}
  {\dotafter}

\titlespacing*{\section}{0pt}{0ex plus 0.5ex minus 0.5ex}{1ex}
\titlespacing*{\subsection}{0pt}{-1ex plus 0.5ex minus 0.5ex}{1ex}

\newcommand*{\length}[1]{%
  \@tempcnta\z@
  \@for\@tempa:=#1\do{\advance\@tempcnta\@ne}%
  \@tempcnta%
}

% tabularx multicolumn magic tricks
\newcommand{\mcX}[2]{\multicolumn{#1}{@{}>{\setlength{\hsize}{#1\hsize}}X@{}}{#2}}
\newcommand{\mc}[3]{\multicolumn{#1}{@{}#2@{}}{#3}}

% what, when, info, extra, extrainfo, description
\newcommand{\block}[6]{%
  \begin{tabularx}{\width}{@{}Xr@{}}
    \mc{1}{l}{\bf #1} & #2 \\
    \mc{1}{l}{#3} & \textit{#4} \\
    \def\nextitem{\def\nextitem{}}%
    \ifstrempty{#5}
      {\\ [-2\normalbaselineskip]}
      {\@for \el:={#5}\do{\nextitem{\el \newline}}}
    \phantom{} \\ [-\normalbaselineskip]
    \ifstrempty{#6}
      {}
      {\mcX{2}{\descriptionsize #6}}
  \end{tabularx}
  \vspace{1ex}
}

\def\nameskip{\smallskip}
\def\sectionskip{\smallskip}
\def\subsectionskip{\smallskip}

\setlength\leftskip{1.5em}
\def\width{\dimexpr\linewidth-\leftskip\relax}

\def\descriptionsize{\footnotesize}