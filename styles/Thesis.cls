\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Thesis}
              [2007/22/02 v1.0
   LaTeX document class]
\def\baseclass{memoir}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}

\DisemulatePackage{setspace}
\usepackage{setspace}

% for colored listings
\usepackage{listings}
\usepackage{color}

% for tables
\usepackage[table,xcdraw]{xcolor}
\usepackage{booktabs}
 
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
 
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
 
\lstset{style=mystyle}
% end for colored


\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{listings}
\usepackage{vmargin}
\usepackage{calc}
\usepackage{fourier}
\usepackage[outline]{contour}
\contourlength{0.04ex}

\usepackage{tikz, tikz-3dplot}                               % for graphics
\usepackage{pgfplots, pgfplotstable}                         %
\usetikzlibrary{calc, patterns, arrows, backgrounds, 
                decorations.markings, shapes,shapes.multipart,
                positioning}
                
\usepackage{xfrac}                                           % for inline fractions
\usepackage{xcolor}                                          % for colors
\usepackage{array}                                           % for vertical centering in tables
\usepackage[detect-all, binary-units]{siunitx}               % for proper using SI units
\sisetup{output-decimal-marker = {,}}

\usepackage[inline]{enumitem}                                % for smart lists
\usepackage{xspace}                                          % for \xspace command
\usepackage{calc}                                            % for smart lengths
\usepackage{mathtools}                                       % for improvement of amsmath package
\usepackage{nag}                                             % for additional warnings
\usepackage{anyfontsize}                                     % for fractional font sizes
\usepackage[square, numbers,
            comma, sort&compress]{natbib}                    % references arrangement 
\usepackage{fix-cm}
\usepackage{adjustbox}
\usepackage{makecell}

                                                             
\usepackage{styles/gml}                                      % our own commands and settings
\usepackage{styles/onimage}                                  % for tikzonimage environment 

\usepackage[pdfpagemode={UseOutlines}, bookmarks=true,
            bookmarksopen=true, bookmarksopenlevel = 0,
            bookmarksnumbered = true, hypertexnames = false,
            colorlinks, linkcolor = {green!90!black},
            citecolor = {green!90!black}, urlcolor = {blue},
            pdfstartview = {FitV}, breaklinks=true]{hyperref}
            
\usepackage{polyglossia}                                     % multiple languages
                                                              
\newfontfamily\cyrillicfont[Script=Greek]{Times New Roman}
\newfontfamily\cyrillicfonttt[Script=Greek]{Times New Roman}
\setdefaultlanguage[spelling=modern]{russian}     
\setotherlanguage{english}

\newcommand*{\doi}[1]{doi: \href{http://dx.doi.org/#1}{#1}}

\captionnamefont{\small}
\captiontitlefont{\small}
           
%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------
\setmarginsrb  { 1.5in}  % left margin
               { 0.2in}  % top margin
               { 1.0in}  % right margin
               { 0.4in}  % bottom margin
               {  20pt}  % head height
               {0.25in}  % head sep
               {   9pt}  % foot height
               { 0.3in}  % foot sep
%----------------------------------------------------------------------------------------

\raggedbottom
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
           
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} 

\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}           
           
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
           
%--------------------------------------------------------------------------------
%   Chapters
%--------------------------------------------------------------------------------
           
\definecolor{numbercolor}{gray}{0.7}
\newif\ifchapternonum
\makechapterstyle{jenor}{
    \renewcommand\printchaptername{}
    \renewcommand\printchapternum{}
    \renewcommand\printchapternonum{%
        \chapternonumtrue%
    }
    \renewcommand\chaptitlefont{%
        \fontsize{20}{30}\selectfont\centering%
    }
    \renewcommand\chapnumfont{%
        \fontsize{0.8in}{0in}\selectfont\color{numbercolor}%
    }
    \renewcommand\printchaptertitle[1]{%
        \noindent%
        \ifchapternonum%
            \begin{tabularx}{\textwidth}{X}{%
                \parbox[b]{\linewidth}{\chaptitlefont ##1}%
                \vphantom{\raisebox{-15pt}{\chapnumfont 1}}}%
            \end{tabularx}%
        \else
            \begin{tabularx}{\textwidth}{Xl}{%
                \parbox[b]{\linewidth}{\chaptitlefont ##1}}%
                & \raisebox{-15pt}{\chapnumfont \thechapter}%
            \end{tabularx}%
        \fi
        \par\vskip2mm\hrule
    }
}

\newcommand\thickhrulefill{%
    \leavevmode \leaders \hrule height 1ex \hfill \kern \z@%
}
\makechapterstyle{VZ14}{
    \renewcommand{\beforechapskip}{0pt}
    \renewcommand{\midchapskip}{0pt}

    \renewcommand\chapternamenum{}
    \renewcommand\printchaptername{}
    \renewcommand\chapnamefont{\color{blue!40!black}\Large\scshape}
    \renewcommand\printchapternum{%
        \makebox{}\\[-2cm]
        \chapnamefont\null\thickhrulefill\quad
        \thechapter\quad\thickhrulefill%
    }
    \renewcommand\printchapternonum{%
        \hrule\makebox{}\\[-0.35cm]\color{blue!40!black}
    }
    \renewcommand\chaptitlefont{%
        \Huge\scshape\centering%
    }
    \renewcommand\afterchapternum{%
        \makebox{}\\[-0.22cm]%
    }
    \renewcommand\afterchaptertitle{%
        \makebox{}\\[0.2cm]\hrule\nobreak\vskip\afterchapskip%
    }
}


\setsechook{\hangsecnum}
\setsecheadstyle{\color{blue!40!black}\Large\bfseries\memRTLraggedright}
\chapterstyle{VZ14}
\pagestyle{plain}           
                                            
\newcommand*{\thesistitle}[1]{\def\ttitle{#1}}
\thesistitle{Полуавтоматическая модель внимания и ее применение для сжатия видео}
\newcommand*{\engthesistitle}[1]{\def\engttitle{#1}}
\engthesistitle{Semiautomatic Visual-Attention Modeling and Its Application to Video Compression}
%-------------------------------------------------  
\newcommand*{\supervisor}[1]{\def\supname{#1}}
%-------------------------------------------------   
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\engauthors}[1]{\def\engauthornames{#1}}
%-------------------------------------------------   
\newcommand*{\logo}[1]{\def\logoname{#1}}
%----------------------------------------------------------------------------------------    
\newcommand*{\university}[1]{\def\univname{#1}}
%-------------------------------------------------                
\newcommand*{\department}[1]{\def\deptname{#1}}
%-------------------------------------------------                
\newcommand*{\group}[1]{\def\groupname{#1}}
%----------------------------------------------------------------------------------------    
                      
%----------------------------------------------------------------------------------------
%	TITLE PAGE DESIGN
%----------------------------------------------------------------------------------------

\renewcommand\maketitle
{
    \btypeout{Title Page}
    \hypersetup{pdftitle={\@title}}
    \hypersetup{pdfauthor=\authornames}
    \thispagestyle{empty}
  
    \begin{center}
    
        \makebox{}\\[2cm]
    
        \textsc{\LARGE \univname}\\[1.5cm]
        \textsc{\Large Дипломная работа}\\[0.5cm]

        \HRule \\[0.4cm]
        {\huge \bfseries \ttitle}\\
        \HRule \\[1.5cm]
         
        \begin{minipage}{0.45\textwidth}
        \begin{flushleft} \large
        \emph{Автор:}\\
            \authornames 
        \end{flushleft}
        \end{minipage}
        \begin{minipage}{0.45\textwidth}
        \begin{flushright} \large
        \emph{Научный руководитель:} \\
            \supname     
        \end{flushright}
        \end{minipage}\\[1.5cm]

        \includegraphics[width=\linewidth]{\logoname}\\[0.5cm]
         
        \groupname\\\deptname\\[2cm]
         
        {\large \today}    
    
    \end{center}
}


%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------
\newenvironment{abstracteng}
{
  \btypeout{Abstract Page (english)}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    {\huge{\textit{Abstract}} \par}
    \bigskip
    {\normalsize\textbf \engttitle \par} % Thesis title
    \medskip
    {\normalsize by \engauthornames \par} % Author name
    \bigskip
  \end{center}

}
{
  \vfil\vfil\vfil\null
  \clearpage
}
\newenvironment{abstractrus}
{
  \btypeout{Abstract Page (russian)}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    {\huge{\textit{Аннотация}} \par}
    \bigskip
    {\normalsize\textbf \ttitle \par} % Thesis title
    \medskip
    {\normalsize \authornames \par} % Author name
    \bigskip
  \end{center}

}
{
  \vfil\vfil\vfil\null
  \clearpage
}           
       
%----------------------------------------------------------------------------------------
%	DESIGN OF TABLE OF CONTENTS
%----------------------------------------------------------------------------------------
       
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
    \refstepcounter{dummy}
    \addcontentsline{toc}{chapter}{#1}%
}
\renewcommand\tableofcontents{
    \btypeout{Table of Contents}
    \begingroup
        \hypersetup{linkcolor=black}
        \addtotoc{Оглавление}
        \begin{spacing}{1}{
            \setlength{\parskip}{1pt}
            \if@twocolumn
              \@restonecoltrue\onecolumn
            \else
              \@restonecolfalse
            \fi
            \chapter*{\contentsname
                \@mkboth{
                   \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
            \@starttoc{toc}
            \if@restonecol\twocolumn\fi
           \clearpage
        }\end{spacing}
    \endgroup
}

%------------------------------------------------------------
% Abbreviations
%------------------------------------------------------------

\DeclareRobustCommand\onedot{\futurelet\@let@token\@onedot}
\def\@onedot{\ifx\@let@token.\else.\null\fi\xspace}

\def\etal{\emph{и др}\onedot}

%------------------------------------------------------------
% HACKS
%------------------------------------------------------------
\let\cleardoublepage\clearpage           