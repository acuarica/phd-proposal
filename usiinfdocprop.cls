% -----------------------------------------------------------------------------
% LaTeX class for the doctoral proposal at the Faculty of
% Informatics of Universita' della Svizzera Italiana
% 
% Domenico Bianculli <domenico.bianculli@usi.ch>
%
% part of this code is based on 'USINFthesis.cls' by
% Domenico Bianculli <domenico.bianculli@usi.ch> and
% Jochen Wuttke <wuttkej@usi.ch>
% -----------------------------------------------------------------------------
%%
%% This file is 'USIINFdocprop.cls'
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.

%%% identification
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{usiinfdocprop}[2009/08/25 v. 1.0.2 %
 USI Informatics Doctoral Proposal class]
%%% initial code
\RequirePackage{ifthen}
%%% true to produce a version suitable for printing
\newboolean{@printversion}
%%% true to enable automatic loading of hyperref package
\newboolean{@hypermode}
%%% true if a subtitle is provided
\newboolean{@subtitle}
%%% declaration of options
\DeclareOption{print}{\setboolean{@printversion}{true}}
  {%redefine margins to match oneside layout
  }
%%% enable/disable hyperref
\DeclareOption{hyper}{\setboolean{@hypermode}{true}}
\DeclareOption{nohyper}{\setboolean{@hypermode}{false}}

\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{openany}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{oneside}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}

%%%
\DeclareOption*{% 
\PassOptionsToClass{\CurrentOption}{book}% 
} 
%%% execution of options
\ExecuteOptions{hyper}
\ProcessOptions \relax
\typeout{*** Please report bugs, comments, suggestions, and improvements
  to: }
\typeout{*** Domenico Bianculli <domenico.bianculli@usi.ch>}
%%% package loading
\LoadClass[a4paper,11pt,twoside,onecolumn,final,openany,titlepage]{book}
%%% main code

%font settings
\RequirePackage[T1]{fontenc}
\RequirePackage[charter]{mathdesign}
%\RequirePackage[scaled]{beramono}
%\renewcommand{\sfdefault}{uop}
%\renewcommand{\scshape}{%
%\not@math@alphabet\scshape\relax
%\ifthenelse{\equal{\f@family}{uop}}%
%{\fontshape{sc}\selectfont}%
%{\fontshape{fsc}\selectfont}%
%}

%sans-serif titles
%\RequirePackage{sectsty}
%\allsectionsfont{\sffamily}

%geometry
\RequirePackage[a4paper]{geometry}
%\geometry{hscale=0.67}
\ifthenelse{\boolean{@printversion}}{}%
{  \geometry{asymmetric}
  \geometry{bindingoffset=0pt,hmarginratio=1:1}
}


%%% fancy headers
\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}
\fancypagestyle{cover}{%
  \fancyhf{}
  \fancyhead{\mbox{ }}
}
\fancypagestyle{hrulefpage}{%
  \fancyhf{}
   \fancyhead{\mbox{ }}
  \fancyfoot[C]{\sf \thepage}
}
%modifying captions
%\RequirePackage[font=sf,labelsep=period]{caption}

%datatool
\RequirePackage{datatool}
\RequirePackage{calc}

%%% populate the committee database
%%% format of the rows (name of the columns in brackets) :
%%% Title [title], First and Middle [first], Last [last], Affiliation
%%% [aff], Type ([a]dvisor, [c]oadvisor, [e]xternal, [i]nternal) [type]
\newenvironment{committee}{%
\DTLnewdb{committee}
}
{
}

\newcommand{\advisor}[3]{%
\DTLnewrow{committee}
\DTLnewdbentry{committee}{title}{#1}
\DTLnewdbentry{committee}{fullname}{#2}
\DTLnewdbentry{committee}{aff}{#3}
\DTLnewdbentry{committee}{type}{a}
}

\newcommand{\coadvisor}[3]{%
\DTLnewrow{committee}
\DTLnewdbentry{committee}{title}{#1}
\DTLnewdbentry{committee}{fullname}{#2}
\DTLnewdbentry{committee}{aff}{#3}
\DTLnewdbentry{committee}{type}{c}
}

\newcommand{\internalmember}[3][\USI, Switzerland]{%
\DTLnewrow{committee}
\DTLnewdbentry{committee}{title}{#2}
\DTLnewdbentry{committee}{fullname}{#3}
\DTLnewdbentry{committee}{aff}{#1}
\DTLnewdbentry{committee}{type}{i}
}

\newcommand{\externalmember}[3]{%
\DTLnewrow{committee}
\DTLnewdbentry{committee}{title}{#1}
\DTLnewdbentry{committee}{fullname}{#2}
\DTLnewdbentry{committee}{aff}{#3}
\DTLnewdbentry{committee}{type}{e}
}

\newcommand{\phddirector}[3][\USI, Switzerland]{
\DTLnewrow{committee}
\DTLnewdbentry{committee}{title}{#2}
\DTLnewdbentry{committee}{fullname}{#3}
\DTLnewdbentry{committee}{aff}{#1}
\DTLnewdbentry{committee}{type}{p}
}

%%% additional titlepage content commands
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}\setboolean{@subtitle}{true}}
\newcommand\abstract[1]{\def\@abstract{#1}}

%%% title page
\renewcommand{\maketitle}{%
\pagenumbering{Alph}\begin{titlepage}
\thispagestyle{empty}
\noindent \includegraphics[width=48mm]{logoinfo-en.pdf}
\hspace{-1.3mm}\rule[3.46mm]{\textwidth-48mm}{0.2pt}
\vspace{-20mm}
\begin{flushright}
{\Large Dissertation Proposal}
\end{flushright}
\vspace{1mm}
\hfill {\today}\\
\vspace{10mm}

\noindent {\Huge {\textbf{\@title}}}
 \ifthenelse{\boolean{@subtitle}}{%
      \noindent{\Large \\[0.5em]\textbf{\@subtitle}}\\[8mm]
    }{\\[8mm]}
\hfill { \Large {\textbf{\@author}}}\\

\hrule height 0.2pt  \vspace{4mm}

\noindent{\textbf{Abstract}}\\
\@abstract
\vfill

\hrule height 0.2pt \vspace{2mm}

\noindent {\textbf{Research Advisor}}\\
\DTLforeach*[\DTLiseq{\type}{a}]{committee}%
{\actitle=title,\fullname=fullname,\type=type}{%
\actitle \ \fullname%
}
%
\DTLforeach*[\DTLiseq{\type}{c}]{committee}%
{\actitle=title,\fullname=fullname,\type=type}{%
\DTLiffirstrow{\\[3mm]\textbf{Research Co-advisor}\\}{, }%
\actitle \ \fullname
}%
%
\\[3mm]
\textbf{Internal Committee Members}\\
\DTLforeach*[\DTLiseq{\type}{i}]{committee}%
{\actitle=title,\fullname=fullname,\type=type}{%
\DTLiffirstrow{}{, }\actitle \ \fullname%
}
%
\\[3mm]
\textbf{External Committee Members}\\
\DTLforeach*[\DTLiseq{\type}{e}]{committee}%
{\actitle=title,\fullname=fullname,\type=type}{%
\DTLiffirstrow{}{, }\actitle \ \fullname%
}
\vspace{2mm}
\hrule height 0.2pt
\end{titlepage}
\setcounter{footnote}{0}
}

\renewenvironment{titlepage}{%
      \cleardoublepage
      \setcounter{page}\z@
    }%
    {\newpage }

\renewcommand{\frontmatter}{%
  \@mainmatterfalse
  \pagenumbering{Roman}
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \clearpage
  \pagestyle{empty}
  \pagenumbering{roman}
  \setcounter{page}{1}
  This proposal has been approved by the dissertation committee and the
  director of the Ph.D. program:

  \vfill
  %%% committee
  \begin{center}
  %advisor
  \DTLforeach*[\DTLiseq{\type}{a}]{committee}%
  {\actitle=title,\fullname=fullname,\type=type,\aff=aff}{%
      \rule{.7\textwidth}{0.2mm} \\
      \actitle \ \fullname, Research Advisor and Committee Chair, \aff
      \vfill      
  }
  %coadvisor
  \DTLforeach*[\DTLiseq{\type}{c}]{committee}%
  {\actitle=title,\fullname=fullname,\type=type,\aff=aff}{%
      \rule{.7\textwidth}{0.2mm} \\
      \actitle \ \fullname, Research Co-Advisor, \aff
      \vfill
  }
  %others
  \DTLforeach*[\DTLiseq{\type}{i} \or \DTLiseq{\type}{e}]{committee}%
  {\actitle=title,\fullname=fullname,\type=type,\aff=aff}{%
      \rule{.7\textwidth}{0.2mm} \\
      \actitle \ \fullname, \aff
      \vfill
  }
  %director
    
  \DTLforeach*[\DTLiseq{\type}{p}]{committee}%
  {\actitle=title,\fullname=fullname,\type=type,\aff=aff}{%
      \rule{.7\textwidth}{0.2mm} \\
      \actitle \ \fullname, Ph.D. Program Director, \aff
      \vfill
  }  
  
  \end{center}
  \thispagestyle{empty}
  \cleardoublepage
  \fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[C]{\sf \thepage}
    \renewcommand{\headrulewidth}{0pt}}
    \pagestyle{fancy}
    \renewcommand{\chaptermark}[1]{\markboth{\ ##1}{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
    \ifthenelse{\boolean{@printversion}}{%
      \fancyhead{}
      \fancyhead[LE, RO]{\sf \thepage}
      \fancyhead[RE]{\sf \leftmark}
      \fancyhead[LO]{\sf \rightmark}
      }
      {%
      \fancyhead{}
      \fancyhead[RO, RE]{\sf \rightmark}
      \fancyhead[LO, LE]{\sf \thepage}
      }
    \fancyfoot{}
  \newcounter{oldpage}
  \setcounter{oldpage}{\value{page}}
  \pagenumbering{roman}
  \setcounter{page}{\value{oldpage}}
}

\renewcommand\listfigurename{Figures}
\renewcommand\listtablename{Tables}

%%% put ToC, LoF, LoT and Index entries in the ToC
%%% use of \phantomsection is required for dealing with hyperref
%%% package and depends on nohyper option


\renewcommand\tableofcontents{%
\ifthenelse{\boolean{@hypermode}}{\phantomsection}{}
\addcontentsline{toc}{chapter}{\contentsname}%
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
\cleardoublepage
    }

\renewcommand\listoffigures{%
\ifthenelse{\boolean{@hypermode}}{\phantomsection}{}
\addcontentsline{toc}{chapter}{List of \listfigurename}%
    \chapter*{\listfigurename}%
      \@mkboth{\listfigurename}%
              {\listfigurename}%
    \@starttoc{lof}%
\cleardoublepage
    }

\renewcommand\listoftables{%
\ifthenelse{\boolean{@hypermode}}{\phantomsection}{}
\addcontentsline{toc}{chapter}{List of \listtablename}%
    \chapter*{\listtablename}%
      \@mkboth{%
          \listtablename}%
         {\listtablename}%
    \@starttoc{lot}%
    }

%%% other useful packages

\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{url}
\RequirePackage{amsmath}
\RequirePackage[square]{natbib}
%%% lowercase header for bibliography and corresponding entry in the
%%% ToC. \bibsection is provided by the natbib package
\renewcommand\bibsection{
\chapter*{\bibname \@mkboth{\bibname}{\bibname}}
\ifthenelse{\boolean{@hypermode}}{\phantomsection}{}
\addcontentsline{toc}{chapter}{\bibname}
}

%%% switch on hyperref support
\ifthenelse{\boolean{@hypermode}}{%
\RequirePackage[unicode,plainpages=false,pdfpagelabels,breaklinks]{hyperref}
\RequirePackage[all]{hypcap}
}{}

%%% other formatting stuff

\renewcommand{\baselinestretch}{1.05}

\newcommand{\USI}{Universit\`a della Svizzera Italiana}
