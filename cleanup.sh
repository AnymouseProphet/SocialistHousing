#!/bin/bash

rm -f *.aux *.log *.out *.toc *.pdf
rm -f assets/SocialistHousing-Print.pdf

find . -print |grep "\.bak$" |while read file; do
  rm -f ${file}
done
