\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tucsreport_2013pdf}[2005/06/06 TUCS Technical Report.]

\RequirePackage{ifthen,graphicx}
\RequirePackage[usenames]{color}
\RequirePackage[usenames, dvipsnames]{xcolor}

% For the cover pages.
\newboolean{cover}
\DeclareOption{cover}{\setboolean{cover}{true}}

%%%%%%%%%%%%%%%%%
% A TUCS report is a kind of article.
%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

\LoadClass[twoside,a4paper,titlepage]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUCS reports have some fields that articles dont, namly:
%   tucsnumber: The number of the TUCS report.
%   isbn: The ISBN number of the report.	
%   lab: The TUCS laboratory that produced the report.	
%   keywords: Some keywords the describe the report.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@tucsnumber}{?}
\newcommand{\tucsnumber}[1]{\renewcommand{\@tucsnumber}{#1}}

\newcommand{\@isbn}{?}
\newcommand{\isbn}[1]{\renewcommand{\@isbn}{#1}}

\newcommand{\@lab}{}
\newcommand{\lab}[1]{%
  \renewcommand{\@lab}{%
    \begin{center}%
      \textbf{TUCS Laboratory}\\
      #1
    \end{center}%
  }%
}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{%
  \renewcommand{\@keywords}{%
    \vspace{2\baselineskip}
    \begin{raggedright}%
      \textbf{Keywords:} #1
    \end{raggedright}%
  }%
}

%%%%%%%%%%%%%%%%%%%%%%
%   issn: The ISSN number of the TR series.
%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@issn}{1239-1891}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The date in a TUCS Report is just given as: Month YEAR.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\today}{%
  \ifcase\month\or
    January\or
    February\or
    March\or
    April\or
    May\or
    June\or
    July\or
    August\or
    September\or
    October\or
    November\or
    December\fi\
  \number\year
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The authors of a TUCS Report appear on seperate lines.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\and}{$|$\ }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The thanks command is used to give an author's address.
% It behaves differently on the cover page and on the title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{showthanks}
\renewcommand{\thanks}[1]{%
  \ifthenelse{\boolean{showthanks}}{\\
    {\indent \addr@font
      \hspace{2em}%
      \begin{tabular}{@{}l@{}}%
	#1
      \end{tabular}%
    }%
  }{}%
}

% Set up the margins _after_ the paper size has been selected by whatever
% style files the user has.

\AtBeginDocument{
  \setlength{\textwidth}{140mm}
  \setlength{\textheight}{220mm}

% Place the text centered on the pages
  \setlength{\evensidemargin}{11mm}
  \setlength{\oddsidemargin}{11mm}
  \setlength{\topmargin}{-7mm}
}


%%%%%%%%%%%%%%%%%%%%%%%
% TUCS report titles look a bit different though.
%%%%%%%%%%%%%%%%%%%%%%%

% The font for the title on the front cover
\newcommand{\title@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{23}{28}
  \selectfont
  \sffamily}

% The font for the title on the inner cover
\newcommand{\titletwo@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{24.88}{28}
  \selectfont
  \sffamily}

% The font for the author{s} on the front cover
\newcommand{\author@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{16}{20}
  \selectfont
  \sffamily}

% The font for the author{s} on the inner cover
\newcommand{\authortwo@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{14}{18}%
  \selectfont
  \sffamily}

% The font for the univerities on the back cover
\newcommand{\backhead@font}{%
  \fontseries{b}%
  \fontshape{n}%
  \fontsize{10}{11}%
  \selectfont
  \sffamily}

% The font for the departments on the back cover
\newcommand{\back@font}{%
  \fontseries{m}
  \fontshape{n}%
  \fontsize{10}{11}%
  \selectfont
  \sffamily}

% The font for the report number and date on the front cover
\newcommand{\tinfo@font}{%
  \fontseries{m}
  \fontshape{n}%
  \fontsize{14}{16}%
  \selectfont
  \sffamily}

% The font for report number and date on inner cover page
\newcommand{\tinfotwo@font}{%
  \fontseries{m}
  \fontshape{n}%
  \fontsize{12}{14}%
  \selectfont
  \sffamily}

% The font for addresses of authors on inner cover page
% Used in \thanks
\newcommand{\addr@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{12}{14}%
  \selectfont
  \rmfamily}

% This is the command that actually makes the title.
\renewcommand{\maketitle}{%
  \pagestyle{empty}
  \clearpage
  \begin{figure}[t]
    \begin{picture}(100,100)(0,0)
      \put(-60,-345){\includegraphics{TUCS_etukansi.pdf}}
      \put(-35,130){\parbox[t]{15cm}{\color{white}\author@font\@author}}
      \put(-35,10){\parbox[t]{15cm}{\color{white}\hyphenpenalty=10000\title@font\@title}}
      \put(-4,-270){\centerline{\author@font{\color{Gray}TUCS Technical Report}}}
      \put(-4,-290){\centerline{\tinfo@font{\color{Gray}No \@tucsnumber, \@date}}}
    \end{picture} \\
  \end{figure}
  \cleardoublepage

  % Put authors on separate lines on the inner title page
  % and show \thanks
  \renewcommand{\and}{\\}
  \setboolean{showthanks}{true}%

    \begin{figure}[t]
      \begin{picture}(100,100)(0,0)
        \put(-40,200){\includegraphics[scale=0.50]{TUCS_logo.pdf}}
	\put(-30,190){\parbox[t]{15cm}{
	  {\color{black}\hyphenpenalty=10000\titletwo@font\@title}   \vspace{8mm} \\
	  {\color{black}\authortwo@font\@author}
	} }
	\put(-30,-260){\tinfotwo@font{\color{black}TUCS Technical Report}}
	\put(-30,-280){\tinfotwo@font{\color{black}No \@tucsnumber, \@date}}
      \end{picture}
  \end{figure}
  \clearpage

  \pagestyle{plain}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUCS abstracts (which are mandatory) appear before the `first' page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{@titlepage}}{%
  \let\@ldabstract=\abstract
  \let\@ldendabstract=\endabstract
  \renewenvironment{abstract}{%
    \@ldabstract
    \setcounter{page}{0}%
  }{
    \par
    \@keywords
    \vfill
    \begin{center}
      \@lab
    \end{center}
    \vfill
    \@ldendabstract
    \setcounter{page}{1}%
  }%
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUCS reports have a page at the end with some logos on it.	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndDocument{%
  \clearpage
  \pagestyle{empty}%
  \enlargethispage*{2cm}
  \ifthenelse{\boolean{cover}}{%
    \cleardoublepage
    \hbox{}
    \clearpage
  }{%
    \ifthenelse{\isodd{\value{page}}}{%
      \hbox{}
      \clearpage
    }{}%
  }%

 \begin{picture}(100,100)(0,0)
      \put(-80,-600){\includegraphics{TUCS_takakansi.pdf}}
      \put(-40,-130){\parbox[t]{15cm}{\color{white}\tinfo@font{Joukahaisenkatu 3-5 A, 20520 TURKU,
      Finland \ $|$\  www.tucs.fi}}}
      \end{picture}

    \begin{picture}(100,500)(0,0)
   \put(-25,-10) {
   \vbox{
      \hbox{
      	{\includegraphics[width=2.1cm]{tylogo.pdf}}
	\hspace{6mm}
     	\put(20,-20){\parbox[b]{12cm}{
		{\backhead@font University of Turku} \\
        {\it Faculty of Mathematics and Natural Sciences} \\
		  {\color{blue}$\bullet$}
		    {\back@font Department of Information Technology} \\
		  {\color{blue}$\bullet$}
		    {\back@font Department of Mathematics and Statistics} \\
		{\it Turku School of Economics} \\
		  {\color{blue}$\bullet$}
		    {\back@font Institute of Information Systems Sciences} \\
	
	     }  % end of \parbox
        }%end of \put
	} % end of \hbox
	
    \vspace{6mm}

     \hbox{
      	{\includegraphics[width=2.0cm]{aalogo.pdf}}
	\hspace{6mm}
     	\put(20,0){\parbox[b]{12cm}{
		{\backhead@font{\AA}bo Akademi University} \\
		  {\color{blue}$\bullet$}
		    {\back@font Computer Science} \\
		  {\color{blue}$\bullet$}
		    {\back@font Computer Engineering} \\
	     } % end of \parbox
        } %end of \put
	} % end of \hbox

   \vspace{16mm}

   {\noindent \parbox[b]{10cm}{
	\tinfotwo@font ISBN \@isbn \\
	ISSN  \@issn}
   }  % end of \parbox


}  % \vbox
} % put
\end{picture}


}  % end of \AtEndDocument
