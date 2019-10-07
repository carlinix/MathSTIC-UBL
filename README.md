# MathSTIC-UBL LaTeX Class
<img src="/tex/87181ad2b235919e0785dee664166921.svg?invert_in_darkmode&sanitize=true" align=middle width=45.69716744999999pt height=22.465723500000017pt/>  PhD thesis template for the _Université Bretagne Loire_ (UBL) MathSTIC Doctoral School.

[Link dowload release 1.0](https://drive.google.com/file/d/1IIVfScDHspFUg2VBp6xcxnW2f0m97jD4/view?usp=sharing)

-----
*English explanations*

This repository contains an 'unofficial' template for the thesis manuscript of the [MathSTIC doctoral school](https://ed-mathstic.u-bretagneloire.fr/en) of the [Université Bretagne Loire](https://en.u-bretagneloire.fr/).

The main goal of this template is to provide a full automatization of the $\LaTeX$-related tasks. Basically, you need only to focus on writing your thesis, is it cool, no?

The class provides the cover and back cover, according to the [MathSTIC specifications](https://web.u-bretagneloire.fr/doctorat/couverture/accordeon4.html#). It provides simple commands to fill all items in the cover (and back cover) as specified in the _[guide pour compléter les champs]_(https://web.u-bretagneloire.fr/doctorat/couverture/pdf/Couverture_infosObligatoires20160706.pdf).
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
  
  -`\abstract{}`: The abstract of your thesis in English (max 1700 words).
  
  -`\keywords{}`: from 3 to 6 keywords in English.
  
  -`\resume{}`: The abstract of your thesis in French (max 1700 words).
  
  -`\motscles{}`: From 3 to 6 keywords in French.

* About you advisors (one entry per advisor/co-advisor):

  -`\advisor[Gender]{Name}{Surname}{Function --- establishment}`: Informations about your advisor(s). 
    - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if (co-)director or (co-)directrice.
    - Name: The first name
    - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
    - Function --- establishment: 
 
* About the School:

  -`\school{}`: Your school, the possibilities are: (AGRO, CS, ECN, ENIB, ENS, ENSAI, ENSTA, IMTA, INSA, LMU, UA, UBO, UBS, UN, UR1, UR2)
  
  -`\cotutele{logo-path}{school-description}` (comment isn't in cotutele)
    - logo-path: The path for the logo's file of your cotutele university
    - shool-description: The name of your cotutle university
  
  -`\lab{}`: The lab where you've been done your work Options are found in:  [Les unités de recherche](https://theses.u-bretagneloire.fr/bs)
  
  -`\city{}`: The city where you've been done your work.

* About the **big day**, your _defense's day_:

  -`\date{}`: Your defenses date (in French)
  
  -`\president[Gender]{Name}{Surname}{Function --- establishment}`:
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if President or Presidente.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function --- establishment:
  
  -`\rapporteur[Gender]{Name}{Surname}{}`  (one entry per rapporteur):
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if Rapporteur or Rapportrice.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function --- establishment:

  -`\examinateur[Gender]{Name}{Surname}{}`  (one entry per examinateur):
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if Examinateur or Examinatrice.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function --- establishment:
        
  -`\invite[Gender]{Name}{Surname}{}`  (one entry per invite): if you don't have any guest, remove or comment this entry
  - Gender: *M* (_Monsieur_,  default by omission) or *Mme* (_Madame_) --- used to define the french word if Invité or Invitée.
  - Name: The first name
  - Surname: the surname (*do not put all in caps*, the code automatically apply small caps)
  - Function --- establishment:
    
