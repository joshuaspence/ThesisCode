#!/bin/bash

echo "Cleaning..."
rm --force --verbose graph.{mat,txt} output.{csv,png} random.{mat,txt} TopN_Outlier_Pruning_Block.{mat,txt} vars.dat
echo "DONE!"
exit 0
