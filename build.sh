#!/bin/bash

# test for canonical
[ -f canonical.tmp ] && mv appendix/changelog.tex appendix/changelog.txt

# test the LaTeX
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex
if [ $? != 0 ]; then
  [ -f appendix/changelog.txt ] && mv appendix/changelog.txt appendix/changelog.tex
  echo "LaTeX error, exiting"
  exit 1
fi

# two more runs
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex

# make print version
sed -e s?"^\\\newcommand{\\\versionforprint}{no}"?"\\\newcommand{\\\versionforprint}{yes}"? < SocialistHousing.tex > SocialistHousing-Print.tex

# three runs
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex

# cleanup
rm -f SocialistHousing-Print.tex
mv SocialistHousing-Print.pdf assets/
[ -f appendix/changelog.txt ] && mv appendix/changelog.txt appendix/changelog.tex

echo && echo && echo
echo "SocialistHousing.pdf ready for cryptographic signing."
exit 0
