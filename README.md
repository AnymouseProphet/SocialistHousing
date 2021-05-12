PLACEHOLDER
===========

This repo will be populated with LaTeX files when manifesto is ready to be
published.


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

This is a free LaTeX package for typesetting mathematical equations. It is
available from:
[MathTime Professional 2 Fonts](https://www.pctex.com/mtpro2.html).

The free 'Lite' version is sufficient for the use of math in the manifesto.

When the `pdflatex` compiler detects the style file for MathTime Pro 2 then it
is instructed to load both `times.sty` (a standard package) and `mtpro2.sty`.

Even though `times.sty` is a standard packages, `pdflatex` is only instructed to
load it when `mtpro2.sty` is available because otherwise, math would be typeset
using Computer Modern which does not visually match the Times font.

Follow the PCTeX instructions for installing MathTime Pro 2 Lite if you want
to compile the document typeset in Times.

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








