%05.12.2024 Ana Neacșu
%Modified the class and added examples 
%
% 01.04.2010 Dragoș Niculescu 
% teza-upb.cls bazat pe ru-thesis.cls - Rutgers University thesis class file 
% 
% Les Clowney 
% ru-thesis document style (LaTeX)
%  ruthesis.cls is based on the LaTeX documentstyle ruthesis.sty, to which
%  both Dave Steiner and Tara Madhyastha contributed.

%  4/9/94 Modified for LaTeX2e [lsc]
%  11/18/94 [lsc] Removed uses of the \initials command. Use of initials,
%     e.g., Ph.D. is not acceptable until after the degree is awarded.
%  3/22/95  [lsc/dks] Changed the way the default 11pt gets setup.
%
%     This style  reflects the requirements set forth by the Graduate
%     School of Rutgers, The State  University. The style is initially defined
%     by the LaTex report style at 11 point.

% Class description
\usepackage[utf8x]{inputenc}
\NeedsTeXFormat{LaTeX2e}
\def\fileversion{1.0}
\def\filedate{03/04/2011}
\ProvidesClass{teza-upb}[\filedate\space v\fileversion\space
			 Standard LaTeX2e document class]
% this style is really a driver for the report style, so pass all
% options through.
\newcommand\@pointsize{11pt}
\DeclareOption{10pt}{\renewcommand\@pointsize{10pt}}
\DeclareOption{11pt}{\renewcommand\@pointsize{11pt}}
\DeclareOption{12pt}{\renewcommand\@pointsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[\@pointsize]{report}
\usepackage{array}
\usepackage{setspace}
\usepackage{fancyhdr}
\doublespacing

% ***********************************************************************
% Sumary of New Commands (many are not to be used outside of the style file)
%
%       The flollowing are primarily for the titlepage et al....
%       \draft     (this invokes the macro  \draftrue, modifies title page)
%       \copyrightpage     (make a copyright page)
%       \figurespage     (make a page for list of figures)
%       \tablespage     (make a page for list of tables)
%       \title{thesis title} (this is defined by the report style)
%       \author{author's name}(this is defined by the report style)
%       \pagestyletopright. Place page numbers at topright corner.
%       \phd    (if invoked then \phdtrue is set.
%                The default is  not to be getting one. The command
%                \degree may be ignored if this command is 
%                used. The default is for the Master of Science.)
%       \degree{type of degree, e.g. Master of Science}
%               The default is Master of Science (or Doctor of Philosophy if
%                \phd is used.) 
%       **** joint  Degrees ****
%               The joint degree is always(?) offered in conjunction
%               with The University of Medicine and Dentistry of New
%               Jersey. Thus for a joint degree \jointumdnj will
%               probably always be used.                
%       \jointumdnj (Invokes the command \joint with the proper argument
%               for the University of Medicine of and Dentistry.)
%       \joint{argument}
%               (The degree is offered jointly with... . The command
%                \joint invokes the macro \jointtrue and gdefs @jointwith
%                to be the value of argument.
%                The command \jointumdnj will invoke joint.)
%       \abstract{the body of the abstract}
%       \acknowledgements{the body of the acknowledgements}
%       \dedication{the body of the dedication}
%       \advisor{the principal advisor's name}
%       \submissionyear{year of submission to the Graduate School}
%       \submissionmonth{month of submission to the Graduate School}
%               (The default dates used will be those at which the
%                document was prepared)
%      \begin-end{vita}  (begin single spacing after this point for the vita)
%       ******* Booleans ******* 
%       \ifpagestyletopright (invoke \pagestyle{topright})
%       \ifdraft  (Will do some things differently if draft. Set by \draft)
%       \ifcopyright (Add a copyright notice? (Set by \copyrightpage)
%       \ifabstract (set if command \abstract invoked)
%       \ifpreface (set if command \preface invoked)
%       \ifacknowledgements (set by \acknowledgements)
%       \ifabstract (set by \abstract)
%       \ifjoint (set by  \joint)
%       \iffigures
%       \iftables
%       \ifafterpreface (afterpreface sections pagenumber must be at topright 
%               corner. If user has chosen a hader then it must be overridden.)
%               (Produce a List of figures? The default is to do so.)
%       \tablestrue
%               (Produce a List of tables?)
%       \begin/end{descriptionlist} (Basically a modified  \description.)
%       \fullpagefigure Creates a figure where the page is a vbox whose
%                height is \textheight. 




%          **** PAGE LAYOUT ****
% We need 1" (~72pt) margins except on the binding edge, where it is 1 1/2".
% They are a bit larger to handle lines with overfull boxes.
% 
\@twocolumnfalse
%\@twosidefalse
\oddsidemargin -5mm 
\evensidemargin -5mm  %%% was 40 and 25 -dks

\marginparwidth 40bp 
\marginparsep 10bp 
\topmargin -20mm 
\leftmargin 0mm 
\rightmargin 0mm 
\textwidth 170mm
\textheight 250mm

%\topmargin -47bp        % Default margin is  73 points-- make 1/2 that
                        % plus a bit more to get page 1/2 inch down.
\headheight 10mm        % Height of box containing running head.
\headsep 5mm           % Distance between foot of head and text.
                        % headsep + headheight + topmargin ~ 72 pt
%\textheight 648bp       % Height of text (including footnotes and  %%% was 620
                        % figures, excluding running head and foot).
%\textwidth 412bp        % Give 92pt right margin;72 + extra for overfull boxes.
% disappeared from LaTeX\footheight 11bp        %    Height of box containing running foot.
\footnotesep  
\baselineskip
\footskip 15mm          %    Distance from baseline of box containing foot 
                        %    to baseline of last line of text.
\parindent 3.5ex
\parskip 1bp plus 1bp 
\setcounter{tocdepth}{3} % Put subsubsections in toc (set to 2 in
                         % report.sty). [lsc] 
\skip\footins 15pt plus3pt minus3pt % Add space between text and
                                    % footnotes.

% *******  Documentstyle Modifications *******
\brokenpenalty=10000 % Do not break pages at hyphens.
\def\baselinestretch{1.6}  % 1.6 space document ~ doublespace.
\@addtoreset{equation}{chapter} % Set things up so that theequation, 
        % thefigure, and thetable counters are reset by incrementing 
        % thechaphter. (The others are correct in the report style.)


% **** Make changes to the formats of table of contents and sectioning ****
% **** commands . 
%  Center chapter headings, add the string ``chapter #'', and reduce the
%  font size that is used in the report style. Must  modify fonts used for 
% other sectioning commands also.
\newcommand\chapter@topskip{\null\vskip67bp} % Chapters sink this much before
                                      % output.
\newcommand\chapter@bottomskip{\vskip40bp} % Chapters sink this much
                                         % after output. 
\def\@makechapterhead#1{\chapter@topskip { \parindent 0pt \centering
 \ifnum \c@secnumdepth >\m@ne \MakeUppercase{{\Large \bf \thechapter.}  {\Large \bf #1}}\par
   \par  
   \vskip7bp 
 \fi  
 \nobreak \chapter@bottomskip }}

% Chapter with only a string heading--as in unnumberedsections.
\renewcommand{\@makeschapterhead}[1]{\chapter@topskip{ \parindent 0pt \centering
{\Large\bfseries#1}\par 
 \nobreak \chapter@bottomskip } }
\renewcommand\chapter{\clearpage\global\@topnum\z@
 \@afterindentfalse \secdef\@chapter\@schapter} 
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
 \refstepcounter{chapter}
 \typeout{\@chapapp\space\thechapter.}
 \addcontentsline{toc}{chapter}{\protect
 \numberline{\thechapter}#1} \else 
 \addcontentsline{toc}{chapter}{#1}\fi
 \chaptermark{#1}
 % Don't add extra space to lists of figures and tables after chapters.
 %  \addtocontents{lof}{\protect\addvspace{10bp}}
 %  \addtocontents{lot}{\protect\addvspace{10bp}}
 \if@twocolumn
 \@topnewpage[\@makechapterhead{#2}] 
 \else \@makechapterhead{#2}
 \@afterheading \fi} 
\renewcommand{\@schapter}[1]{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
 \else \@makeschapterhead{#1} 
 \@afterheading\fi}


% use Table of Contents rather than default of Contents
\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{CUPRINS\@mkboth{TABLE OF CONTENTS}{TABLE OF CONTENTS}}
 \@starttoc{toc}\if@restonecol\twocolumn\fi}


% Add period after section numbers in table of contents.
\def\numberline#1{\advance\hangindent\@tempdima \hbox to\@tempdima{#1.\hfil}}

\newcommand{\l@unnumberedsection}[2]{\pagebreak[3]% \vskip 1em plus 1bp
\parindent \z@ \rightskip \@pnumwidth 
 \parfillskip -\@pnumwidth 
\interlinepenalty\@M\leavevmode 
\@tempdima 1.5em\relax \begingroup \bfseries
    #1\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}% \hfill 
\hskip 0pt plus 1filll % new line
   \hbox to\@pnumwidth{\hfil\rm #2}\endgroup\par}


\newcount\@chaptertoccount
\@chaptertoccount=0 % Initialize the counter

\renewcommand{\l@chapter}[2]{%
  \pagebreak[3]%
  % Increment the counter
  \advance\@chaptertoccount by 1%
  % Apply vertical space only to the first 3 entries
  \ifnum\@chaptertoccount>2
    \vskip 1em plus 1bp % Vertical space for the first 3 entries
  \fi
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \interlinepenalty\@M\leavevmode
  \@tempdima 1.5em\relax
  \begingroup
   \def\\{\relax\ifhmode\unskip\fi\space\ignorespaces}
    \textbf{\MakeUppercase{#1}}%
    \leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}% Add dotted leaders
    \hskip 0pt plus 1filll
    \hbox to\@pnumwidth{\hfil\rm #2}%
  \endgroup
  \par
}


\def\section{\@startsection {section}{1}{\z@}{-3.5ex plus -1ex minus 
 -.2ex}{2.3ex plus .2ex}{\large\bfseries}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus 
 -.2ex}{1.5ex plus .2ex}{\large\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
 -1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize\bfseries}}
\let\paragraph=\subsubsection

% single space bibliography, quotations and verse. 

\def\thebibliography#1{\def\baselinestretch{1}\@normalsize 
\unnumberedchapter{Bibliografie}\list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus -.07em}
 \sloppy
 \sfcode`\.=1000\relax}
% end bib with a new page
\def\endthebibliography{\endlist}

% Rutgers requires that quotations be indented at the left and 
% flush at the right margin. Center Verses.
\renewcommand\quotation{\def\baselinestretch{1}\@normalsize\list{}{%
\rightmargin -\z@ \listparindent 0.5ex
\itemindent\leftmargin\parsep 0pt}\item[]}
\let\endquotation=\endlist

\renewcommand\verse{\def\baselinestretch{1}\@normalsize\let\\=\centercr 
 \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent 
 \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse=\endlist

% The pageheading style topright places numbers at top righthand corners.
% The macro \draftheading expands to show the rootfile and date
% if the \draft command has been given, otherwise it is empty.
% 8/1/88 Added \draftheading  [lsc]
\newcommand\ps@topright{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\draftheading\hfil\thepage}\let\@evenhead\@oddhead
  \def\@evenfoot{}\def\@oddfoot{}}
% For drafts make this redefinition.


%  ***** Verbatim listing macro ****
%  Code from the TeXbook for inputting  a file and listing it 
%  verbatim in \texttt mode. Will not properly handle tabs.
%  This code hasn't been rigorously tested so it should be used cautiously.
%  Note that the left quote. "`", is redefined when the macro is finally used
%  or ` isn't properly handled.
\def\uncatcodespecials{\def\do##1{\catcode`##1=12 }\dospecials}
\newcommand{\setupverbatim}{\normalfont\ttfamily
        \def\par{\leavevmode\endgraf}\catcode`\`=\active
        \obeylines \uncatcodespecials \obeyspaces}
{	\obeyspaces\global\let =\ }


\def\verbatimfont{\ttfamily}
\def\uncatcodespecials{\def\do##1{\catcode`##1=12 }\dospecials}

\def\listing#1{%
\par\begingroup
\setupverbatim
\input{#1} \endgroup}

% \let\listing=\verbatimfile


% Single Space Figures, Tables, and Footnotes

% Redefine the macro used for floats (figures and tables)
% so that single spacing is used.
% (Note \def\figure{\@float{figure}<set single spacing>} doesn't work
%  because figure has an optional argument)
\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
      \@parmoderr\@floatpenalty\z@
    \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
       \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
       \@tfor \@tempa :=#2\do
                        {\if\@tempa h\advance\@tempcnta \@ne\fi
                         \if\@tempa t\advance\@tempcnta \tw@\fi
                         \if\@tempa b\advance\@tempcnta 4\relax\fi
                         \if\@tempa p\advance\@tempcnta 8\relax\fi
         }\global\count\@currbox\@tempcnta}\@fltovf\fi
   \global\setbox\@currbox\color@vbox\normalcolor\vbox\bgroup %%%%%aici modificare pentru cod colorat
    \def\baselinestretch{1}\@normalsize
    \boxmaxdepth\z@
    \hsize\columnwidth \@parboxrestore}

% Single space footnotes.
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}


% *******  User commands *******
% \if one of the following is invoked then set appropriate macros
\newcommand\draftheading{}
\newcommand\draft{\drafttrue
 \def\ps@plain{\let\@mkboth\@gobbletwo
  % redefine page styles so that appropriate headers are used.
   \def\@oddhead{\rm\draftheading\hfil\thepage}\let\@evenhead\@oddhead
   \def\@evenfoot{\hfil\thepage\hfil}\let\@oddfoot\@evenfoot}
 \def\draftheading{{\bfseries\jobname.tex\hfil\the\month/\the\day/\the\year}}}
\newcommand\copyrightpage{\copyrighttrue}
\newcommand\figurespage{\figurestrue}
\newcommand\tablespage{\tablestrue}
\newcommand\phd{\phdtrue\def\@degree{Doctor of Philosophy}}
\long\def\abstract#1{\abstracttrue\gdef\@abstract{#1}}
\long\def\preface#1{\prefacetrue\gdef\@preface{#1}}
\long\def\acknowledgements#1{\acknowledgementstrue\gdef\@acknowledgements{#1}}
\long\def\dedication#1{\dedicationtrue\gdef\@dedication{#1}}
\newcommand{\abbreviations}[1]{\abbreviationspagetrue\gdef\@abbreviations{    \begin{tabular}{@{}r@{\hspace{1em}}l@{}} % Right-align the first column and add spacing
    #1 % Insert the abbreviations provided as an argument
  \end{tabular}}}
% Use of the \initials command is being stopped but keep the macro for old 
% files.
\newcommand{\initials}[1]{\gdef\@initials{#1}} % Ph.D. et al.
\newcommand{\degree}[1]{\phdfalse\gdef\@degree{#1}} % Master of Science et al.
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\catedra}[1]{\gdef\@catedra{#1}}
\newcommand{\domeniu}[1]{\gdef\@domeniu{#1}}
\newcommand{\campus}[1]{\gdef\@campus{#1}}
\newcommand{\titlulobtinut}[1]{\gdef\@titlulobtinut{#1}}
\newcommand{\jointumdnj}{\joint{The Graduate School of Biomedical Sciences\\
         the University of Medicine and  Dentistry of New Jersey\\}}
\newcommand{\joint}[1]{\jointtrue\long\gdef\@jointwith{#1}} % if joint program
                                                  % then who with?      
%\newcommand{\declaratie}[1]{\gdef\@declaratie{#1}}   
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}   
\newcommand{\facultatea}[1]{\gdef\@facultatea{#1}}   
\newcommand{\approvals}[1]{\gdef\@approvals{#1}}
\newcommand{\submissiondate}[1]{\gdef\@submissiondate{#1}}
\newcommand{\submissionyear}[1]{\gdef\@year{#1}}
\newcommand{\tiplucrare}[1]{\gdef\@tiplucrare{#1}}

%   ******** set defaults *******
\newcommand\@initials{M.S.}
\newcommand\@degree{Master of Science}
\newcommand\@campus{New Brunswick}
\renewcommand\@title{}
\renewcommand\@author{\ }
\newcommand\@program{}
\newcommand\@catedra{}
\newcommand\@submissiondate{}
\newcommand\@advisor{}
\edef\@month{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
\edef\@year{\number\the\year}

%    ******* conditionals  *******
\newif\ifdraft
\newif\ifafterpreface
\newif\ifcopyright \newif\iffigures\newif\iftables
\newif\ifabstract   \newif\ifpreface \newif\ifacknowledgements 
\newif\ifdedication \newif\ifabbreviationspage
\newif\ifjoint \newif\ifphd \newif\ifpagestyletopright

%    ******* conditional defaults ******* 
\draftfalse
\afterprefacefalse
\pagestyletoprighttrue
\abstractfalse
\prefacefalse
\dedicationfalse
\jointfalse
\phdfalse % default is not for PhD (currently is  Master of Science) 
\copyrightfalse  
\abbreviationspagefalse 

\newcommand\titlep{\vbox to \textheight{%
    \vskip 12mm
    \centering\large{Universitatea Națională de Știință și Tehnologie POLITEHNICA București\\
\@facultatea} \par\nobreak % DN
    \vskip 30mm
        \parskip0pt 
        \parindent0pt
        \typeout{Title}
        \null\nobreak\vskip 10bp 
        {\def\baselinestretch{1}\@normalsize
%          \centering\Large\bfseries\uppercase\expandafter{\@title}\par\nobreak
          \centering\LARGE\bfseries\expandafter{\@title}\par\nobreak % DN
         }

        \vskip 20mm
        {\centering\bfseries{\LARGE Lucrare de {\@tiplucrare}}
          \nobreak
          \vskip 4ex plus 2ex minus 2ex 
          \ifdraft%
            {VERSIUNEA DRAFT CREATĂ LA \uppercase\expandafter{\today}\\}
          \else %
          \textnormal{
prezentată ca cerință parțială pentru obținerea titlului de \textit{Master} în domeniul 
\textit{Inginerie electronică, telecomunicații și tehnologii informaționale} \\
programul de studii de masterat \textit{Tehnologii multimedia în aplicații de biometrie și securitatea informației (BIOSINF)}}


        \vfil

             \begin{tabular}
               {>{\raggedright}p{0.7\textwidth}r}
               \large{Conducător(i) științific(i):} & \large{Absolvent:}\\
               {\@advisor} & {\@author}\\
             \end{tabular}
 \vfil
       
        \@year\\
   \fi %   close ifdraft
   }}\newpage} % end titlep


\newcommand\inscrierep{\vbox to \textheight{%
    \vskip 12mm
\large{Universitatea POLITEHNICA din București\\
\@facultatea\\
Catedra \@catedra} \par\nobreak % DN
    \vskip 20mm

        \parskip0pt 
        \parindent0pt
        \typeout{Title}
        \null\nobreak\vskip 10bp 
        {\def\baselinestretch{1}\@normalsize
%          \centering\Large\bfseries\uppercase\expandafter{\@title}\par\nobreak
          \centering\Large\bfseries\expandafter{\@title}\par\nobreak % DN
         }

        \vskip 20mm
        {\centering\bfseries{\Huge Lucrare de {\@tiplucrare}}
          \nobreak
          \vskip 4ex plus 2ex minus 2ex 
          \ifdraft%
            {VERSIUNEA DRAFT CREATĂ LA \uppercase\expandafter{\today}\\}
          \else %
            Prezentată ca cerință parțială pentru obținerea\\ 
            titlului de {\it {\@titlulobtinut}}\\ 
            în domeniul {\it\@domeniu}\\
            programul de studii {\it\@program}

        \vfil

             \begin{tabular}
               {>{\raggedright}p{0.7\textwidth}r}
               \Large{Conducător științific} & \Large{Absolvent}\\
               {\@advisor} & {\@author}\\
             \end{tabular}
 \vfil
       
        Anul \@year\\
   \fi %   close ifdraft
   }}\newpage} % end titlep


%% \newcommand\copyrightp{%
%%         \null\vfil
%%         \typeout{Copyright}
%%         {\centering\bfseries
%%                 \large\copyright\ \@year\\
%%                 \@author\\
%%                 \large ALL RIGHTS RESERVED\par}
%%         \vfil\newpage}


\newcommand\declaratiep{%
\null

\begingroup
\centering{\bfseries\Large Declaraţie de onestitate academică}\\
\endgroup
\textnormal{}
\vspace{15mm}
    
Prin prezenta declar că lucrarea cu titlul {\it {\@title}}, prezentată în cadrul Facultății de Electronică, Telecomunicații și Tehnologia Informației a Universității Naționale de Știință și Tehnologie POLITEHNICA București drept cerință parțială pentru obținerea titlului de \textit{Master} în domeniul \textit{Inginerie electronică, telecomunicații și tehnologii informaționale}, programul de studii de masterat \textit{Tehnologii multimedia în aplicații de biometrie și securitatea informației (BIOSINF)}, este scrisă de mine și nu a mai fost prezentată niciodată la o facultate sau instituție de învățămînt superior din țară sau străinătate.\\

Declar că toate sursele utilizate, inclusiv cele de pe Internet, sunt indicate în lucrare ca referințe bibliografice. Fragmentele de text din alte surse, reproduse exact, chiar și în traducere proprie din altă limbă, sunt scrise între ghilimele și fac referire la sursă. Reformularea în cuvinte proprii a textelor scrise de către alți autori face referire la sursă. Înțeleg că plagiatul constituie infracțiune și se sancționează conform legilor în vigoare.\\

Declar că toate rezultatele simulărilor, experimentelor și măsurătorilor pe care le prezint ca fiind făcute de mine, precum și metodele prin care au fost obținute, sunt reale și provin din respectivele simulări, experimente și măsurători. Înțeleg că falsificarea datelor și rezultatelor constituie fraudă și se sancționează conform regulamentelor în vigoare.


\vfil 
\begin{tabular}
{>{\raggedright}p{0.6\textwidth}r}
Bucureşti,  {\@submissiondate} & Absolvent: {\@author}\\
& \\
& \underline{\hspace{4.2cm}}\\
& (semnătura în original)
\end{tabular}


%{\@declaratie}\\
\vfil\newpage}



\newcommand{\desclabel}[1]{{\textbf{#1}\hfill}}
\def\descriptionlist#1{\list{}
         {\settowidth\labelwidth{#1}\leftmargin\labelwidth
         \let\makelabel\desclabel}}
\let\enddescriptionlist=\endlist

\renewcommand{\cleardoublepage}{%
  \clearpage% Start a new page
  \if@twoside% Check if it's a double-sided document
    \ifodd\c@page% If the current page is odd, no need to add a blank page
    \else
      \thispagestyle{empty}% Suppress page number on the blank page
      \hbox{}% Add an empty box to make the page non-empty
      \newpage% Add a blank page
    \fi
  \fi
}

\newcommand\beforepreface{%
        
        \pagestyle{empty}
        \titlep
        \cleardoublepage
        \includepdf[]{Anexa_2.pdf}
        \cleardoublepage
        % \inscrierep
        \declaratiep
        \cleardoublepage
         % set page counter so that next is 1
         \pagenumbering{roman}
        \pagestyle{plain}
        \setcounter{page}{5}
        \tableofcontents
        \cleardoublepage
        %\ifcopyright\copyrightp\fi  
        
        \ifabstract{%
                \typeout{Abstract}
                \addcontentsline{toc}{unnumberedsection}{Abstract}
                \null\vskip10bp
                \begin{center}
                {\large\bfseries
                ABSTRACT OF THE \ifphd DISSERTATION\else THESIS\fi
                \vskip72bp
                \Large\bfseries\expandafter{\@title} \large
                \vskip30bp
                by \@author\\
                \ifphd Dissertation\else Thesis\fi\ Advisor: \@advisor
                \vskip 31bp}
                \end{center}
                \@abstract}
        \fi }

\newcommand{\unnumberedchapter}[1]{\chapter*{#1}
       \addcontentsline{toc}{chapter}{#1}\typeout{#1}}

\newcommand{\unnumberedsection}[1]{\section*{#1}
        \addcontentsline{toc}{section}{#1}\typeout{#1}}

%need to call addcontentsline before @starttoc. -dks
\renewcommand\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{LISTA FIGURILOR\@mkboth
 {LISTA FIGURILOR}{LISTA FIGURILOR}}
 \addcontentsline{toc}{chapter}{Lista figurilor}
 \@starttoc{lof}\if@restonecol\twocolumn\fi}

 \renewcommand\listoffigures{%
  \@restonecolfalse
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \fi
  \chapter*{LISTA FIGURILOR\@mkboth{LISTA FIGURILOR}{LISTA FIGURILOR}}%
  \addcontentsline{toc}{chapter}{Lista figurilor}%
  \begingroup % Start a group to localize changes
  
    \def\@figurenumberline##1{\hbox{\bfseries Figura~##1 \hspace*{0.5em}}}% Custom numberline for figures
    \let\originalnumberline\numberline % Save the original \numberline command
    \renewcommand{\numberline}[1]{\@figurenumberline{##1}}% Override \numberline for figures 
    
    \@starttoc{lof}%
    \let\numberline\originalnumberline % Restore the original \numberline
  \endgroup % End the group
  \if@restonecol
    \twocolumn
  \fi
  \cleardoublepage
}
 
\renewcommand\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{LISTA TABELELOR\@mkboth
 {LISTA TABELELOR}{LISTA TABELELOR}}
 \addcontentsline{toc}{chapter}{Lista tabelelor}
 \@starttoc{lot}\if@restonecol\twocolumn\fi}

\renewcommand\listoftables{%
  \@restonecolfalse
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \fi
  \chapter*{LISTA TABELELOR\@mkboth{LISTA TABELELOR}{LISTA TABELELOR}}%
  \addcontentsline{toc}{chapter}{Lista tabelelor}%
  \begingroup % Start a group to localize changes
    \def\@tabelnumberline##1{\hbox{\bfseries Tabelul~##1 \hspace*{0.5em}}}% Custom numberline for tables
    \let\originalnumberline\numberline % Save the original \numberline command
    \renewcommand{\numberline}[1]{\@tabelnumberline{##1}}% Override \numberline for tables
    \@starttoc{lot}%
    \let\numberline\originalnumberline % Restore the original \numberline
  \endgroup % End the group
  \if@restonecol
    \twocolumn
  \fi
  \newpage
  \cleardoublepage
}


\newcommand\afterpreface{%
%  Insert all of the text between the title (and copyright) pages and the main 
%  body of the thesis.
        \ifpreface{\unnumberedsection{Preface}
                \@preface}
        \fi   
        \ifacknowledgements%
                \unnumberedsection{Acknowledgements}
                \@acknowledgements 
        \fi
        \ifdedication%
                \unnumberedsection{Dedication}
                \@dedication
        \fi 

%        \tableofcontents
        \iftables%
                \addvspace{10bp}
                \let\saveaddvspace=\addvspace
                \def\addvspace##1{}
                \listoftables
                \let\addvspace=\saveaddvspace
        \fi
        \iffigures%
                \addvspace{10bp}
                \let\saveaddvspace=\addvspace
                \def\addvspace##1{}
                \listoffigures
                \let\addvspace=\saveaddvspace
        \fi
        \ifabbreviationspage{\def\baselinestretch{1}\@normalsize
                \unnumberedchapter{LISTA ABREVIERILOR}
                \@abbreviations}
        \fi
        
        \cleardoublepage
        
        \afterprefacetrue

        %\pagestyle{fancy}
       %\fancyhf{}
       % \fancyhead[RE, LO]{\@title}
        %\fancyhead[LE, RO]{\leftmark}
        % \fancyfoot[CE,CO]{\leftmark}
       % \fancyfoot[LE,RO]{\thepage}
        }
\newenvironment{vita}%
{\unnumberedsection{Vita}
 \bgroup\def\baselinestretch{1}\@normalsize}
{\egroup}

% Fullpage floats:
\newenvironment{fullpagefigure}%
{\@float{figure}[p]\vbox to \textheight \bgroup}
{\egroup\end@float}

\newenvironment{fullpagetable}
{\@float{table}[p]\vbox to \textheight \bgroup}
{\egroup\end@float}

% Redefine appendix to print Appendix []. ... page # in table of contents.
\newcommand{\appnumberline}[1]{\advance\hangindent\@tempdima \hbox{Anexa #1. }}
\renewcommand\appendix{\par
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \renewcommand\@chapapp{Anexa}
 \renewcommand\thechapter{\Alph{chapter}}
% Redefine @chapter  so that appnumberline (ratherline) is used.
 \def\@chapter[##1]##2{\ifnum \c@secnumdepth >\m@ne
  \refstepcounter{chapter}
  \typeout{\@chapapp\space\thechapter.}
  \addcontentsline{toc}{chapter}{\protect
  \appnumberline{\thechapter}##1} \else 
  \addcontentsline{toc}{chapter}{##1}\fi
  \chaptermark{##1}
  % Don't add extra space to lists of figures and tables after chapters.
  %  \addtocontents{lof}{\protect\addvspace{10pt}}
  %  \addtocontents{lot}{\protect\addvspace{10pt}}
  \if@twocolumn
  \@topnewpage[\@makechapterhead{##2}] 
  \else \@makechapterhead{##2}
  \@afterheading \fi}}
%
\newcommand\tempheading{\@startsection{donothing}{donothing}{\z@}{-3.25ex plus
 -1ex minus -.2ex}{1.5ex plus .2ex}{\centering\large\bfseries}}
\newcommand\heading{\tempheading*}
\newcommand\subheading{\subsection*}




\renewenvironment{itemize}{%
  \begin{list}{\textbf{--}}{% Use bullet as default label
    \setlength{\leftmargin}{2cm} % Set left margin for alignment
    \setlength{\labelsep}{0.2cm} % Space between label and text
    \setlength{\itemsep}{0} % Space between items
    \setlength{\topsep}{0cm} % Remove space between text and the list
    % Enable proper hyphenation
  }
}{\end{list}}





