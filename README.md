PLACEHOLDER
===========

This repo will be populated with LaTeX files when manifesto is ready to be
published.


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

With `appendix/changelog.tex` is a place for you to add a description of what
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
to plug my social media accounts or my bitcoin address. However, do remember to
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

Tha Canonical version of this manifesto was compiled using
[TeXLive 2021](https://www.tug.org/texlive/)
installed from their [Network Installer](https://www.tug.org/texlive/acquire-netinstall.html).

Many (most?) GNU/Linux distributions come with a packaged version of TeXLive
already. I still prefer to install it myself in `/usr/local/texlive` but the
packages that come with your distribution are probably sufficient.

The manifesto should also compile in MacTeX, PCTeX, MiKTeX, et cetera.


Optional LaTeX Packages
-----------------------

The manifesto source should compile in virtually any modern LaTeX distribution
however their are some __non-standard__ packages that were used to compile the
canonical version.

All of these are optional, the manifesto compiles without them.

### MathTime Pro 2 Lite

This is a free LaTeX package for typesetting mathematical equations that match
the Times font. It is available from:
[MathTime Professional 2 Fonts](https://www.pctex.com/mtpro2.html).

The free 'Lite' version is sufficient for the use of math in the manifesto.

When the `pdflatex` compiler detects the style file for MathTime Pro 2 then it
is instructed to load both `times.sty` (a standard package) and `mtpro2.sty`.

Even though `times.sty` is a standard packages, `pdflatex` is only instructed to
load it when `mtpro2.sty` is available because otherwise, the body text would be
typeset in Times but math would be typeset using Computer Modern which does not
visually match the Times font very well.

Follow the PCTeX instructions for installing MathTime Pro 2 Lite if you want
to compile the document typeset in Times.

If you like Computer Modern then do not install MathTime Pro 2 Lite and Computer
Modern will be used for both the body font and the math font.

### Space Mono Font

I am not fond of the Courier font that is used by default when `times.sty` is
loaded so I use Space Mono instead.

Space Mono is a monospace font I do like but it is not *yet* available from
CTAN. I have installation instructions for that font here:

[Space Mono LaTeX Files](https://github.com/AnymouseProphet/SpaceMono-LaTeX)

When the `pdflatex` compiler detects `spacemono.sty` then it will use Space Mono
as the monospace font. If it is not detected, it will use whatever monospace
font is currently set (Courier if `times.sty` was loaded, otherwise the default
Computer Modern monospace font).

### Digital Signature Support

This is only needed if you want to add a cryptographic digital signature to your
fork of the manifesto.

If the `pdflatex` compiler finds `digsig.sty` then it will load that file and
include the `appendix/signature.tex` file which contains the form field allowing
you to add a cryptographic digital signature.

To the best of my knowledge, at this time `pdflatex` and LaTeX in general are
not able to add the signature themselves but you can open the compiled document
in [Acrobat Reader DC](https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html)
to add your digital signature. Scroll to the end of the document and ckick the
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

The canonical version has the following Adobe Type 1 fonts embedded:

* Helvetica-Bold
* Times-Roman
* Times-Italic
* Times-Bold
* Times-BoldItalic

This is because I happen to have the *actual* Adobe Type 1 fonts available for
LaTeX to embed.

Unless you both have the *actual* Adobe Type 1 fonts *and* have set up LaTeX to
use them, then (assuming you have `mtpro2.sty` so `times.sty` loads) your fork
will use the free URW equivalents that ship with TeXLive.

The URW equivalents are fully metric compatible and for the vast majority of us,
they are visually indistinguishable from the Adobe versions.

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
subset but also wants it embeddded using a particular structure within the PDF
file. Otherwise it will not be used in the form content.

I suspect it requires some LaTeX macros that have not yet been written. Well, to
do it in LaTeX anyway.

It would be nice if Acrobat Reader DC would embed the font it uses for visual
indication when signing the document. But it doesn't. Maybe one of their
profession PDF tools that costs money does.

It would be nice if TeXLive came with software for adding the digital signature
to the signature form field. But it doesn't. Maybe a typography programming
student will take it on as a project. Then the visual indication of the
signature could have a TeX Lion watermark instead of an Acrobat watermark. Or
even better, the watermark could be configurable so we could make it a Red Rose.


