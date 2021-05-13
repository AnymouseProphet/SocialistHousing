#!/bin/bash

# make the ISBN barcode
if [ -f assets/isbn.tex ]; then
  mv appendix/changelog.tex appendix/changelog.txt
  cd assets
  /usr/local/texlive/2021/bin/x86_64-linux/latex isbn.tex
  /usr/local/texlive/2021/bin/x86_64-linux/dvips -E -T 1.85in,1.15in isbn.dvi
  mv isbn.ps isbn.eps
  /usr/bin/ps2pdf isbn.eps isbn.pdf
  rm -f isbn.dvi
  rm -f isbn.eps
  cd ../
fi

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
mv SocialistHousing-Print.pdf assets/
[ -f appendix/changelog.txt ] && mv appendix/changelog.txt appendix/changelog.tex

echo && echo && echo
echo "SocialistHousing.pdf ready for cryptographic signing."
exit 0
