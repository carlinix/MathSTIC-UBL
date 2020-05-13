# MathSTIC-UBL LaTeX Class
$\LaTeX$  PhD thesis template for the _Université Bretagne Loire_ (UBL) MathSTIC Doctoral School.

Last version: 2.0.1
 [Link dowload release 2.0.1](https://drive.google.com/drive/folders/1JJLK4g8ZMs1k6xDMJImjpZC9Sg0LLbO5?usp=sharing)

-----
*English explanations*

This repository contains an 'unofficial' template for the thesis manuscript of the [MathSTIC doctoral school](https://ed-mathstic.u-bretagneloire.fr/en) of the [Université Bretagne Loire](https://en.u-bretagneloire.fr/).

The main goal of this template is to provide a full automatization of the $\LaTeX$-related tasks. Basically, you need only to focus on writing your thesis, is it cool, no?

The class provides the cover and back cover, according to the [MathSTIC specifications](https://web.u-bretagneloire.fr/doctorat/couverture/accordeon4.html). It provides simple commands to fill all items in the cover (and back cover) as specified in the [_guide pour compléter les champs_](https://doctorat.u-bretagneloire.fr/couverture/pdf/Couverture_infosObligatoires20160706.pdf).
Also, the policy of fonts, paragraphs, page numbering and margins, too, the style of elements positioning (summary, list of items, appendix, bibliography) defined in [FORM@DOCT](https://guides-formadoct.u-bretagneloire.fr/these_normes_formats).


## Multilanguage support
The class is multilanguage. When you specify the option `{french,english}` the class expects an English thesis, and actives the _Résumé Étendú_ chapter. Otherwise, if the option is `{english,french}` the class expects a French thesis, so it  disables the _Résumé Étendú_ chapter, and automatically translates the package `algorithmc` to French.


## Fill the front and back cover
To fill the front and back cover is really easy. Considering the as base the file `main.tex` provided in the template, you need only to fill the commands:
* About you:

  -`\author{Name}{surname}`

* About your work:

  -`\title{English Title}`: English title of you thesis,

  -`\subtitle{English subtitle}`: English subtitle of you thesis, comment if you *dont* have one

  -`\titre{French Title}`: French title of your thesis    

  -`\suostitre{French subtitle}`: French subtitle of you thesis, comment if you dont have one

  -`\subject{}`: The subject (domain) of your work: Options are found in [Spécialités](https://theses.u-bretagneloire.fr/bs).

  -`\tnumber{number}`: The thesis number
  
  -`\abstract{}`: The abstract of your thesis in English (max 1700 characters).
  
  -`\keywords{}`: from 3 to 6 keywords in English.
  
  -`\resume{}`: The abstract of your thesis in French (max 1700 characters).
  
  -`\motscles{}`: From 3 to 6 keywords in French.

* About you advisors (one entry per advisor/co-advisor):

  -`\advisor[Gender]{Name}{Surname}{Function, establishment}`: Informations about your advisor(s). 
    - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if (co-)director or (co-)directrice.
    - Name: The first name
    - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
    - Function, establishment: 
 
* About the School:

  -`\school{}`: Your school, the possibilities are: (AGRO, CS, ECN, ENIB, ENS, ENSAI, ENSTA, IMTA, INSA, LMU, UA, UBO, UBS, UN, UR1, UR2)
  
  -`\cotutele{logo-path}{school-description}` (comment isn't in cotutele)
    - logo-path: The path for the logo's file of your cotutele university
    - shool-description: The name of your cotutle university
  
  -`\lab{}`: The lab where you've been done your work Options are found in:  [Les unités de recherche](https://theses.u-bretagneloire.fr/bs)
  
  -`\city{}`: The city where you've been done your work.

* About the **big day**, your _defense's day_:

  -`\date{}`: Your defenses date (in French)
  
  -`\president[Gender]{Name}{Surname}{Function, establishment}`:
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if President or Presidente.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function, establishment:
  
  -`\rapporteur[Gender]{Name}{Surname}{Function, establishment}`  (one entry per rapporteur):
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if Rapporteur or Rapportrice.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function, establishment:

  -`\examinateur[Gender]{Name}{Surname}{Function, establishment}`  (one entry per examinateur):
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if Examinateur or Examinatrice.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function, establishment:
        
  -`\invite[Gender]{Name}{Surname}{Function, establishment}`  (one entry per invite): if you don't have any guest, remove or comment this entry
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if Invité or Invitée.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function, establishment:
    
  # Extra commands:
   -`\summary` : Make the summary (one level TOC, used at the beginning of the document).
  
   -`\makequotation{Phrase}{Author}{Where}`: The quotation at the beginning of the document.
  
   -`\dedicatory{To someone}`: The dedicatory at the beginning of the document. 
   
   -`\addpart{Title}`: To add an unnumbered part to the TOC.
   
   -`\addchap{Title}`: To add an unnumbered chaper to the TOC.
   
   -`\addsec{Title}`: To add an unnumbered section to the TOC.
   
   -`\addsubsec{Title}`: To add an unnumbered subsection to the TOC.
   
   -`\addsubsubsec{Title}`: To add an unnumbered subsubsection to the TOC.
   
   -`\epigraph{Quote}{Author}`: To make an epigraph, good at the begining of chapters

   -`\magicbox{Title of my box}{content}`: Create a box with title
   
   -`\simplebox{Title of my box}{content}`: Create a box without title
   
   -`\ublmstic`: writes $\mathrm{MathSTIC}-\raisebox{.15ex}{U}\raisebox{-.15ex}{B}\raisebox{.15ex}{L}$

   -`\apud[see][pgnumber]{author}[opttext][pagenumber]{author}`: Produces a indirect citation.
   
## Class options:
To change the document layout, remember. By defined in [FORM@DOCT](https://guides-formadoct.u-bretagneloire.fr/these_normes_formats), the options a4paper, 12pt, onehalfspacing, indentfirst and parkskip are mandatory.

- To change the document layout:
- _`papersize`_:  a4paper, letter, etc.;
- _`fontsize`_: 12pt, 10pt, 11pt;  
- _`linespacing`_: onehalfspacing, singlespacing, doublespacing
- `nolistspacing`: If the document is onehalfspacing or doublespacing, uncomment this to set spacing in lists (TOC, LO?) to single
- `indentfirst`:  To indent the first paragraph of each chapter/section/etc. 
- `parskip`: To add space between paragraphs
- `headsepline`: To get a line under the header
- `chapterinoneline`: To place the chapter title next to the number on one line
- `consistentlayout`: To change the layout of the declaration, abstract and acknowledgements pages to match the default layout
- `liststotoc`:	To add the list of figures/tables/etc to the table of contents
- `toctotoc`: To add the main table of contents to the table of contents
- `nocleverefsupport`: to not load the  [cleveref](http://tug.ctan.org/tex-archive/macros/latex/contrib/cleveref/cleveref.pdf) package. (\Cref and \cref)
- `nohyperrefsupport`: to not load the [hyperref](http://ctan.mines-albi.fr/macros/latex/contrib/hyperref/doc/manual.pdf) package.
- `noacro`: to not load the [acro](http://distrib-coffee.ipsl.jussieu.fr/pub/mirrors/ctan/macros/latex/contrib/acro/acro_en.pdf) package.
- `draft`: to enable the draft mode (no pictures, no links, overfull hboxes indicated)

The language setup is defined by one of the following options:

- `{french,english}`: Use if you are **writting your thesis in English**
- `{english,french}`: Use if you are **writting your thesis in French** 

