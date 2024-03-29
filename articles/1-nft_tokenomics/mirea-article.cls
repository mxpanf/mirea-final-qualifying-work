% !TeX program  = xelatex
% !TeX encoding = UTF-8
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mirea-article}[2024/01/01 v1.0 MIREA article format]

% Declare options and pass them to the underlying class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

% Load the base class with options
\LoadClass[12pt, a4paper, titlepage]{extarticle}


% Package for hyperlinks in documents, disabling the colored borders around links
\RequirePackage{hyperref}
\hypersetup{colorlinks=false, pdfborder={0 0 0}}

% Language support for English and Russian, setting Russian as the main language
\RequirePackage[english,main=russian]{babel}

% Font package for specifying fonts
\RequirePackage{fontspec}

% Set the main document font, with specific styles for different font weights and italics
\setmainfont{XO_Thames}[
	Path = ../../fonts/,
	Extension = .ttf,
	UprightFont=*_nu,      % Regular style
	BoldFont = *_bu,       % Bold style
	ItalicFont = *_ni,     % Italic style
	BoldItalicFont = *_bi  % Bold Italic style
]

% Set the monospace font, similar to the main font setup
\setmonofont{XO_Courser}[
	Path = ../../fonts/,
	Extension = .ttf,
	UprightFont=*_nu,
	BoldFont = *_bu,
	ItalicFont = *_ni,
	BoldItalicFont = *_bi
]

% Use New Times Roman for math formulas
\RequirePackage{newtxmath}

% Package for including graphics
\RequirePackage{graphicx}

% Page geometry setup: margins
\RequirePackage[left=30mm, right=15mm, top=20mm, bottom=20mm]{geometry}

% Ensure the first paragraph of each section is indented
\RequirePackage{indentfirst}

% Paragraph indentation and spacing setup
\parindent=1.25cm % Paragraph indentation
\parskip=0pt      % Paragraph spacing

% Minimum number of characters at the end of a line for hyphenation
\righthyphenmin=2

% Line spacing (1.5 lines)
\linespread{1.43}

% Customization of the table of contents title
\addto\captionsrussian{\renewcommand{\contentsname}{Содержание}}

% Package for enhanced underline capabilities
\RequirePackage[normalem]{ulem}

% Package for customizing the list of figures, tables, and contents
\RequirePackage{tocloft}
% Contents title format customization
\renewcommand\cfttoctitlefont{\hfill\fontsize{16pt}{16pt}\selectfont\bfseries\MakeUppercase}
\renewcommand\cftaftertoctitle{\hfill\hfill}
% Adjust additional space between sections in toc
\setlength{\cftbeforesecskip}{0pt}
% Add dots to section titles in the table of contents
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Package to control the placement of floats like tables and figures
\RequirePackage{placeins}


% Package for customizing section titles
\RequirePackage{titlesec}
% Customize the format of sections, subsections, and subsubsections
\titleformat{\section}{\FloatBarrier\parskip=6pt\filcenter\fontsize{14pt}{14pt}\selectfont\bfseries\uppercase}{\thesection}{.5em}{}
\titleformat{\subsection}{\FloatBarrier\filcenter\bfseries}{\thesubsection}{.5em}{}
\titleformat{\subsubsection}{\FloatBarrier\filcenter\bfseries}{\thesubsubsection}{.5em}{}
% Adjust spacing for sections
\titlespacing*{\section}{0pt}{*2}{0pt}
\titlespacing*{\subsection}{0pt}{*2}{0pt}
\titlespacing*{\subsubsection}{0pt}{*2}{0pt}

% Abstract environment customization
\renewenvironment{abstract}{\clearpage\section*{\MakeUppercase{\abstractname}}}{\clearpage}

% List indentation and label customization
\labelwidth=1.25cm
% Unordered list labels
\renewcommand\labelitemi{---}
\renewcommand\labelitemii{---}
\renewcommand\labelitemiii{---}
\renewcommand\labelitemiv{---}
% Ordered list labels
\renewcommand\labelenumi{\arabic{enumi})}
\renewcommand\labelenumii{\asbuk{enumii})}
\renewcommand\labelenumiii{\arabic{enumiii})}
\renewcommand\labelenumiv{\asbuk{enumiv})}

% Package for customizable list formats
\RequirePackage{enumitem}
\setlist{itemsep=0pt, parsep=0pt, topsep=0mm} % Adjust list spacing

% Additional customizations for Russian typography
\makeatletter
\AddEnumerateCounter*{\asbuk}{\c@asbuk}
\makeatother

\graphicspath{{../images/}}

\makeatletter
% Буквы для нумерации списка (исключены ё, з, щ, ч, ъ, ы, ь)
% Подробнее https://ctan.math.illinois.edu/macros/latex/required/babel/contrib/russian/russianb.pdf 
\def\russian@alph#1{\ifcase#1\or
		а\or б\or в\or г\or д\or е\or ж\or
		и\or к\or л\or м\or н\or о\or п\or
		р\or с\or т\or у\or ф\or х\or ц\or
		ш\or э\or ю\or я\else\@ctrerr\fi}
\def\russian@Alph#1{\ifcase#1\or
		А\or Б\or В\or Г\or Д\or Е\or Ж\or
		И\or К\or Л\or М\or Н\or О\or П\or
		Р\or С\or Т\or У\or Ф\or Х\or Ц\or
		Ш\or Э\or Ю\or Я\else\@ctrerr\fi}

\patchcmd{\l@section}{#1}{\textnormal{\uppercase{#1}}}{}{} % Разделы в содержании без выделения жирным, в верхнем регистре
\patchcmd{\l@section}{#2}{\textnormal{#2}}{}{} % Страницы без выделения жирным

\apptocmd{\appendix}{
	\renewcommand{\thesection}{\Asbuk{section}}
	\titleformat{\section}{\filcenter\fontsize{16pt}{16pt}\selectfont\bfseries}{}{0pt}{\MakeUppercase{\appendixname}~\thesection \\}{}{} % Изменение формата раздела приложения
	\renewcommand\thefigure{\Asbuk{section}.\arabic{figure}} % Изменении формата нумерации иллюстрации
	\renewcommand\thetable{\Asbuk{section}.\arabic{table}} % Изменении формата нумерации таблицы
	\renewcommand\theequation{\Asbuk{section}.\arabic{equation}} % Изменении формата нумерации формулы

	\let\oldsec\section
	\renewcommand{\section}{
		\clearpage
		\phantomsection
		\refstepcounter{section}
		\setcounter{figure}{0} % Счёт иллюстраций в пределах одного приложения
		\setcounter{table}{0} % Счёт таблиц в пределах одного приложения
		\setcounter{equation}{0} % Счёт иллюстраций в пределах одного приложения
		\addcontentsline{toc}{section}{\appendixname~\thesection}
		\oldsec*} % Нумерация раздела после названия
}

\makeatother


% Caption package for customization of captions in figures and tables
\RequirePackage[labelsep=endash]{caption}
\captionsetup[table]{justification=raggedright, singlelinecheck=false}

% Renaming figure captions in Russian
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}

% Customization of the bibliography section title
\addto\captionsrussian{\renewcommand{\refname}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}}

% Bibliography environment adjustments
\BeforeBeginEnvironment{thebibliography}{
	\phantomsection
	\makeatletter
	\renewcommand*{\@biblabel}[1]{#1.\hfill}
	\makeatother
}

\setlength{\bibindent}{-1.25cm} % Adjust bibliography item indentation
