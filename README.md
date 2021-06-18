PLACEHOLDER
===========

This repo is slowly being populated with LaTeX files as the manifesto is getting
ready to be published. A new branch for the Canonical version will be created
when all is ready.


Forking the Manifesto
---------------------

The manifesto is released under the terms of the CC BY-NC 4.0 license (see the
`LICENSE.txt` file) which---if the terms of the license are met---allows you to
modify this manifesto (what I call forking) and distribute your modified
version.

Why anyone would want to create a modified version? I do not *expect* anyone to,
but you can.

Maybe you want to add details about plumbing best practices to the __House
Retrofitting__ section. Maybe you want to clarify some of my points that are a
bit confusing. Maybe Sean Hannity paid you a bunch of money to annotate the
manifesto with counter points showing how stupid I am.

Whatever your reason, as long as the terms of the license are followed, it is
allowed. For those who are able to work with LaTeX---having the LaTeX source
available makes it a lot easier than
[copypasta](https://en.wikipedia.org/wiki/Copypasta) from the PDF.

### LaTeX Environment

This manifesto will compile in TeXLive 2021 with the addition of the
`anymouse.sty` file from the
[anymouse LaTeX](https://github.com/AnymouseProphet/anymouse) git project. It
should also compile in MacTeX, PCTeX, MiKTeX, et cetera of course also requiring
that style file.

I do recommend a LaTeX version modern enough to have the TeX Gyre fonts but you
can also use the URW (or Adobe) "Base 35" font collection instead of the TeX
Gyre font collection---assuming you have
[MathTime Pro 2](https://www.pctex.com/mtpro2.html) installed. The free "Lite"
version is sufficient and note that MathTime Pro 2 is *only* needed to use the
URW (or Adobe) "Base 35" font collection. You do not need MathTime Pro 2 to use
the TeX Gyre font collection which is the default.

If you want the same monospace font I use, you will also need to install
[SpaceMono LaTeX](https://github.com/AnymouseProphet/SpaceMono-LaTeX) but that
is optional, the manifesto builds just fine without it. I only use Space Mono
because I like the aesthetics of it. My sense of aesthetics differs from many.

### Canonical Definition

Many people associate the word "Canonical" with "Authoritative". I do not. To me
"Canonical" indicates a version of a document or collection that is vouched for
by the maintainer of the canon. In the case of a manifesto with a license that
specifically allows for modification, that maintainer would be whoever maintains
the fork and "Canonical" would be a version that maintainer specifically vouches
for with a cryptographic signature that allows the reader to verify that the
maintainer vouches for the authenticity of that version.

If you fork this manifesto, you may vouch for the authenticity of your fork so
if you cryptographically sign your fork, that signed version is "Canonical" as
long as you complied with the license terms for forking the document. I do not
have to agree with your changes for your version to be "Canonical" as the
license requires you to specify your changes in the document.

When compiling a "Canonical" version, the `digsig.sty` LaTeX file is required to
add the necessary PDF form field that you will then use to add the cryptographic
signature.

Instructions for generating a private/public key pair can be found at
https://github.com/AnymouseProphet/anymouse/blob/main/keypair.md

By default, the LaTeX preamble in `SocialistHousing.tex` will not compile a PDF
file that is intended to be signed. If you do want to sign it, change

    \usepackage[]{anymouse}

to

    \usepackage[canonical]{anymouse}

and the resulting PDF file will have the form field for a digital signature,
assuming you have the `digsig.sty` package file available to the LaTeX compiler.

For other options to the `anymouse.sty` package, see
https://github.com/AnymouseProphet/anymouse/blob/main/README.md

If you do make a "Canonical" version you sign, note that you need to update the
`signature.tex` file to include *your* public key.

#### ISBN and LCCN

If you want an ISBN number, it *must* be different than the ISBN number that I
use. If you want a Library of Congress Catalog Number, first you need an ISBN
number.

When you have an ISBN number, change the `SocialistHousing.tex` preamble line

    \newcommand{\isbn}{978-1-56619-909-4}

to reflect your ISBN number.

After making that change, when you compile the "Canonical" version of your fork,
the ISBN bar code will be added to the title page.

If you get a LCCN number, change

    \newcommand{\lccn}{987654321}

to reflect __YOUR__ LCCN number. Once changed, it will be added to the
dedication page whenever you compile your fork, canonical or not.

Remember that even minor changes to a document require a brand new ISBN number.
That is why the ISBN is only added when a Canonical version is built. Minor
changes do not require a new LCCN but for substantial changes, you probably
should get a new LCCN.

My philosophy is that every Canonical version has its own ISBN number with its
own LCCN number. Non-Canonical versions do not have an ISBN number but will have
the LCCN number associated with the Canonical version it references as the
Canonical version.


### Translations

Me encantaría ver este manifiesto traducido al español.

De hecho, si lo hace, avíseme y, si la traducción es buena, es posible que desee
agregarle mi firma digital.

### The Changelog

Within `SocialistHousing.tex` a macro called `\original` is defined. It expands
to a URL to *my* canonical version of this manifesto. Leave that alone.

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

Nothing in the `assets` directory is used to compile the manifesto. After you
fork this git, you probably should delete everything in the `assets` directory
as it will not pertain to your fork.


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

There is a shell script called `build.sh` that will build the files for you,
including a non-canonical version suitable for printing.


Adobe Helvetica Note
--------------------

With PDF desktop publishing, it is considered bad form to produce a document
that does not have all of the fonts embedded.

When you use Acrobat Reader DC to add a cryptographic signature, the Acrobat
Reader DC software uses the Helvetica font but does not embed it.

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

I suspect it requires some LaTeX engine code that has not yet been written.
Well, to do it in LaTeX anyway.

Hevetica is part of the 'Standard 14' PDF fonts so every PDF renderer will have
an adequate metric-compatible substitute, but it just might be an ugly
substitute. If I could choose the font, I would actually use either TeX Gyre
HerosCondensed-Regular or Adobe Helvetica-Narrow.

It would be nice if Acrobat Reader DC would embed the font it uses for visual
indication when signing the document. But it doesn't. Maybe one of their
profession PDF tools that costs money does.

It would be nice if TeXLive came with software for adding the digital signature
to the signature form field. But it doesn't. Maybe a typography programming
student will take it on as a project. Then the visual indication of the
signature could have a TeX Lion watermark instead of an Acrobat watermark. Or
even better, the watermark could be configurable so we could make it a Red Rose.
Well, as a watermark, likely a light pink rose...


