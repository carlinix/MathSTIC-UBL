%% MathSTICUBL.cls, v<VERSION> carlinix
%% Copyright 2019-<COPYRIGHT_YEAR> by Ricardo Carlini Sperandio at rcarlini@gmail.com
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Ricardo Carlini. 
%% Further information are available on https://github.com/carlinix/MathSTIC-UBL 
%% https://www.abntex.net.br/
%%
%% This work consists of the file MathSTICUBL.cls.

%% Doctoral Thesis Class for the MathSTIC Doctoral School / Universite Bretagne Loire
%% Class File
%% Version  v<VERSION> <CURRENT_DATE> 
%% Author:
%% Ricardo Carlini a.k.a. Carlinix (rcarlinil@gmail.com)
%% 
%% This class was inspired by some previous projects:
%% 1. MastersDoctoralThesis.cls by
%%  Vel (vel@latextemplates.com)
%%  Johannes Böttcher 
%%
%% 2. these.sty from template-adoc by
%%  Eddy Fromentin 1996
%%  Florent de Dinechin 1997
%%
%% 3. these-ubl.cls 18/04/2018 v4.0 by 
%%   Louiza Yala (2018-), 
%%   Pierre-Louis Roman (2019-)
%%
%% 4. abntex2.cls by
%%  Lauro César Araujo
%% 
%% 5. Many others hacks on the Web.

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\newcommand{\classname}{MathSTICUBL}
\newcommand{\classversion}{<VERSION>}
\ProvidesClass{\classname}[<CURRENT_DATE> \classversion Standard MathSTIC Universite Bretagne Loire Thesis class]

\providecommand{\baseclass}{book} % build uppon book


\LoadClass{\baseclass}
%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage{etoolbox} % The package provides functions that seem to offer alternative 
 						  % ways of implementing some LATEX kernel commands;
 						  % in special \AtEndPreamble and \AtBeginDocument
\RequirePackage{xparse}   % replacement for LATEX2ε’s \newcommand macro, with significantly
                          % improved functionality.
                          
\RequirePackage{ifthen}
                          

% Language related packages
\RequirePackage{babel}    % Required for automatically changing names of document elements
                          % to languages besides english
\RequirePackage{scrbase}  % Provide basic features for KOMA-Script -- Required for handling
                          % language-dependent names of sections/document elements
\RequirePackage{translations} 
% ---

% Table related packages
\RequirePackage{longtable} % Required for tables that span multiple pages (used in the
                           % symbols, abbreviations and physical constants pages)
\RequirePackage{booktabs}  % Required for better table rules
\RequirePackage{multirow}  % flexibility, including an option for specifying an entry at the “natural” width of its text.
% ---

% Layout related packages
\RequirePackage{geometry}
\RequirePackage{setspace} 
\RequirePackage{caption3} 		   % load caption package kernel first
\DeclareCaptionOption{parskip}[]{} % disable "parskip" caption option
\RequirePackage{caption} 		   % Required for customising the captions
\RequirePackage[markcase=used]{scrlayer-scrpage} % controlling page headers and footers.
\RequirePackage{multicol}			 % Required for abstract page
\RequirePackage[table,xcdraw]{xcolor} % used to color fonts and tables.
\RequirePackage[bottom]{footmisc}   % force footnote to the page's botton
\RequirePackage{shorttoc}			% short table of contents
\RequirePackage{minitoc}			% table of contents per chapter
\RequirePackage{epigraph}			% for epigraph
\RequirePackage{varwidth}			% for epigraph
\RequirePackage{titletoc}           % Customize TOC, LO?

% ---
% image / Lists / float related packages
\RequirePackage{graphicx} 		% Required to include images
\graphicspath{{Figures/}{./}}   % Specifies where to look for included images
\RequirePackage{tikz} 			% Required for cover page, abtract page, etc.
\usetikzlibrary{positioning,calc}
\RequirePackage{framed}         % Magic and simple boxes
\RequirePackage{ntheorem}		% support for making a list of theorems, analagous to \listoffigures.
\RequirePackage[inline]{enumitem}       % User control over the layout of the enumerate, itemize and description
\RequirePackage[chapter]{algorithm}
% ---
% Fonts
\RequirePackage{calligra}       % Required for dedicace page
\RequirePackage{amsmath}        % The principal package in the AMS-LATEX
\RequirePackage{textcomp}       % he package supports the Text Companion fonts, which provide many text symbols 

%----------------------------------------------------------------------------------------
% THOSE PACKAGES MUST BE LOAD AT THE END
%----------------------------------------------------------------------------------------
\AtEndPreamble{%
    \ifbool{hyperrefsupport}{% If the nohyperref class option has not been specified
         \RequirePackage{hyperref}
         \hypersetup{pdfpagemode={UseOutlines},
            bookmarksopen=true,
            bookmarksopenlevel=0,
            hypertexnames=false,
            colorlinks=false,% Set to false to disable coloring links
            %%citecolor=magenta,% The color of citations
            %%linkcolor=red,% The color of references to document elements (sections, figures, etc)
            %%urlcolor=mdtRed,% The color of hyperlinks (URLs)
            pdfstartview={FitV},
            unicode,
            hidelinks, %%%%%
            pdfborder={0 0 0}, %%%%%
            breaklinks=true,
     	}
 		%\RequirePackage[style=verbose-trad1,hyperref,backend=biber,natbib=true]{biblatex}
    }{% NO hyperref
    	%\RequirePackage[style=verbose-trad1,backend=biber,natbib=true]{biblatex}
	}
    \ifbool{cleverefsupport}{% If the noclevref class option has not been specified
        \RequirePackage{cleveref}
        %	\RequirePackage[babel,kerning]{microtype}
     }{}
     \ifbool{acrosupport}{% If the noclevref class option has not been specified
     	\ifbool{hyperrefsupport}{
 			\RequirePackage[hyperref]{acro}
 		}{\RequirePackage[hyperref]{acro}}
		\DeclareAcroListStyle{UBLStyle}{table}{
		table = longtable,
		table-spec = {@{\extracolsep{\fill}}@{}p{50pt}@{}p{250pt}@{}}% {@{}p{50pt}@{}p{250pt}} 	
		}
		\ifbool{listtoc}{
			\acsetup{list-style=UBLStyle,
			list-heading=addchap,
			list-name = {\abbrevname}
			}
		}{% ELSE
			\acsetup{list-style=UBLStyle,
			list-heading=chapter*,
			list-name = {\abbrevname}
			}	
		
		}
		\input{./acro-def.tex}
 	}{}
 	%	\RequirePackage[babel,kerning]{microtype}
 
 

 
	%----------------------------------------------------------------------------------------
	% Fix polyglossie captions 
	%----------------------------------------------------------------------------------------
	% Table
	\renewcaptionname{french}{\tablename}{Tableau}                %Table
	
	% algorithm
	\newcaptionname{french}{\ALG@name}{Algorithme}                
	\newcaptionname{french}{\listalgorithmname}{Liste des algorithmes}
	
	% Summary
	\newcaptionname{french}{\Sum@name}{Sommaire}
	\newcaptionname{english}{\Sum@name}{Summary}
	
	\newcaptionname{french}{\algorithmicprocedure}{\textbf{procédure}}
	\newcaptionname{french}{\Not}{\textbf{non}\ }
	\newcaptionname{french}{\And}{\textbf{et}\ }
	\newcaptionname{french}{\Or}{\textbf{ou}\ }
	\newcaptionname{french}{\algorithmicrequire}{\textbf{Entrée:}}
	\newcaptionname{french}{\algorithmicensure}{\textbf{Sortie:}}
	%\newcaptionname{french}{\algorithmiccomment}[1]{\{#1\}}
	\newcaptionname{french}{\algorithmicend}{\textbf{fin}}
	\newcaptionname{french}{\algorithmicif}{\textbf{si}}
	\newcaptionname{french}{\algorithmicthen}{\textbf{alors}}
	\newcaptionname{french}{\algorithmicelse}{\textbf{sinon}}
	\newcaptionname{french}{\algorithmicfor}{\textbf{pour}}
	\newcaptionname{french}{\algorithmicforall}{\textbf{pour tout}}
	\newcaptionname{french}{\algorithmicdo}{\textbf{faire}}
	\newcaptionname{french}{\algorithmicwhile}{\textbf{tant que}}
	\newcaptionname{french}{\algorithmicelsif}{\algorithmicelse\ \algorithmicif}
	\newcaptionname{french}{\algorithmicendif}{\algorithmicend\ \algorithmicif}
	\newcaptionname{french}{\algorithmicendfor}{\algorithmicend\ \algorithmicfor}

	\RequirePackage[autostyle=true]{csquotes} % Required to generate language-dependent quotes in the bibliography

}
%----------------------------------------------------------------------------------------
\newcounter{socdepth}
\newbool{parskip}
\newbool{indentfirst}
\newbool{draftmode}
\newbool{headsepline}
\newbool{nolistspace}
\newbool{consistentlayout}
\newbool{chapteroneline}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport} 
\newbool{cleverefsupport}
\booltrue{cleverefsupport} 
\newbool{listtoc}
\newbool{toctoc}
\newbool{acrosupport}
\booltrue{acrosupport} 
%\newcounter{UBLupperchapter}
%\newcounter{UBLuppersection}
%\newcounter{UBLuppersubsection}
%\newcounter{UBLuppersubsubsection}

%----------------------------------------------------------------------------------------
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption{draft}{\booltrue{draftmode}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{indentfirst}{\booltrue{indentfirst}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nocleveref}{\boolfalse{cleverrefsupport}}
\DeclareOption{noacro}{\boolfalse{acrosupport}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}



\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax

% I don't know why this need to be after the ProcessOptions command.
%\RequirePackage[backend=biber,style=authoryear,natbib=true]{biblatex} % Use the bibtex backend with the authoryear citation style (which resembles APA)
\ifbool{hyperrefsupport}{%
	\RequirePackage[style=verbose-trad1,hyperref,backend=biber,natbib=true]{biblatex}
}{%
	\RequirePackage[style=verbose-trad1,backend=biber,natbib=true]{biblatex}
}

\newcommand{\bibheadingnameP}{Primary Sources}
\newcommand{\bibheadingnameS}{Secundary Sources}
\providecaptionname{english,british,american}{\bibheadingnameP}{Primary Sources}
\providecaptionname{french}{\bibheadingnameP}{Sources primaires}
\providecaptionname{english,british,american}{\bibheadingnameS}{Secondary Sources}
\providecaptionname{french}{\bibheadingnameS}{Sources secondaires}

\defbibheading{primary}{\addsec{\bibheadingnameP}} % Categorie (sous forme de section) pour le tri de la bibliographie.
\defbibheading{secondary}{\addsec{\bibheadingnameS}} % Categorie (sous forme de section) pour le tri de la bibliographie.

\renewcommand*{\newunitpunct}{\addcomma\space} % Virgule entre les parties d'une reference (merci a Josquin Debaz)
% Et pour mettre le in en italique dans la ref\'{e}rence biblio (merci encore \`{a} Josquin Debaz)
\DefineBibliographyStrings{english}{%
	in = {\emph{in}}%
}



%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

%---
% CONDITIONAL PACKAGE LOADING
\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 

\ifbool{indentfirst}{\RequirePackage{indentfirst}} % If the indentfirst option is passed to the class, require the indentfirst package 

%----------------------------------------------------------------------------------------
%	PAGE FORMATING
%----------------------------------------------------------------------------------------
\geometry{% PAGE LAYOUT
	headheight=4ex,
	head=20.00409pt,    % fix
	includehead,
	includefoot,
	%paper=a4paper,      % Change to letterpaper for US letter
	inner=2.5cm,        % Inner margin
	outer=2.5cm,        % Outer margin
	bindingoffset=.5cm, % Binding offset
	top=1.5cm,          % Top margin
	bottom=2.0cm,       % Bottom margin
	%
	%inner = \dimexpr1in+33pt\relax , % Inner margin
	%outer = \dimexpr1in+22pt\relax , % Outer margin
	%top = \dimexpr1in+12pt+24pt\relax , % Top margin
	%bottom = \dimexpr1in+24pt\relax, % Bottom margin
	%marginpar = 51pt ,
	%marginparsep = 17pt ,
	%foot = 24pt ,
	%headsep = 24pt
}
\raggedbottom 

%\setcounter{mtc}{3}  % before resume we have the ACKNOWLEDGEMENTS PAGE 
% The depth : 0:chapter/1:section/2:subsection/3:subsubsection
\setcounter{minitocdepth}{1}  % summary of each chapter
\setcounter{secnumdepth}{3}   % section numbering of each chapter
\setcounter{tocdepth}{3}      % table of contents
\setcounter{socdepth}{1}      % summary
%\setcounter{lofdepth}{1}
%\setcounter{lotdepth}{1}

\captionsetup{justification=centerlast,font=small,labelfont=sc,margin=50pt}
\setlength{\epigraphwidth}{0.4\textwidth}
\setlength{\textfloatsep}{10pt plus 1.0pt minus 2.0pt} % Fix float distance
\setlength{\parindent}{1.5em} % Paragraph indent lenght



%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------
\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes


%----------------------------------------------------------------------------------------
%  Simple interface for the user  to customize the chapter titles 
%----------------------------------------------------------------------------------------
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{40pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\Huge\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\LARGE\bfseries}

\DeclareDocumentCommand{\@makechapterhead}{m}{%
	\singlespace\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont%
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\ifbool{chapteroneline}{%
			\chapterfont\mdtChapapp\thechapter\autodot\enspace
		}{%
			\chapterprefixfont \@chapapp\space\thechapter%
			\par\nobreak
			\chapterinbetweenskip
		}%
		\fi
		\fi
		\interlinepenalty\@M%
		\chapterfont #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}
\def\@makeschapterhead#1{%
	\singlespace\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}



\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
	\patchcmd{\listofalgorithms}{\@starttoc{loa}}{%
	\addchaptertocentry{\listofalgorithms}\@starttoc{loa}%
}{}{}%
}


\ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
	\patchcmd{\tableofcontents}{\@starttoc{toc}%
	}{%
		\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

% --
% Avoid \MakeUppercase in LO?
% As LOA is now a "clone"of LOF, all modifications in LOF will be replied in LOA
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

%---
% Fix spacing
%---
% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{%
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}
%----------------------------------------------------------------------------------------

% ---
% Comamand and hacks
%----------------------------------------------------------------------------------------

%\usepackage{mfirstuc}


\newcommand*\MakeFUpperCase[1]{{#1}} % TODO: 

\NewDocumentCommand{\summary}{}{%
	\shorttoc{\Sum@name}{\value{socdepth}}
}


\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\ublmstic}{}{%
Math{STIC}-\raisebox{.15ex}{U}\raisebox{-.15ex}{B}\raisebox{.15ex}{L}
}
% --------------------------------------------------------------------------------------------
% make \footnote and \url robust commands, needs package `etoolbox':
\robustify\footnote
%\robustify\url



% epigrafe

\renewcommand{\epigraphsize}{\small}
\renewcommand{\textflush}{flushright}
\renewcommand{\sourceflush}{flushright}
% A useful addition
\newcommand{\epitextfont}{\itshape}
\newcommand{\episourcefont}{\scshape}

\newsavebox{\epi@textbox}
\newsavebox{\epi@sourcebox}
\newlength\epi@finalwidth
\renewcommand{\epigraph}[2]{%
	\begin{spacing}{1.0} 
		\vspace{\beforeepigraphskip}
		{\epigraphsize\begin{\epigraphflush}
				\epi@finalwidth=\z@
				\sbox\epi@textbox{%
					\varwidth{\epigraphwidth}
					\begin{\textflush}\epitextfont#1\end{\textflush}
					\endvarwidth
				}%
				\epi@finalwidth=\wd\epi@textbox
				\sbox\epi@sourcebox{%
					\varwidth{\epigraphwidth}
					\begin{\sourceflush}\episourcefont#2\end{\sourceflush}%
					\endvarwidth
				}%
				\ifdim\wd\epi@sourcebox>\epi@finalwidth 
				\epi@finalwidth=\wd\epi@sourcebox
				\fi
				\leavevmode\vbox{%
					\hb@xt@\epi@finalwidth{\hfil\box\epi@textbox}
					\vskip1.75ex
					\hrule height \epigraphrule
					\vskip.75ex
					\hb@xt@\epi@finalwidth{\hfil\box\epi@sourcebox}
				}%
			\end{\epigraphflush}
			\vspace{\afterepigraphskip}}
\end{spacing}}

% fim epigrafe




%----------------------------------------------------------------------------------------
% MAGIC BOX
%----------------------------------------------------------------------------------------
\NewDocumentCommand{\magicbox}{m +m}{%
    \begin{center}
    \begin{tikzpicture}
    % la boite
    \node[rectangle,draw=fondtitre!100,fill=fonddeboite!100,inner sep=10pt, inner ysep=20pt] (mabox)%
        {\begin{minipage}{0.57\paperwidth}#2\end{minipage}};
    % le titre de la boite
    \node[fill=fondtitre!100, text=white, rectangle] at (mabox.north) {\sffamily\textbf{#1}};
    \end{tikzpicture}
    \end{center}
}
%----------------------------------------------------------------------------------------
% SIMPLE BOX
%----------------------------------------------------------------------------------------
\NewDocumentCommand{\simplebox}{+m}{%
    \begin{center}\begin{minipage}{0.57\paperwidth}\begin{shaded}#1\end{shaded}\end{minipage}\end{center}}

%
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space\#1}\bhrule}
\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\ProvideDocumentCommand{\addchaptertocentry}{m}{%
	\addcontentsline{toc}{chapter}{#1}%
}

% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addpart}{s o m}{%
	\part*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{part}{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addcontentsline{toc}{part}{#3}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{s o m}{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

%addsec provides unnumbered section with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addsec}{s o m}{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%addsubsec provides unnumbered subsection with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addsubsec}{s o m}{%
	\subsection*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{subsection}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{subsection}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%addsubsubsec provides unnumbered subsubsection with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addsubsubsec}{s o m}{%
	\subsubsection*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{subsubsection}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{subsubsection}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%


\ProvideDocumentCommand{\addchaptertocentry}{m}{%
	\addcontentsline{toc}{chapter}{#1}%
}


\titlecontents{figure}[2.0em]{}{\contentslabel{2.3em}}{}{\titlerule*[0.25pc]{.}\contentspage}{}
\titlecontents{table}[2.0em]{}{\contentslabel{2.3em}}{}{\titlerule*[0.25pc]{.}\contentspage}{}
\contentsuse{algorithm}{loa}
\titlecontents{algorithm}[2.0em]{}{\contentslabel{2.3em}}{}{\titlerule*[0.25pc]{.}\contentspage}{}

\let\listofalgorithms\listoftables
\patchcmd{\listofalgorithms}{\listtablename}{\listalgorithmname}{}{}
\patchcmd{\listofalgorithms}{\listtablename}{\listalgorithmname}{}{}
\patchcmd{\listofalgorithms}{\listtablename}{\listalgorithmname}{}{}
\patchcmd{\listofalgorithms}{\listtablename}{\listalgorithmname}{}{}
\patchcmd{\listofalgorithms}{lot}{loa}{}{}



%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------
\colorlet{mdtRed}{red!50!black}
\definecolor{mathSTIC-Color}{RGB}{233,90,104} %MathSTIC 
\definecolor{grisfonce}{RGB}{49,49,49}
\definecolor{grisclair}{RGB}{111,111,111}
\definecolor{blanc}{RGB}{255,255,255}
\definecolor{fondtitre}{RGB}{85,85,85}
\definecolor{fonddeboite}{RGB}{232,232,232}
\definecolor{shadecolor}{RGB}{232,232,232}

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ihead{\headmark}% Inner header
	\ohead[\pagemark]{\pagemark}% Outer header
}
\ifoot{}% Inner footer
\ofoot{}% Outer footer
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
	incompatible\MessageBreak with this class}{The pagesyles are defined 
	using package `scrlayer-scrpage', please consult the\MessageBreak 
	KOMA-script documentation for details.}]{fancyhdr}
%
%
\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{m}{%
	\ClassWarning{\classname}{\string\blankpagestyle\space{is}
		obsolete,\MessageBreak use \string\setblankpagestyle\space{instead}}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{m}{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{m}{\renewcommand{\chapter@p@gestyle}{#1}}
%
\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}
%
%----------------------------------------------------------------------------------------
% School related info
%----------------------------------------------------------------------------------------
% logo dim (based on word file)
\newdimen\logoH
\logoH=0cm
\newdimen\logoW
\logoW=0cm
% conjoint? (UR2/AGRO)
\newif\ifdeliveconj
\deliveconjfalse
\newif\ifschoolnset
\schoolnsettrue


\newcommand{\@school}[1]{%
	\schoolnsetfalse
	\ifthenelse{\equal{#1}{UR1}}{%
	\def\logoUNIV{UR1}%
	\def\univname{l'Universit\'{e} de Rennes 1}% 
	\logoH=1.53cm% 
	\logoW=4.99cm}
	%
	{\ifthenelse{\equal{#1}{UR2}}{%
	\def\logoUNIV{UR2}%
	\deliveconjtrue%
	\def\univname{l'Universit\'{e} de Rennes 2}
	\logoH=2.13cm 
	\logoW=2.05cm}
	%	
	{\ifthenelse{\equal{#1}{UA}}}{%
	\def\logoUNIV{UA} 
	\def\univname{l'Universit\'{e} d'Angers} 
	\logoH=2.43cm 
	\logoW=2.43cm}
	%
	{\ifthenelse{\equal{#1}{LMU}}{%
	\def\logoUNIV{LMU}
	\def\univname{Le Mans Universit\'{e}} 
	\logoH=1.47cm 
	\logoW=5.9cm}
	%
	{\ifthenelse{\equal{#1}{UBO}}{%
	\def\logoUNIV{UBO}
	\def\univname{l'Universit\'{e}\\de Bretagne Occidentale} 
	\logoH=1.47cm 
	\logoW=3.67cm}
	%
	{\ifthenelse{\equal{#1}{UBS}}{%
	\def\logoUNIV{UBS} 
	\def\univname{l'Universit\'{e} de Bretagne Sud} 
	\logoH=3.02cm 
	\logoW=4.52cm}
	%
	{\ifthenelse{\equal{#1}{UN}}}{%
	\def\logoUNIV{UN} 
	\def\univname{l'Universit\'{e} de Nantes} 
	\logoH=2.37cm 
	\logoW=4.36cm}
	%
	{\ifthenelse{\equal{#1}{IMTA}}{%
	\def\logoUNIV{IMTA}
	\def\univname{l'\'{E}cole Nationale Superieure Mines-Telecom Atlantique\\Bretagne Pays de la Loire -- IMT Atlantique} 
	\logoH=2.19cm 
	\logoW=3.8cm} 
	%
	{\ifthenelse{\equal{#1}{ECN}}{%
	\def\logoUNIV{ECN} 
	\def\univname{l’\'{E}cole Centrale de Nantes}
	\logoH=2cm 
	\logoW=3.99cm}
	%
	{\ifthenelse{\equal{#1}{AGRO}}{%
	\def\logoUNIV{AGRO}
	\deliveconjtrue 
	\def\univname{AgroCampus Ouest}
	\logoH=1.94cm 
	\logoW=2.33cm}
	%
	{\ifthenelse{\equal{#1}{INSA}}{%
	\def\logoUNIV{INSA} 
	\def\univname{l’Institut National des Sciences\\Appliquees Rennes} 
	\logoH=1.82cm 
	\logoW=3.28cm}
	%
	{\ifthenelse{\equal{#1}{ENS}}{%
	\def\logoUNIV{ENS}  
	\def\univname{l’\'{E}cole Normale\\Superieure Rennes}
	\logoH=1.76cm 
	\logoW=4.99cm}
	%
	{\ifthenelse{\equal{#1}{CS}}{%
	\def\logoUNIV{CS} 
	\def\univname{CentraleSuperlec Rennes} 
	\logoH=2.08cm 
	\logoW=4.11cm}
	%
	{\ifthenelse{\equal{#1}{ENIB}}{%
	\def\logoUNIV{ENIB}  
	\def\univname{l’\'{E}cole Nationale d'Ingenieurs de Brest} 
	\logoH=2.01cm 
	\logoW=4.47cm}
	%
	{\ifthenelse{\equal{#1}{ENSAI}}{%
	\def\logoUNIV{ENSAI} 
	\def\univname{l’\'{E}cole Nationale de la Statistique\\et de l'Analyse de l'Information} 
	\logoH=2.2cm 
	\logoW=4.41cm} 
	%
	{\ifthenelse{\equal{#1}{ENSTA}}{%
	\def\logoUNIV{ENSTA}
	\def\univname{l’\'{E}cole Nationale Superieure\\de Techniques Avancees Bretagne} 
	\logoH=2.61cm 
	\logoW=2.12cm}
	% default UR1
	{\def\logoUNIV{UR1} \def\univname{l'Universit\'{e} de Rennes 1} \logoH=1.53cm \logoW=4.99cm}}}}}}}}}}}}}}
}
\ifschoolnset
	\def\logoUNIV{UR1} 
	\def\univname{l'Universit\'{e} de Rennes 1} 
	\logoH=1.53cm 
	\logoW=4.99cm
\fi

\NewDocumentCommand{\school}{m}{%
	\newcommand{\@uschool}{#1} % TODO FIX FORCE UPPERCASE
	%\newcommand{\@uschool}{\expandafter\uppercase\expandafter{\@tuschool}} 
	\@school{\@uschool}
}
									
%----------------------------------------------------------------------------------------
%	Cotutle
%----------------------------------------------------------------------------------------
\newif\ifcotutele
\cotutelefalse
\NewDocumentCommand{\cotutele} {m m}{%
	\def\cotutelelogopath{#1}%
	\def\cotutelename{\textsc{#2}}%
	\cotuteletrue   
}
%----------------------------------------------------------------------------------------
% Type of background image used on conver page and backcover page (unofficial -> 1)
%----------------------------------------------------------------------------------------
\newcommand{\covertypen}{2}
\newif\ifcovertype
\covertypefalse
\NewDocumentCommand{\covertype}{m}{%
	\renewcommand{\covertypen}{#1}
	\covertypetrue
}

%----------------------------------------------------------------------------------------
% Keywords
%----------------------------------------------------------------------------------------
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}
\NewDocumentCommand{\motscles}{m}{\newcommand{\keywordFnames}{#1}}
%----------------------------------------------------------------------------------------
% Abstract
%----------------------------------------------------------------------------------------
\NewDocumentCommand{\abstract}{+m}{\newcommand{\abstractT}{#1}}
\NewDocumentCommand{\resume}{+m}{\newcommand{\abstractTF}{#1}}
%----------------------------------------------------------------------------------------
% Author Name
%----------------------------------------------------------------------------------------
\DeclareDocumentCommand{\author}{m m}{%
	 \newcommand{\authorpname}{#1}
	 \newcommand{\authorname}{#2}
	 \renewcommand{\@author}{#1 \textsc{#2}}
}
%----------------------------------------------------------------------------------------
% thesis subject 
%----------------------------------------------------------------------------------------
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{\MakeFUpperCase{#1}}}
%----------------------------------------------------------------------------------------
% Thesis title and subtitle in document language
%----------------------------------------------------------------------------------------
\RenewDocumentCommand{\title}{o m}{%
	\IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
	\def\@title{#2}%
	\def\@titleE{#2}%
	\def\ttitle{#2}%
}
\newif\iftsubt
\tsubtfalse
\NewDocumentCommand{\subtitle}{o m}{%
	\IfValueTF{#1}{\def\shortsubtitle{#1}}{\def\shortsubtitle{#2}}%
	\def\@subtitle{#2}%
	\def\@subtitleE{#2}%
	\def\tsubtitle{#2}%
	\tsubttrue   
}
%----------------------------------------------------------------------------------------
% Thesis title and subtitle in foreign language
%----------------------------------------------------------------------------------------
\NewDocumentCommand{\titre} {o m}{%
	\IfValueTF{#1}{\def\shorttitleF{#1}}{\def\shorttitleF{#2}}%
	\def\@titleF{#2}%
	\def\ttitleF{#2}%
}
\newif\iftsubtF
\tsubtFfalse
\NewDocumentCommand{\soustitre} {o m}{%
	\IfValueTF{#1}{\def\shortsubtitleF{#1}}{\def\shortsubtitleF{#2}}%
	\def\@subtitleF{#2}%
	\def\tsubtitleF{#2}%
	\tsubtFtrue   
}
%----------------------------------------------------------------------------------------
% TODO: comment here

\newcommand\deptname{Math\`{e}matique et Sciences et Technologies \\ de l'Information et de la Communication} 
\newcommand\deptnumber{601}
\NewDocumentCommand{\department}{m}{\renewcommand{\deptname}{#1}}
\NewDocumentCommand{\departmentnumber}{m}{\renewcommand{\deptnumber}{#1}}


\newcommand\addcomue{Comue Universite Bretagne Loire}
\NewDocumentCommand{\addresses}{m}{\renewcommand{\addcomue}{#1}}

\NewDocumentCommand{\city}{m}{\newcommand{\cityname}{#1}}
\NewDocumentCommand{\tnumber}{m}{\newcommand{\theseorder}{#1}}

\NewDocumentCommand{\lab}{m}{\newcommand{\labname}{#1}}
	 
%----------------------------------------------------------------------------------------
%	QUOTATION PAGE DESIGN
%----------------------------------------------------------------------------------------
\NewDocumentCommand\makequotation{+mmm}{% #1 can contain \par
	\clearpage
	\thispagestyle{empty}
	\vspace*{0.2\textheight}
	\noindent\enquote{\itshape #1%
	}.\bigbreak%
	\hfill #2 \emph{#3}%
}
%----------------------------------------------------------------------------------------
% Defining a new coordinate system for the page, Helpfull to the cover page.
%----------------------------------------------------------------------------------------
% --------------------------
% |(-1,1)    (0,1)    (1,1)|
% |                        |
% |(-1,0)    (0,0)    (1,0)|
% |                        |
% |(-1,-1)   (0,-1)  (1,-1)|
% --------------------------
%\makeatletter%
\def\parsecomma#1,#2\endparsecomma{\def\page@x{#1}\def\page@y{#2}}%
\tikzdeclarecoordinatesystem{page}{%
	\parsecomma#1\endparsecomma%
	\pgfpointanchor{current page}{north east}%
	% Save the upper right corner
	\pgf@xc=\pgf@x%
	\pgf@yc=\pgf@y%
	% save the lower left corner
	\pgfpointanchor{current page}{south west}%
	\pgf@xb=\pgf@x%
	\pgf@yb=\pgf@y%
	% Transform to the correct placement
	\pgfmathparse{(\pgf@xc-\pgf@xb)/2.*\page@x+(\pgf@xc+\pgf@xb)/2.}%
	\expandafter\pgf@x\expandafter=\pgfmathresult pt%
	\pgfmathparse{(\pgf@yc-\pgf@yb)/2.*\page@y+(\pgf@yc+\pgf@yb)/2.}%
	\expandafter\pgf@y\expandafter=\pgfmathresult pt%
}%
%\makeatother%


%TODO BUG on cover with draftmode
%----------------------------------------------------------------------------------------
% PAGES RELATED TO SETUP FOR DRAFT
%----------------------------------------------------------------------------------------
\ifbool{draftmode}{%
	\tikzset{st/.style={draw, anchor=north west, text width=17cm}}
	 \newcommand{\dbox}[1]{\fbox{#1}}
	 \geometry{showframe}
}{\tikzset{st/.style={anchor=north west, text width=17cm}}
\newcommand{\dbox}[1]{#1}
}

%----------------------------------------------------------------------------------------
% President du jury
%----------------------------------------------------------------------------------------
%----------------------------------------------------------------------------------------
% President du jury variables
\newcommand{\PRESp}{} % Name (prenon)
\newcommand{\PRESn}{} % surname (nom)
\newcommand{\PRESq}{} % Fonction et établissement d’exercice 
\newcommand{\Mpres}{} % M or Mme 
\newcommand{\TPres}{Pr\'{e}sident}

% define hspace in function of the longest phrase
\newlength{\lenMax}
\newlength{\lenAct}
\newlength{\lenDif}
\lenDif=0pt
\settowidth{\lenMax}{Co-dir.\ de th\`{e}se\,:}
\newlength{\lenP}
\settowidth{\lenP}{President~:}
%----------------------------------------------------------------------------------------
% president parameters [Mme] {Name} {Surname} {Fonction et établissement d’exercice}
\newcommand{\president}[4][M]{%
	\renewcommand{\Mpres}{#1}%
	\ifthenelse{\equal{#1}{Mme}}{\renewcommand{\TPres}{Pr\'{e}sidente}\settowidth{\lenP}{Presidente~:}}{}% fix length president -> presidente
	\renewcommand{\PRESp}{#2}%
	\renewcommand{\PRESn}{#3}%
	\renewcommand{\PRESq}{#4}%
}
\newlength{\lenPF}
\lenPF=0pt
\advance\lenPF by \lenMax
\advance\lenPF by -\lenP 
%----------------------------------------------------------------------------------------
\newcounter{III}
%----------------------------------------------------------------------------------------
% Examinateur
%----------------------------------------------------------------------------------------
\newcommand{\EXApi}{}
\newcommand{\EXAni}{}
\newcommand{\EXAqi}{}
\newcommand{\EXAti}{}
\newcounter{nexa}
\setcounter{nexa}{0}
%
\newcommand{\newExam}[5]{%
	\expandafter\def\csname EXAp#1\endcsname{#2}%
	\expandafter\def\csname EXAn#1\endcsname{#3}%
	\expandafter\def\csname EXAq#1\endcsname{#4}%
	\expandafter\def\csname EXAt#1\endcsname{#5}%
}
%
% examinateur parameters [Mme] {Name} {Surname} {Fonction et établissement d’exercice}
\newcommand{\examinateur}[4][M]{%
	\stepcounter{nexa}%
	\ifthenelse{\equal{#1}{Mme}}{\newExam{\roman{nexa}}{#2}{#3}{#4}{Examinatrice}}{\newExam{\roman{nexa}}{#2}{#3}{#4}{Examinateur}}%
}
%
\newcommand{\TExam}{Examinateurs}
\newcommand{\Lexa}[1]{%
	\ifnum\theIII=1
	\settowidth{\lenAct}{\TExam~:}
	\lenDif=0pt
	\advance\lenDif by 	\lenMax
	\advance\lenDif by 	-\lenAct
	\TExam~:\hspace{\lenDif}\dbox{\parbox[t]{13.9cm}{{\csname EXAp#1\endcsname} \textsc{\csname EXAn#1\endcsname}~---~{\small\csname EXAq#1\endcsname}}}%{\small\csname EXAt#1\endcsname}
	\fi
	\ifnum\theIII>1	
	\hspace{\lenMax}\dbox{\parbox[t]{13.9cm}{{\csname EXAp#1\endcsname} \textsc{\csname EXAn#1\endcsname}~---~{\small\csname EXAq#1\endcsname}}}% {\small\csname EXAt#1\endcsname}
	\fi
	
}
%----------------------------------------------------------------------------------------
% Advisors
%----------------------------------------------------------------------------------------
\newcommand{\ADVpi}{}
\newcommand{\ADVni}{}
\newcommand{\ADVqi}{}
\newcommand{\ADVti}{}
\newcounter{nadv}
\setcounter{nadv}{0}
%
\newcommand{\newAdv}[5]{%
	\expandafter\def\csname ADVp#1\endcsname{#2}%
	\expandafter\def\csname ADVn#1\endcsname{#3}%
	\expandafter\def\csname ADVq#1\endcsname{#4}%
	\expandafter\def\csname ADVt#1\endcsname{#5}%
}
%
% advisor parameters [Mme] {Name} {Surname} {Fonction et établissement d’exercice}
\newcommand{\advisor}[4][M]{%
	\stepcounter{nadv}%
	\ifthenelse{\equal{#1}{Mme}}{\newAdv{\roman{nadv}}{#2}{#3}{#4}{Directrice de th\`{e}se}}{\newAdv{\roman{nadv}}{#2}{#3}{#4}{Directeur de th\`{e}se}}%
}
%
\newcommand{\Ladv}[1]{%
	\ifnum\theIII=1
	\settowidth{\lenAct}{Dir.\ de th\`{e}se~:}
	\lenDif=0pt
	\advance\lenDif by 	\lenMax
	\advance\lenDif by 	-\lenAct
	Dir.\ de th\`{e}se~:\hspace{\lenDif}\dbox{\parbox[t]{13.9cm}{{\csname ADVp#1\endcsname} \textsc{\csname ADVn#1\endcsname}~--~{\small\csname ADVq#1\endcsname}}}%{\small\csname ADVt#1\endcsname}
	\fi
	\ifnum\theIII=2	
	\settowidth{\lenAct}{Co-dir.\ de th\`{e}se\,:}
	\lenDif=0pt
	\advance\lenDif by 	\lenMax
	\advance\lenDif by 	-\lenAct
	Co-dir.\ de th\`{e}se\,:\hspace{\lenDif}\dbox{\parbox[t]{13.9cm}{{\csname ADVp#1\endcsname} \textsc{\csname ADVn#1\endcsname}~---~{\small\csname ADVq#1\endcsname}}}% {\small\sname ADVt#1\endcsname}
	\fi	
	\ifnum\theIII>2	
	\hspace{\lenMax}\dbox{\parbox[t]{13.9cm}{{\csname ADVp#1\endcsname} \textsc{\csname ADVn#1\endcsname}~---~{\small\csname ADVq#1\endcsname}}}% {\small\csname ADVt#1\endcsname}
	\fi
}
%----------------------------------------------------------------------------------------
% Rapporteur
%----------------------------------------------------------------------------------------
\newcommand{\RAPpi}{}
\newcommand{\RAPni}{}
\newcommand{\RAPqi}{}
\newcommand{\RAPti}{}
\newcounter{nrap}
\setcounter{nrap}{0}
%
\newcommand{\newRap}[5]{%
	\expandafter\def\csname RAPp#1\endcsname{#2}%
	\expandafter\def\csname RAPn#1\endcsname{#3}%
	\expandafter\def\csname RAPq#1\endcsname{#4}%
	\expandafter\def\csname RAPt#1\endcsname{#5}%
}
%
% rapporter parameters [Mme] {Name} {Surname} {Fonction et établissement d’exercice}
\newcommand{\rapporteur}[4][M]{%
	\stepcounter{nrap}%
	\ifthenelse{\equal{#1}{Mme}}{\newRap{\roman{nrap}}{#2}{#3}{#4}{Rapporteuse}}{\newRap{\roman{nrap}}{#2}{#3}{#4}{Rapporteur}}%
}
%
\newcommand{\Lrap}[1]{%
%	\ifnum\theIII=1	
	\dbox{\parbox[t]{15cm}{{\csname RAPp#1\endcsname} \textsc{\csname RAPn#1\endcsname}~---~{\small\csname RAPq#1\endcsname}}} %{\small\csname RAPt#1\endcsname}
%	\fi
%	\ifnum\theIII=2	
%	\parbox[t]{15cm}{{\csname RAPp#1\endcsname} \textsc{\csname RAPn#1\endcsname} -- {\small\csname RAPq#1\endcsname}} % {\small\csname RAPt#1\endcsname}
%	\fi	
%	\ifnum\theIII>2	
%	\parbox[t]{15cm}{{\csname RAPp#1\endcsname} \textsc{\csname RAPn#1\endcsname} -- {\small\csname RAPq#1\endcsname}} % {\small\csname RAPt#1\endcsname}
%	\fi	
}
%----------------------------------------------------------------------------------------
% Invite
%----------------------------------------------------------------------------------------
\newcommand{\GUEpi}{}
\newcommand{\GUEni}{}
\newcommand{\GUEqi}{}
\newcommand{\GUEti}{}
\newcounter{ngue}
\setcounter{ngue}{0}
%
\newcommand{\newGue}[5]{%
	\expandafter\def\csname GUEp#1\endcsname{#2}%
	\expandafter\def\csname GUEn#1\endcsname{#3}%
	\expandafter\def\csname GUEq#1\endcsname{#4}%
	\expandafter\def\csname GUEt#1\endcsname{#5}%
}
%
% invite parameters [Mme] {Name} {Surname} {Fonction et établissement d’exercice}
\newcommand{\invite}[4][M]{%
	\stepcounter{ngue}%
	\ifthenelse{\equal{#1}{Mme}}{\newGue{\roman{ngue}}{#2}{#3}{#4}{Inviée}}{\newGue{\roman{ngue}}{#2}{#3}{#4}{Invité}}%
}

\newcommand{\Lgue}[1]{%
%	\ifnum\theIII=1%
	\dbox{{\csname GUEp#1\endcsname} \textsc{\csname GUEn#1\endcsname}~---~{\small\csname GUEq#1\endcsname}}\\%
%	\fi%
%	\ifnum\theIII=2%	
%	{\csname GUEp#1\endcsname} \textsc{\csname GUEn#1\endcsname} -- {\small\csname GUEq#1\endcsname}%
%	\fi%	
%	\ifnum\theIII>2%	
%	{\csname GUEp#1\endcsname} \textsc{\csname GUEn#1\endcsname} -- {\small\csname GUEq#1\endcsname}%
%	\fi%	
}

\newcommand{\pnqRAP}[1]{%
	\csname RAPp#1\endcsname\ \csname RAPn#1\endcsname, \csname RAPq#1\endcsname}
\newcommand{\pnqEXA}[1]{%
	\csname EXAp#1\endcsname\ \csname EXAn#1\endcsname, \csname EXAq#1\endcsname}
\newcommand{\pnqADV}[1]{%
	\csname ADVp#1\endcsname\ \csname ADVn#1\endcsname, \csname ADVq#1\endcsname}


%----------------------------------------------------------------------------------------
% Create the jury box
%----------------------------------------------------------------------------------------
\newcommand{\JURYX}{%	
{\bfseries{Rapporteurs avant soutenance~:\\}}%
	\setcounter{III}{0}%
	{\small%
		\whiledo{{\value{III}<\value{nrap}}}{\stepcounter{III}\Lrap{\roman{III}}}%
	}%
	\vspace{0.25cm}%
	{\bfseries~\\Composition du jury~:\\}%
	{\footnotesize%
		\textcolor{mathSTIC-Color}{\textit{Attention, en cas d'absence d’un des membres du Jury le jour de la soutenance,  la composition ne comprend que les membres pr\'{e}sents}}}\\%
	{\setlength{\baselineskip}{0.5\baselineskip} %
		{\small%
			\TPres{}~:\hspace{\lenPF}\dbox{\parbox[t]{13.9cm}{\PRESp~\textsc{\PRESn{}}~---~\PRESq}}\\%
			\setcounter{III}{0}%
			\whiledo{{\value{III}<\value{nexa}}}{\stepcounter{III}\Lexa{\roman{III}}}%
			\setcounter{III}{0}%
			\vspace{0.15cm}%
			\whiledo{{\value{III}<\value{nadv}}}{\stepcounter{III}\Ladv{\roman{III}}\\}%
			\ifnum\thengue=1%
			{\bfseries~\\Invité~:\\}%
			\fi%
			\ifnum\thengue>1%
			{\bfseries~\\Invités~:\\}%
			\fi%
			\setcounter{III}{0}%			
			\whiledo{{\value{III}<\value{ngue}}}{\stepcounter{III}\Lgue{\roman{III}}}%			
		}%
	}%	
}%


%----------------------------------------------------------------------------------------
%	COVER PAGE DESIGN
%----------------------------------------------------------------------------------------
\newdimen\nodeD
\nodeD=1.2cm
%
\def\@coverext{eps}
\newcommand*{\coverbackground}[1]{\gdef\@coverbackground{#1}}%
\coverbackground{./cover/cover\covertypen.\@coverext}
%\makeatletter%
\def\maketitle{%
	\newgeometry{margin=0.5in}%
	\newcounter{totalJury}
	\setcounter{totalJury}{0}
	\addtocounter{totalJury}{\value{nexa}}
	\addtocounter{totalJury}{\value{nrap}}
	\addtocounter{totalJury}{\value{nadv}}
	\addtocounter{totalJury}{\value{ngue}}
	\ifnum\thetotalJury>10
		\newcounter{extraJury}
		\setcounter{extraJury}{\value{totalJury}}
		\whiledo{{\value{extraJury}>10}}{\addtocounter{extraJury}{-1}\advance\nodeD by -0.2cm}% 0.03125
	\fi
	\begin{spacing}{1.0} % cover is always 1 line spacing
		\begin{otherlanguage}{french} % cover is always in French (of course, the title, certain not... )
			%\pagenumbering{gobble} % NEEDS ?
			\thispagestyle{empty}%
			\clearpage%
			\begin{tikzpicture}[%
			remember picture,%
			overlay,%
			line width=0mm,%
			node distance=\nodeD,%
			%st/.style={draw,
			%	anchor=north west,
			%	text width=17cm}
			]%
			% BACKGROUND
			\node[anchor=center] at (current page.center){\includegraphics[height=\paperheight,width=\paperwidth]{\@coverbackground}};%
			%
			\node[,anchor=north west] (FL) at (page cs:-0.869,0.91) {%
				\includegraphics[height=23.5mm,keepaspectratio]{./cover/logos/logo-mathSTIC.\@coverext}%
			};%	
			\ifcotutele% 
			% LOGO COTUTELE
			\node[anchor= east] (FC) at (page cs:0.869,0.8251) {%
				\includegraphics[width=2.33cm,keepaspectratio]{\cotutelelogopath}%
			};%
			% CONJOINT and COTUTELE
			\ifdeliveconj%
			\node[left = 0.3cm of FC.west] (FUR1) {%
				\includegraphics[width=4.99cm,keepaspectratio]{./cover/logos/logo-UR1.\@coverext}%
			};%
			\node[left = 0.3cm of FUR1.west] (FR) {%
				\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
			};%
			\else%		    
			% ONLY COTUTULE
			\node[left = 0.3cm of FC.west] (FR) {%
				\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
			};%
			\fi%
			\else%
			% NO COTUTLE AND CONJOINT
			\ifdeliveconj%
			\node[anchor= east  ] (FUR1) at (page cs:0.869,0.825) {%
				\includegraphics[width=4.99cm,keepaspectratio]{./cover/logos/logo-UR1.\@coverext}%
			};%
			\node[left = 0.3cm of FUR1.west] (FR) {%
				\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
			};%
			\else		    
			% ONLY ONE LOGO
			\node[anchor= east] (FR) at (page cs:0.869,0.825) {%
				\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
			};%
			\fi%
			\fi%	
			% TEXT TITLE LINE 1
			\node[st] (H1) at (page cs:-0.85,0.65) {%
				{\Huge\fontfamily{phv}\selectfont\scshape Th\`{e}se de Doctorat de}%
			};%
			% Bloc 2
			\node[st,below = 2cm of H1] (H2) {%
				{\fontfamily{phv}\selectfont \scshape  {\Large \univname}\\%
					\ifdeliveconj%
					Deliver\'{e}e Conjointement avec\\l’Universit\'{e} de Rennes 1\\%
					\fi%
					\ifcotutele%
					\cotutelename\\%
					\fi% 
					\addcomue}%
			};%
			% Bloc 3
			\node[st,below = 1cm of H2] (H3)  {%				
				{\fontfamily{phv}\selectfont \scshape \'{E}col\'{e} Doctorale N\footnotesize{\textsuperscript{\underline{o}}} \deptnumber}\\%
				{\itshape \fontfamily{phv}\selectfont \deptname}\\%
				{\fontfamily{phv}\selectfont Sp\'{e}cialit\'{e} : \subjectname} \\[0.25cm]%
				\hspace*{0.5cm}Par%				
			};%
			% AUTHOR NAME
			\node[st,below = 0.2cm of H3] (H4) {%
				{\LARGE\bfseries\fontfamily{phv}\selectfont\hspace*{0.5cm}\@author}%
			};%
			% TITLE / SUBTITLE
			\node[st, align=center, below = 0.2cm of H4] (H5){%
				{\centering \scshape{\Large\bfseries\fontfamily{phv}\selectfont\@title} \\%
					\iftsubt{\large\@subtitle}\fi%
				}%
			};
			% Bloc 6
			\node[st, below = of H5] (H6) {%
				{\fontfamily{phv}\selectfont\bfseries Th\`{e}se pr\'{e}sent\'{e}e et soutenue \`{a} \cityname{} le \@date \\%
					Unit\'{e} de recherche : \labname\\% 
					Th\`{e}se N\footnotesize{\textsuperscript{\underline{o}}} : \theseorder% 
				}%
			};%
			% Bloc 7 (REPORTER AND JURY)
			\node[st, below = of H6] (H7) {%
				\JURYX%
			};%
			\end{tikzpicture}%
		\end{otherlanguage}%
	\end{spacing}%
	 \restoregeometry
	\cleardoublepage%
	\pagestyle{plain}
}%
%\makeatother% 


%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------
%\makeatletter%
\newcommand*{\abstractbackground}[1]{\gdef\@abstractbackground{#1}}
\abstractbackground{./cover/back_resume.\@coverext}
%
\NewDocumentCommand{\makeabstract}{}{%
	%\thispagestyle{empty}
	%\clearpage
	%	\addchap*{\abstractname}
	
	%	\iflanguage{french}{\run@renchtrue}{\run@frenchfalse}
	\addchap{Résumé/Abstract}
	\begin{spacing}{1.0}  %  always one spacing
		\begin{tikzpicture}[%
		remember picture,%
		overlay,%
		line width=0mm,%
		node distance=0.1cm,%
		]
		% JUST TO CLEAR ALL
		\draw [draw=white,fill=white] (current page.north west) rectangle (current page.south east);
		% BACKGROUND IMAGE
		\node[anchor=center] at (current page.center){\includegraphics[height=\paperheight,width=\paperwidth]{\@abstractbackground}};%
		% LOGO LEFT  
		\node[anchor=north west] (FL) at (page cs:-0.8,0.93) {%
			\includegraphics[height=23.09mm,keepaspectratio]{./cover/logos/logo-mathSTIC.\@coverext}
		};
		\ifcotutele% 
		% LOGO COTUTELE
		\node[anchor= east] (FC) at (page cs:0.8,0.845) {%
			\includegraphics[width=2.33cm,keepaspectratio]{\cotutelelogopath}%
		};%
		% CONJOINT and COTUTELE
		\ifdeliveconj%
		\node[left = 0.3cm of FC.west] (FUR1) {%
			\includegraphics[width=4.99cm,keepaspectratio]{./cover/logos/logo-UR1.\@coverext}%
		};%
		\node[left = 0.3cm of FUR1.west] (FR) {%
			\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
		};%
		\else%		    
		% ONLY COTUTULE
		\node[left = 0.3cm of FC.west] (FR) {%
			\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
		};%
		\fi%
		\else%
		% NO COTUTLE AND CONJOINT
		\ifdeliveconj%
		\node[anchor= east] (FUR1) at (page cs:0.8,0.845) {%
			\includegraphics[width=4.99cm,keepaspectratio]{./cover/logos/logo-UR1.\@coverext}%
		};%
		\node[left = 0.3cm of FUR1.west] (FR) {%
			\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
		};%
		\else		    
		% ONLY ONE LOGO
		\node[anchor= east] (FR) at (page cs:0.8,0.845) {%
			\includegraphics[height=\logoH,width=\logoW]{./cover/logos/logo-\logoUNIV.\@coverext}%
		};%
		\fi%
		\fi%
		\node[text width=16.5cm, anchor=center] (RULE)  at (page cs:0,0.73)  {\textcolor{mathSTIC-Color}{\rule{\textwidth }{0.2cm}}
		};
		\node[st,text width=16.5cm, anchor=north, below = of RULE.center] (RESUME) {%at (page cs:0,0.54)   {
			{\small\noindent\fontfamily{phv}\selectfont{{\bfseries\textcolor{mathSTIC-Color}{Titre}}\space: \@titleF\iftsubtF : \@subtitleF\fi}\\[0.25cm]
				\noindent{\bfseries Mots cl\'{e}s : }\small\keywordFnames
				\vspace{-0.25cm}
				\begin{multicols}{2}
				\noindent\textbf{R\'{e}sum\'{e} : }
					\begin{otherlanguage}{french}\small{\abstractTF}\end{otherlanguage}%
				\end{multicols}%
			}
		};
		\node[text width=16.5cm, anchor=north, below = of RESUME ] (RULEB) {% at (page cs:0,0.58)  {
			\textcolor{mathSTIC-Color}{\rule{\textwidth }{0.2cm}}};
		
		\node[st,text width=16.5cm, anchor=north, below = of RULEB] (ABSTRACT) {%at (page cs:0,0.54)   {
			{\small\noindent\fontfamily{phv}\selectfont{{\bfseries\textcolor{mathSTIC-Color}{Title}}: \@titleE\iftsubt: \@subtitleE\fi}\\[0.25cm]
				\noindent{\bfseries Keywords: }\small\keywordnames
				\vspace{-0.25cm}
				\begin{multicols}{2}
				\noindent\textbf{Abstract: }%
					\begin{otherlanguage}{english}\small{\abstractT}\end{otherlanguage}
				\end{multicols}}
		};
		\end{tikzpicture}
	\end{spacing}
%	\cleardoublepage
}%
%\makeatother%
%----------------------------------------------------------------------------------------
%	COVER BACK PAGE
%----------------------------------------------------------------------------------------
\def\makebackcover{%
	\pagestyle{empty}%
	\cleardoublepage%
	%\pagenumbering{gobble}%
	%\pagestyle{empty}%
	\ifodd\thepage % Now, is it odd? 
	\null% 'fill` and clear again
	\clearpage%
	\fi
	{%
		\makeabstract
	}%
}%

%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------
\ifbool{consistentlayout}{%
	\DeclareDocumentCommand{\dedicatory}{%
		m O{\vspace*{.7\textheight} }  }{%
		\checktoopen\tttypeout{Dedicatory}
		\markboth{}{}
		#2
		{\hfill\parbox{.4\textwidth}{\flushright#1\par}}
	}
}{% ELSE
\DeclareDocumentCommand{\dedicatory}{m}{%
		\checktoopen
		\thispagestyle{plain}
		\tttypeout{Dedicatory}
		\null\vfil
		\begin{center}{\huge \textcalligra{#1}}\end{center}
		\vfil\null
	}
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\acknowledgementname}{Acknowledgements}
\providecaptionname{french}{\acknowledgementname}{Remerciements}

\ifbool{consistentlayout}{%
	\DeclareDocumentEnvironment{acknowledgements}{}{%
		\tttypeout{\acknowledgementname}
		\addchap*{\acknowledgementname}
	}
}{% ELSE
\DeclareDocumentEnvironment{acknowledgements}{}{%
	\begin{spacing}{1.0}  % ack always one spacing
		\checktoopen
		\tttypeout{\acknowledgementname}
		\thispagestyle{plain}
		\begin{center}{\huge\textit{\acknowledgementname}\par}\end{center}
	\end{spacing} 
	}
	{%
		\vfil\vfil\null
	}
}


%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\abbrevname}{List of Abbreviations}
\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{french}{\abbrevname}{Liste des sigles}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\abbrevname}}
	\setlength\LTleft{0pt}
	\setlength\LTright{0pt}
	\begin{longtable}{@{\extracolsep{\fill}}#1@{}}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}


%----------------------------------------------------------------------------------------
%	PHYSICAL CONSTANTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\constantsname}{Physical Constants}
\providecaptionname{english,british,american}{\constantsname}{Physical Constants}
\providecaptionname{french}{\constantsname}{Constantes}

\NewDocumentEnvironment{constants}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\constantsname}}{\addchap*{\constantsname}}
	\begin{longtable}{@{\extracolsep{\fill}}#1@{}}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{french}{\symbolsname}{Nomenclature}


\NewDocumentEnvironment{symbols}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\symbolsname}}{\addchap*{\symbolsname}}
	\begin{longtable}{@{\extracolsep{\fill}}#1@{}}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}



%\newcommand{\url}[1]{%
%\expandafter\string\csname #1\endcsname}

% FIX PDF
\ifx\pdfoutput\undefined
    % not running pdfTeX
\else
    \ifx\pdfoutput\relax
        % not running pdfTeX
    \else
        % running pdfTeX, with...
        \ifnum\pdfoutput>0
            \pdfminorversion=7
            \pdfobjcompresslevel=2
            % If there is an explicit linebreak in a section heading (or anything printed to the pdf- bookmarks), it is replaced by a space
            %\pdfstringdefDisableCommands{\let\\\space}
        \else
            % DVI output
        \fi
    \fi
\fi

\AtBeginDocument{%
	\ifcurrentbaselanguage{French}{
	\renewcommand{\@title}{\@titleF}
	\renewcommand{\@subtitle}{\@subtitleF}
	\message{FRENCH}
	}{\message{NOT FRENCH}}
}


\AtEndDocument{%
\makebackcover
}

% disable page counter reseting.
\renewcommand\mainmatter{
	\@mainmattertrue\cleardoublepage\renewcommand\thepage{\arabic{page}}}


\endinput
