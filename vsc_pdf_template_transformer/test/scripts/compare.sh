#!/usr/bin/env bash

set -evx

baseName="$1"
echo "Comparing $baseName"

cd test
goldenPdf="goldens/${baseName}.pdf"
testPdf="outputs/${baseName}.pdf"

pdftocairo "${testPdf}" -png -r 150 "outputs/result-${baseName}"
pdftocairo "${goldenPdf}" -png -r 150 "outputs/golden-${baseName}"

error=0
for goldenPng in outputs/golden-"${baseName}"-*.png
do
  suffix=${goldenPng##*-}
  testPng="outputs/result-${baseName}-${suffix}"
  compare -metric AE "${goldenPng}" "${testPng}" null: 2>&1 && result=$? || result=$?
  [[ $result != "0" ]] && {
      diffPng="failures/diff-${baseName}-${suffix}"
      compare -highlight-color red "${goldenPng}" "${testPng}" "${diffPng}"
      echo "Difference between ${goldenPng} and ${testPng} => ${diffPng}"
      error=1
  }
done

exit ${error}
