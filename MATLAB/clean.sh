#!/bin/bash

echo "Cleaning..."
rm --force --verbose graph.{mat,txt} output.{csv,png} random.{mat,txt} TopN_Outlier_Pruning_Block.{mat,txt} vars.dat

echo "Cleaning testing files..."
rm --force --verbose josh_test.log josh_test.*.log
rm --force --verbose --recursive test/ test.*/
echo "DONE!"
exit 0
