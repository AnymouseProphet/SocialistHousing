#!/bin/bash

# test the LaTeX
pdflatex SocialistHousing.tex
if [ $? != 0 ]; then
  echo "LaTeX error, exiting"
  exit 1
fi

# two more runs
pdflatex SocialistHousing.tex && pdflatex SocialistHousing.tex

# make non-canonical print version
#sed -e s?"^\\\newcommand{\\\canonicalversion}{yes}"?"\\\newcommand{\\\canonicalversion}{no}"? < SocialistHousing.tex > SocialistHousing-Print.tex

cat SocialistHousing.tex \
|sed -e s?"\[canonical\]"?"[]"? \
|sed -e s?"\[canonical,"?"["? \
|sed -e s?",canonical\]"?"]"? \
|sed -e s?",canonical,"?","? \
> SocialistHousing-Print.tex

# three runs
pdflatex SocialistHousing-Print.tex && pdflatex SocialistHousing-Print.tex && pdflatex SocialistHousing-Print.tex

# cleanup
rm -f SocialistHousing-Print.tex
mv SocialistHousing-Print.pdf assets/

echo && echo && echo
echo "SocialistHousing.pdf ready for cryptographic signing."
exit 0
