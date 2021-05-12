#!/bin/bash

# move the changelog file
[ -f canonical.tmp ]  mv appendix/changelog.tex appendix/changelog.txt

# test the LaTeX
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex

if [ $? != 0 ]; then
  [ -f appendix/changelog.txt ] && mv appendix/changelog.txt appendix/changelog.tex
  echo "LaTeX error, exiting"
  exit 1
fi

/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing.tex

# make print version
sed -e s?"digsig\.sty"?"FUBARdigsig.sty"?g < SocialistHousing.tex > SocialistHousing-Print.tex

/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex
/usr/local/texlive/2021/bin/x86_64-linux/pdflatex SocialistHousing-Print.tex

# cleanup
rm -f SocialistHousing-Print.tex
rm -f canonical.tmp
mv SocialistHousing-Print.pdf assets/
[ -f appendix/changelog.txt ] && mv appendix/changelog.txt appendix/changelog.tex

echo && echo && echo
echo "SocialistHousing.pdf ready for cryptographic signing."
exit 0
