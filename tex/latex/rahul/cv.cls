\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2018/07/13 Rahul Parhi's CV/Resume class]
\LoadClass[10pt,letterpaper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage[headheight=110pt,margin=0.63in]{geometry}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage[cmyk]{xcolor}

\renewcommand{\familydefault}{\sfdefault}

\setlength\parindent{0pt} % no indent by default
\newcommand{\name}[1]{\centerline{\bfseries\huge{\MakeUppercase{#1}}}\nameskip}

\setlist{noitemsep}

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

% kinda like \hfill but with dots instead of blankspace
\renewcommand{\dotfill}
  {\leavevmode \cleaders \hb@xt@ .33em{\hss .\hss }\hfill \kern \z@}

% fill in rest of line ith dots after text
\newcommand{\dotafter}[1]
  {#1\textnormal{\dotfill}}

\titleformat{\section}
  {\color{blue}\normalsize\bfseries\raggedright}
  {}
  {0pt}
  {\uppercase}
  [\sectionskip\titlerule]

\titleformat{\subsection}
  {\color{blue}\normalsize\raggedright}
  {}
  {0.5em}
  {\dotafter}

\titlespacing*{\section}{0pt}{3ex plus 2ex minus 0.5ex}{2ex plus 0.5ex minus 0ex}
\titlespacing*{\subsection}{0pt}{2ex plus 1ex minus 0.5ex}{1ex plus 0.5ex minus 0ex}

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
  \bgroup
  \def\arraystretch{1.1}
  \begin{tabularx}{\width}{@{}Xr@{}}
    \mc{1}{l}{\bfseries #1} & #2 \\
    \mc{1}{l}{#3} & \textsl{#4} \\
    \def\nextitem{\def\nextitem{}}%
    \ifstrempty{#5}
      {\\ [-2.2\normalbaselineskip]}
      {\@for \el:={#5}\do{\nextitem{\el \newline}}}
    \phantom{} \\[-0.8\normalbaselineskip]
    \ifstrempty{#6}
      {}
      {\mcX{2}{\descriptionsize\rmfamily\parbox{\hsize}{#6}}}
  \end{tabularx}
  \egroup
  \vspace{1ex plus 1ex minus 1ex}
}

\def\nameskip{\smallskip}
\def\sectionskip{\smallskip}
\def\subsectionskip{\smallskip}

\setlength\leftskip{1.5em}
\def\width{\dimexpr\linewidth-\leftskip\relax}

\def\descriptionsize{\small}
