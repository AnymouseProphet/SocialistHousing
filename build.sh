#!/bin/bash

# test the LaTeX
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex
if [ $? != 0 ]; then
  echo "LaTeX error, exiting"
  exit 1
fi

# two more runs
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex

# make non-canonical print version
sed -e s?"^\\\newcommand{\\\canonicalversion}{yes}"?"\\\newcommand{\\\canonicalversion}{no}"? < SocialistHousing.tex > SocialistHousing-Print.tex

# three runs
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex

# cleanup
rm -f SocialistHousing-Print.tex canonical.tmp
mv SocialistHousing-Print.pdf assets/

echo && echo && echo
echo "SocialistHousing.pdf ready for cryptographic signing."
exit 0
