% resume.cls
% LaTeX file defining the structure of the resume
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2024/12/16 v1.1 LaTeX class for CVs]

% Load the base class with A4 paper size and 10pt font
\LoadClass[a4paper,10pt]{article}

% Load necessary packages
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{tgheros}

\RequirePackage[margin=1in]{geometry}
\RequirePackage{amsmath, amssymb}
\RequirePackage[dvipsnames]{xcolor}

\definecolor{britishgreen}{RGB}{0, 66, 37}
\definecolor{green-link}{RGB}{0, 122, 69}

\RequirePackage[
   colorlinks=true,
   %linkcolor=PineGreen,
   linkcolor=green-link,
   %linkbordercolor=PineGreen,
   linkbordercolor=green-link
   filecolor=magenta,
   % urlcolor=PineGreen,
   % urlbordercolor=PineGreen,   
   urlcolor=green-link,
   urlbordercolor=green-link,
   citecolor=blue
]{hyperref}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{titlesec}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage{etaremune}
\RequirePackage[style=iso]{datetime2}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{soul}
\RequirePackage{microtype}
\RequirePackage{ragged2e}
\usepackage[most]{tcolorbox}

% Bibliography setup
\RequirePackage[
    backend=biber,
    sorting=ydnt,
    url=false,
    maxbibnames=99,
    defernumbers=true,
    style=numeric-comp
]{biblatex}



% Create a command for the boxed title
\newcommand{\boxedsection}[1]{%
   \begin{tcolorbox}[
      %colback=gray!20,
        colback=britishgreen,
      %colframe=black,
      coltext=white,
      boxrule=.5pt,
      width=\textwidth,
      arc=0mm,
      sharp corners,   % Added to ensure rectangular shape
      top=1.3pt,         % Reduced top padding
      bottom=1.3pt,      % Reduced bottom padding
      right=0pt,
      left=0pt,
   ]
   \textbf{#1}
   \end{tcolorbox}%
}
% Format section titles
\titleformat{\section}
   {\large}
   {}
   {0em}
   {\boxedsection}

\titlespacing{\section}
   {0pt}    % Left margin
   {-3.ex}  % Space before
   {-4.ex}  % Space after

% Subsection formatting
\titleformat{\subsection}
    {\large\bfseries\raggedright}
    {}{0em}
    {}

\titlespacing*{\subsection}
    {0pt}
    {1.25ex plus .5ex minus .2ex}
    {.75ex plus .1ex}

% Define custom commands
\newcommand{\name}[1]{%
    \begingroup
    % \centering
    {\Huge\scshape \textbf{#1}\par}
    \vspace{1em}
    \endgroup
}

% Section title command
\newcommand{\sectiontitle}[1]{%
    \section*{#1}
}

% Subsection title command
\newcommand{\subsectiontitle}[1]{%
    \subsection*{#1}
}

% Entry environments
\newenvironment{entry}[1]{%
    \par\noindent
    \textbf{#1}
    \vspace{0.5em}\par
}{%
    \vspace{0.15em}
}

\newenvironment{inline_entry}[1]{%
    \par\noindent
    \textbf{#1}
}{%
    \vspace{0.15em}
}

\newenvironment{position_simple}[2]{%
    \par\noindent
    \textbf{#1}, \textit{#2}\par
}{%
    \vspace{0.15em}
}

\newenvironment{position}[3]{%
    \par\noindent
    \textbf{#1}, \textit{#2}\hfill\textbf{#3}
    \vspace{0.05em}\par
}{%
    \vspace{0.5em}
}

% Header and footer setup
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\lfoot{\small\textit{Curriculum Vitae of Riccardo Caraccio --- \today}}
\rfoot{\small\thepage/\pageref*{LastPage}}

% Bibliography name highlighting
% See here: http://www.hansenlab.org/cv_bibliography_tex
\renewcommand*{\mkbibnamegiven}[1]{
   \ifitemannotation{highlight}
   % {\underline{\textbf{#1}}}
   {\textbf{#1}}
   {#1}
}

\renewcommand*{\mkbibnamefamily}[1]{
   \ifitemannotation{highlight}
     % {\underline{\textbf{#1}}}
     {\textbf{#1}}
     {#1}%
   \ifitemannotation{equal}
     {\textsuperscript{\textdagger}}
     {}%
   \ifitemannotation{corresponding}
     {\textsuperscript{*}}
     {}%
}%%

% Bibliography environment
\defbibenvironment{bibliography}
    {\renewcommand\labelenumi{\theenumi.}%
     \begin{etaremune}[leftmargin=2em]}
    {\end{etaremune}}
    {\item}

\endinput
