#!/bin/bash

echo "Cleaning..."
rm --force --verbose graph.{mat,txt} output.csv random.{mat,txt} TopN_Outlier_Pruning_Block.{mat,txt}
echo "DONE!"
exit 0
