% !TeX program  = xelatex
% !TeX encoding = UTF-8
% !TeX root     = course-work.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mirea}[2024/03/21 KB-14 final classification work]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} 
\ProcessOptions\relax

\LoadClass[14pt, a4paper, titlepage]{extarticle}


\RequirePackage{hyperref}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} % Отключение подсветки ссылок


\RequirePackage[english,main=russian]{babel}
\RequirePackage{fontspec}
\setmainfont{Times New Roman} % Если возникают проблемы при компиляции с данной строкой, необходимо на компьютер установить  Times New Roman
\RequirePackage{newtxmath} % Поменять гарнитуру в фомулах на Times New Roman

\RequirePackage[left=30mm, right=15mm, top=20mm, bottom=20mm]{geometry}

\RequirePackage{indentfirst} % Красная строка у первого абзаца раздела

\RequirePackage{graphicx}

\parindent=1.25cm % Размер красной строки

\parskip=0pt % Отступ между абзацами

\righthyphenmin=2 % Разрешить переносить слоги в 2 буквы (стандартное значение 3)

\linespread{1.3} % полуторный межстрочный интервал

%\RequirePackage{tocbibind} % Добавить раздел содержание в содержание

% Настройка заголовка содержания
\addto\captionsrussian{\renewcommand{\contentsname}{Содержание}}

\RequirePackage[normalem]{ulem} % underline some lines

\RequirePackage{tocloft}
% Формат содержания
\renewcommand\cfttoctitlefont{\hfill\fontsize{16pt}{16pt}\selectfont\bfseries\MakeUppercase}
\renewcommand\cftaftertoctitle{\hfill\hfill}

\setlength{\cftbeforesecskip}{0pt} % Addtional space between sections in toc

%\setlength{\cftsecindent}{0pt} % Remove indent in toc for \section
%\setlength{\cftsubsecindent}{0pt} % Remove indent in toc for \subsection
%\setlength{\cftsubsubsecindent}{0pt} % Remove indent in toc for \subsubsection

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % Добавить точки у разделов в содержании

\RequirePackage{placeins} % Команда \FloatBarrier для размещения плавающего окружения в пределах раздела, подраздела, пункта

% Настройка раздела, подраздела, подподраздела
\RequirePackage{titlesec}
\titleformat{\section}{\FloatBarrier\parskip=6pt\filcenter\fontsize{16pt}{16pt}\selectfont\bfseries\uppercase}{\thesection}{.5em}{}
\titleformat{\subsection}{\FloatBarrier\filcenter\bfseries}{\thesubsection}{.5em}{}
\titleformat{\subsubsection}{\FloatBarrier\filcenter\bfseries}{\thesubsubsection}{.5em}{}
%\titlespacing*{\subsection}{0pt}{*2}{0pt} % Remove indent for \subsection 
%\titlespacing*{\subsubsection}{0pt}{*2}{0pt} % Remove indent for \subsubsection 


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