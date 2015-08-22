\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sensor-cdt-mres}[2014/06/10 v0.1 Sensor CDT MRes]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sensor CDT MRes document class, created by James D. Manton                      %
% See https://github.com/Sensor-CDT-14-15/sensor-cdt-mres for support and updates %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[twoside]{article}


% Fonts
\RequirePackage{fontspec}
\setmainfont{Minion Pro}
\setsansfont[Scale=MatchLowercase]{Myriad Pro}
\setmonofont[Scale=MatchLowercase]{DejaVu Sans Mono}
\RequirePackage{unicode-math}
\newcommand{\sansnormal}{\fontspec{Myriad Pro}}
\newcommand{\sanssemibold}{\fontspec{Myriad Pro Semibold}}
\newcommand{\sanssemibolditalic}{\fontspec{Myriad Pro Semibold Italic}}
\newcommand{\sansbold}{\fontspec{Myriad Pro Bold}}
\newcommand{\serifnormal}{\fontspec{Myriad Pro}}


% Page dimensions
\RequirePackage[paperwidth=210mm, paperheight=297mm, left=19mm, right=12mm, top=27.5mm, bottom=32mm, foot=8mm, asymmetric]{geometry}
\setlength{\columnsep}{5.2mm}
\setlength{\parindent}{5.2mm}


% Maths
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\setmathfont[Scale=MatchLowercase]{XITS Math}%
\setmathfont[range=\mathup/{num,latin,Latin,greek,Greek}]{Minion Pro}%
\setmathfont[range=\mathbfup/{num,latin,Latin,greek,Greek}]{MinionPro-Bold}% 
\setmathfont[range=\mathit/{num,latin,Latin,greek,Greek}]{MinionPro-It}%
\setmathfont[range=\mathbfit/{num,latin,Latin,greek,Greek}]{MinionPro-BoldIt}%


% Table of contents
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\sffamily\oldtableofcontents\vspace*{2em}}}


% Figure captions
\RequirePackage{caption}
\newfontfamily\capfont{Myriad Pro}
\DeclareCaptionFormat{capfont}{\capfont \fontsize{7.9pt}{8.5pt}\selectfont \textbf{#1#2}#3}
\captionsetup[figure]{format=capfont}
\RequirePackage{sidecap}


% Tables
\captionsetup[table]{format=capfont}
\renewenvironment{table}{%
	\renewcommand* {\@floatboxreset}{%
		\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont\@setminipage}%
	\@float{table}%
}{%
	\end@float
}


% Title
\RequirePackage{titling}
\def\affiliation#1{\def\@affiliation{#1}}
\newcommand{\printaffiliation}{\@affiliation}
\affiliation{}
\renewcommand{\maketitle}{
	\frontmatter
	\coverpage
	\declaration
	
	\mainmatter

	\makeatletter
	% Span both columns
	\twocolumn[
		\begin{@twocolumnfalse}
			% Title
			{\sanssemibold\fontsize{22pt}{24pt}\selectfont \thetitle}

			\vspace*{10pt}
			% Author
			{\sanssemibold\fontsize{9.7pt}{12pt}\selectfont \theauthor}

			\vspace*{8pt}

			{\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont
			\printaffiliation

			\vspace*{1em}

			\vspace*{0.5em}\addcontentsline{toc}{section}{Introduction}
			}
		\end{@twocolumnfalse}
	]
}


% Abstract
\renewenvironment{abstract}{%
\sanssemibold\fontsize{8.5pt}{10.5pt}\selectfont\setlength{\parindent}{0pt}%
}{\par\vspace*{1em}}


% Keywords
\RequirePackage{color}


% Drop cap
\RequirePackage{lettrine}
\renewcommand{\LettrineTextFont}{\rmfamily}
\newcommand{\dropcap}[1]{\lettrine[loversize=0.15,nindent=0pt]{{\sansnormal\selectfont #1}}{}}


% Footer
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[OC]{\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont \ifthenelse{\value{page}=1}{cdt.sensors.cam.ac.uk}{\@author} \hfill Sensor CDT \hspace{2pt} | \hspace{2pt} \textbf{Team Challenge} \hspace{2pt} | \hspace{2pt} \ifthenelse{\value{page}=1}{\thepage\ of \ifdefined \r@LastMainPage \pageref{LastMainPage} \else \pageref{LastPage} \fi}{\textbf{\thepage}}}
\fancyfoot[EC]{\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont \thepage \hspace{2pt} | \hspace{2pt} cdt.sensors.cam.ac.uk \hfill \@author}
\pagestyle{fancy}


% Section headers
\RequirePackage{titlesec}
\titleformat{\section}{\sansbold\fontsize{7.9pt}{8.5pt}}{\arabic{section}}{0.5em}{}{}
\titlespacing*{\section}{0pt}{1em}{0pt}
\titleformat{\subsection}[runin]{\sanssemibold}{\arabic{section}.\arabic{subsection}}{0.5em}{}[.]
\titlespacing*{\subsection}{0pt}{1em}{1em}
\titleformat{\subsubsection}[runin]{\sanssemibolditalic}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}[.]
\titlespacing*{\subsubsection}{0pt}{0pt}{1em}


% Alter some LaTeX defaults for better treatment of figures
\renewcommand{\topfraction}{0.999}
\renewcommand{\bottomfraction}{0.999}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\setcounter{dbltopnumber}{2}
\renewcommand{\dbltopfraction}{0.999}
\renewcommand{\textfraction}{0.01}
\renewcommand{\floatpagefraction}{0.99}
\renewcommand{\dblfloatpagefraction}{0.99}


% Cross-references
\RequirePackage{prettyref}
\newrefformat{tab}{Table \ref{#1}}
\newrefformat{fig}{Figure \ref{#1}}
\newrefformat{eqn}{Equation \ref{#1}}
\newrefformat{app}{Appendix \ref{#1}}


% Main text
\renewcommand{\normalsize}{\fontsize{9.5pt}{10.5pt}\selectfont}
\frenchspacing


% Front matter
\newcommand{\frontmatter}{%
	\newgeometry{hmarginratio=1:1, margin=1.5in}%
	\pagestyle{empty}%
	\pagenumbering{gobble}%
}


% Main matter
\newcommand{\mainmatter}{%
	\restoregeometry%
	\pagenumbering{arabic}%
	\pagestyle{fancy}%
}


% Cover page
\def\college#1{\gdef\@college{#1}}
\newcommand{\coverpage}{%
	\newgeometry{hmarginratio=1:1, margin=1.5in}
	\begin{center}
		\includegraphics[height=12mm]{sensor_cdt} \hfill \includegraphics[height=12mm]{epsrc}
		
		\vspace{\fill}
		
		{\fontsize{22pt}{25pt}\selectfont \bfseries \@title \par}
	
		\vspace{2em}
	
		{\fontsize{18pt}{21pt}\selectfont \bfseries \@author \par}
	
		\vspace{\fill}
		
		\includegraphics[height=50mm]{coat_of_arms}
	
		\vspace{\fill}
		
		{\fontsize{16pt}{19pt}\selectfont Department of Chemical Engineering \& Biotechnology \par}
	
		\vspace{1.5em}
	
		{\fontsize{16pt}{19pt}\selectfont University of Cambridge \par}
	
		\vspace{\fill}
	
		{\fontsize{14pt}{17pt}\selectfont This dissertation is submitted as part-fulfilment for the degree of \\ Master of Research \par}

		\vspace{\fill}
		
		{\fontsize{14pt}{17pt}\selectfont \@college\hfill \hfill \@date}
	\end{center}
	\clearpage
}


% Declaration
\RequirePackage{lastpage}
\def\wordcount#1{\gdef\@wordcount{#1 words}}
\newcommand{\declaration}{%
	{\fontsize{12pt}{14pt}\selectfont
	\noindent The work described in this report is the result of my own research, unaided except as specifically acknowledged in the text, and it does not contain material that has already been used to any substantial extent for a comparable purpose.
	This report contains \ifdefined \r@LastMainPage \pageref{LastMainPage} \else \pageref{LastPage} \fi pages (excluding this page and the appendices) and \@wordcount.

	\vspace{2em}
	
	\noindent Signed:
	\IfFileExists{signature.png}
	{\begin{minipage}[t]{15em}
		\vspace*{-2.5em}
		\includegraphics[height=5em]{signature}
		
		\centering
		(Student)
	\end{minipage}}
	{\begin{minipage}[t]{15em}
		\centering
		\rule{\textwidth}{0.5pt} \newline
		\newline
		(Student)
	\end{minipage}}
	\hspace{\fill} Date: \thedate \newline

	\vspace{\fill}

	\noindent I confirm that I have cleared the laboratory space I have used for the work described in this report, to the satisfaction of the Sensor CDT Teaching Fellows and the responsible laboratory technician.
	All chemical and biological samples have been properly and safely disposed of according to University guidance.

	\vspace{2em}
	
	\noindent Signed:
	\IfFileExists{signature.png}
	{\begin{minipage}[t]{15em}
		\vspace*{-2.5em}
		\includegraphics[height=5em]{signature}
		
		\centering
		(Student)
	\end{minipage}}
	{\begin{minipage}[t]{15em}
		\centering
		\rule{\textwidth}{0.5pt} \newline
		\newline
		(Student)
	\end{minipage}}
	\hspace{\fill} Date: \thedate \newline

	\vspace{\fill}

	\noindent I confirm that the student above has cleared the laboratory space used in this project to my satisfaction.

	\vspace{2em}
	
	\noindent Signed:
	\begin{minipage}[t]{15em}
		\centering
		\rule{\textwidth}{0.5pt} \newline
		\newline
		(Senior Teaching Fellow)
	\end{minipage}
	\hspace{\fill} Date: \rule{9em}{0.5pt} \newline

	\vspace{\fill}
	}
	\clearpage
}


% Appendices
\let\oldappendix\appendix
\renewcommand{\appendix}{
	\label{LastMainPage}
	\clearpage
	\onecolumn
	\pagestyle{empty}
	{\fontsize{14pt}{16pt}\selectfont \noindent \sffamily{\textbf{Appendices}}} \newline
	\oldappendix
	\titleformat{\section}{\sansbold\fontsize{7.9pt}{8.5pt}}{\Alph{section}}{0.5em}{}{}
	\titleformat{\subsection}[runin]{\sanssemibold}{\Alph{section}.\arabic{subsection}}{0.5em}{}[.]
	\titleformat{\subsubsection}[runin]{\sanssemibolditalic}{\Alph{section}.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}[.]
}
