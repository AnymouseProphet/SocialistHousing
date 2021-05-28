PLACEHOLDER
===========

This repo is slowly being populated with LaTeX files as the manifesto is getting
ready to be published. A new branch for the Canonical version will be created
when all is ready.


Forking the Manifesto
---------------------

The manifesto is released under the terms of the CC BY-NC 4.0 license (see the
`LICENSE.txt` file) which---if the terms of the license are met---allows you to
modify this manifesto (what I call a fork) and distribute your modified version.

Why anyone would want to? I do not *expect* anyone to, but you can.

Maybe you want to add details about plumbing best practices to the __House
Retrofitting__ section. Maybe you want to clarify some of my points that are a
bit confusing. Maybe Sean Hannity paid you a bunch of money to annotate the
manifesto with counter points showing how stupid I am.

Whatever your reason, as long as the terms of the license are followed, it is
allowed. For those who are able to work with LaTeX---having the LaTeX source
available makes it a lot easier than copypasta from the PDF.

### Translations

Me encantaría ver este manifiesto traducido al español.

De hecho, si lo hace, avíseme y, si la traducción es buena, es posible que desee
agregarle mi firma digital.

### The Changelog

Within `SocialistHousing.tex` a macro called `\canonical` is defined. It expands
to a URL to the canonical version of this manifesto. Leave that alone.

Within `appendix/changelog.tex` is a place for you to add a description of what
changes you made, so that it is clear to the reader that those changes are yours
and not mine, in compliance with the CC BY-NC 4.0 license.

By using that `appendix/changelog.tex` file to describe your changes and by
keeping the reference to the canonical version intact, compliance with the
CC BY-NC 4.0 license is much easier.

There may be some changes you make that are not easily described in the
`appendix/changelog.tex` file, but that is your problem.

### Digital Cryptography Signature

Exclusion or alteration of the `appendix/signature.tex` file __DOES NOT__
require any notices within the `appendix/changelog.tex` file.

### Social Media and Bitcoin References

Feel free to alter (or omit) the `appendix/social.tex` files---you do not need
to plug my social media accounts or my Bitcoin address. However, do remember to
note that you did so in the `appendix/changelog.tex` file.

### Title Page and Dedication

The title page and dedication are defined within the `SocialistHousing.tex`
file, they are not defined in separate input files.

__Make sure to add yourself as an author__ and note any changes you make in the
`appendix/changelog.tex` file.


Github Directory Structure
--------------------------

The top directory of this git has the main `SocialistHousing.tex` file, the
`LICENSE.txt` file, and various [markdown](https://daringfireball.net/projects/markdown/)
text files (including this README).

The `SocialistHousing.tex` file is the only file in the top level directory that
is used to compile the manifesto.

The `appendix` directory has the LaTeX source files for the appendix section of
the manifesto.

The `inputfiles` directory has the LaTeX source files for the non-appendix
sections of the manifesto.

The `assets` directory has the public cryptography key that the author uses to
digitally sign PDF files, and some branches may have a PDF copy of the canonical
version of the manifesto that is signed, and an unsigned copy of the PDF that
only differs from the canonical version in that it lacks the __Digital
Cryptography Signature__ appendix section. That copy is intended for printed
versions where a digital cryptography signature is meaningless.

Nothing in the `assets` directory is used to compile the manifesto. After you
fork this git, you probably should delete everything in the `assets` directory
as it will not pertain to your fork.


TeXLive 2021
------------

The Canonical version of this manifesto was compiled using
[TeXLive 2021](https://www.tug.org/texlive/)
installed from their [Network Installer](https://www.tug.org/texlive/acquire-netinstall.html).

Many (most?) GNU/Linux distributions come with a packaged version of TeXLive
already. I still prefer to install it myself in `/usr/local/texlive` but the
packages that come with your distribution are probably sufficient.

The manifesto *should* also compile in MacTeX, PCTeX, MiKTeX, et cetera.

Originally I was working on the manifesto in TeXLive 2016. I tend not to upgrade
to newer versions of TeXLive until I need something new or the version I am
using is starting to get very old.

I upgraded to TeXLive 2021 because TeXLive 2016 was starting to get very old.
The code I used in the manifesto really is not very version picky.


Preample Options
----------------

Obviously you can make whatever changes in the preamble of your fork that floats
your boat, but there are two pre-defined options.

### Typeset Canonical Version

Change the macro

    \newcommand{\canonicalversion}{no}

to

    \newcommand{\canonicalversion}{yes}

if you intend on including an ISBN number and optionally adding a cryptography
digital signature to your fork. Digital signatures are discussed within the
__Optional LaTeX Packages__ section of this document.

### Main Body Font

Some LaTeX users really like Donald Knuth's "Computer Modern" font.

Computer Modern itself ends up as a bitmap font when used in a PDF and is thus
not suitable for PDF but an updated vector postscript version called "Latin
Modern" is suitable for PDF documents.

If you would prefer to use "Latin Modern" over "Times" (or a Times clone) then
change

    \newcommand{\uselatinmodern}{no}

to

    \newcommand{\uselatinmodern}{yes}

and the "Latin Modern" fonts will be used for the main body of the text. Note
that this does *significantly* change the pagination, resulting in more pages of
text as Latin Modern is not quite as compact as Times or Times Clones.

### Library of Congress

If you have a LCCN for your fork, then change

    \newcommand{\libraryofcongress}{no}

to

    \newcommand{\libraryofcongress}{yes}

and also change

    \newcommand{\lccn}{987654321}

to define *your* LCCN number. This will typeset the LCCN on the dedication page.

### ISBN Number

If you have an ISBN number for your fork, then change

    \usepackage[ISBN=978-1-56619-909-4,SC0]{ean13isbn}

to reflect *your* ISBN number. The proper barcode for your ISBN number will be
generated by the `pdflatex` engine at compile time, but only when compiling the
canonical version.


Optional LaTeX Packages
-----------------------

The manifesto source should compile in virtually any modern LaTeX distribution
however their are some __non-standard__ packages that were used to compile the
canonical version of the original manifesto.

All of these are optional, the manifesto compiles without them.

### MathTime Pro 2 Lite

This only matter when you are not using the "Computer Modern" fonts.

This is a free LaTeX package for typesetting mathematical equations that match
the Times font. It is available from:
[MathTime Professional 2 Fonts](https://www.pctex.com/mtpro2.html).

The free 'Lite' version is sufficient for the use of math in the manifesto.

When the `pdflatex` compiler detects the style file for MathTime Pro 2 then it
is instructed to load both `times.sty` (a standard package) and `mtpro2.sty`.

When the `mtpro2.sty` file is not detected then the TeXGrye (Adobe 'Base35'
clones but extended) fonts are loaded via the `newtxtext.sty` and `newtxtmath`
(both standard, part of the
[newtx](https://ctan.org/pkg/newtx?lang=en) package) packages.

The TeXGyre fonts are *very* similar to the fonts you would get with both
`times.sty` and `mtpro2.sty` but there may some *minor* pagination differences
due to *slightly* different font metrics.

For installing MathTime Pro 2 Lite follow the PCTeX install instructions if you
want to compile the document typeset in Times. Otherwise, the TeXGrye family of
extended clones will be used.

If you like the TeXGyre family of clones (many do) then either do not install
MathTime Pro 2 Lite or if it is already installed, in the preamble change

    \IfFileExists{mtpro2.sty}{%

to

    \IfFileExists{FOOmtpro2.sty}{%

Then the TeXGrye family of fonts will be used instead of the Adobe or URW 'Base
35' family of fonts.

#### For the plethora of n00bs who say `times.sty` should never be used:

With high frequency on places like reddit, I see bad advice given to never use
`times.sty` with claims that it is deprecated and that the *proper* way to get
the Times font in LaTeX is to use `mathptmx.sty`.

Look at the `times.sty` file, all it does is redefine `\sfdefault`,
`\rmdefault`, and `\ttdefault`. That is literally __all that it does__. There is
absolutely nothing about that to become "obsolete", the method it uses is the
correct way to redefine those defaults.

Social media is full of bad advice. The only issue with `times.sty` is that it
does *not* redefine fonts to use for math, so the default Computer Modern math
fonts ends up being used if you use `times.sty` and have math in your LaTeX
*without* defining a Times compatible math font. That does look ugly, especially
if you have any inline math.

That issue is readily solved by using `mtpro2.sty` to define the math font after
you load `times.sty` in your preamble. MathTime Pro 2 is superior to the math
fonts defined by either `mathptmx.sty` or `newtxmath.sty`.

Yes, the math in this document is light enough I could have used `mathptmx.sty`
to get the Times font with matching math glyphs. But with many documents that
use math, using `mtpro2.sty` in combination with the `times.sty` package really
is noticeably better.

MathTime Pro 2 can beautifully typeset everything math those alternatives can
typeset but the reverse is not the case and I never know when I'll use something
MathTime Pro 2 is better at so it is logical to just always use the standard
`times.sty` package with the `mtpro2.sty` package for math with the Times font
*regardless* of what math is in the document.

If you want to use the Times font and Math, use MathTime Pro2 for the math font.
__It is the visually best way to do it__ as evidenced by the fact that many
academic journals use MathTime Pro 2.

If you are making a profit or can afford it, buy the paid version and support
PCTeX who maintains it. If you are poor, there is no shame in just using the
free Lite version until you need the additional features of the paid version.

MathTime Pro 2 really is typographically better for Math with Times than the
current CTAN hosted solutions that come bundled in TeXLive et alia. It just is.

### Space Mono Font

I am not fond of the Courier font that is used as the monospace default when
`times.sty` is loaded. I also do not like the t1xtt font that is used as the
monospace default when `newtxtext.sty` is loaded. So I use Space Mono instead,
a monospace font I do like.

Space Mono is not *yet* available from CTAN. I have installation instructions
for that font here:

[Space Mono LaTeX Files](https://github.com/AnymouseProphet/SpaceMono-LaTeX)

When the `pdflatex` compiler detects `spacemono.sty` then it will use Space Mono
as the monospace font. If it is not detected, it will use whatever monospace
font is currently set by the main font package.

### Digital Signature Support

This is only needed if you want to add a cryptographic digital signature to your
fork of the manifesto and that only happens when the `canonicalversion` macro is
defined as `yes`.

If the `pdflatex` compiler finds `digsig.sty` then it will load that file and
include the `appendix/signature.tex` file which contains the form field allowing
you to add a cryptographic digital signature.

To the best of my knowledge, at this time `pdflatex` and LaTeX in general are
not able to add the signature themselves but you can open the compiled document
in [Acrobat Reader DC](https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html)
to add your digital signature. Scroll to the end of the document and click the
thing that looks like a pencil where the __Visual Indication of Signature:__
heading is.

If you do not already have a cryptography key pair you use for signing PDF
documents, how to generate one is in the file `keypair.md`.

Remember to update the `appendix/signature.tex` file to tell the user how they
can obtain YOUR public key.

If you do not want to bother with digital signatures, do not worry about having
this file but if you do want to sign your fork, get the `digsig.sty` file from:

http://home.htp-tel.de/lottermose2/tex/dist/digsig.sty

Place it at `[TEXMF-LOCAl]/tex/latex/digsig/digsig.sty` and then run the
`mktexlsr` command so that `pdflatex` will know about it.


Compiling the Manifesto
-----------------------

This manifesto is intended to be compiled using the `pdflatex` engine. The
LaTeX source *may* need modification to compile with a different LaTeX engine.

The following should do it:

    pdflatex SocialistHousing.tex && pdflatex SocialistHousing.tex && pdflatex SocialistHousing.tex

The reason multiple runs are needed are so that helper files that are
automatically generated (or updated) will be current for the final run.

In reality running the command twice in succession should be sufficient but
thrice does not hurt.

The compiled result will be named `SocialistHousing.pdf`.


Base 35 Postscript Font Notes
-----------------------------

This section only applies if you are __not__ using Latin Modern and you __do__
have the `mtpro2.sty` package. Without those conditions then your compiled
version will obviously have different fonts than what my canonical version has.

If you compile the LaTeX source yourself you may notice different font names are
used in your resulting PDF file than what is used in the my canonical version.
There is a reason for this.

The Postscript Level 2 specification specifies 35 fonts that are often known as
the 'Base 35' fonts.

https://en.wikipedia.org/wiki/PostScript_fonts#Core_Font_Set

Back in the days before storage and bandwidth were cheap, it was safe to save
space in a document and not embed these fonts as long as the output device (e.g.
printer) was a Postscript Level 2 compliant renderer.

Note that Postscript Level 3 fonts is a mess that few adopted even though
Postscript 3 was popular. They forgot KISS. Too many fonts and licensing issues,
people who wanted to avoid embedding just stuck with the Level 2 fonts in their
postscript 3 documents.

Also note that PDF is not Postscript but all of the PDF 'Standard 14' fonts are
part of the 'Base 35' Postscript Level 2 fonts and in the world of LaTeX we just
use the 'Base 35' Postscript Level 2 fonts as our standard set because a LaTeX
document can produce either Postscript or PDF (or DVI for old-school LaTeX in
the days before Postscript).

Now that file size and network bandwidth are no longer an issue it is standard
to embed all fonts so that documents render properly *even if the output device
is not a Postscript Level 2 compliant renderer*. Embedding the fonts really is
better because otherwise some renderers will use substitutes that look just
awful (e.g. substituting Arial for Helvetica).

Embedding fonts can have font licensing issues. No font licensing issues for
fonts exist in this manifesto.

The canonical version of this manifesto has font subsets embedded from the
following *genuine* Adobe 'Base 35' Type 1 fonts:

* Helvetica-Bold
* Helvetica-Narrow
* Helvetica-Narrow-Oblique
* Helvetica-Narrow-Bold
* Times-Roman
* Times-Italic
* Times-Bold
* Times-BoldItalic
* ZapfChancery-MediumItalic

This is because I happen to have the *actual* Adobe Type 1 fonts available for
LaTeX to embed. During the late 90s I purchased the fonts as part of a bundle
sold to students and it allows embedding the fonts in distributed documents.

If you are not using Space Mono but Times is your main font, then the Adobe
font Courier from the Base 35 collection would also be used.

Unless you both have the *actual* Adobe Type 1 fonts *and* have set up LaTeX to
use them, then your fork will use the free URW equivalents that ship with
TeXLive or whatever LaTeX distribution you use.

The URW equivalents are fully metric compatible and for the vast majority of us,
they are visually indistinguishable from the Adobe versions. They are quality
substitutes.

The URW equivalents were designed when there was a clear need to implement
Postscript Level 2 for those who did not have a license to the actual Adobe
fonts. URW did an outstanding job with them and they are now common on 'NIX
systems as part of
[ghostscript](https://www.ghostscript.com/)
and the URW fonts are also now distributed with most LaTeX distributions with
the LaTeX postscript and PDF engines using them by default when 'Base35' fonts
are requested. You have to specifically configure LaTeX to use the *genuine*
'Base 35' fonts if you have them.

### Adobe Helvetica Note

When you use Acrobat Reader DC to add a cryptographic signature, the software
uses Helvetica but does not embed it.

Thus far I have not been able to figure out how to get the font embedded into
the PDF before signing---which means that the visual indication of the signature
may display (or print) using Arial or some other awful Helvetica substitute on
some systems.

Apparently fonts used in form areas (which the digital signature is) have to be
embedded *differently* than fonts used for regular content and I have yet to
figure out how to get LaTeX to do that.

From what I have read, PDF wants the *entire* font embedded rather than just a
subset but it also wants it embedded using a particular structure within the PDF
file. Otherwise it will not be used in the form content.

I suspect it requires some LaTeX macros that have not yet been written. Well, to
do it in LaTeX anyway.

Hevetica is part of the 'Standard 14' PDF fonts so every PDF renderer will have
an adequate metric-compatible substitute, but it just might be an ugly
substitute.

It would be nice if Acrobat Reader DC would embed the font it uses for visual
indication when signing the document. But it doesn't. Maybe one of their
profession PDF tools that costs money does.

It would be nice if TeXLive came with software for adding the digital signature
to the signature form field. But it doesn't. Maybe a typography programming
student will take it on as a project. Then the visual indication of the
signature could have a TeX Lion watermark instead of an Acrobat watermark. Or
even better, the watermark could be configurable so we could make it a Red Rose.
Well, as a watermark, likely a light pink rose...


