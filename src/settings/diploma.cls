% !TeX program  = xelatex
% !TeX encoding = UTF-8
% !TeX root     = diploma.tex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diploma}[2024/03/21 v1.0 MIREA KB-14 final classification work]

% Declare options and pass them to the underlying class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

% Load the base class with options
\LoadClass[14pt, a4paper, titlepage]{extarticle}

% Package for hyperlinks in documents, disabling the colored borders around links
\RequirePackage{hyperref}
\hypersetup{colorlinks=false, pdfborder={0 0 0}}

% Language support for English and Russian, setting Russian as the main language
\RequirePackage[english,main=russian]{babel}

% Font package for specifying fonts
\RequirePackage{fontspec}

% Set the main document font, with specific styles for different font weights and italics
\setmainfont{XO_Thames}[
	Path = ../fonts/,
	Extension = .ttf,
	UprightFont=*_nu,      % Regular style
	BoldFont = *_bu,       % Bold style
	ItalicFont = *_ni,     % Italic style
	BoldItalicFont = *_bi  % Bold Italic style
]

\newfontface\monofont{XO_Courser}[
    Path = ../fonts/,
    Extension = .ttf,
    UprightFont=*_nu,      % Monospace regular style
    BoldFont = *_bu,      % Monospace bold style
    ItalicFont = *_ni,     % Monospace italic style
    BoldItalicFont = *_bi % Monospace bold italic style
]


% Math formulas
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

%\RequirePackage{tocbibind} % Добавить раздел содержание в содержание

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

% Add a period after section and subsection numbers in the table of contents
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

\setlength{\cftsecindent}{0pt} % Remove indent in toc for \section
\setlength{\cftsubsecindent}{0pt} % Remove indent in toc for \subsection
\setlength{\cftsubsubsecindent}{0pt} % Remove indent in toc for \subsubsection


% Package to control the placement of floats like tables and figures
\RequirePackage{placeins}

% Package for customizing section titles
\RequirePackage{titlesec}
% Customize the format of sections, subsections, and subsubsections
\titleformat{\section}{\FloatBarrier\parskip=6pt\filcenter\fontsize{16pt}{16pt}\selectfont\bfseries\uppercase}{\thesection.}{.5em}{}
\titleformat{\subsection}{\FloatBarrier\filcenter\bfseries}{\thesubsection.}{.5em}{}
\titleformat{\subsubsection}{\FloatBarrier\filright\bfseries\itshape}{\thesubsubsection.}{.5em}{}
%\titlespacing*{\subsection}{0pt}{*2}{0pt} % Remove indent for \subsection 
%\titlespacing*{\subsubsection}{0pt}{*2}{0pt} % Remove indent for \subsubsection

% Настройка вертикальных отступов для section
\titlespacing*{\section}
{0pt} % отступ слева
{15pt} % отступ сверху
{10pt} % отступ снизу

% Настройка вертикальных отступов для subsection
\titlespacing*{\subsection}
{0pt} % отступ слева
{15pt} % отступ сверху
{10pt} % отступ снизу

% Настройка вертикальных отступов для subsubsection
\titlespacing*{\subsubsection}
{0pt} % отступ слева
{15pt} % отступ сверху
{10pt} % отступ снизу

\AddToHook{cmd/section/before}{\clearpage} % Начинать раздел с новой страницы

\renewenvironment{abstract}{\clearpage\section*{\MakeUppercase{\abstractname}}}{\clearpage}

\labelwidth=1.25cm % Горизонтальный отступ у элемента списка

% Ненумерованные списки разной вложенности
\renewcommand\labelitemi{---}
\renewcommand\labelitemii{---}
\renewcommand\labelitemiii{---}
\renewcommand\labelitemiv{---}

% Нумерованные списки разной вложенности
\renewcommand\labelenumi{\arabic{enumi})}
\renewcommand\labelenumii{\asbuk{enumii})}
\renewcommand\labelenumiii{\arabic{enumiii})}
\renewcommand\labelenumiv{\asbuk{enumiv})}

% Форматирование списков
\RequirePackage{enumitem}
\setlist{itemsep=0pt, parsep=0pt, topsep=0mm, } % Возможна опция wide
\makeatletter
\AddEnumerateCounter*{\asbuk}{\c@asbuk}
\makeatother

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


\RequirePackage[labelsep=endash]{caption} % Настройка пунктуации
\captionsetup[table]{justification=raggedright, singlelinecheck=false} % Выравнивание по левому краю надписи таблицы

\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}} % Переопределение caption из babel


% Настройка заголовка списка использованных источников
\addto\captionsrussian{\renewcommand{\refname}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}}

\BeforeBeginEnvironment{thebibliography}{
	\phantomsection % для корректной ссылки в содержании 
	\makeatletter
	\renewcommand*{\@biblabel}[1]{#1.\hfill} % формат нумерации списка
	\makeatother}

\setlength{\bibindent}{-1.25cm} % Убрать отступы у элементов списка использованных источников + \{thebibliography}{99\kern\bibindent}