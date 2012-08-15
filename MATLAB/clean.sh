#!/bin/bash

echo "Cleaning..."
rm --force --verbose graph.{mat,txt} output.{csv,png} random.{mat,txt} TopN_Outlier_Pruning_Block.{mat,txt} vars.dat top_n_outlier_pruning_block.log
echo "DONE!"
